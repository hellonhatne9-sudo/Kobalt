-- Decompiled by Executor
-- Path: ReplicatedStorage.Shared.Config.DamageConfig

local v_u_1 = {
	["BulletDamageScale"] = 0.6,
	["BulletDamageScaleByClass"] = {
		["SR"] = 0.7,
		["DMR"] = 0.7,
		["Crossbow"] = 1
	},
	["Zones"] = {
		["Head"] = 1,
		["Neck"] = 0.75,
		["Clavicle"] = 1,
		["UpperChest"] = 1.1,
		["Stomach"] = 1,
		["LowerStomach"] = 0.95,
		["Pelvis"] = 1,
		["UpperArm"] = 0.6,
		["Forearm"] = 0.5,
		["Hand"] = 0.3,
		["Thigh"] = 0.6,
		["Calf"] = 0.5,
		["Foot"] = 0.3
	},
	["ZoneGroup"] = {
		["Head"] = "Head",
		["Neck"] = "Head",
		["Clavicle"] = "Body",
		["UpperChest"] = "Body",
		["Stomach"] = "Body",
		["LowerStomach"] = "Body",
		["Pelvis"] = "Body",
		["UpperArm"] = "Limb",
		["Forearm"] = "Limb",
		["Hand"] = "Limb",
		["Thigh"] = "Limb",
		["Calf"] = "Limb",
		["Foot"] = "Limb"
	},
	["ArmorCover"] = {
		["Head"] = "Helmet",
		["Neck"] = "Helmet",
		["Clavicle"] = "Vest",
		["UpperChest"] = "Vest",
		["Stomach"] = "Vest",
		["LowerStomach"] = "Vest",
		["Pelvis"] = "Vest"
	},
	["Class"] = {
		["AR"] = {
			["Head"] = 2.35,
			["Body"] = 1,
			["Limb"] = 0.9
		},
		["DMR"] = {
			["Head"] = 2.35,
			["Body"] = 1.05,
			["Limb"] = 0.95
		},
		["SR"] = {
			["Head"] = 2.5,
			["Body"] = 1.3,
			["Limb"] = 0.95
		},
		["SMG"] = {
			["Head"] = 2.1,
			["Body"] = 1.05,
			["Limb"] = 1.3
		},
		["LMG"] = {
			["Head"] = 2.3,
			["Body"] = 1.05,
			["Limb"] = 0.9,
			["Pelvis"] = 1
		},
		["SG"] = {
			["Head"] = 1.5,
			["Body"] = 0.9,
			["Limb"] = 1.05
		},
		["Pistol"] = {
			["Head"] = 2.1,
			["Body"] = 1,
			["Limb"] = 1.05
		},
		["Crossbow"] = {
			["Head"] = 2.3,
			["Body"] = 1.4,
			["Limb"] = 1.2
		},
		["Special"] = {
			["Head"] = 1.5,
			["Body"] = 1,
			["Limb"] = 1
		},
		["Melee"] = {
			["Head"] = 1.5,
			["Body"] = 1,
			["Limb"] = 1
		}
	}
}
local v2 = {
	["Helmet"] = nil,
	["Vest"] = nil,
	["BrokenVestReduction"] = 0.2,
	["DurabilityBeforeReduction"] = true,
	["AimPunchReduction"] = nil,
	["Helmet"] = {
		{
			["Reduction"] = 0.3,
			["Durability"] = 80
		},
		{
			["Reduction"] = 0.4,
			["Durability"] = 150
		},
		{
			["Reduction"] = 0.55,
			["Durability"] = 230
		}
	},
	["Vest"] = {
		{
			["Reduction"] = 0.3,
			["Durability"] = 200
		},
		{
			["Reduction"] = 0.4,
			["Durability"] = 220
		},
		{
			["Reduction"] = 0.55,
			["Durability"] = 250
		}
	},
	["AimPunchReduction"] = {
		[0] = 1,
		[1] = 0.85,
		[2] = 0.75,
		[3] = 0.6
	}
}
v_u_1.Armor = v2
v_u_1.IgnoreArmor = {
	["Zone"] = true,
	["Fire"] = true,
	["Fall"] = true,
	["Drown"] = true,
	["Vehicle"] = true
}
v_u_1.VestOnly = {
	["Explosion"] = true,
	["Barrage"] = true
}
v_u_1.Knock = {
	["Modes"] = nil,
	["KnockHP"] = 100,
	["BleedOut"] = nil,
	["StillMult"] = 0.75,
	["CarriedMult"] = 0.75,
	["Immunity"] = 1.5,
	["ReviveTime"] = 10,
	["ReviveHP"] = 10,
	["ReviveRange"] = 2.6,
	["ReviveMoveCancel"] = 0.6,
	["ReviveIgnoreSources"] = nil,
	["GiveUpDelay"] = 2,
	["GiveUpHold"] = 1.5,
	["CrawlSpeed"] = 0.45,
	["VsKnocked"] = nil,
	["Modes"] = {
		["Duo"] = true,
		["Squad"] = true,
		["Mixed"] = true,
		["Teams"] = true
	},
	["BleedOut"] = {
		90,
		30,
		30,
		10,
		7,
		5,
		4,
		3,
		2
	},
	["ReviveIgnoreSources"] = {
		["Zone"] = true,
		["Fire"] = true,
		["Drown"] = true
	},
	["VsKnocked"] = {
		["Explosion"] = 0.8,
		["SR"] = 1.35,
		["Crossbow"] = 1.125
	}
}
v_u_1.Melee = {
	["Pan"] = nil,
	["Blade"] = nil,
	["Punch"] = nil,
	["JumpPunch"] = nil,
	["Kick"] = nil,
	["HitRadius"] = 0.45,
	["Pan"] = {
		["Body"] = 80,
		["Head"] = 120
	},
	["Blade"] = {
		["Body"] = 60,
		["Head"] = 90
	},
	["Punch"] = {
		["Body"] = 18,
		["Head"] = 18,
		["Range"] = 1.4,
		["Cooldown"] = 0.45,
		["SwingTime"] = 0.15
	},
	["JumpPunch"] = {
		["Body"] = 38,
		["Head"] = 38
	},
	["Kick"] = {
		["Body"] = 25,
		["Head"] = 25,
		["Range"] = 1.6,
		["Cooldown"] = 1,
		["SwingTime"] = 0.25,
		["Knockback"] = 18
	}
}
local v3 = {
	["Frag"] = {
		["Radius"] = 10,
		["Curve"] = nil,
		["ProneMult"] = 0.8,
		["Shake"] = 1,
		["ShakeRadius"] = 30,
		["Curve"] = {
			{ 0, 220 },
			{ 3.5, 150 },
			{ 6, 85 },
			{ 8.5, 40 },
			{ 10, 8 }
		}
	},
	["Panzerfaust"] = {
		["Radius"] = 6,
		["Curve"] = nil,
		["ProneMult"] = 0.8,
		["Shake"] = 1.2,
		["ShakeRadius"] = 40,
		["Curve"] = {
			{ 0, 300 },
			{ 2, 200 },
			{ 4, 90 },
			{ 6, 20 }
		}
	},
	["Barrage"] = {
		["Radius"] = 8,
		["Curve"] = nil,
		["ProneMult"] = 0.8,
		["Shake"] = 1,
		["ShakeRadius"] = 40,
		["Curve"] = {
			{ 0, 200 },
			{ 3, 120 },
			{ 8, 15 }
		}
	}
}
v_u_1.Explosions = v3
v_u_1.Fall = {
	["Curve"] = nil,
	["GroundMargin"] = 0.25,
	["StillSpeed"] = 0.5,
	["StillTime"] = 0.15,
	["WaterDepth"] = 0.6,
	["LandGrace"] = 1.5,
	["Curve"] = {
		{ 8, 0 },
		{ 10, 15 },
		{ 11, 25 },
		{ 14, 50 },
		{ 16, 65 },
		{ 19, 82 },
		{ 22, 100 },
		{ 24, 115 }
	}
}
v_u_1.FriendlyFire = {
	["Guns"] = false,
	["Melee"] = false,
	["Throwables"] = true
}
v_u_1.FriendlyFireSource = {
	["Bullet"] = "Guns",
	["Melee"] = "Melee",
	["Explosion"] = "Throwables",
	["Fire"] = "Throwables",
	["Barrage"] = "Throwables"
}
v_u_1.AssistWindow = 30
v_u_1.HeadshotZones = {
	["Head"] = true,
	["Neck"] = false
}
function v_u_1.curve(p4, p5) -- name: curve
	if p5 <= p4[1][1] then
		return p4[1][2]
	end
	for v6 = 2, #p4 do
		local v7 = p4[v6 - 1]
		local v8 = p4[v6]
		if p5 > v8[1] then
			continue
		end
		local v9 = p5 - v7[1]
		local v10 = v8[1] - v7[1]
		local v11 = v9 / math.max(v10, 1e-6)
		return v7[2] + (v8[2] - v7[2]) * v11
	end
	return p4[#p4][2]
end
v_u_1.BeginnerBotDamageMult = 0.5
function v_u_1.friendlyBlocked(p12, p13, p14) -- name: friendlyBlocked
	-- upvalues: (copy) v_u_1
	if not p12 or (not p13 or p12 == p13) then
		return false
	end
	local v15 = p12:GetAttribute("TeamId")
	if v15 == nil or v15 ~= p13:GetAttribute("TeamId") then
		return false
	end
	local v16 = v_u_1.FriendlyFireSource[p14 or "Bullet"]
	if not v16 then
		return false
	end
	local v17 = v_u_1.FriendlyFire
	if type(v17) == "boolean" then
		return not v17
	end
	local v18
	if type(v17) == "table" then
		v18 = v17[v16] == false
	else
		v18 = false
	end
	return v18
end
function v_u_1.bleedOutTime(p19) -- name: bleedOutTime
	-- upvalues: (copy) v_u_1
	local v20 = v_u_1.Knock.BleedOut
	local v21 = #v20
	return v20[math.clamp(p19, 1, v21)]
end
function v_u_1.fallDamageAt(p22) -- name: fallDamageAt
	-- upvalues: (copy) v_u_1
	local v23 = v_u_1.Fall.Curve
	if p22 ~= p22 or p22 < v23[1][1] then
		return 0
	end
	local v24 = v_u_1.curve
	return math.max(0, v24(v23, p22))
end
function v_u_1.fallDamage(p25) -- name: fallDamage
	-- upvalues: (copy) v_u_1
	local v26 = math.abs(p25)
	return v_u_1.fallDamageAt(v26 * v26 / 19.62)
end
return v_u_1