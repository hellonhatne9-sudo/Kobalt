-- Decompiled by Executor
-- Path: ReplicatedStorage.Shared.Config.WeaponConfig

local v_u_1 = {
	["GravityMps2"] = 9.81,
	["MoveSpread"] = {
		["Walk"] = 1.3,
		["Run"] = 1.75,
		["Jump"] = 4,
		["Crouch"] = 0.8,
		["Prone"] = 0.6,
		["ADSMoveScale"] = 0.35,
		["VehicleSpread"] = 1.15,
		["VehicleRecoil"] = 1.25
	},
	["HipSpreadScale"] = {
		["AR"] = 0.5,
		["DMR"] = 0.5,
		["SR"] = 0.55,
		["SMG"] = 0.3,
		["LMG"] = 0.52,
		["SG"] = 1,
		["Pistol"] = 0.8,
		["Special"] = 0.8
	},
	["Class"] = {
		["AR"] = {
			["ADSTime"] = 0.25,
			["EquipTime"] = 0.5,
			["AimMult"] = 0.17,
			["ADSMult"] = 0.02,
			["Bloom"] = 0.087,
			["BloomMax"] = 0.75,
			["BloomRecover"] = 4,
			["Recovery"] = 0.65,
			["RecoverySpeed"] = 24,
			["First"] = 1.35,
			["Kick"] = 0.35,
			["Crouch"] = 0.84,
			["Prone"] = 0.6,
			["Sway"] = 1,
			["SprintSpeed"] = 6.01,
			["AimPunch"] = 0.4,
			["ZeroMax"] = 500,
			["Range"] = 1000,
			["Drag"] = 0.45
		},
		["DMR"] = {
			["ADSTime"] = 0.28,
			["EquipTime"] = 0.55,
			["AimMult"] = 0.2,
			["ADSMult"] = 0.012,
			["Bloom"] = 0.11,
			["BloomMax"] = 1,
			["BloomRecover"] = 3.2,
			["Recovery"] = 0.6,
			["RecoverySpeed"] = 22,
			["First"] = 1,
			["Kick"] = 0.55,
			["Crouch"] = 0.84,
			["Prone"] = 0.6,
			["Sway"] = 1,
			["SprintSpeed"] = 5.99,
			["AimPunch"] = 0.5,
			["ZeroMax"] = 800,
			["Range"] = 1200,
			["Drag"] = 0.3
		},
		["SR"] = {
			["ADSTime"] = 0.3,
			["EquipTime"] = 0.6,
			["AimMult"] = 0.25,
			["ADSMult"] = 0.007,
			["Bloom"] = 0.13,
			["BloomMax"] = 1,
			["BloomRecover"] = 2.5,
			["Recovery"] = 0.75,
			["RecoverySpeed"] = 18,
			["First"] = 1,
			["Kick"] = 0.9,
			["Crouch"] = 0.84,
			["Prone"] = 0.6,
			["Sway"] = 1,
			["SprintSpeed"] = 5.99,
			["AimPunch"] = 1,
			["ZeroMax"] = 1000,
			["Range"] = 1300,
			["Drag"] = 0.28
		},
		["SMG"] = {
			["ADSTime"] = 0.2,
			["EquipTime"] = 0.45,
			["AimMult"] = 0.15,
			["ADSMult"] = 0.03,
			["Bloom"] = 0.15,
			["BloomMax"] = 0.7,
			["BloomRecover"] = 5,
			["Recovery"] = 0.7,
			["RecoverySpeed"] = 26,
			["First"] = 1.25,
			["Kick"] = 0.3,
			["Crouch"] = 0.84,
			["Prone"] = 0.6,
			["Sway"] = 0.9,
			["SprintSpeed"] = 6.15,
			["AimPunch"] = 0.55,
			["ZeroMax"] = 300,
			["Range"] = 500,
			["Drag"] = 0.6
		},
		["LMG"] = {
			["ADSTime"] = 0.37,
			["EquipTime"] = 0.75,
			["AimMult"] = 0.25,
			["ADSMult"] = 0.035,
			["Bloom"] = 0.08,
			["BloomMax"] = 0.8,
			["BloomRecover"] = 3.2,
			["Recovery"] = 0.5,
			["RecoverySpeed"] = 20,
			["First"] = 1.2,
			["Kick"] = 0.4,
			["Crouch"] = 0.83,
			["Prone"] = 0.73,
			["Sway"] = 1.15,
			["SprintSpeed"] = 5.99,
			["AimPunch"] = 0.45,
			["ZeroMax"] = 500,
			["Range"] = 1000,
			["Drag"] = 0.45
		},
		["SG"] = {
			["ADSTime"] = 0.25,
			["EquipTime"] = 0.55,
			["AimMult"] = 0.6,
			["ADSMult"] = 0.35,
			["Bloom"] = 0.1,
			["BloomMax"] = 0.6,
			["BloomRecover"] = 3,
			["Recovery"] = 0.8,
			["RecoverySpeed"] = 20,
			["First"] = 1,
			["Kick"] = 0.8,
			["Crouch"] = 0.84,
			["Prone"] = 0.6,
			["Sway"] = 1,
			["SprintSpeed"] = 5.91,
			["AimPunch"] = 0.8,
			["ZeroMax"] = 100,
			["Range"] = 150,
			["Drag"] = 1.5
		},
		["Pistol"] = {
			["ADSTime"] = 0.18,
			["EquipTime"] = 0.35,
			["AimMult"] = 0.5,
			["ADSMult"] = 0.05,
			["Bloom"] = 0.12,
			["BloomMax"] = 0.8,
			["BloomRecover"] = 4.5,
			["Recovery"] = 0.85,
			["RecoverySpeed"] = 26,
			["First"] = 1,
			["Kick"] = 0.3,
			["Crouch"] = 0.84,
			["Prone"] = 0.6,
			["Sway"] = 0.9,
			["SprintSpeed"] = 6.32,
			["AimPunch"] = 0.3,
			["ZeroMax"] = 100,
			["Range"] = 400,
			["Drag"] = 0.65
		},
		["Special"] = {
			["ADSTime"] = 0.3,
			["EquipTime"] = 0.6,
			["AimMult"] = 0.3,
			["ADSMult"] = 0.01,
			["Bloom"] = 0.1,
			["BloomMax"] = 1,
			["BloomRecover"] = 3,
			["Recovery"] = 0.7,
			["RecoverySpeed"] = 18,
			["First"] = 1,
			["Kick"] = 0.6,
			["Crouch"] = 0.84,
			["Prone"] = 0.6,
			["Sway"] = 1,
			["SprintSpeed"] = 6.01,
			["AimPunch"] = 0.3,
			["ZeroMax"] = 100,
			["Range"] = 400,
			["Drag"] = 0.3
		},
		["Melee"] = {
			["EquipTime"] = 0.4,
			["SprintSpeed"] = 6.3
		},
		["Throwable"] = {
			["EquipTime"] = 0.5,
			["SprintSpeed"] = 6.29
		}
	},
	["Falloff"] = {
		["AR556"] = {
			{ 0, 1 },
			{ 80, 1 },
			{ 100, 0.975 },
			{ 200, 0.89 },
			{ 300, 0.81 },
			{ 450, 0.75 }
		},
		["AR762"] = {
			{ 0, 1 },
			{ 90, 1 },
			{ 200, 0.92 },
			{ 300, 0.86 },
			{ 500, 0.78 }
		},
		["DMR"] = {
			{ 0, 1 },
			{ 100, 1 },
			{ 200, 0.95 },
			{ 300, 0.89 },
			{ 400, 0.83 },
			{ 500, 0.78 },
			{ 800, 0.72 }
		},
		["DMRHeavy"] = {
			{ 0, 1 },
			{ 120, 1 },
			{ 300, 0.92 },
			{ 500, 0.85 },
			{ 800, 0.8 }
		},
		["VSS"] = {
			{ 0, 1 },
			{ 50, 1 },
			{ 260, 0.9 }
		},
		["SR"] = {
			{ 0, 1 },
			{ 100, 1 },
			{ 200, 0.987 },
			{ 400, 0.96 },
			{ 500, 0.95 },
			{ 1000, 0.9 }
		},
		["LMG"] = {
			{ 0, 1 },
			{ 45, 1 },
			{ 200, 0.91 },
			{ 400, 0.8 }
		},
		["SMG"] = {
			{ 0, 1 },
			{ 10, 1 },
			{ 100, 0.82 },
			{ 200, 0.7 }
		},
		["Shotgun"] = {
			{ 0, 1 },
			{ 5, 1 },
			{ 20, 0.68 },
			{ 50, 0.44 },
			{ 80, 0.265 },
			{ 120, 0.1 }
		},
		["Slug"] = {
			{ 0, 1 },
			{ 30, 1 },
			{ 100, 0.8 },
			{ 200, 0.6 }
		},
		["Pistol"] = {
			{ 0, 1 },
			{ 25, 1 },
			{ 60, 0.85 },
			{ 120, 0.7 }
		},
		["PistolHeavy"] = {
			{ 0, 1 },
			{ 30, 1 },
			{ 40, 0.97 }
		},
		["Crossbow"] = {
			{ 0, 1 },
			{ 100, 1 },
			{ 200, 0.9 }
		},
		["None"] = {
			{ 0, 1 }
		}
	}
}
local v2 = {
	["Rifle"] = {
		["Grip"] = "RootPart",
		["C0"] = nil,
		["C1"] = nil,
		["C0"] = CFrame.new(0, -0.9, -0.4) * CFrame.Angles(-1.5707963267948966, 0, 0),
		["C1"] = CFrame.identity
	},
	["Shotgun"] = {
		["Grip"] = "RootPart",
		["C0"] = nil,
		["C1"] = nil,
		["C0"] = CFrame.new(0, -0.9, -0.4) * CFrame.Angles(-1.5707963267948966, 0, 0),
		["C1"] = CFrame.identity
	},
	["Pistol"] = {
		["Grip"] = "Handle",
		["C0"] = nil,
		["C1"] = nil,
		["Rename"] = nil,
		["C0"] = CFrame.identity,
		["C1"] = CFrame.new(0, -0.1, 0.42):Inverse(),
		["Rename"] = {
			["MagazineBase"] = "Mag"
		}
	},
	["Beretta"] = {
		["Grip"] = "RootPart",
		["C0"] = nil,
		["C1"] = nil,
		["C0"] = CFrame.new(0, -0.9, -0.4) * CFrame.Angles(-1.5707963267948966, 0, 0),
		["C1"] = CFrame.identity
	},
	["Grenade"] = {
		["Grip"] = "RootPart",
		["C0"] = nil,
		["C1"] = nil,
		["C0"] = CFrame.new(0, -1, -0.25) * CFrame.Angles(-1.5707963267948966, 0, 0),
		["C1"] = CFrame.identity
	},
	["Melee"] = {
		["Grip"] = "RootPart",
		["C0"] = nil,
		["C1"] = nil,
		["C0"] = CFrame.new(0, -0.95, -0.1),
		["C1"] = CFrame.identity
	}
}
v_u_1.AnimPacks = v2
v_u_1.AnimSetToPack = {
	["Rifle"] = "Rifle",
	["Bolt"] = "Rifle",
	["Shotgun"] = "Shotgun",
	["Pistol"] = "Pistol",
	["Melee"] = "Melee",
	["Throwable"] = "Grenade"
}
local v3 = {
	"Comp_AR",
	"FlashHider_AR",
	"Suppressor_AR",
	"MuzzleBrake"
}
local v4 = {
	"Comp_AR",
	"FlashHider_AR",
	"Suppressor_AR",
	"MuzzleBrake",
	"Comp_SR",
	"FlashHider_SR",
	"Suppressor_SR"
}
local v5 = { "Comp_SR", "FlashHider_SR", "Suppressor_SR" }
local v6 = { "Comp_SMG", "FlashHider_SMG", "Suppressor_SMG" }
local v7 = { "Suppressor_SMG" }
local v8 = {
	"VerticalGrip",
	"AngledGrip",
	"HalfGrip",
	"ThumbGrip",
	"LightGrip",
	"TiltedGrip",
	"Laser"
}
local v9 = { "Laser" }
local v10 = { "RedDot", "Holo" }
local v11 = {
	"RedDot",
	"Holo",
	"Canted",
	"Scope2x",
	"Scope3x",
	"Scope4x"
}
local v12 = {
	"RedDot",
	"Holo",
	"Canted",
	"Scope2x",
	"Scope3x",
	"Scope4x",
	"Scope6x"
}
local v13 = {
	"RedDot",
	"Holo",
	"Canted",
	"Scope2x",
	"Scope3x",
	"Scope4x",
	"Scope6x",
	"Scope8x",
	"Scope15x"
}
local v14 = { "ExtMag_AR", "QuickMag_AR", "ExtQuickMag_AR" }
local v15 = { "ExtMag_SR", "QuickMag_SR", "ExtQuickMag_SR" }
local v16 = { "ExtMag_SMG", "QuickMag_SMG", "ExtQuickMag_SMG" }
local v17 = { "TacticalStock", "HeavyStock" }
local v18 = { "CheekPad" }
local v19 = { "BulletLoops" }
v_u_1.RecoilScale = {
	["All"] = 0.75,
	["ADS"] = 0.6,
	["Aim"] = 0.85,
	["Hip"] = 0.7,
	["Visual"] = 0.85
}
v_u_1.RecoilFeel = {
	["AR"] = {
		["Climb"] = 0.8,
		["KickSpeed"] = 21,
		["KickDamp"] = 0.55,
		["Drift"] = 0.66,
		["Wander"] = 1.25,
		["Freq"] = 0.24,
		["Roll"] = 0.9,
		["Shake"] = 0.12,
		["VMBack"] = 0.11,
		["VMRot"] = 3.4,
		["VMSpeed"] = 19,
		["VMDamp"] = 0.5
	},
	["LMG"] = {
		["Climb"] = 0.82,
		["KickSpeed"] = 17,
		["KickDamp"] = 0.5,
		["Drift"] = 0.72,
		["Wander"] = 1.3,
		["Freq"] = 0.18,
		["Roll"] = 1.1,
		["Shake"] = 0.14,
		["VMBack"] = 0.13,
		["VMRot"] = 3.8,
		["VMSpeed"] = 16,
		["VMDamp"] = 0.48
	},
	["SMG"] = {
		["Climb"] = 0.75,
		["KickSpeed"] = 32,
		["KickDamp"] = 0.68,
		["Drift"] = 0.5,
		["Wander"] = 0.9,
		["Freq"] = 0.34,
		["Roll"] = 0.45,
		["Shake"] = 0.08,
		["VMBack"] = 0.06,
		["VMRot"] = 1.9,
		["VMSpeed"] = 30,
		["VMDamp"] = 0.62
	},
	["DMR"] = {
		["Climb"] = 0.62,
		["KickSpeed"] = 15,
		["KickDamp"] = 0.5,
		["Drift"] = 0.3,
		["Wander"] = 0.5,
		["Freq"] = 0.4,
		["Roll"] = 1.6,
		["Shake"] = 0.18,
		["VMBack"] = 0.16,
		["VMRot"] = 5,
		["VMSpeed"] = 15,
		["VMDamp"] = 0.45
	},
	["SR"] = {
		["Climb"] = 0.5,
		["KickSpeed"] = 11,
		["KickDamp"] = 0.45,
		["Drift"] = 0.1,
		["Wander"] = 0.3,
		["Freq"] = 0.5,
		["Roll"] = 3.5,
		["Shake"] = 0.3,
		["VMBack"] = 0.24,
		["VMRot"] = 9,
		["VMSpeed"] = 12,
		["VMDamp"] = 0.42
	},
	["SG"] = {
		["Climb"] = 0.5,
		["KickSpeed"] = 13,
		["KickDamp"] = 0.45,
		["Drift"] = 0.2,
		["Wander"] = 0.4,
		["Freq"] = 0.5,
		["Roll"] = 2.5,
		["Shake"] = 0.25,
		["VMBack"] = 0.2,
		["VMRot"] = 8,
		["VMSpeed"] = 13,
		["VMDamp"] = 0.45
	},
	["Pistol"] = {
		["Climb"] = 0.55,
		["KickSpeed"] = 24,
		["KickDamp"] = 0.55,
		["Drift"] = 0.35,
		["Wander"] = 0.6,
		["Freq"] = 0.45,
		["Roll"] = 1.2,
		["Shake"] = 0.1,
		["VMBack"] = 0.08,
		["VMRot"] = 6,
		["VMSpeed"] = 22,
		["VMDamp"] = 0.5
	},
	["Special"] = {
		["Climb"] = 0.5,
		["KickSpeed"] = 12,
		["KickDamp"] = 0.5,
		["Drift"] = 0.2,
		["Wander"] = 0.4,
		["Freq"] = 0.4,
		["Roll"] = 2,
		["Shake"] = 0.2,
		["VMBack"] = 0.2,
		["VMRot"] = 6,
		["VMSpeed"] = 13,
		["VMDamp"] = 0.45
	}
}
local v20 = {}
local v21 = {
	["Name"] = "HK416",
	["Class"] = "AR",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_556",
	["MagSize"] = 30,
	["ExtMagSize"] = 40,
	["Damage"] = 40,
	["FireModes"] = nil,
	["TBS"] = 0.0857,
	["Velocity"] = 880,
	["Falloff"] = "AR556",
	["EquipTime"] = 0.5,
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["ZeroMax"] = 500,
	["Attachments"] = nil,
	["Spawn"] = "World",
	["LootWeight"] = 100,
	["AnimSet"] = "Rifle",
	["Sound"] = "AR556",
	["FireModes"] = { "Single", "Auto" },
	["Recoil"] = {
		["V"] = 0.55,
		["H"] = 0.24,
		["Bias"] = 0.02
	},
	["Spread"] = {
		["Hip"] = 4
	},
	["Reload"] = {
		["Tactical"] = 2.75,
		["Empty"] = 3.43,
		["Commit"] = nil,
		["Commit"] = {
			["Tactical"] = 0.62,
			["Empty"] = 0.51
		}
	},
	["Attachments"] = {
		["Muzzle"] = v3,
		["Grip"] = v8,
		["Optic"] = v12,
		["Mag"] = v14,
		["Stock"] = v17
	}
}
v20.HK416 = v21
local v22 = {
	["Name"] = "AKM",
	["Class"] = "AR",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_762",
	["MagSize"] = 30,
	["ExtMagSize"] = 40,
	["Damage"] = 48,
	["FireModes"] = nil,
	["TBS"] = 0.1,
	["Velocity"] = 715,
	["Falloff"] = "AR762",
	["EquipTime"] = 0.4,
	["Drag"] = 0.5,
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["ZeroMax"] = 1000,
	["AimPunch"] = 0.5,
	["Attachments"] = nil,
	["Spawn"] = "World",
	["LootWeight"] = 100,
	["AnimSet"] = "Rifle",
	["Sound"] = "AR762",
	["FireModes"] = { "Single", "Auto" },
	["Recoil"] = {
		["V"] = 0.75,
		["H"] = 0.42,
		["Bias"] = -0.1,
		["Recovery"] = 0.55
	},
	["Spread"] = {
		["Hip"] = 6
	},
	["Reload"] = {
		["Tactical"] = 2.98,
		["Empty"] = 3.95,
		["Commit"] = nil,
		["Commit"] = {
			["Tactical"] = 0.65,
			["Empty"] = 0.51
		}
	},
	["Attachments"] = {
		["Muzzle"] = v3,
		["Optic"] = v12,
		["Mag"] = v14
	}
}
v20.AKM = v22
local v23 = {
	["Name"] = "Beryl M762",
	["Class"] = "AR",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_762",
	["MagSize"] = 30,
	["ExtMagSize"] = 40,
	["Damage"] = 44,
	["FireModes"] = nil,
	["Burst"] = 3,
	["TBS"] = 0.0857,
	["Velocity"] = 715,
	["Falloff"] = "AR762",
	["Drag"] = 0.5,
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["ZeroMax"] = 1000,
	["AimPunch"] = 0.5,
	["Attachments"] = nil,
	["Spawn"] = "World",
	["LootWeight"] = 70,
	["AnimSet"] = "Rifle",
	["Sound"] = "AR762",
	["FireModes"] = { "Single", "Burst", "Auto" },
	["Recoil"] = {
		["V"] = 0.85,
		["H"] = 0.5,
		["Bias"] = 0.08,
		["Recovery"] = 0.55
	},
	["Spread"] = {
		["Hip"] = 5.5
	},
	["Reload"] = {
		["Tactical"] = 2.25,
		["Empty"] = 2.9
	},
	["Attachments"] = {
		["Muzzle"] = v3,
		["Grip"] = v8,
		["Optic"] = v12,
		["Mag"] = v14
	}
}
v20.BerylM762 = v23
local v24 = {
	["Name"] = "SCAR-L",
	["Class"] = "AR",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_556",
	["MagSize"] = 30,
	["ExtMagSize"] = 40,
	["Damage"] = 42,
	["FireModes"] = nil,
	["TBS"] = 0.0923,
	["Velocity"] = 870,
	["Falloff"] = "AR556",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "World",
	["LootWeight"] = 90,
	["AnimSet"] = "Rifle",
	["Sound"] = "AR556",
	["FireModes"] = { "Single", "Auto" },
	["Recoil"] = {
		["V"] = 0.55,
		["H"] = 0.26,
		["Bias"] = 0.03
	},
	["Spread"] = {
		["Hip"] = 4
	},
	["Reload"] = {
		["Tactical"] = 2.4,
		["Empty"] = 3.1
	},
	["Attachments"] = {
		["Muzzle"] = v3,
		["Grip"] = v8,
		["Optic"] = v12,
		["Mag"] = v14
	}
}
v20.SCARL = v24
local v25 = {
	["Name"] = "M16A4",
	["Class"] = "AR",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_556",
	["MagSize"] = 30,
	["ExtMagSize"] = 40,
	["Damage"] = 43,
	["FireModes"] = nil,
	["Burst"] = 3,
	["TBS"] = 0.075,
	["Velocity"] = 900,
	["Falloff"] = "AR556",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["ZeroMax"] = 500,
	["Attachments"] = nil,
	["Spawn"] = "World",
	["LootWeight"] = 80,
	["AnimSet"] = "Rifle",
	["Sound"] = "AR556",
	["FireModes"] = { "Single", "Burst" },
	["Recoil"] = {
		["V"] = 0.62,
		["H"] = 0.3,
		["Bias"] = 0
	},
	["Spread"] = {
		["Hip"] = 4.2
	},
	["Reload"] = {
		["Tactical"] = 2.95,
		["Empty"] = 3.48,
		["Commit"] = nil,
		["Commit"] = {
			["Tactical"] = 0.63,
			["Empty"] = 0.54
		}
	},
	["Attachments"] = {
		["Muzzle"] = v3,
		["Optic"] = v13,
		["Mag"] = v14,
		["Stock"] = v17
	}
}
v20.M16A4 = v25
local v26 = {
	["Name"] = "Mk47 Mutant",
	["Class"] = "AR",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_762",
	["MagSize"] = 20,
	["ExtMagSize"] = 30,
	["Damage"] = 49,
	["FireModes"] = nil,
	["Burst"] = 2,
	["TBS"] = 0.075,
	["Velocity"] = 780,
	["Falloff"] = "AR762",
	["Drag"] = 0.5,
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["ZeroMax"] = 1000,
	["AimPunch"] = 0.5,
	["Attachments"] = nil,
	["Spawn"] = "None",
	["LootWeight"] = 0,
	["AnimSet"] = "Rifle",
	["Sound"] = "AR762",
	["FireModes"] = { "Single", "Burst" },
	["Recoil"] = {
		["V"] = 1,
		["H"] = 0.48,
		["Bias"] = 0.05
	},
	["Spread"] = {
		["Hip"] = 5
	},
	["Reload"] = {
		["Tactical"] = 2.25,
		["Empty"] = 2.9
	},
	["Attachments"] = {
		["Muzzle"] = v3,
		["Grip"] = v8,
		["Optic"] = v13,
		["Mag"] = v14,
		["Stock"] = v17
	}
}
v20.Mk47 = v26
local v27 = {
	["Name"] = "AUG A3",
	["Class"] = "AR",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_556",
	["MagSize"] = 30,
	["ExtMagSize"] = 40,
	["Damage"] = 40,
	["FireModes"] = nil,
	["TBS"] = 0.0833,
	["Velocity"] = 940,
	["Falloff"] = "AR556",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["AimPunch"] = 0.2,
	["Attachments"] = nil,
	["Spawn"] = "Supply",
	["LootWeight"] = 100,
	["AnimSet"] = "Rifle",
	["Sound"] = "AR556",
	["FireModes"] = { "Single", "Auto" },
	["Recoil"] = {
		["V"] = 0.45,
		["H"] = 0.2,
		["Bias"] = 0.01
	},
	["Spread"] = {
		["Hip"] = 3.8
	},
	["Reload"] = {
		["Tactical"] = 3,
		["Empty"] = 3.67
	},
	["Attachments"] = {
		["Muzzle"] = v3,
		["Grip"] = v8,
		["Optic"] = v12,
		["Mag"] = v14
	}
}
v20.AUG = v27
local v28 = {
	["Name"] = "QBZ-95",
	["Class"] = "AR",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_556",
	["MagSize"] = 30,
	["ExtMagSize"] = 40,
	["Damage"] = 42,
	["FireModes"] = nil,
	["TBS"] = 0.0923,
	["Velocity"] = 870,
	["Falloff"] = "AR556",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "None",
	["LootWeight"] = 0,
	["AnimSet"] = "Rifle",
	["Sound"] = "AR556",
	["FireModes"] = { "Single", "Auto" },
	["Recoil"] = {
		["V"] = 0.55,
		["H"] = 0.28,
		["Bias"] = -0.02
	},
	["Spread"] = {
		["Hip"] = 4
	},
	["Reload"] = {
		["Tactical"] = 2.4,
		["Empty"] = 3.1
	},
	["Attachments"] = {
		["Muzzle"] = v3,
		["Grip"] = v8,
		["Optic"] = v12,
		["Mag"] = v14
	}
}
v20.QBZ = v28
local v29 = {
	["Name"] = "G36C",
	["Class"] = "AR",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_556",
	["MagSize"] = 30,
	["ExtMagSize"] = 40,
	["Damage"] = 41,
	["FireModes"] = nil,
	["TBS"] = 0.0857,
	["Velocity"] = 870,
	["Falloff"] = "AR556",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "None",
	["LootWeight"] = 0,
	["AnimSet"] = "Rifle",
	["Sound"] = "AR556",
	["FireModes"] = { "Single", "Auto" },
	["Recoil"] = {
		["V"] = 0.56,
		["H"] = 0.3,
		["Bias"] = 0.02
	},
	["Spread"] = {
		["Hip"] = 3.8
	},
	["Reload"] = {
		["Tactical"] = 2.4,
		["Empty"] = 3.1
	},
	["Attachments"] = {
		["Muzzle"] = v3,
		["Grip"] = v8,
		["Optic"] = v12,
		["Mag"] = v14
	}
}
v20.G36C = v29
local v30 = {
	["Name"] = "ACE 32",
	["Class"] = "AR",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_762",
	["MagSize"] = 30,
	["ExtMagSize"] = 40,
	["Damage"] = 43,
	["FireModes"] = nil,
	["TBS"] = 0.0882,
	["Velocity"] = 720,
	["Falloff"] = "AR762",
	["Drag"] = 0.5,
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["ZeroMax"] = 600,
	["AimPunch"] = 0.5,
	["Attachments"] = nil,
	["Spawn"] = "None",
	["LootWeight"] = 0,
	["AnimSet"] = "Rifle",
	["Sound"] = "AR762",
	["FireModes"] = { "Single", "Auto" },
	["Recoil"] = {
		["V"] = 0.7,
		["H"] = 0.4,
		["Bias"] = -0.04
	},
	["Spread"] = {
		["Hip"] = 4.8
	},
	["Reload"] = {
		["Tactical"] = 2.3,
		["Empty"] = 3
	},
	["Attachments"] = {
		["Muzzle"] = v3,
		["Grip"] = v8,
		["Optic"] = v12,
		["Mag"] = v14,
		["Stock"] = v17
	}
}
v20.ACE32 = v30
local v31 = {
	["Name"] = "K2",
	["Class"] = "AR",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_556",
	["MagSize"] = 30,
	["ExtMagSize"] = 40,
	["Damage"] = 41,
	["FireModes"] = nil,
	["Burst"] = 3,
	["TBS"] = 0.0857,
	["Velocity"] = 880,
	["Falloff"] = "AR556",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "None",
	["LootWeight"] = 0,
	["AnimSet"] = "Rifle",
	["Sound"] = "AR556",
	["FireModes"] = { "Single", "Burst", "Auto" },
	["Recoil"] = {
		["V"] = 0.6,
		["H"] = 0.3,
		["Bias"] = 0
	},
	["Spread"] = {
		["Hip"] = 4.2
	},
	["Reload"] = {
		["Tactical"] = 2.4,
		["Empty"] = 3.1
	},
	["Attachments"] = {
		["Muzzle"] = v3,
		["Grip"] = v8,
		["Optic"] = v12,
		["Mag"] = v14
	}
}
v20.K2 = v31
local v32 = {
	["Name"] = "OTs-14 Groza",
	["Class"] = "AR",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_762",
	["MagSize"] = 30,
	["ExtMagSize"] = 40,
	["Damage"] = 47,
	["FireModes"] = nil,
	["TBS"] = 0.08,
	["Velocity"] = 715,
	["Falloff"] = "AR762",
	["EquipTime"] = 0.4,
	["Drag"] = 0.5,
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["ZeroMax"] = 600,
	["AimPunch"] = 0.5,
	["Attachments"] = nil,
	["TppGripOffset"] = 0.3,
	["Spawn"] = "Supply",
	["LootWeight"] = 100,
	["AnimSet"] = "Rifle",
	["Sound"] = "AR762",
	["FireModes"] = { "Single", "Auto" },
	["Recoil"] = {
		["V"] = 0.7,
		["H"] = 0.42,
		["Bias"] = -0.05
	},
	["Spread"] = {
		["Hip"] = 5
	},
	["Reload"] = {
		["Tactical"] = 2.25,
		["Empty"] = 3
	},
	["Attachments"] = {
		["Muzzle"] = { "Suppressor_AR" },
		["Optic"] = v12,
		["Mag"] = v14
	}
}
v20.Groza = v32
local v33 = {
	["Name"] = "FAMAS G2",
	["Class"] = "AR",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_556",
	["MagSize"] = 25,
	["ExtMagSize"] = 30,
	["Damage"] = 39,
	["FireModes"] = nil,
	["Burst"] = 3,
	["TBS"] = 0.0667,
	["Velocity"] = 925,
	["Falloff"] = "AR556",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "None",
	["LootWeight"] = 0,
	["AnimSet"] = "Rifle",
	["Sound"] = "AR556",
	["FireModes"] = { "Single", "Burst", "Auto" },
	["Recoil"] = {
		["V"] = 0.6,
		["H"] = 0.38,
		["Bias"] = 0.04
	},
	["Spread"] = {
		["Hip"] = 4.4
	},
	["Reload"] = {
		["Tactical"] = 2.4,
		["Empty"] = 3.2
	},
	["Attachments"] = {
		["Muzzle"] = v3,
		["Optic"] = v12,
		["Mag"] = v14
	}
}
v20.FAMAS = v33
local v34 = {
	["Name"] = "SKS",
	["Class"] = "DMR",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_762",
	["MagSize"] = 10,
	["ExtMagSize"] = 20,
	["Damage"] = 46,
	["FireModes"] = nil,
	["TBS"] = 0.182,
	["Velocity"] = 800,
	["Falloff"] = "DMR",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "World",
	["LootWeight"] = 100,
	["AnimSet"] = "Rifle",
	["Sound"] = "AR762",
	["FireModes"] = { "Single" },
	["Recoil"] = {
		["V"] = 1.6,
		["H"] = 0.5,
		["Bias"] = 0.05
	},
	["Spread"] = {
		["Hip"] = 5.5
	},
	["Reload"] = {
		["Tactical"] = 2.25,
		["Empty"] = 2.9
	},
	["Attachments"] = {
		["Muzzle"] = v4,
		["Grip"] = v8,
		["Optic"] = v13,
		["Mag"] = v14,
		["Stock"] = v18
	}
}
v20.SKS = v34
local v35 = {
	["Name"] = "Mini-14",
	["Class"] = "DMR",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_556",
	["MagSize"] = 20,
	["ExtMagSize"] = 30,
	["Damage"] = 42,
	["FireModes"] = nil,
	["TBS"] = 0.182,
	["Velocity"] = 990,
	["Falloff"] = "DMR",
	["Drag"] = 0.32,
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "World",
	["LootWeight"] = 100,
	["AnimSet"] = "Rifle",
	["Sound"] = "AR556",
	["FireModes"] = { "Single" },
	["Recoil"] = {
		["V"] = 1.1,
		["H"] = 0.3,
		["Bias"] = 0.02
	},
	["Spread"] = {
		["Hip"] = 5
	},
	["Reload"] = {
		["Tactical"] = 2.6,
		["Empty"] = 3.6
	},
	["Attachments"] = {
		["Muzzle"] = v4,
		["Optic"] = v13,
		["Mag"] = v14
	}
}
v20.Mini14 = v35
local v36 = {
	["Name"] = "L1A1 SLR",
	["Class"] = "DMR",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_762",
	["MagSize"] = 10,
	["ExtMagSize"] = 20,
	["Damage"] = 49,
	["FireModes"] = nil,
	["TBS"] = 0.182,
	["Velocity"] = 840,
	["Falloff"] = "DMR",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "World",
	["LootWeight"] = 60,
	["AnimSet"] = "Rifle",
	["Sound"] = "AR762",
	["FireModes"] = { "Single" },
	["Recoil"] = {
		["V"] = 2,
		["H"] = 0.55,
		["Bias"] = 0.05
	},
	["Spread"] = {
		["Hip"] = 6
	},
	["Reload"] = {
		["Tactical"] = 2.6,
		["Empty"] = 3.6
	},
	["Attachments"] = {
		["Muzzle"] = v4,
		["Optic"] = v13,
		["Mag"] = v14,
		["Stock"] = v18
	}
}
v20.SLR = v36
local v37 = {
	["Name"] = "Mk 12 SPR",
	["Class"] = "DMR",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_556",
	["MagSize"] = 20,
	["ExtMagSize"] = 30,
	["Damage"] = 43,
	["FireModes"] = nil,
	["TBS"] = 0.182,
	["Velocity"] = 930,
	["Falloff"] = "DMR",
	["Drag"] = 0.32,
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "None",
	["LootWeight"] = 0,
	["AnimSet"] = "Rifle",
	["Sound"] = "AR556",
	["FireModes"] = { "Single" },
	["Recoil"] = {
		["V"] = 1.2,
		["H"] = 0.3,
		["Bias"] = 0
	},
	["Spread"] = {
		["Hip"] = 5
	},
	["Reload"] = {
		["Tactical"] = 2.4,
		["Empty"] = 3.2
	},
	["Attachments"] = {
		["Muzzle"] = v4,
		["Grip"] = v8,
		["Optic"] = v13,
		["Mag"] = v14,
		["Stock"] = v18
	}
}
v20.Mk12 = v37
local v38 = {
	["Name"] = "Dragunov SVD",
	["Class"] = "DMR",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_762",
	["MagSize"] = 10,
	["ExtMagSize"] = 20,
	["Damage"] = 52,
	["FireModes"] = nil,
	["TBS"] = 0.333,
	["Velocity"] = 830,
	["Falloff"] = "DMR",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "None",
	["LootWeight"] = 0,
	["AnimSet"] = "Rifle",
	["Sound"] = "AR762",
	["FireModes"] = { "Single" },
	["Recoil"] = {
		["V"] = 2.2,
		["H"] = 0.4,
		["Bias"] = 0.03
	},
	["Spread"] = {
		["Hip"] = 6.5
	},
	["Reload"] = {
		["Tactical"] = 2.6,
		["Empty"] = 3.6
	},
	["Attachments"] = {
		["Muzzle"] = v4,
		["Optic"] = v13,
		["Mag"] = v15,
		["Stock"] = v18
	}
}
v20.SVD = v38
local v39 = {
	["Name"] = "VSS Vintorez",
	["Class"] = "DMR",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_9mm",
	["MagSize"] = 10,
	["ExtMagSize"] = 20,
	["Damage"] = 45,
	["FireModes"] = nil,
	["TBS"] = 0.0857,
	["Velocity"] = 330,
	["Falloff"] = "VSS",
	["Drag"] = 0.5,
	["Range"] = 600,
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["ZeroMax"] = 400,
	["AimPunch"] = 0.55,
	["Subsonic"] = true,
	["BuiltIn"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "World",
	["LootWeight"] = 60,
	["AnimSet"] = "Rifle",
	["Sound"] = "SMG",
	["FireModes"] = { "Single", "Auto" },
	["Recoil"] = {
		["V"] = 0.8,
		["H"] = 0.3,
		["Bias"] = 0
	},
	["Spread"] = {
		["Hip"] = 4.5
	},
	["Reload"] = {
		["Tactical"] = 2.1,
		["Empty"] = 2.9
	},
	["BuiltIn"] = {
		["Optic"] = "Scope4x",
		["Suppressed"] = true
	},
	["Attachments"] = {
		["Mag"] = v15,
		["Stock"] = v18
	}
}
v20.VSS = v39
local v40 = {
	["Name"] = "Mk 14 EBR",
	["Class"] = "DMR",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_762",
	["MagSize"] = 10,
	["ExtMagSize"] = 20,
	["Damage"] = 53,
	["FireModes"] = nil,
	["TBS"] = 0.15,
	["Velocity"] = 853,
	["Falloff"] = "DMRHeavy",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "Supply",
	["LootWeight"] = 100,
	["AnimSet"] = "Rifle",
	["Sound"] = "AR762",
	["FireModes"] = { "Single", "Auto" },
	["Recoil"] = {
		["V"] = 2.4,
		["H"] = 0.65,
		["Bias"] = 0.05
	},
	["Spread"] = {
		["Hip"] = 6.5
	},
	["Reload"] = {
		["Tactical"] = 2.6,
		["Empty"] = 3.6
	},
	["Attachments"] = {
		["Muzzle"] = v4,
		["Optic"] = v13,
		["Mag"] = v14,
		["Stock"] = v18
	}
}
v20.Mk14 = v40
local v41 = {
	["Name"] = "Kar98k",
	["Class"] = "SR",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_762",
	["MagSize"] = 5,
	["Damage"] = 79,
	["FireModes"] = nil,
	["BoltAction"] = true,
	["TBS"] = 1.9,
	["Velocity"] = 760,
	["Falloff"] = "SR",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "World",
	["LootWeight"] = 100,
	["AnimSet"] = "Bolt",
	["Sound"] = "Sniper",
	["FireModes"] = { "Single" },
	["Recoil"] = {
		["V"] = 4.5,
		["H"] = 0.6,
		["Bias"] = 0
	},
	["Spread"] = {
		["Hip"] = 8
	},
	["Reload"] = {
		["Shell"] = nil,
		["Clip"] = 4,
		["Shell"] = {
			["Start"] = 0.35,
			["First"] = 1,
			["Each"] = 0.75,
			["End"] = 0.55
		}
	},
	["Attachments"] = {
		["Muzzle"] = v5,
		["Optic"] = v13,
		["Stock"] = { "CheekPad", "BulletLoops" }
	}
}
v20.Kar98k = v41
local v42 = {
	["Name"] = "M24",
	["Class"] = "SR",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_762",
	["MagSize"] = 5,
	["ExtMagSize"] = 7,
	["Damage"] = 75,
	["FireModes"] = nil,
	["BoltAction"] = true,
	["TBS"] = 1.8,
	["Velocity"] = 790,
	["Falloff"] = "SR",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "World",
	["LootWeight"] = 70,
	["AnimSet"] = "Bolt",
	["Sound"] = "Sniper",
	["FireModes"] = { "Single" },
	["Recoil"] = {
		["V"] = 4.2,
		["H"] = 0.55,
		["Bias"] = 0
	},
	["Spread"] = {
		["Hip"] = 8
	},
	["Reload"] = {
		["Tactical"] = 1.8,
		["Empty"] = 4.2
	},
	["Attachments"] = {
		["Muzzle"] = v5,
		["Optic"] = v13,
		["Mag"] = v15,
		["Stock"] = v18
	}
}
v20.M24 = v42
local v43 = {
	["Name"] = "AWM",
	["Class"] = "SR",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_300",
	["MagSize"] = 5,
	["ExtMagSize"] = 7,
	["Damage"] = 105,
	["FireModes"] = nil,
	["BoltAction"] = true,
	["TBS"] = 1.85,
	["Velocity"] = 945,
	["Falloff"] = "SR",
	["Drag"] = 0.2,
	["Range"] = 1500,
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "Supply",
	["LootWeight"] = 100,
	["AnimSet"] = "Bolt",
	["Sound"] = "Sniper",
	["FireModes"] = { "Single" },
	["Recoil"] = {
		["V"] = 5,
		["H"] = 0.6,
		["Bias"] = 0
	},
	["Spread"] = {
		["Hip"] = 9,
		["ADS"] = 0.004
	},
	["Reload"] = {
		["Tactical"] = 2.75,
		["Empty"] = 4.6
	},
	["Attachments"] = {
		["Muzzle"] = v5,
		["Optic"] = v13,
		["Mag"] = v15,
		["Stock"] = v18
	}
}
v20.AWM = v43
local v44 = {
	["Name"] = "Winchester 1894",
	["Class"] = "SR",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_45",
	["MagSize"] = 8,
	["Damage"] = 66,
	["FireModes"] = nil,
	["BoltAction"] = true,
	["TBS"] = 0.6,
	["Velocity"] = 760,
	["Falloff"] = "SR",
	["Drag"] = 0.45,
	["ZeroMax"] = 300,
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "None",
	["LootWeight"] = 0,
	["AnimSet"] = "Bolt",
	["Sound"] = "Sniper",
	["FireModes"] = { "Single" },
	["Recoil"] = {
		["V"] = 3,
		["H"] = 0.5,
		["Bias"] = 0
	},
	["Spread"] = {
		["Hip"] = 6
	},
	["Reload"] = {
		["Shell"] = {
			["Start"] = 0.25,
			["First"] = 0.75,
			["Each"] = 0.55,
			["End"] = 0.5
		}
	},
	["Attachments"] = {
		["Stock"] = v19
	}
}
v20.Win94 = v44
local v45 = {
	["Name"] = "AMR .50",
	["Class"] = "SR",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_50",
	["MagSize"] = 10,
	["Damage"] = 118,
	["FireModes"] = nil,
	["TBS"] = 0.75,
	["Velocity"] = 900,
	["Falloff"] = "SR",
	["Drag"] = 0.15,
	["Range"] = 1600,
	["EquipTime"] = 0.9,
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["ADSTime"] = 0.4,
	["AimPunch"] = 1,
	["Attachments"] = nil,
	["Spawn"] = "None",
	["LootWeight"] = 0,
	["AnimSet"] = "Bolt",
	["Sound"] = "Sniper",
	["FireModes"] = { "Single" },
	["Recoil"] = {
		["V"] = 7,
		["H"] = 1,
		["Bias"] = 0
	},
	["Spread"] = {
		["Hip"] = 10
	},
	["Reload"] = {
		["Tactical"] = 3.5,
		["Empty"] = 4.5
	},
	["Attachments"] = {
		["Optic"] = v13
	}
}
v20.Lynx = v45
local v46 = {
	["Name"] = "UMP45",
	["Class"] = "SMG",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_9mm",
	["MagSize"] = 25,
	["ExtMagSize"] = 35,
	["Damage"] = 42,
	["FireModes"] = nil,
	["Burst"] = 2,
	["TBS"] = 0.0896,
	["Velocity"] = 360,
	["Falloff"] = "SMG",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "World",
	["LootWeight"] = 100,
	["AnimSet"] = "Rifle",
	["Sound"] = "SMG",
	["Subsonic"] = true,
	["FireModes"] = { "Single", "Burst", "Auto" },
	["Recoil"] = {
		["V"] = 0.38,
		["H"] = 0.2,
		["Bias"] = 0
	},
	["Spread"] = {
		["Hip"] = 7
	},
	["Reload"] = {
		["Tactical"] = 2,
		["Empty"] = 2.9
	},
	["Attachments"] = {
		["Muzzle"] = v6,
		["Grip"] = v8,
		["Optic"] = v12,
		["Mag"] = v16
	}
}
v20.UMP45 = v46
local v47 = {
	["Name"] = "Vector",
	["Class"] = "SMG",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_9mm",
	["MagSize"] = 19,
	["ExtMagSize"] = 33,
	["Damage"] = 31,
	["FireModes"] = nil,
	["Burst"] = 2,
	["TBS"] = 0.054,
	["Velocity"] = 300,
	["Falloff"] = "SMG",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "World",
	["LootWeight"] = 80,
	["AnimSet"] = "Rifle",
	["Sound"] = "SMG",
	["Subsonic"] = true,
	["FireModes"] = { "Single", "Burst", "Auto" },
	["Recoil"] = {
		["V"] = 0.32,
		["H"] = 0.25,
		["Bias"] = 0.02
	},
	["Spread"] = {
		["Hip"] = 7
	},
	["Reload"] = {
		["Tactical"] = 1.7,
		["Empty"] = 2
	},
	["Attachments"] = {
		["Muzzle"] = v6,
		["Grip"] = v8,
		["Optic"] = v12,
		["Mag"] = v16,
		["Stock"] = v17
	}
}
v20.Vector = v47
local v48 = {
	["Name"] = "Micro UZI",
	["Class"] = "SMG",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_9mm",
	["MagSize"] = 25,
	["ExtMagSize"] = 35,
	["Damage"] = 26,
	["FireModes"] = nil,
	["TBS"] = 0.048,
	["Velocity"] = 350,
	["Falloff"] = "SMG",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "World",
	["LootWeight"] = 100,
	["AnimSet"] = "Pistol",
	["Sound"] = "SMG",
	["Subsonic"] = true,
	["FireModes"] = { "Single", "Auto" },
	["Recoil"] = {
		["V"] = 0.42,
		["H"] = 0.36,
		["Bias"] = -0.03
	},
	["Spread"] = {
		["Hip"] = 7.5
	},
	["Reload"] = {
		["Tactical"] = 2.2,
		["Empty"] = 3
	},
	["Attachments"] = {
		["Muzzle"] = v6,
		["Optic"] = v10,
		["Mag"] = v16,
		["Stock"] = { "TacticalStock" }
	}
}
v20.MicroUZI = v48
local v49 = {
	["Name"] = "MP5K",
	["Class"] = "SMG",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_9mm",
	["MagSize"] = 30,
	["ExtMagSize"] = 40,
	["Damage"] = 32,
	["FireModes"] = nil,
	["Burst"] = 3,
	["TBS"] = 0.0667,
	["Velocity"] = 400,
	["Falloff"] = "SMG",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "None",
	["LootWeight"] = 0,
	["AnimSet"] = "Rifle",
	["Sound"] = "SMG",
	["Subsonic"] = true,
	["FireModes"] = { "Single", "Burst", "Auto" },
	["Recoil"] = {
		["V"] = 0.35,
		["H"] = 0.22,
		["Bias"] = 0
	},
	["Spread"] = {
		["Hip"] = 7
	},
	["Reload"] = {
		["Tactical"] = 1.9,
		["Empty"] = 2.9
	},
	["Attachments"] = {
		["Muzzle"] = v6,
		["Grip"] = v8,
		["Optic"] = v12,
		["Mag"] = v16,
		["Stock"] = v17
	}
}
v20.MP5K = v49
local v50 = {
	["Name"] = "Thompson M1928",
	["Class"] = "SMG",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_9mm",
	["MagSize"] = 30,
	["ExtMagSize"] = 50,
	["Damage"] = 40,
	["FireModes"] = nil,
	["TBS"] = 0.08,
	["Velocity"] = 280,
	["Falloff"] = "SMG",
	["EquipTime"] = 0.55,
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "World",
	["LootWeight"] = 60,
	["AnimSet"] = "Rifle",
	["Sound"] = "SMG",
	["Subsonic"] = true,
	["FireModes"] = { "Single", "Auto" },
	["Recoil"] = {
		["V"] = 0.42,
		["H"] = 0.3,
		["Bias"] = 0.03
	},
	["Spread"] = {
		["Hip"] = 7
	},
	["Reload"] = {
		["Tactical"] = 2.3,
		["Empty"] = 3.1
	},
	["Attachments"] = {
		["Muzzle"] = v6,
		["Grip"] = { "VerticalGrip" },
		["Mag"] = v16
	}
}
v20.Tommy = v50
local v51 = {
	["Name"] = "JS9",
	["Class"] = "SMG",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_9mm",
	["MagSize"] = 30,
	["ExtMagSize"] = 40,
	["Damage"] = 32,
	["FireModes"] = nil,
	["TBS"] = 0.0667,
	["Velocity"] = 400,
	["Falloff"] = "SMG",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "None",
	["LootWeight"] = 0,
	["AnimSet"] = "Rifle",
	["Sound"] = "SMG",
	["Subsonic"] = true,
	["FireModes"] = { "Single", "Auto" },
	["Recoil"] = {
		["V"] = 0.34,
		["H"] = 0.2,
		["Bias"] = 0
	},
	["Spread"] = {
		["Hip"] = 7
	},
	["Reload"] = {
		["Tactical"] = 2,
		["Empty"] = 2.8
	},
	["Attachments"] = {
		["Muzzle"] = v6,
		["Grip"] = v8,
		["Optic"] = v12,
		["Mag"] = v16
	}
}
v20.JS9 = v51
local v52 = {
	["Name"] = "MP9",
	["Class"] = "SMG",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_9mm",
	["MagSize"] = 30,
	["ExtMagSize"] = 40,
	["Damage"] = 31,
	["FireModes"] = nil,
	["TBS"] = 0.06,
	["Velocity"] = 400,
	["Falloff"] = "SMG",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "None",
	["LootWeight"] = 0,
	["AnimSet"] = "Pistol",
	["Sound"] = "SMG",
	["Subsonic"] = true,
	["FireModes"] = { "Single", "Auto" },
	["Recoil"] = {
		["V"] = 0.36,
		["H"] = 0.28,
		["Bias"] = 0.02
	},
	["Spread"] = {
		["Hip"] = 7.5
	},
	["Reload"] = {
		["Tactical"] = 2,
		["Empty"] = 2.8
	},
	["Attachments"] = {
		["Muzzle"] = v6,
		["Optic"] = v11,
		["Mag"] = v16,
		["Stock"] = { "TacticalStock" }
	}
}
v20.MP9 = v52
v20.P90 = {
	["Name"] = "P90",
	["Class"] = "SMG",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_57",
	["MagSize"] = 50,
	["Damage"] = 35,
	["FireModes"] = nil,
	["TBS"] = 0.06,
	["Velocity"] = 716,
	["Falloff"] = "SMG",
	["Drag"] = 0.5,
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["BuiltIn"] = nil,
	["Spawn"] = "None",
	["LootWeight"] = 0,
	["AnimSet"] = "Rifle",
	["Sound"] = "SMG",
	["FireModes"] = { "Auto" },
	["Recoil"] = {
		["V"] = 0.25,
		["H"] = 0.15,
		["Bias"] = 0
	},
	["Spread"] = {
		["Hip"] = 6.5
	},
	["Reload"] = {
		["Tactical"] = 2.4,
		["Empty"] = 3
	},
	["BuiltIn"] = {
		["Optic"] = "RedDot"
	}
}
local v53 = {
	["Name"] = "M249",
	["Class"] = "LMG",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_556",
	["MagSize"] = 75,
	["ExtMagSize"] = 150,
	["Damage"] = 41,
	["FireModes"] = nil,
	["TBS"] = 0.075,
	["Velocity"] = 915,
	["Falloff"] = "LMG",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "World",
	["LootWeight"] = 50,
	["AnimSet"] = "Rifle",
	["Sound"] = "LMG",
	["FireModes"] = { "Auto" },
	["Recoil"] = {
		["V"] = 0.42,
		["H"] = 0.33,
		["Bias"] = 0.02,
		["Crouch"] = 0.83,
		["Prone"] = 0.73
	},
	["Spread"] = {
		["Hip"] = 6
	},
	["Reload"] = {
		["Tactical"] = 4,
		["Empty"] = 4.6
	},
	["Attachments"] = {
		["Optic"] = v12,
		["Mag"] = v14,
		["Stock"] = v17
	}
}
v20.M249 = v53
local v54 = {
	["Name"] = "RPD",
	["Class"] = "LMG",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_762",
	["MagSize"] = 50,
	["ExtMagSize"] = 110,
	["Damage"] = 43,
	["FireModes"] = nil,
	["TBS"] = 0.08,
	["Velocity"] = 735,
	["Falloff"] = "LMG",
	["Drag"] = 0.5,
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "None",
	["LootWeight"] = 0,
	["AnimSet"] = "Rifle",
	["Sound"] = "LMG",
	["FireModes"] = { "Auto" },
	["Recoil"] = {
		["V"] = 0.45,
		["H"] = 0.33,
		["Bias"] = -0.02,
		["Stand"] = 0.9,
		["Crouch"] = 0.83,
		["Prone"] = 0.73
	},
	["Spread"] = {
		["Hip"] = 6
	},
	["Reload"] = {
		["Tactical"] = 3.6,
		["Empty"] = 4.3
	},
	["Attachments"] = {
		["Optic"] = v12,
		["Mag"] = v14
	}
}
v20.RPD = v54
local v55 = {
	["Name"] = "MG3",
	["Class"] = "LMG",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_762",
	["MagSize"] = 75,
	["Damage"] = 42,
	["FireModes"] = nil,
	["TBS"] = 0.0909,
	["TBSByMode"] = nil,
	["Velocity"] = 820,
	["Falloff"] = "LMG",
	["Drag"] = 0.4,
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["EquipTime"] = 0.9,
	["Attachments"] = nil,
	["Spawn"] = "None",
	["LootWeight"] = 0,
	["AnimSet"] = "Rifle",
	["Sound"] = "LMG",
	["FireModes"] = { "Auto", "AutoFast" },
	["TBSByMode"] = {
		["AutoFast"] = 0.0606
	},
	["Recoil"] = {
		["V"] = 0.48,
		["H"] = 0.45,
		["Bias"] = 0.03,
		["Stand"] = 0.85,
		["Crouch"] = 0.83,
		["Prone"] = 0.55
	},
	["Spread"] = {
		["Hip"] = 7
	},
	["Reload"] = {
		["Tactical"] = 4,
		["Empty"] = 4.6
	},
	["Attachments"] = {
		["Optic"] = {
			"Scope2x",
			"Scope3x",
			"Scope4x",
			"Scope6x"
		}
	}
}
v20.MG3 = v55
local v56 = {
	["Name"] = "Winchester M1897",
	["Class"] = "SG",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_12g",
	["MagSize"] = 5,
	["Damage"] = 26,
	["Pellets"] = 9,
	["PelletSpread"] = 8,
	["FireModes"] = nil,
	["BoltAction"] = true,
	["TBS"] = 0.55,
	["Velocity"] = 360,
	["Falloff"] = "Shotgun",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "World",
	["LootWeight"] = 100,
	["AnimSet"] = "Shotgun",
	["Sound"] = "Shotgun",
	["FireModes"] = { "Single" },
	["Recoil"] = {
		["V"] = 4,
		["H"] = 1,
		["Bias"] = 0
	},
	["Spread"] = {
		["Hip"] = 2.5
	},
	["Reload"] = {
		["Shell"] = {
			["Start"] = 0.3,
			["First"] = 0.635,
			["Each"] = 0.715,
			["End"] = 0.5
		}
	},
	["Attachments"] = {
		["Muzzle"] = { "Choke", "Duckbill" },
		["Stock"] = v19
	}
}
v20.S1897 = v56
local v57 = {
	["Name"] = "Beretta 686",
	["Class"] = "SG",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_12g",
	["MagSize"] = 2,
	["Damage"] = 26,
	["Pellets"] = 9,
	["PelletSpread"] = 7,
	["FireModes"] = nil,
	["TBS"] = 0.2,
	["Velocity"] = 370,
	["Falloff"] = "Shotgun",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "World",
	["LootWeight"] = 100,
	["AnimSet"] = "Shotgun",
	["Sound"] = "Shotgun",
	["FireModes"] = { "Single" },
	["Recoil"] = {
		["V"] = 5,
		["H"] = 1,
		["Bias"] = 0
	},
	["Spread"] = {
		["Hip"] = 2.5
	},
	["Reload"] = {
		["Tactical"] = 2,
		["Empty"] = 2.4
	},
	["Attachments"] = {
		["Muzzle"] = { "Choke" },
		["Stock"] = v19
	}
}
v20.S686 = v57
local v58 = {
	["Name"] = "Saiga-12K",
	["Class"] = "SG",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_12g",
	["MagSize"] = 5,
	["ExtMagSize"] = 10,
	["Damage"] = 23,
	["Pellets"] = 9,
	["PelletSpread"] = 9,
	["FireModes"] = nil,
	["TBS"] = 0.25,
	["Velocity"] = 350,
	["Falloff"] = "Shotgun",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "World",
	["LootWeight"] = 70,
	["AnimSet"] = "Rifle",
	["AnimPack"] = "Rifle",
	["Sound"] = "Shotgun",
	["FireModes"] = { "Single" },
	["Recoil"] = {
		["V"] = 2.5,
		["H"] = 0.8,
		["Bias"] = 0
	},
	["Spread"] = {
		["Hip"] = 3
	},
	["Reload"] = {
		["Tactical"] = 2.4,
		["Empty"] = 3
	},
	["Attachments"] = {
		["Muzzle"] = { "Choke", "Duckbill", "Suppressor_AR" },
		["Optic"] = v11,
		["Mag"] = v14
	}
}
v20.S12K = v58
local v59 = {
	["Name"] = "DP-12",
	["Class"] = "SG",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_12g",
	["MagSize"] = 14,
	["Damage"] = 28,
	["Pellets"] = 9,
	["PelletSpread"] = 8,
	["FireModes"] = nil,
	["TBS"] = 0.125,
	["PumpEvery"] = 2,
	["PumpTime"] = 0.45,
	["Velocity"] = 360,
	["Falloff"] = "Shotgun",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "World",
	["LootWeight"] = 40,
	["AnimSet"] = "Shotgun",
	["Sound"] = "Shotgun",
	["FireModes"] = { "Single" },
	["Recoil"] = {
		["V"] = 3,
		["H"] = 0.8,
		["Bias"] = 0
	},
	["Spread"] = {
		["Hip"] = 2.5
	},
	["Reload"] = {
		["Shell"] = {
			["Start"] = 0.3,
			["First"] = 0.6,
			["Each"] = 0.55,
			["End"] = 0.5
		}
	},
	["Attachments"] = {
		["Optic"] = v12
	}
}
v20.DBS = v59
local v60 = {
	["Name"] = "Sawed-Off",
	["Class"] = "SG",
	["Slot"] = "Pistol",
	["Ammo"] = "Ammo_12g",
	["MagSize"] = 2,
	["Damage"] = 21,
	["Pellets"] = 9,
	["PelletSpread"] = 12,
	["FireModes"] = nil,
	["TBS"] = 0.25,
	["Velocity"] = 330,
	["EquipTime"] = 0.4,
	["Falloff"] = "Shotgun",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "None",
	["LootWeight"] = 0,
	["AnimSet"] = "Shotgun",
	["Sound"] = "Shotgun",
	["FireModes"] = { "Single" },
	["Recoil"] = {
		["V"] = 5,
		["H"] = 1.5,
		["Bias"] = 0
	},
	["Spread"] = {
		["Hip"] = 3
	},
	["Reload"] = {
		["Tactical"] = 2.2,
		["Empty"] = 2.6
	},
	["Attachments"] = {
		["Muzzle"] = { "Choke" }
	}
}
v20.SawedOff = v60
local v61 = {
	["Name"] = "Slugger",
	["Class"] = "SG",
	["Slot"] = "Primary",
	["Ammo"] = "Ammo_12g",
	["MagSize"] = 5,
	["ExtMagSize"] = 10,
	["Damage"] = 99,
	["Pellets"] = 1,
	["FireModes"] = nil,
	["TBS"] = 0.125,
	["Velocity"] = 625,
	["Falloff"] = "Slug",
	["Drag"] = 0.8,
	["Range"] = 400,
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "None",
	["LootWeight"] = 0,
	["AnimSet"] = "Rifle",
	["AnimPack"] = "Rifle",
	["Sound"] = "Shotgun",
	["FireModes"] = { "Single" },
	["Recoil"] = {
		["V"] = 4,
		["H"] = 1,
		["Bias"] = 0
	},
	["Spread"] = {
		["Hip"] = 3,
		["ADS"] = 0.02
	},
	["Reload"] = {
		["Tactical"] = 2.5,
		["Empty"] = 3.2
	},
	["Attachments"] = {
		["Muzzle"] = { "Choke", "Suppressor_AR" },
		["Optic"] = v12,
		["Mag"] = v14
	}
}
v20.O12 = v61
local v62 = {
	["Name"] = "Beretta 92",
	["Class"] = "Pistol",
	["Slot"] = "Pistol",
	["Ammo"] = "Ammo_9mm",
	["MagSize"] = 15,
	["ExtMagSize"] = 20,
	["Damage"] = 34,
	["FireModes"] = nil,
	["TBS"] = 0.1,
	["Velocity"] = 380,
	["Falloff"] = "Pistol",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["OpticHost"] = "Slide",
	["Spawn"] = "World",
	["LootWeight"] = 100,
	["AnimSet"] = "Pistol",
	["Sound"] = "Pistol",
	["Subsonic"] = true,
	["FireModes"] = { "Single" },
	["Recoil"] = {
		["V"] = 1.4,
		["H"] = 0.4,
		["Bias"] = 0
	},
	["Spread"] = {
		["Hip"] = 2.5
	},
	["Reload"] = {
		["Tactical"] = 1.7,
		["Empty"] = 2
	},
	["Attachments"] = {
		["Muzzle"] = v7,
		["Grip"] = v9,
		["Optic"] = v10,
		["Mag"] = v16
	}
}
v20.P92 = v62
local v63 = {
	["Name"] = "Glock 18C",
	["Class"] = "Pistol",
	["Slot"] = "Pistol",
	["Ammo"] = "Ammo_9mm",
	["MagSize"] = 17,
	["ExtMagSize"] = 25,
	["Damage"] = 23,
	["FireModes"] = nil,
	["TBS"] = 0.06,
	["Velocity"] = 375,
	["Falloff"] = "Pistol",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["OpticHost"] = "Slide",
	["Spawn"] = "World",
	["LootWeight"] = 90,
	["AnimSet"] = "Pistol",
	["Sound"] = "Pistol",
	["Subsonic"] = true,
	["FireModes"] = { "Single", "Auto" },
	["Recoil"] = {
		["V"] = 0.9,
		["H"] = 0.45,
		["Bias"] = 0.05
	},
	["Spread"] = {
		["Hip"] = 3
	},
	["Reload"] = {
		["Tactical"] = 1.7,
		["Empty"] = 2
	},
	["Attachments"] = {
		["Muzzle"] = v7,
		["Grip"] = v9,
		["Optic"] = v10,
		["Mag"] = v16
	}
}
v20.P18C = v63
local v64 = {
	["Name"] = "Nagant M1895",
	["Class"] = "Pistol",
	["Slot"] = "Pistol",
	["Ammo"] = "Ammo_762",
	["MagSize"] = 7,
	["Damage"] = 64,
	["FireModes"] = nil,
	["TBS"] = 0.2,
	["Velocity"] = 330,
	["Falloff"] = "PistolHeavy",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "World",
	["LootWeight"] = 70,
	["AnimSet"] = "Pistol",
	["Sound"] = "Pistol",
	["Subsonic"] = true,
	["FireModes"] = { "Single" },
	["Recoil"] = {
		["V"] = 3,
		["H"] = 0.6,
		["Bias"] = 0
	},
	["Spread"] = {
		["Hip"] = 2.5
	},
	["Reload"] = {
		["Shell"] = {
			["Start"] = 0.3,
			["First"] = 0.7,
			["Each"] = 0.75,
			["End"] = 0.4
		}
	},
	["Attachments"] = {
		["Muzzle"] = v7
	}
}
v20.R1895 = v64
local v65 = {
	["Name"] = "Desert Eagle",
	["Class"] = "Pistol",
	["Slot"] = "Pistol",
	["Ammo"] = "Ammo_45",
	["MagSize"] = 7,
	["ExtMagSize"] = 10,
	["Damage"] = 62,
	["FireModes"] = nil,
	["TBS"] = 0.2,
	["Velocity"] = 380,
	["Falloff"] = "PistolHeavy",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["AimPunch"] = 0.4,
	["Attachments"] = nil,
	["Spawn"] = "None",
	["LootWeight"] = 0,
	["AnimSet"] = "Pistol",
	["Sound"] = "Pistol",
	["FireModes"] = { "Single" },
	["Recoil"] = {
		["V"] = 4,
		["H"] = 0.8,
		["Bias"] = 0
	},
	["Spread"] = {
		["Hip"] = 3
	},
	["Reload"] = {
		["Tactical"] = 1.7,
		["Empty"] = 2
	},
	["Attachments"] = {
		["Muzzle"] = v7,
		["Grip"] = v9,
		["Optic"] = v10,
		["Mag"] = v16
	}
}
v20.Deagle = v65
local v66 = {
	["Name"] = "Skorpion vz. 61",
	["Class"] = "Pistol",
	["Slot"] = "Pistol",
	["Ammo"] = "Ammo_9mm",
	["MagSize"] = 20,
	["ExtMagSize"] = 40,
	["Damage"] = 22,
	["FireModes"] = nil,
	["TBS"] = 0.0706,
	["Velocity"] = 350,
	["Falloff"] = "Pistol",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Attachments"] = nil,
	["Spawn"] = "None",
	["LootWeight"] = 0,
	["AnimSet"] = "Pistol",
	["Sound"] = "Pistol",
	["Subsonic"] = true,
	["FireModes"] = { "Single", "Auto" },
	["Recoil"] = {
		["V"] = 0.6,
		["H"] = 0.35,
		["Bias"] = 0.02
	},
	["Spread"] = {
		["Hip"] = 3.5
	},
	["Reload"] = {
		["Tactical"] = 2,
		["Empty"] = 2.7
	},
	["Attachments"] = {
		["Muzzle"] = v7,
		["Grip"] = { "Laser", "VerticalGrip" },
		["Optic"] = v10,
		["Mag"] = v16,
		["Stock"] = { "TacticalStock" }
	}
}
v20.Skorpion = v66
v20.FlareGun = {
	["Name"] = "Flare Gun",
	["Class"] = "Pistol",
	["Slot"] = "Pistol",
	["Ammo"] = "FlareRound",
	["MagSize"] = 1,
	["Damage"] = 0,
	["FireModes"] = nil,
	["TBS"] = 1,
	["Velocity"] = 120,
	["Falloff"] = "None",
	["Drag"] = 0.2,
	["Range"] = 600,
	["Flare"] = true,
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["Spawn"] = "World",
	["LootWeight"] = 5,
	["AnimSet"] = "Pistol",
	["Sound"] = "Flare",
	["MinAimPitch"] = 45,
	["AimPitchTolerance"] = 8,
	["FireModes"] = { "Single" },
	["Recoil"] = {
		["V"] = 3,
		["H"] = 0.5,
		["Bias"] = 0
	},
	["Spread"] = {
		["Hip"] = 3
	},
	["Reload"] = {
		["Tactical"] = 2,
		["Empty"] = 2
	}
}
v20.Pan = {
	["Name"] = "Frying Pan",
	["Class"] = "Melee",
	["Slot"] = "Melee",
	["MeleeKind"] = "Pan",
	["Range"] = 2,
	["SwingTime"] = 0.3,
	["Cooldown"] = 0.85,
	["BlocksBullets"] = true,
	["Spawn"] = "World",
	["LootWeight"] = 100,
	["AnimSet"] = "Melee",
	["Sound"] = "Melee",
	["EquipTime"] = 0.5
}
v20.Machete = {
	["Name"] = "Machete",
	["Class"] = "Melee",
	["Slot"] = "Melee",
	["MeleeKind"] = "Blade",
	["Range"] = 2.2,
	["SwingTime"] = 0.25,
	["Cooldown"] = 0.7,
	["Spawn"] = "World",
	["LootWeight"] = 100,
	["AnimSet"] = "Melee",
	["Sound"] = "Melee"
}
v20.Crowbar = {
	["Name"] = "Crowbar",
	["Class"] = "Melee",
	["Slot"] = "Melee",
	["MeleeKind"] = "Blade",
	["Range"] = 2.1,
	["SwingTime"] = 0.28,
	["Cooldown"] = 0.75,
	["Spawn"] = "World",
	["LootWeight"] = 100,
	["AnimSet"] = "Melee",
	["Sound"] = "Melee"
}
v20.Sickle = {
	["Name"] = "Sickle",
	["Class"] = "Melee",
	["Slot"] = "Melee",
	["MeleeKind"] = "Blade",
	["Range"] = 1.9,
	["SwingTime"] = 0.22,
	["Cooldown"] = 0.65,
	["Spawn"] = "World",
	["LootWeight"] = 100,
	["AnimSet"] = "Melee",
	["Sound"] = "Melee"
}
local v67 = {
	["Name"] = "Crossbow",
	["Class"] = "Special",
	["Slot"] = "Primary",
	["Ammo"] = "Bolt_Crossbow",
	["MagSize"] = 1,
	["Damage"] = 105,
	["FireModes"] = nil,
	["TBS"] = 0.5,
	["Velocity"] = 160,
	["Falloff"] = "Crossbow",
	["Drag"] = 0.25,
	["Range"] = 400,
	["ZeroMax"] = 100,
	["Recoil"] = nil,
	["Spread"] = nil,
	["Reload"] = nil,
	["DamageClass"] = "Crossbow",
	["Subsonic"] = true,
	["Attachments"] = nil,
	["Spawn"] = "World",
	["LootWeight"] = 20,
	["AnimSet"] = "Rifle",
	["Sound"] = "Crossbow",
	["FireModes"] = { "Single" },
	["Recoil"] = {
		["V"] = 1.5,
		["H"] = 0.2,
		["Bias"] = 0
	},
	["Spread"] = {
		["Hip"] = 3,
		["ADS"] = 0.01
	},
	["Reload"] = {
		["Tactical"] = 3.55,
		["Empty"] = 3.55
	},
	["Attachments"] = {
		["Optic"] = v11
	}
}
v20.Crossbow = v67
v20.Panzerfaust = {
	["Name"] = "Panzerfaust",
	["Class"] = "Special",
	["Slot"] = "Primary",
	["MagSize"] = 1,
	["SingleUse"] = true,
	["Damage"] = 0,
	["FireModes"] = nil,
	["TBS"] = 1,
	["Velocity"] = 85,
	["Falloff"] = "None",
	["Drag"] = 0,
	["Range"] = 300,
	["ZeroMax"] = 100,
	["Explosion"] = "Panzerfaust",
	["Recoil"] = nil,
	["Spread"] = nil,
	["Spawn"] = "None",
	["LootWeight"] = 0,
	["AnimSet"] = "Rifle",
	["Sound"] = "Launcher",
	["EquipTime"] = 1,
	["FireModes"] = { "Single" },
	["Recoil"] = {
		["V"] = 6,
		["H"] = 1,
		["Bias"] = 0
	},
	["Spread"] = {
		["Hip"] = 4,
		["ADS"] = 0.02
	}
}
v20.Frag = {
	["Name"] = "Frag Grenade",
	["Class"] = "Throwable",
	["Slot"] = "Throwable",
	["Fuse"] = 5,
	["Explosion"] = "Frag",
	["Cook"] = true,
	["Detonate"] = "Fuse",
	["Bounce"] = 0.35,
	["Friction"] = 0.55,
	["Radius"] = 0.05,
	["Spawn"] = "World",
	["LootWeight"] = 100,
	["AnimSet"] = "Throwable",
	["Sound"] = "Frag"
}
v20.Smoke = {
	["Name"] = "Smoke Grenade",
	["Class"] = "Throwable",
	["Slot"] = "Throwable",
	["Fuse"] = 1,
	["StartOnLand"] = true,
	["Detonate"] = "Fuse",
	["Bounce"] = 0.25,
	["Friction"] = 0.6,
	["Radius"] = 0.05,
	["Cloud"] = nil,
	["Spawn"] = "World",
	["LootWeight"] = 80,
	["AnimSet"] = "Throwable",
	["Sound"] = "Smoke",
	["Cloud"] = {
		["Radius"] = 6,
		["Duration"] = 40,
		["SoundStopsBefore"] = 10
	}
}
v20.Stun = {
	["Name"] = "Stun Grenade",
	["Class"] = "Throwable",
	["Slot"] = "Throwable",
	["Fuse"] = 5,
	["ImpactDelay"] = 0.7,
	["Detonate"] = "Impact",
	["Bounce"] = 0.3,
	["Friction"] = 0.55,
	["Radius"] = 0.05,
	["Flash"] = nil,
	["Spawn"] = "World",
	["LootWeight"] = 70,
	["AnimSet"] = "Throwable",
	["Sound"] = "Stun",
	["Flash"] = {
		["DirectMax"] = 5.5,
		["DirectMin"] = 1,
		["DirectRange"] = 20,
		["ConeDeg"] = 100,
		["IndirectMax"] = 3,
		["IndirectRange"] = 6.5
	}
}
v20.Molotov = {
	["Name"] = "Molotov Cocktail",
	["Class"] = "Throwable",
	["Slot"] = "Throwable",
	["Fuse"] = 30,
	["Detonate"] = "Shatter",
	["Bounce"] = 0,
	["Friction"] = 1,
	["Radius"] = 0.08,
	["Fire"] = nil,
	["Spawn"] = "World",
	["LootWeight"] = 70,
	["AnimSet"] = "Throwable",
	["Sound"] = "Molotov",
	["Fire"] = {
		["Radius"] = 3.5,
		["Duration"] = 5,
		["DPS"] = 15.5,
		["BurnDPS"] = 3.5,
		["BurnTime"] = 2.5,
		["Tick"] = 0.25
	}
}
v_u_1.Weapons = v20
function v_u_1.pickDefaultMode(p68) -- name: pickDefaultMode
	if type(p68) == "table" and #p68 ~= 0 then
		return table.find(p68, "Auto") and "Auto" or (table.find(p68, "Burst") and "Burst" or p68[1])
	else
		return nil
	end
end
for _, v69 in v_u_1.Weapons do
	if not v69.FireModes or v69.DefaultMode ~= nil then
		continue
	end
	v69.DefaultMode = v_u_1.pickDefaultMode(v69.FireModes)
end
v_u_1.ReloadCommit = {
	["Default"] = {
		["Tactical"] = 0.68,
		["Empty"] = 0.56
	},
	["Pistol"] = {
		["Tactical"] = 0.7,
		["Empty"] = 0.6
	},
	["LMG"] = {
		["Tactical"] = 0.84,
		["Empty"] = 0.74
	},
	["BoltMag"] = {
		["Tactical"] = 0.7,
		["Empty"] = 0.64
	},
	["Slap"] = {
		["Tactical"] = 0.68,
		["Empty"] = 0.64
	},
	["Clip"] = {
		["Tactical"] = 0.62,
		["Empty"] = 0.62
	},
	["Break"] = {
		["Tactical"] = 0.8,
		["Empty"] = 0.8
	},
	["String"] = {
		["Tactical"] = 0.8,
		["Empty"] = 0.8
	}
}
v_u_1.ReloadCommitKind = {
	["M249"] = "LMG",
	["RPD"] = "LMG",
	["MG3"] = "LMG",
	["M24"] = "BoltMag",
	["AWM"] = "BoltMag",
	["Lynx"] = "BoltMag",
	["UMP45"] = "Slap",
	["MP5K"] = "Slap",
	["JS9"] = "Slap",
	["Kar98k"] = "Clip",
	["S686"] = "Break",
	["SawedOff"] = "Break",
	["FlareGun"] = "Break",
	["Crossbow"] = "String"
}
v_u_1.EmptyStyleReloadClasses = {
	["AR"] = true,
	["DMR"] = true,
	["SMG"] = true
}
v_u_1.EmptyStyleReloadSkip = {
	["AKM"] = true,
	["HK416"] = true,
	["M16A4"] = true
}
function v_u_1.emptyStyleReload(p70) -- name: emptyStyleReload
	-- upvalues: (copy) v_u_1
	local v71
	if p70 then
		v71 = v_u_1.Weapons[p70]
	else
		v71 = p70
	end
	if v71 then
		local v72 = v71.Reload
		if type(v72) == "table" and not (v71.Reload.Shell or v_u_1.EmptyStyleReloadSkip[p70]) then
			return v_u_1.EmptyStyleReloadClasses[v71.Class] == true
		end
	end
	return false
end
function v_u_1.reloadCommit(p73, p74) -- name: reloadCommit
	-- upvalues: (copy) v_u_1
	local v75 = v_u_1.emptyStyleReload(p73) and true or p74
	local v76
	if p73 then
		v76 = v_u_1.Weapons[p73]
	else
		v76 = p73
	end
	local v77 = v76 and v76.Reload
	if v77 then
		v77 = v76.Reload.Commit
	end
	local v78 = type(v77) == "table" and v77 and v77 or (v_u_1.ReloadCommit[p73 and v_u_1.ReloadCommitKind[p73] or (v76 and v76.Class == "Pistol" and "Pistol" or "Default")] or v_u_1.ReloadCommit.Default)
	local v79 = v75 and (v78.Empty or v78.Tactical) or (v78.Tactical or v78.Empty)
	local v80 = tonumber(v79) or 0.68
	return math.clamp(v80, 0.2, 1)
end
v_u_1.Throw = {
	["OverhandSpeed"] = 22,
	["UnderhandSpeed"] = 11,
	["UpAngleDeg"] = 8,
	["UnderhandUpDeg"] = 2,
	["MaxCookOverFuse"] = 0.1,
	["PinPullTime"] = 0.35,
	["ThrowCooldown"] = 0.9,
	["MaxInFlightPerPlayer"] = 3
}
v_u_1.Breath = {
	["HoldMax"] = 5.5,
	["Regen"] = 0.7,
	["ExhaustedSwayMult"] = 2,
	["HoldSwayMult"] = 0.12,
	["BaseSwayDeg"] = 0.18,
	["ProneMult"] = 0.35,
	["CrouchMult"] = 0.7
}
function v_u_1.get(p81) -- name: get
	-- upvalues: (copy) v_u_1
	if p81 == nil then
		return nil
	else
		return v_u_1.Weapons[p81]
	end
end
function v_u_1.stat(p82, p83) -- name: stat
	-- upvalues: (copy) v_u_1
	local v84 = v_u_1.Weapons[p82]
	if not v84 then
		return nil
	end
	local v85 = v84[p83]
	if v85 ~= nil then
		return v85
	end
	local v86 = v_u_1.Class[v84.Class]
	if v86 then
		v86 = v86[p83]
	end
	return v86
end
function v_u_1.isGun(p87) -- name: isGun
	-- upvalues: (copy) v_u_1
	if p87 then
		p87 = v_u_1.Weapons[p87]
	end
	local v88
	if p87 == nil or p87.Class == "Melee" then
		v88 = false
	else
		v88 = p87.Class ~= "Throwable"
	end
	return v88
end
function v_u_1.isThrowable(p89) -- name: isThrowable
	-- upvalues: (copy) v_u_1
	if p89 then
		p89 = v_u_1.Weapons[p89]
	end
	local v90
	if p89 == nil then
		v90 = false
	else
		v90 = p89.Class == "Throwable"
	end
	return v90
end
function v_u_1.isMelee(p91) -- name: isMelee
	-- upvalues: (copy) v_u_1
	if p91 then
		p91 = v_u_1.Weapons[p91]
	end
	local v92
	if p91 == nil then
		v92 = false
	else
		v92 = p91.Class == "Melee"
	end
	return v92
end
function v_u_1.animPack(p93) -- name: animPack
	-- upvalues: (copy) v_u_1
	if p93 then
		p93 = v_u_1.Weapons[p93]
	end
	return p93 and (p93.AnimPack or v_u_1.AnimSetToPack[p93.AnimSet or "Rifle"] or "Rifle") or nil
end
function v_u_1.attachSlotFor(p94, p95) -- name: attachSlotFor
	-- upvalues: (copy) v_u_1
	local v96 = v_u_1.Weapons[p94]
	if not (v96 and v96.Attachments) then
		return nil
	end
	for v97, v98 in v96.Attachments do
		if not table.find(v98, p95) then
			continue
		end
		return v97
	end
	return nil
end
function v_u_1.ironZeroing(p99) -- name: ironZeroing
	-- upvalues: (copy) v_u_1
	local v100 = {}
	for v101 = 100, v_u_1.stat(p99, "ZeroMax") or 100, 100 do
		table.insert(v100, v101)
	end
	return v100
end
function v_u_1.list(p102) -- name: list
	-- upvalues: (copy) v_u_1
	local v103 = {}
	for v104, v105 in v_u_1.Weapons do
		if p102 and not p102(v104, v105) then
			continue
		end
		table.insert(v103, v104)
	end
	table.sort(v103)
	return v103
end
return v_u_1