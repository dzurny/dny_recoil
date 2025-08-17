local playerPed = PlayerPedId()
local isWeaponJammed = false
local jamStartTime = 0
local recoilCycle = 0

local lastWeaponHash = 0
local cachedRecoilModifiers = {pitch = 0, shake = 0}
local lastVehicle = 0
local lastVehicleClass = -1
local lastSpeedCheck = 0
local speedCheckInterval = 100 

local componentHashes = {}
for hash, _ in pairs(Config.Components) do
    componentHashes[#componentHashes + 1] = hash
end

local function GetPlayerSpeed()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if vehicle ~= lastVehicle then
        lastVehicle = vehicle
        if vehicle ~= 0 then
            lastVehicleClass = GetVehicleClass(vehicle)
        else
            lastVehicleClass = -1
        end
    end
    
    if vehicle ~= 0 then
        return GetEntitySpeed(vehicle) * 3.6 -- Convert to km/h
    end
    return 0
end

local function GetCachedVehicleClass()
    return lastVehicleClass
end

local function CalculateRecoilModifiers(weaponHash)

    if weaponHash == lastWeaponHash then
        return cachedRecoilModifiers.pitch, cachedRecoilModifiers.shake
    end
    
    local pitchModifier = 0
    local shakeModifier = 0
    

    for i = 1, #componentHashes do
        local componentHash = componentHashes[i]
        if HasPedGotWeaponComponent(playerPed, weaponHash, componentHash) then
            local componentData = Config.Components[componentHash]
            pitchModifier = pitchModifier + (componentData.pitchFactor * 0.01) 
            shakeModifier = shakeModifier + (componentData.shakeFactor * 0.01)
        end
    end
    
    lastWeaponHash = weaponHash
    cachedRecoilModifiers.pitch = pitchModifier
    cachedRecoilModifiers.shake = shakeModifier
    
    return pitchModifier, shakeModifier
end

local function ApplyRecoil(weaponHash)
    local weaponData = Config.Recoils[weaponHash]
    if not weaponData then return end
    
    local pitchFactor = weaponData.pitchFactor
    local shakeFactor = weaponData.shakeFactor
    local maxCycles = weaponData.maxCycles
    
    local pitchMod, shakeMod = CalculateRecoilModifiers(weaponHash)
    pitchFactor = pitchFactor + pitchMod
    shakeFactor = shakeFactor + shakeMod
    
    local inCover = IsPedInCover(playerPed, false)
    local inStealth = GetPedStealthMovement(playerPed)
    
    if inCover then
        local multiplier = Config.CoverModeMultiplier
        pitchFactor = pitchFactor * multiplier
        shakeFactor = shakeFactor * multiplier
    end
    
    if inStealth then
        local multiplier = Config.StealthModeMultiplier
        pitchFactor = pitchFactor * multiplier
        shakeFactor = shakeFactor * multiplier
    end
    
    recoilCycle = recoilCycle + 1
    if recoilCycle > maxCycles then
        recoilCycle = maxCycles
    end
    
    local cycleFactor = 1.0 + (recoilCycle - 1) * 0.1
    pitchFactor = pitchFactor * cycleFactor
    shakeFactor = shakeFactor * cycleFactor
    
    local jitterRange = Config.Jitter.max - Config.Jitter.min
    local jitter = (Config.Jitter.min + math.random() * jitterRange) * 0.01
    pitchFactor = pitchFactor + jitter

    ShakeGameplayCam("HAND_SHAKE", shakeFactor)
    
    local currentPitch = GetGameplayCamRelativePitch()
    SetGameplayCamRelativePitch(currentPitch + pitchFactor, 1.0)
end

local function CheckVehicleSpeedLimits()
    local currentTime = GetGameTimer()
    
    if currentTime - lastSpeedCheck < speedCheckInterval then
        return true 
    end
    lastSpeedCheck = currentTime
    
    local vehicleClass = GetCachedVehicleClass()
    if vehicleClass == -1 then return true end 
    
    local speedLimit = Config.VehicleSpeedLimits[vehicleClass]
    
    if speedLimit == nil then
        speedLimit = Config.VehicleSpeedLimits[-1] or false
    end
    
    if speedLimit == true then
        lib.notify(Config.Notifications.shootingDisabled)
        return false
    end
    
    if speedLimit == false then
        return true
    end
    
    local currentSpeed = GetPlayerSpeed()
    if currentSpeed > speedLimit then
        lib.notify(Config.Notifications.speedLimitExceeded)
        return false
    end
    
    return true
end

local function CheckWeaponJam()
    if math.random() < Config.WeaponJam.Chance then
        isWeaponJammed = true
        jamStartTime = GetGameTimer()
        lib.notify(Config.Notifications.weaponJammed)
        
        DisableControlAction(0, 24, true) -- Attack
        DisableControlAction(0, 25, true) -- Aim
        DisableControlAction(0, 68, true) -- Vehicle Attack
        DisableControlAction(0, 69, true) -- Vehicle Attack 2
        
        return true
    end
    return false
end

local function ClearWeaponJam()
    if isWeaponJammed and GetGameTimer() - jamStartTime >= Config.WeaponJam.Duration then
        isWeaponJammed = false
        jamStartTime = 0
        lib.notify(Config.Notifications.weaponCleared)
    end
end

CreateThread(function()
    local lastShotTime = 0
    local lastPedUpdate = 0
    local resetDelay = 1000 
    local pedUpdateInterval = 500 
    
    while true do
        local currentTime = GetGameTimer()
        
        if currentTime - lastPedUpdate > pedUpdateInterval then
            playerPed = PlayerPedId()
            lastPedUpdate = currentTime
        end
        

        if isWeaponJammed then
            ClearWeaponJam()
        end
        
        -- Disabled Controls while the Gun is Jammed
        if isWeaponJammed then
            DisableControlAction(0, 24, true) -- Attack
            DisableControlAction(0, 25, true) -- Aim
            DisableControlAction(0, 68, true) -- Vehicle Attack
            DisableControlAction(0, 69, true) -- Vehicle Attack 2
            DisableControlAction(0, 257, true) -- Attack 2
            DisableControlAction(0, 263, true) -- Melee Attack 1
            DisableControlAction(0, 264, true) -- Melee Attack 2
            Wait(10) 
            goto continue
        end
        
        if IsPedShooting(playerPed) then
            local currentWeapon = GetSelectedPedWeapon(playerPed)
            
            if not CheckVehicleSpeedLimits() then
                Wait(5)
                goto continue
            end

            if CheckWeaponJam() then
                Wait(5)
                goto continue
            end
            
            ApplyRecoil(currentWeapon)
            lastShotTime = currentTime
            Wait(5) 
        else
            Wait(10)
        end
        
        if currentTime - lastShotTime > resetDelay then
            recoilCycle = 0
        end
        
        ::continue::
        Wait(0) 
    end
end)
