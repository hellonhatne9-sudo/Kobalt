-- Decompiled by Executor
-- Path: ReplicatedStorage.Shared.Config.AttachmentConfig

local v_u_1 = {}
local v2 = {
	["RedDot"] = {
		["HFOV"] = 70,
		["Name"] = "Red Dot Sight",
		["Slot"] = "Optic",
		["Zoom"] = 1.1,
		["FOV"] = 43,
		["Reticle"] = "Dot",
		["ReticleColor"] = nil,
		["EyeRelief"] = 0.75,
		["ScreenFrac"] = 0.3,
		["PistolModel"] = "RedDot_Pistol",
		["Mods"] = nil,
		["ReticleColor"] = Color3.fromRGB(255, 40, 40),
		["Mods"] = {
			["ADSTime"] = 0.83
		}
	},
	["Holo"] = {
		["HFOV"] = 70,
		["Name"] = "Holographic Sight",
		["Slot"] = "Optic",
		["Zoom"] = 1.1,
		["FOV"] = 43,
		["Reticle"] = "Holo",
		["ReticleColor"] = nil,
		["EyeRelief"] = 0.75,
		["ScreenFrac"] = 0.32,
		["Mods"] = nil,
		["ReticleColor"] = Color3.fromRGB(255, 50, 50),
		["Mods"] = {
			["ADSTime"] = 0.83
		}
	},
	["Canted"] = {
		["HFOV"] = 70,
		["Name"] = "Canted Sight",
		["Slot"] = "Optic",
		["Zoom"] = 1.1,
		["FOV"] = 43,
		["Reticle"] = "Dot",
		["ReticleColor"] = nil,
		["EyeRelief"] = 0.75,
		["ScreenFrac"] = 0.2,
		["Canted"] = true,
		["Mods"] = nil,
		["ReticleColor"] = Color3.fromRGB(90, 255, 90),
		["Mods"] = {
			["ADSTime"] = 0.8
		}
	},
	["Scope2x"] = {
		["Name"] = "2x Scope",
		["Slot"] = "Optic",
		["Zoom"] = 2,
		["ScopeMask"] = true,
		["Reticle"] = "Dot",
		["ReticleColor"] = nil,
		["EyeRelief"] = 0.6,
		["ScreenFrac"] = 0.3,
		["Mods"] = nil,
		["ReticleColor"] = Color3.fromRGB(255, 45, 45),
		["Mods"] = {
			["ADSTime"] = 1
		}
	},
	["Scope3x"] = {
		["Name"] = "3x Scope",
		["Slot"] = "Optic",
		["Zoom"] = 3,
		["ScopeMask"] = true,
		["Reticle"] = "Chevron",
		["ReticleColor"] = nil,
		["Ranging"] = nil,
		["EyeRelief"] = 0.6,
		["ScreenFrac"] = 0.3,
		["Mods"] = nil,
		["ReticleColor"] = Color3.fromRGB(255, 60, 40),
		["Ranging"] = { 200, 300, 400 },
		["Mods"] = {
			["ADSTime"] = 1.05
		}
	},
	["Scope4x"] = {
		["Name"] = "4x Scope",
		["Slot"] = "Optic",
		["Zoom"] = 4.2,
		["ScopeMask"] = true,
		["Reticle"] = "ACOG",
		["ReticleColor"] = nil,
		["Ranging"] = nil,
		["EyeRelief"] = 0.6,
		["ScreenFrac"] = 0.3,
		["Mods"] = nil,
		["ReticleColor"] = Color3.fromRGB(255, 70, 30),
		["Ranging"] = {
			200,
			300,
			400,
			500,
			600
		},
		["Mods"] = {
			["ADSTime"] = 1.1
		}
	},
	["Scope6x"] = {
		["Name"] = "6x Scope",
		["Slot"] = "Optic",
		["Zoom"] = 6,
		["ScopeMask"] = true,
		["Reticle"] = "Duplex",
		["ReticleColor"] = nil,
		["Ranging"] = nil,
		["Zeroing"] = nil,
		["EyeRelief"] = 0.6,
		["ScreenFrac"] = 0.32,
		["Mods"] = nil,
		["ReticleColor"] = Color3.fromRGB(10, 10, 10),
		["Ranging"] = {
			300,
			400,
			500,
			600,
			700,
			800
		},
		["Zeroing"] = {
			100,
			200,
			300,
			400,
			500
		},
		["Mods"] = {
			["ADSTime"] = 1.25,
			["Sway"] = 1.1
		}
	},
	["Scope8x"] = {
		["Name"] = "8x Scope",
		["Slot"] = "Optic",
		["Zoom"] = 8,
		["ScopeMask"] = true,
		["Reticle"] = "MilDot",
		["ReticleColor"] = nil,
		["Zeroing"] = nil,
		["EyeRelief"] = 0.6,
		["ScreenFrac"] = 0.36,
		["Mods"] = nil,
		["ReticleColor"] = Color3.fromRGB(10, 10, 10),
		["Zeroing"] = {
			100,
			200,
			300,
			400,
			500,
			600,
			700,
			800,
			900,
			1000
		},
		["Mods"] = {
			["ADSTime"] = 1.25,
			["Sway"] = 1.2
		}
	},
	["Scope15x"] = {
		["Name"] = "15x Scope",
		["Slot"] = "Optic",
		["Zoom"] = 15,
		["ScopeMask"] = true,
		["Reticle"] = "MilDot",
		["ReticleColor"] = nil,
		["Zeroing"] = nil,
		["EyeRelief"] = 0.6,
		["ScreenFrac"] = 0.56,
		["Mods"] = nil,
		["ReticleColor"] = Color3.fromRGB(10, 10, 10),
		["Zeroing"] = {
			100,
			200,
			300,
			400,
			500,
			600,
			700,
			800,
			900,
			1000
		},
		["Mods"] = {
			["ADSTime"] = 1.3,
			["Sway"] = 1.35
		}
	},
	["Comp_AR"] = {
		["Name"] = "Compensator (AR, DMR)",
		["Slot"] = "Muzzle",
		["Family"] = "AR",
		["Mods"] = nil,
		["Mods"] = {
			["VRecoil"] = 0.85,
			["HRecoil"] = 0.9,
			["RecoilRandom"] = 0.75
		}
	},
	["Comp_SR"] = {
		["Name"] = "Compensator (SR)",
		["Slot"] = "Muzzle",
		["Family"] = "SR",
		["Mods"] = nil,
		["Mods"] = {
			["VRecoil"] = 0.85,
			["HRecoil"] = 0.9,
			["RecoilRandom"] = 0.75,
			["Kick"] = 0.85
		}
	},
	["Comp_SMG"] = {
		["Name"] = "Compensator (SMG)",
		["Slot"] = "Muzzle",
		["Family"] = "SMG",
		["Mods"] = nil,
		["Mods"] = {
			["VRecoil"] = 0.85,
			["HRecoil"] = 0.9,
			["RecoilRandom"] = 0.75
		}
	},
	["FlashHider_AR"] = {
		["Name"] = "Flash Hider (AR, DMR)",
		["Slot"] = "Muzzle",
		["Family"] = "AR",
		["Mods"] = nil,
		["Mods"] = {
			["VRecoil"] = 0.9,
			["HRecoil"] = 0.9,
			["RecoilRandom"] = 0.9,
			["FlashHidden"] = true
		}
	},
	["FlashHider_SR"] = {
		["Name"] = "Flash Hider (SR)",
		["Slot"] = "Muzzle",
		["Family"] = "SR",
		["Mods"] = nil,
		["Mods"] = {
			["VRecoil"] = 0.9,
			["HRecoil"] = 0.9,
			["RecoilRandom"] = 0.9,
			["FlashHidden"] = true
		}
	},
	["FlashHider_SMG"] = {
		["Name"] = "Flash Hider (SMG)",
		["Slot"] = "Muzzle",
		["Family"] = "SMG",
		["Mods"] = nil,
		["Mods"] = {
			["VRecoil"] = 0.9,
			["HRecoil"] = 0.9,
			["RecoilRandom"] = 0.9,
			["FlashHidden"] = true
		}
	},
	["Suppressor_AR"] = {
		["Name"] = "Suppressor (AR, DMR)",
		["Slot"] = "Muzzle",
		["Family"] = "AR",
		["Mods"] = nil,
		["Mods"] = {
			["Suppressed"] = true,
			["FlashHidden"] = true,
			["HipSpread"] = 0.95
		}
	},
	["Suppressor_SR"] = {
		["Name"] = "Suppressor (SR)",
		["Slot"] = "Muzzle",
		["Family"] = "SR",
		["Mods"] = nil,
		["Mods"] = {
			["Suppressed"] = true,
			["FlashHidden"] = true,
			["HipSpread"] = 0.95
		}
	},
	["Suppressor_SMG"] = {
		["Name"] = "Suppressor (SMG, Pistol)",
		["Slot"] = "Muzzle",
		["Family"] = "SMG",
		["Mods"] = nil,
		["Mods"] = {
			["Suppressed"] = true,
			["FlashHidden"] = true,
			["HipSpread"] = 0.95
		}
	},
	["MuzzleBrake"] = {
		["Name"] = "Muzzle Brake",
		["Slot"] = "Muzzle",
		["Family"] = "AR",
		["Mods"] = nil,
		["Mods"] = {
			["VRecoil"] = 0.92,
			["HRecoil"] = 0.92,
			["Kick"] = 0.65
		}
	},
	["Choke"] = {
		["Name"] = "Choke",
		["Slot"] = "Muzzle",
		["Mods"] = nil,
		["Mods"] = {
			["PelletSpread"] = 0.75
		}
	},
	["Duckbill"] = {
		["Name"] = "Duckbill",
		["Slot"] = "Muzzle",
		["Mods"] = nil,
		["Mods"] = {
			["PelletSpreadV"] = 0.6,
			["PelletSpreadH"] = 1.3
		}
	},
	["VerticalGrip"] = {
		["Name"] = "Vertical Foregrip",
		["Slot"] = "Grip",
		["Mods"] = nil,
		["Mods"] = {
			["VRecoil"] = 0.85
		}
	},
	["AngledGrip"] = {
		["Name"] = "Angled Foregrip",
		["Slot"] = "Grip",
		["Mods"] = nil,
		["Mods"] = {
			["HRecoil"] = 0.8,
			["ADSTime"] = 0.91,
			["Sway"] = 0.9
		}
	},
	["HalfGrip"] = {
		["Name"] = "Half Grip",
		["Slot"] = "Grip",
		["Mods"] = nil,
		["Mods"] = {
			["VRecoil"] = 0.92,
			["HRecoil"] = 0.84,
			["Recovery"] = 1.1,
			["Sway"] = 0.9
		}
	},
	["ThumbGrip"] = {
		["Name"] = "Thumb Grip",
		["Slot"] = "Grip",
		["Mods"] = nil,
		["Mods"] = {
			["VRecoil"] = 0.9,
			["ADSTime"] = 0.71,
			["Sway"] = 1.2
		}
	},
	["LightGrip"] = {
		["Name"] = "Lightweight Grip",
		["Slot"] = "Grip",
		["Mods"] = nil,
		["Mods"] = {
			["FirstShot"] = 0.7,
			["Kick"] = 1.2,
			["Recovery"] = 1.2
		}
	},
	["TiltedGrip"] = {
		["Name"] = "Tilted Grip",
		["Slot"] = "Grip",
		["Mods"] = nil,
		["Mods"] = {
			["VRecoil"] = 0.88,
			["HRecoil"] = 0.94,
			["Kick"] = 0.75
		}
	},
	["Laser"] = {
		["Name"] = "Laser Sight",
		["Slot"] = "Grip",
		["Mods"] = nil,
		["Mods"] = {
			["HipSpread"] = 0.7,
			["HipSpreadPistol"] = 0.3
		}
	},
	["TacticalStock"] = {
		["Name"] = "Tactical Stock",
		["Slot"] = "Stock",
		["Mods"] = nil,
		["Mods"] = {
			["RecoilRandom"] = 0.8,
			["ADSTime"] = 0.91,
			["Recovery"] = 1.05,
			["Sway"] = 0.9
		}
	},
	["HeavyStock"] = {
		["Name"] = "Heavy Stock",
		["Slot"] = "Stock",
		["Mods"] = nil,
		["Mods"] = {
			["VRecoil"] = 0.9,
			["HRecoil"] = 0.9,
			["ADSTime"] = 1.1,
			["HipSpread"] = 1.1
		}
	},
	["CheekPad"] = {
		["Name"] = "Cheek Pad",
		["Slot"] = "Stock",
		["Mods"] = nil,
		["Mods"] = {
			["VRecoil"] = 0.8,
			["Kick"] = 0.8,
			["Sway"] = 0.85
		}
	},
	["BulletLoops"] = {
		["Name"] = "Bullet Loops",
		["Slot"] = "Stock",
		["Mods"] = nil,
		["Mods"] = {
			["ReloadTime"] = 0.8
		}
	},
	["ExtMag_AR"] = {
		["Name"] = "Extended Mag (AR, DMR)",
		["Slot"] = "Mag",
		["Family"] = "AR",
		["Mods"] = nil,
		["Mods"] = {
			["ExtMag"] = true
		}
	},
	["QuickMag_AR"] = {
		["Name"] = "Speed Mag (AR, DMR)",
		["Slot"] = "Mag",
		["Family"] = "AR",
		["Mods"] = nil,
		["Mods"] = {
			["ReloadTime"] = 0.7
		}
	},
	["ExtQuickMag_AR"] = {
		["Name"] = "Extended Speed Mag (AR, DMR)",
		["Slot"] = "Mag",
		["Family"] = "AR",
		["Mods"] = nil,
		["Mods"] = {
			["ExtMag"] = true,
			["ReloadTime"] = 0.7
		}
	},
	["ExtMag_SR"] = {
		["Name"] = "Extended Mag (DMR, SR)",
		["Slot"] = "Mag",
		["Family"] = "SR",
		["Mods"] = nil,
		["Mods"] = {
			["ExtMag"] = true
		}
	},
	["QuickMag_SR"] = {
		["Name"] = "Speed Mag (DMR, SR)",
		["Slot"] = "Mag",
		["Family"] = "SR",
		["Mods"] = nil,
		["Mods"] = {
			["ReloadTime"] = 0.7
		}
	},
	["ExtQuickMag_SR"] = {
		["Name"] = "Extended Speed Mag (DMR, SR)",
		["Slot"] = "Mag",
		["Family"] = "SR",
		["Mods"] = nil,
		["Mods"] = {
			["ExtMag"] = true,
			["ReloadTime"] = 0.7
		}
	},
	["ExtMag_SMG"] = {
		["Name"] = "Extended Mag (SMG, Pistol)",
		["Slot"] = "Mag",
		["Family"] = "SMG",
		["Mods"] = nil,
		["Mods"] = {
			["ExtMag"] = true
		}
	},
	["QuickMag_SMG"] = {
		["Name"] = "Speed Mag (SMG, Pistol)",
		["Slot"] = "Mag",
		["Family"] = "SMG",
		["Mods"] = nil,
		["Mods"] = {
			["ReloadTime"] = 0.7
		}
	},
	["ExtQuickMag_SMG"] = {
		["Name"] = "Extended Speed Mag (SMG, Pistol)",
		["Slot"] = "Mag",
		["Family"] = "SMG",
		["Mods"] = nil,
		["Mods"] = {
			["ExtMag"] = true,
			["ReloadTime"] = 0.7
		}
	}
}
v_u_1.Attachments = v2
v_u_1.ReticleStyle = {
	["LineThin"] = 1,
	["LineThick"] = 4,
	["DotSize"] = 5.5,
	["HoloRing"] = 44,
	["MaskRingPx"] = 3000
}
v_u_1.ScopeBlur = {
	["Enabled"] = false,
	["Frost"] = 0,
	["FrostStart"] = 1.45
}
function v_u_1.modelFor(p3, p4) -- name: modelFor
	-- upvalues: (copy) v_u_1
	local v5 = v_u_1.Attachments[p3]
	if v5 and (v5.PistolModel and (type(p4) == "table" and p4.Class == "Pistol")) then
		return v5.PistolModel
	else
		return p3
	end
end
v_u_1.BASE_HFOV = 70
v_u_1.REF_ASPECT = 1.7777777777777777
local v_u_6 = math.rad
local v_u_7 = math.deg
local v_u_8 = math.tan
local v_u_9 = math.atan
function v_u_1.hfovForZoom(p10) -- name: hfovForZoom
	-- upvalues: (copy) v_u_1, (copy) v_u_6, (copy) v_u_8, (copy) v_u_9, (copy) v_u_7
	return v_u_7(v_u_9(v_u_8(v_u_6(v_u_1.BASE_HFOV) / 2) / math.max(p10, 0.01)) * 2)
end
function v_u_1.tanHalfV(p11) -- name: tanHalfV
	-- upvalues: (copy) v_u_6, (copy) v_u_8, (copy) v_u_1
	return v_u_8(v_u_6(p11) / 2) / v_u_1.REF_ASPECT
end
for _, v12 in v_u_1.Attachments do
	if v12.Slot ~= "Optic" or not (v12.ScopeMask and v12.Zoom) then
		continue
	end
	v12.HFOV = v_u_1.hfovForZoom(v12.Zoom)
	v12.FOV = v_u_7(v_u_9((v_u_1.tanHalfV(v12.HFOV))) * 2)
end
function v_u_1.widestHfov(p13) -- name: widestHfov
	-- upvalues: (copy) v_u_1
	local v14 = v_u_1.Attachments[p13]
	if v14 then
		if v14.ScopeMask and v14.Variable then
			return v_u_1.hfovForZoom(v14.Variable.Min)
		else
			return v14.HFOV or v_u_1.BASE_HFOV
		end
	else
		return v_u_1.BASE_HFOV
	end
end
function v_u_1.eyeDist(p15, p16, p17) -- name: eyeDist
	-- upvalues: (copy) v_u_1
	local v18 = v_u_1.Attachments[p15]
	local v19 = v18 and (v18.ScreenFrac or 0.45) or 0.45
	return p16 / (math.max(v19, 0.05) * v_u_1.tanHalfV(p17 or (v18 and v18.HFOV or v_u_1.BASE_HFOV)))
end
v_u_1.AutoRank = {
	["Default"] = {
		["ExtQuickMag_AR"] = 3,
		["ExtMag_AR"] = 2,
		["QuickMag_AR"] = 1,
		["ExtQuickMag_SMG"] = 3,
		["ExtMag_SMG"] = 2,
		["QuickMag_SMG"] = 1,
		["ExtQuickMag_SR"] = 3,
		["ExtMag_SR"] = 2,
		["QuickMag_SR"] = 1,
		["Comp_AR"] = 4,
		["Suppressor_AR"] = 3,
		["FlashHider_AR"] = 2,
		["MuzzleBrake"] = 1,
		["Comp_SMG"] = 4,
		["Suppressor_SMG"] = 3,
		["FlashHider_SMG"] = 2,
		["Suppressor_SR"] = 3,
		["Comp_SR"] = 2,
		["FlashHider_SR"] = 1
	},
	["SR"] = {
		["Suppressor_SR"] = 4,
		["Comp_SR"] = 3,
		["FlashHider_SR"] = 2,
		["Suppressor_AR"] = 4,
		["Comp_AR"] = 3,
		["FlashHider_AR"] = 2,
		["MuzzleBrake"] = 1
	},
	["DMR"] = {
		["Suppressor_SR"] = 4,
		["Suppressor_AR"] = 4,
		["Comp_SR"] = 3,
		["Comp_AR"] = 3,
		["FlashHider_SR"] = 2,
		["FlashHider_AR"] = 2,
		["MuzzleBrake"] = 1
	}
}
function v_u_1.autoRank(p20, p21) -- name: autoRank
	-- upvalues: (copy) v_u_1
	if p20 == nil then
		return 0
	end
	if p21 then
		p21 = v_u_1.AutoRank[p21]
	end
	if p21 then
		p21 = p21[p20]
	end
	if p21 == nil then
		p21 = v_u_1.AutoRank.Default[p20]
	end
	return p21 or 0
end
function v_u_1.get(p22) -- name: get
	-- upvalues: (copy) v_u_1
	if p22 == nil then
		return nil
	else
		return v_u_1.Attachments[p22]
	end
end
function v_u_1.slotOf(p23) -- name: slotOf
	-- upvalues: (copy) v_u_1
	if p23 then
		p23 = v_u_1.Attachments[p23]
	end
	if p23 then
		p23 = p23.Slot
	end
	return p23
end
function v_u_1.mod(p24, p25) -- name: mod
	-- upvalues: (copy) v_u_1
	if p24 then
		p24 = v_u_1.Attachments[p24]
	end
	local v26 = p24 and p24.Mods
	if v26 then
		v26 = p24.Mods[p25]
	end
	return v26
end
function v_u_1.list(p27) -- name: list
	-- upvalues: (copy) v_u_1
	local v28 = {}
	for v29, v30 in v_u_1.Attachments do
		if p27 and v30.Slot ~= p27 then
			continue
		end
		table.insert(v28, v29)
	end
	table.sort(v28)
	return v28
end
return v_u_1