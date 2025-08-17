Config = {}

--========================================================--
--  SETTINGS
--========================================================--

Config.CoverModeMultiplier = 1.25
Config.StealthModeMultiplier = 0.75
Config.Jitter = {min = 1, max = 10}

--========================================================--
--  SHOOTING RESTRICTIONS
--========================================================--

Config.VehicleSpeedLimits = {
    -- [-1] = 100 -- Enables Shooting upto 100 MPH
    -- [-1] = false -- Enables Shooting
    -- [-1] = true -- Disables Shooting

    [0]  = 100, -- Compacts
    [1]  = 100, -- Sedans
    [2]  = 100, -- SUVs
    [3]  = 100, -- Coupes
    [4]  = 100, -- Muscle
    [5]  = 100, -- Sports Classics
    [6]  = 100, -- Sports
    [7]  = 100, -- Super
    [8]  = 20, -- Motorcycles
    [9]  = 100, -- Off-road
    [10] = 100, -- Industrial
    [11] = 100, -- Utility
    [12] = 100, -- Vans
    [13] = 15, -- Cycles
    [14] = 100, -- Boats
    [15] = true, -- Helicopters
    [16] = 100, -- Planes
    [17] = 100, -- Service
    [18] = 100, -- Emergency
    [19] = 100, -- Military
    [20] = 100, -- Commercial
    [21] = 100, -- Trains
}

Config.WeaponJam = {
    Chance = 0.005, -- 0.5% chance (rare)
    Duration = 5000,
}

--========================================================--
--  NOTIFICATIONS
--========================================================--

Config.Notifications = {
    weaponJammed = {
        title = 'Zbraň se zasekla',
        type = 'error',
        duration = 3000
    },
    weaponCleared = {
        title = 'Zbraň odblokována',
        type = 'success',
        duration = 2000
    },
    speedLimitExceeded = {
        title = 'Rychlostní limit',
        description = 'Jedeš příliš rychle na přesnou střelbu!',
        type = 'warning',
        duration = 2000
    },
    shootingDisabled = {
        title = 'Střelba zakázána',
        description = 'Z tohoto typu vozidla nemůžeš střílet.',
        type = 'error',
        duration = 2000
    }
}

--========================================================--
--  RECOIL SETTINGS
--========================================================--

Config.Recoils = {
    -- Pistols
    [`weapon_pistol`] = {pitchFactor = 0.17, shakeFactor = 0.01, maxCycles = 2},
    [`weapon_pistol_mk2`] = {pitchFactor = 0.14, shakeFactor = 0.01, maxCycles = 2},
    [`weapon_combatpistol`] = {pitchFactor = 0.15, shakeFactor = 0.01, maxCycles = 2},
    [`weapon_appistol`] = {pitchFactor = 0.20, shakeFactor = 0.01, maxCycles = 2},
    [`weapon_pistol50`] = {pitchFactor = 0.26, shakeFactor = 0.02, maxCycles = 6},
    [`weapon_snspistol`] = {pitchFactor = 0.28, shakeFactor = 0.01, maxCycles = 2},
    [`weapon_snspistol_mk2`] = {pitchFactor = 0.18, shakeFactor = 0.01, maxCycles = 2},
    [`weapon_heavypistol`] = {pitchFactor = 0.13, shakeFactor = 0.01, maxCycles = 6},
    [`weapon_vintagepistol`] = {pitchFactor = 0.11, shakeFactor = 0.01, maxCycles = 2},
    [`weapon_marksmanpistol`] = {pitchFactor = 0.38, shakeFactor = 0.03, maxCycles = 4},
    [`weapon_revolver`] = {pitchFactor = 0.38, shakeFactor = 0.04, maxCycles = 6},
    [`weapon_revolver_mk2`] = {pitchFactor = 0.29, shakeFactor = 0.04, maxCycles = 6},
    [`weapon_doubleaction`] = {pitchFactor = 0.22, shakeFactor = 0.03, maxCycles = 3},
    [`weapon_ceramicpistol`] = {pitchFactor = 0.19, shakeFactor = 0.01, maxCycles = 2},
    [`weapon_navyrevolver`] = {pitchFactor = 0.25, shakeFactor = 0.01, maxCycles = 4},
    [`weapon_pistolxm3`] = {pitchFactor = 0.17, shakeFactor = 0.01, maxCycles = 2},

    -- Submachine Guns
    [`weapon_microsmg`] = {pitchFactor = 0.22, shakeFactor = 0.02, maxCycles = 2},
    [`weapon_minismg`] = {pitchFactor = 0.16, shakeFactor = 0.02, maxCycles = 2},
    [`weapon_smg`] = {pitchFactor = 0.23, shakeFactor = 0.01, maxCycles = 3},
    [`weapon_smg_mk2`] = {pitchFactor = 0.18, shakeFactor = 0.01, maxCycles = 2},
    [`weapon_assaultsmg`] = {pitchFactor = 0.19, shakeFactor = 0.02, maxCycles = 2},
    [`weapon_combatpdw`] = {pitchFactor = 0.18, shakeFactor = 0.02, maxCycles = 2},
    [`weapon_machinepistol`] = {pitchFactor = 0.17, shakeFactor = 0.02, maxCycles = 2},
    [`weapon_tecpistol`] = {pitchFactor = 0.22, shakeFactor = 0.02, maxCycles = 2},

    -- Shotguns
    [`weapon_pumpshotgun`] = {pitchFactor = 0.3, shakeFactor = 0.04, maxCycles = 5},
    [`weapon_pumpshotgun_mk2`] = {pitchFactor = 0.46, shakeFactor = 0.04, maxCycles = 5},
    [`weapon_sawnoffshotgun`] = {pitchFactor = 0.58, shakeFactor = 0.04, maxCycles = 5},
    [`weapon_assaultshotgun`] = {pitchFactor = 0.62, shakeFactor = 0.04, maxCycles = 5},
    [`weapon_bullpupshotgun`] = {pitchFactor = 0.48, shakeFactor = 0.04, maxCycles = 5},
    [`weapon_heavyshotgun`] = {pitchFactor = 0.49, shakeFactor = 0.04, maxCycles = 5},
    [`weapon_dbshotgun`] = {pitchFactor = 0.6, shakeFactor = 0.04, maxCycles = 5},
    [`weapon_autoshotgun`] = {pitchFactor = 0.49, shakeFactor = 0.04, maxCycles = 5},

    -- Rifles
    [`weapon_carbinerifle_mk2`] = {pitchFactor = 0.28, shakeFactor = 0.04, maxCycles = 4},
    [`weapon_carbinerifle`] = {pitchFactor = 0.31, shakeFactor = 0.04, maxCycles = 4},
    [`weapon_assaultrifle`] = {pitchFactor = 0.38, shakeFactor = 0.04, maxCycles = 4},
    [`weapon_assaultrifle_mk2`] = {pitchFactor = 0.35, shakeFactor = 0.04, maxCycles = 4},
    [`weapon_advancedrifle`] = {pitchFactor = 0.32, shakeFactor = 0.04, maxCycles = 4},
    [`weapon_bullpuprifle`] = {pitchFactor = 0.32, shakeFactor = 0.04, maxCycles = 4},
    [`weapon_bullpuprifle_mk2`] = {pitchFactor = 0.29, shakeFactor = 0.04, maxCycles = 4},
    [`weapon_specialcarbine`] = {pitchFactor = 0.31, shakeFactor = 0.04, maxCycles = 4},
    [`weapon_specialcarbine_mk2`] = {pitchFactor = 0.28, shakeFactor = 0.04, maxCycles = 4},
    [`weapon_compactrifle`] = {pitchFactor = 0.33, shakeFactor = 0.04, maxCycles = 4},
    [`weapon_militaryrifle`] = {pitchFactor = 0.32, shakeFactor = 0.04, maxCycles = 4},
    [`weapon_heavyrifle`] = {pitchFactor = 0.33, shakeFactor = 0.04, maxCycles = 4},
    [`weapon_tacticalrifle`] = {pitchFactor = 0.35, shakeFactor = 0.04, maxCycles = 4},

    -- Machine Guns
    [`weapon_mg`] = {pitchFactor = 0.44, shakeFactor = 0.03, maxCycles = 5},
    [`weapon_combatmg`] = {pitchFactor = 0.40, shakeFactor = 0.03, maxCycles = 5},
    [`weapon_combatmg_mk2`] = {pitchFactor = 0.37, shakeFactor = 0.03, maxCycles = 5},
    [`weapon_gusenberg`] = {pitchFactor = 0.34, shakeFactor = 0.03, maxCycles = 5},

    -- Others
    [`weapon_musket`] = {pitchFactor = 0.73, shakeFactor = 0.08, maxCycles = 7},
    [`weapon_stungun`] = {pitchFactor = 0.1, shakeFactor = 0.01, maxCycles = 2},
    [`weapon_flaregun`] = {pitchFactor = 0.1, shakeFactor = 0.01, maxCycles = 2},
}

local grip = {pitchFactor = 20, shakeFactor = 15}
local barrel = {pitchFactor = 10, shakeFactor = 15}
local suppressor = {pitchFactor = 15, shakeFactor = 10}
local compensator = {pitchFactor = 10, shakeFactor = 15}
local extendedClip = {pitchFactor = -15, shakeFactor = -15}
local drumClip = {pitchFactor = -30, shakeFactor = -30}
local flashlight = {pitchFactor = 5, shakeFactor = 10}
local scope = {pitchFactor = 10, shakeFactor = 5}

Config.Components = {
    -- Grips
    [`COMPONENT_AT_AR_AFGRIP`] = grip,
    [`COMPONENT_AT_AR_AFGRIP_02`] = grip,

    -- Barrels
    [`COMPONENT_AT_SB_BARREL_02`] = barrel,
    [`COMPONENT_AT_BP_BARREL_02`] = barrel,
    [`COMPONENT_AT_SC_BARREL_02`] = barrel,
    [`COMPONENT_AT_AR_BARREL_02`] = barrel,
    [`COMPONENT_AT_CR_BARREL_02`] = barrel,
    [`COMPONENT_AT_MG_BARREL_02`] = barrel,
    [`COMPONENT_AT_MRFL_BARREL_02`] = barrel,
    [`COMPONENT_AT_SR_BARREL_02`] = barrel,

    -- Suppressors
    [`COMPONENT_AT_PI_SUPP`] = suppressor,
    [`COMPONENT_AT_PI_SUPP_02`] = suppressor,
    [`COMPONENT_AT_AR_SUPP`] = suppressor,
    [`COMPONENT_AT_AR_SUPP_02`] = suppressor,
    [`COMPONENT_AT_AR_SUPP_03`] = suppressor,
    [`COMPONENT_AT_SR_SUPP`] = suppressor,
    [`COMPONENT_AT_SR_SUPP_03`] = suppressor,
    [`COMPONENT_CERAMICPISTOL_SUPP`] = suppressor,

    -- Compensators
    [`COMPONENT_AT_PI_COMP`] = compensator,
    [`COMPONENT_AT_PI_COMP_02`] = compensator,
    [`COMPONENT_AT_PI_COMP_03`] = compensator,

    -- Extended Clips
    [`COMPONENT_PISTOL_CLIP_02`] = extendedClip,
    [`COMPONENT_PISTOL_MK2_CLIP_02`] = extendedClip,
    [`COMPONENT_SNSPISTOL_CLIP_02`] = extendedClip,
    [`COMPONENT_SNSPISTOL_MK2_CLIP_02`] = extendedClip,
    [`COMPONENT_COMBATPISTOL_CLIP_02`] = extendedClip,
    [`COMPONENT_APPISTOL_CLIP_02`] = extendedClip,
    [`COMPONENT_PISTOL50_CLIP_02`] = extendedClip,
    [`COMPONENT_HEAVYPISTOL_CLIP_02`] = extendedClip,
    [`COMPONENT_VINTAGEPISTOL_CLIP_02`] = extendedClip,
    [`COMPONENT_CERAMICPISTOL_CLIP_02`] = extendedClip,

    [`COMPONENT_SMG_CLIP_02`] = extendedClip,
    [`COMPONENT_SMG_MK2_CLIP_02`] = extendedClip,
    [`COMPONENT_MICROSMG_CLIP_02`] = extendedClip,
    [`COMPONENT_ASSAULTSMG_CLIP_02`] = extendedClip,
    [`COMPONENT_MINISMG_CLIP_02`] = extendedClip,
    [`COMPONENT_MACHINEPISTOL_CLIP_02`] = extendedClip,
    [`COMPONENT_COMBATPDW_CLIP_02`] = extendedClip,
    [`COMPONENT_ASSAULTSHOTGUN_CLIP_02`] = extendedClip,
    [`COMPONENT_HEAVYSHOTGUN_CLIP_02`] = extendedClip,

    [`COMPONENT_ASSAULTRIFLE_CLIP_02`] = extendedClip,
    [`COMPONENT_ASSAULTRIFLE_MK2_CLIP_02`] = extendedClip,
    [`COMPONENT_CARBINERIFLE_CLIP_02`] = extendedClip,
    [`COMPONENT_CARBINERIFLE_MK2_CLIP_02`] = extendedClip,
    [`COMPONENT_SPECIALCARBINE_CLIP_02`] = extendedClip,
    [`COMPONENT_SPECIALCARBINE_MK2_CLIP_02`] = extendedClip,
    [`COMPONENT_BULLPUPRIFLE_CLIP_02`] = extendedClip,
    [`COMPONENT_BULLPUPRIFLE_MK2_CLIP_02`] = extendedClip,
    [`COMPONENT_ADVANCEDRIFLE_CLIP_02`] = extendedClip,
    [`COMPONENT_COMPACTRIFLE_CLIP_02`] = extendedClip,
    [`COMPONENT_MILITARYRIFLE_CLIP_02`] = extendedClip,

    [`COMPONENT_COMBATMG_CLIP_02`] = extendedClip,
    [`COMPONENT_COMBATMG_MK2_CLIP_02`] = extendedClip,
    [`COMPONENT_MG_CLIP_02`] = extendedClip,
    [`COMPONENT_GUSENBERG_CLIP_02`] = extendedClip,

    [`COMPONENT_MARKSMANRIFLE_CLIP_02`] = extendedClip,
    [`COMPONENT_MARKSMANRIFLE_MK2_CLIP_02`] = extendedClip,
    [`COMPONENT_HEAVYSNIPER_MK2_CLIP_02`] = extendedClip,

    -- Drum Clips
    [`COMPONENT_SMG_CLIP_03`] = drumClip,
    [`COMPONENT_MACHINEPISTOL_CLIP_03`] = drumClip,
    [`COMPONENT_COMBATPDW_CLIP_03`] = drumClip,
    [`COMPONENT_HEAVYSHOTGUN_CLIP_03`] = drumClip,
    [`COMPONENT_ASSAULTRIFLE_CLIP_03`] = drumClip,
    [`COMPONENT_CARBINERIFLE_CLIP_03`] = drumClip,
    [`COMPONENT_SPECIALCARBINE_CLIP_03`] = drumClip,
    [`COMPONENT_COMPACTRIFLE_CLIP_03`] = drumClip,

    -- Flashlights
    [`COMPONENT_AT_PI_FLSH`] = flashlight,
    [`COMPONENT_AT_PI_FLSH_02`] = flashlight,
    [`COMPONENT_AT_PI_FLSH_03`] = flashlight,
    [`COMPONENT_AT_AR_FLSH`] = flashlight,
    
    -- Scopes
    [`COMPONENT_AT_SCOPE_MACRO`] = scope,
    [`COMPONENT_AT_SCOPE_MACRO_MK2`] = scope,
    [`COMPONENT_AT_SCOPE_MACRO_02`] = scope,
    [`COMPONENT_AT_SCOPE_MACRO_02_MK2`] = scope,
    [`COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2`] = scope,
    [`COMPONENT_AT_SCOPE_SMALL`] = scope,
    [`COMPONENT_AT_SCOPE_SMALL_02`] = scope,
    [`COMPONENT_AT_SCOPE_SMALL_MK2`] = scope,
    [`COMPONENT_AT_SCOPE_SMALL_SMG_MK2`] = scope,
    [`COMPONENT_AT_SCOPE_MEDIUM`] = scope,
    [`COMPONENT_AT_SCOPE_MEDIUM_MK2`] = scope,
    [`COMPONENT_AT_SCOPE_LARGE`] = scope,
    [`COMPONENT_AT_SCOPE_LARGE_MK2`] = scope,
    [`COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM`] = scope,
    [`COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2`] = scope,
    [`COMPONENT_AT_SCOPE_MAX`] = scope,
    [`COMPONENT_AT_SCOPE_NV`] = scope,
    [`COMPONENT_AT_SCOPE_THERMAL`] = scope,
}
