-- Decompiled by Executor
-- Path: ReplicatedStorage.Client.Controllers.ViewmodelController.Pose

local v_u_1 = {
	["SCALE"] = 0.86,
	["REF_SCALE"] = 0.66,
	["CHEEK"] = 0.8,
	["PISTOL_EYE"] = 0.85,
	["MIN_EYE"] = 0.32
}
local v_u_2 = math.rad
local v_u_3 = CFrame.new
local v_u_4 = CFrame.Angles
function v_u_1.smooth(p5) -- name: smooth
	local v6 = math.clamp(p5, 0, 1)
	return v6 * v6 * (3 - v6 * 2)
end
function v_u_1.holdKind(p7) -- name: holdKind
	return p7 and (p7.isMelee and "Melee" or (p7.isThrowable and "Throwable" or (p7.class == "Pistol" and "Pistol" or (p7.animSet == "Pistol" and p7.class == "SMG" and "SmallSMG" or "Rifle")))) or "Rifle"
end
local v_u_8 = {
	["Rifle"] = v_u_3(0.481, -0.9, -1.091) * v_u_4(0.05235987755982989, 0.15707963267948966, 0.03490658503988659),
	["SmallSMG"] = v_u_3(0.37, -0.74, -1.08) * v_u_4(0.06981317007977318, 0.06981317007977318, 0),
	["Pistol"] = v_u_3(0.31, -0.58, -1.18) * v_u_4(0.08726646259971647, 0.06981317007977318, 0),
	["Melee"] = v_u_3(0.66, -0.66, -1.05) * v_u_4(0.6632251157578453, 0.20943951023931956, -0.3141592653589793),
	["Throwable"] = v_u_3(0.5, -0.46, -1) * v_u_4(0.13962634015954636, 0.17453292519943295, -0.10471975511965978)
}
v_u_1.HIP = v_u_8
v_u_1.TUNE = {
	["AWM"] = {
		["hip"] = Vector3.new(-0.101, -0.039, -0.139),
		["rot"] = Vector3.new(0, -3, -1),
		["left"] = Vector3.new(0, -0.05, 0)
	},
	["M24"] = {
		["hip"] = Vector3.new(-0.129, -0.024, -0.258),
		["rot"] = Vector3.new(0, -3.5, -1),
		["left"] = Vector3.new(0, -0.05, 0)
	},
	["Kar98k"] = {
		["hip"] = Vector3.new(-0.146, -0.024, -0.278),
		["rot"] = Vector3.new(0, -4, -1),
		["left"] = Vector3.new(0, -0.05, 0)
	},
	["Win94"] = {
		["hip"] = Vector3.new(-0.08, 0.08, 0.02),
		["rot"] = Vector3.new(0, -4, -1),
		["left"] = Vector3.new(0, -0.05, 0)
	},
	["Mini14"] = {
		["hip"] = Vector3.new(-0.02, 0.06, -0.18),
		["left"] = Vector3.new(0, -0.05, 0)
	},
	["SKS"] = {
		["hip"] = Vector3.new(-0.02, 0.06, -0.16),
		["left"] = Vector3.new(0, -0.05, 0)
	},
	["Lynx"] = {
		["hip"] = Vector3.new(0.04, -0.05, 0.14),
		["left"] = Vector3.new(0, -0.05, 0)
	},
	["SLR"] = {
		["hip"] = Vector3.new(0, -0.02, -0.14),
		["left"] = Vector3.new(0, -0.05, 0)
	},
	["SVD"] = {
		["hip"] = Vector3.new(0.02, -0.02, 0.06),
		["left"] = Vector3.new(0, -0.05, 0)
	},
	["VSS"] = {
		["hip"] = Vector3.new(-0.02, 0, -0.14)
	},
	["Mk14"] = {
		["hip"] = Vector3.new(-0.02, -0.01, -0.18)
	},
	["S1897"] = {
		["hip"] = Vector3.new(-0.06, 0.13, 0.04),
		["rot"] = Vector3.new(0, -3, 0),
		["left"] = Vector3.new(0, -0.05, 0)
	},
	["S686"] = {
		["hip"] = Vector3.new(-0.05, 0.1, 0.06),
		["rot"] = Vector3.new(0, -3, 0),
		["left"] = Vector3.new(0, -0.05, 0)
	},
	["S12K"] = {
		["hip"] = Vector3.new(0.02, -0.02, 0.04)
	},
	["MG3"] = {
		["hip"] = Vector3.new(0.04, -0.05, 0.08)
	},
	["M249"] = {
		["hip"] = Vector3.new(0.03, -0.04, 0.06)
	},
	["Panzerfaust"] = {
		["hip"] = Vector3.new(0.05, 0.05, 0.1),
		["left"] = Vector3.new(0, -0.02, 0)
	},
	["Crossbow"] = {
		["hip"] = Vector3.new(0, -0.04, 0.02)
	},
	["AUG"] = {
		["hip"] = Vector3.new(0, 0, -0.06)
	},
	["FAMAS"] = {
		["hip"] = Vector3.new(0, 0, -0.06)
	},
	["QBZ"] = {
		["hip"] = Vector3.new(0, 0, -0.06)
	},
	["Groza"] = {
		["hip"] = Vector3.new(0, 0, -0.12)
	},
	["P90"] = {
		["hip"] = Vector3.new(0, 0.02, -0.08)
	},
	["MP5K"] = {
		["hip"] = Vector3.new(0, 0, -0.08)
	},
	["Tommy"] = {
		["hip"] = Vector3.new(0, -0.02, 0.02)
	},
	["MicroUZI"] = {
		["left"] = Vector3.new(0.1, 0.16, -0.3),
		["lSide"] = Vector3.new(-0.45, -0.9, 0)
	},
	["SawedOff"] = {
		["hip"] = Vector3.new(0, 0.12, -0.06)
	},
	["DBS"] = {
		["hip"] = Vector3.new(0, -0.02, 0)
	},
	["Skorpion"] = {
		["hip"] = Vector3.new(0, -0.13, 0)
	}
}
function v_u_1.hip(p9, p10, p11) -- name: hip
	-- upvalues: (copy) v_u_8, (copy) v_u_1, (copy) v_u_3, (copy) v_u_4, (copy) v_u_2
	local v12 = v_u_8[p9] or v_u_8.Rifle
	if p11 then
		p11 = v_u_1.TUNE[p11]
	end
	if p11 then
		local v13 = p11.hip
		if typeof(v13) == "Vector3" then
			v12 = v_u_3(p11.hip) * v12
		end
		local v14 = p11.rot
		if typeof(v14) == "Vector3" then
			v12 = v12 * v_u_4(v_u_2(p11.rot.X), v_u_2(p11.rot.Y), (v_u_2(p11.rot.Z)))
		end
	end
	if p10 then
		local v15 = p10.VmOffset
		if typeof(v15) == "Vector3" then
			v12 = v_u_3(p10.VmOffset) * v12
		end
	end
	return v12
end
local function v24(p16, p17, p18) -- name: hand
	local v19 = p17.Magnitude > 0.0001 and p17.Unit or Vector3.new(0, 1, 0)
	local v20 = p18 or Vector3.new(0, 0, -1)
	local v21 = v20 - v19 * v20:Dot(v19)
	if v21.Magnitude < 0.001 then
		local v22 = v19.Z
		v21 = math.abs(v22) < 0.9 and v19:Cross(Vector3.new(0, 0, 1)) or v19:Cross(Vector3.new(1, 0, 0))
	end
	local v23 = v21.Unit
	return CFrame.fromMatrix(p16, v23:Cross(v19), v19, -v23)
end
v_u_1.hand = v24
local _ = Vector3.new
local v25 = {
	["Rifle"] = {
		["r"] = nil,
		["l"] = nil,
		["lGrip"] = nil,
		["elbowR"] = Vector3.new(1.35, -2.1, -0.1),
		["elbowL"] = Vector3.new(-0.8, -1.6, 0.3),
		["adsElbowR"] = Vector3.new(0.75, -2, 0.25),
		["adsElbowL"] = Vector3.new(-1.3, -1.8, -0.5),
		["actElbowR"] = Vector3.new(1.3, -1, 0.35),
		["dirR"] = Vector3.new(-0.135, 0.242, -0.961),
		["dirL"] = Vector3.new(0.451, 0.276, -0.848),
		["adsDirR"] = Vector3.new(-0.202, 0.208, -0.951),
		["adsDirL"] = Vector3.new(0.33, 0.259, -0.907),
		["r"] = v24(Vector3.new(0.075, -0.06, 0.03), Vector3.new(-1, 0.1, 0), Vector3.new(0, 0.35, -1)),
		["l"] = v24(Vector3.new(-0.02, -0.1, -0.1), Vector3.new(0, 1, 0), Vector3.new(0.6, 0, -1)),
		["lGrip"] = v24(Vector3.new(-0.05, 0.02, 0), Vector3.new(1, 0, 0), Vector3.new(0, 0.5, -1))
	},
	["SmallSMG"] = {
		["r"] = nil,
		["l"] = nil,
		["lGrip"] = nil,
		["elbowR"] = Vector3.new(1.05, -2, 0),
		["elbowL"] = Vector3.new(-0.35, -2, -0.2),
		["adsElbowR"] = Vector3.new(0.9, -1.9, 0.2),
		["adsElbowL"] = Vector3.new(-1, -1.85, -0.2),
		["actElbowR"] = Vector3.new(1.2, -1.1, 0.35),
		["dirR"] = Vector3.new(-0.167, 0.276, -0.947),
		["dirL"] = Vector3.new(0.362, 0.259, -0.896),
		["adsDirR"] = Vector3.new(-0.234, 0.259, -0.937),
		["adsDirL"] = Vector3.new(0.333, 0.225, -0.916),
		["r"] = v24(Vector3.new(0.07, -0.12, 0.04), Vector3.new(-1, 0.15, 0), Vector3.new(0, 0.35, -1)),
		["l"] = v24(Vector3.new(-0.03, -0.08, 0.02), Vector3.new(0.55, 0.85, 0), Vector3.new(0.3, 0.2, -1)),
		["lGrip"] = v24(Vector3.new(-0.05, 0.02, 0), Vector3.new(1, 0, 0), Vector3.new(0, 0.5, -1))
	},
	["Pistol"] = {
		["r"] = nil,
		["l"] = nil,
		["lGrip"] = nil,
		["elbowR"] = Vector3.new(0.8, -1.55, 0.7),
		["elbowL"] = Vector3.new(-0.35, -1.6, 0.65),
		["adsElbowR"] = Vector3.new(0.65, -1.45, 0.85),
		["adsElbowL"] = Vector3.new(-0.6, -1.5, 0.8),
		["actElbowR"] = Vector3.new(1.1, -1.2, 0.4),
		["dirR"] = Vector3.new(-0.167, 0.276, -0.947),
		["dirL"] = Vector3.new(0.362, 0.259, -0.896),
		["adsDirR"] = Vector3.new(-0.234, 0.259, -0.937),
		["adsDirL"] = Vector3.new(0.333, 0.225, -0.916),
		["r"] = v24(Vector3.new(0.07, -0.13, 0.04), Vector3.new(-1, 0.15, 0), Vector3.new(0, 0.35, -1)),
		["l"] = v24(Vector3.new(-0.03, -0.14, 0.03), Vector3.new(0.55, 0.85, 0), Vector3.new(0.3, 0.2, -1)),
		["lGrip"] = v24(Vector3.new(-0.05, 0.02, 0), Vector3.new(1, 0, 0), Vector3.new(0, 0.5, -1))
	},
	["Melee"] = {
		["r"] = nil,
		["l"] = nil,
		["elbowR"] = Vector3.new(1.3, -2, -0.2),
		["elbowL"] = Vector3.new(-0.9, -2, -0.5),
		["r"] = v_u_3(0, 0, 0.02),
		["l"] = v_u_3(0, -0.06, 0)
	},
	["Throwable"] = {
		["r"] = nil,
		["l"] = nil,
		["elbowR"] = Vector3.new(1.2, -2, -0.1),
		["elbowL"] = Vector3.new(-0.9, -2, -0.5),
		["r"] = v24(Vector3.new(0.07, -0.15, 0.04), Vector3.new(-0.55, 0.85, 0), Vector3.new(0, 0.3, -1)),
		["l"] = v_u_3(0, -0.06, 0)
	}
}
v_u_1.HANDS = v25
function v_u_1.hands(p26) -- name: hands
	-- upvalues: (copy) v_u_1
	return v_u_1.HANDS[p26 or "Rifle"] or v_u_1.HANDS.Rifle
end
v_u_1.GRIP_L = {
	["VerticalGrip"] = v24(Vector3.new(-0.05, 0.02, 0), Vector3.new(1, 0, 0), Vector3.new(0, 0.5, -1)),
	["AngledGrip"] = v24(Vector3.new(-0.03, -0.05, 0.03), Vector3.new(0.4, 0.92, 0), Vector3.new(0.5, 0, -1)),
	["HalfGrip"] = v24(Vector3.new(-0.03, -0.06, 0), Vector3.new(0.45, 0.9, 0), Vector3.new(0.5, 0, -1)),
	["ThumbGrip"] = v24(Vector3.new(-0.02, -0.08, 0.02), Vector3.new(0.15, 1, 0), Vector3.new(0.6, 0, -1)),
	["LightGrip"] = v24(Vector3.new(-0.05, 0, 0), Vector3.new(0.9, 0.45, 0), Vector3.new(0, 0.5, -1)),
	["TiltedGrip"] = v24(Vector3.new(-0.05, -0.01, 0), Vector3.new(0.85, 0.5, 0), Vector3.new(0, 0.5, -1))
}
v_u_1.GRASP = {
	["Rifle"] = {
		["rP"] = Vector3.new(0, -0.08, 0.02),
		["rSide"] = Vector3.new(1, -0.05, 0.25),
		["rGap"] = -0.1,
		["rReach"] = 0.2,
		["lP"] = Vector3.new(0, -0.07, 0.02),
		["lSide"] = Vector3.new(-0.6, -0.8, 0),
		["lGap"] = -0.11,
		["lReach"] = 0.12
	},
	["SmallSMG"] = {
		["rP"] = Vector3.new(0, -0.1, 0.02),
		["rSide"] = Vector3.new(1, 0, 0.3),
		["rGap"] = -0.1,
		["rReach"] = 0.2,
		["lP"] = Vector3.new(0.07, -0.06, -0.03),
		["lSide"] = Vector3.new(-1, -0.3, -0.1),
		["lGap"] = 0.03,
		["lReach"] = 0.14
	},
	["Pistol"] = {
		["rP"] = Vector3.new(0, -0.1, 0.02),
		["rSide"] = Vector3.new(1, 0, 0.3),
		["rGap"] = -0.1,
		["rReach"] = 0.2,
		["lP"] = Vector3.new(0.07, -0.08, -0.03),
		["lSide"] = Vector3.new(-1, -0.3, -0.1),
		["lGap"] = 0.03,
		["lReach"] = 0.14
	}
}
function v_u_1.grasp(p27) -- name: grasp
	-- upvalues: (copy) v_u_1
	return v_u_1.GRASP[p27 or "Rifle"]
end
v_u_1.GRASP_GRIP = {
	["VerticalGrip"] = {
		["p"] = Vector3.new(0, -0.09, 0),
		["side"] = Vector3.new(-1, 0, 0.25),
		["gap"] = -0.11
	},
	["AngledGrip"] = {
		["p"] = Vector3.new(0, -0.01, 0),
		["side"] = Vector3.new(-0.75, -0.65, 0),
		["gap"] = -0.06
	},
	["HalfGrip"] = {
		["p"] = Vector3.new(0, 0, 0),
		["side"] = Vector3.new(-0.8, -0.6, 0),
		["gap"] = -0.06
	},
	["ThumbGrip"] = {
		["p"] = Vector3.new(0, 0, 0),
		["side"] = Vector3.new(-1, -0.7, 0),
		["gap"] = -0.04
	},
	["LightGrip"] = {
		["p"] = Vector3.new(0, -0.01, 0),
		["side"] = Vector3.new(-1, -0.25, 0.15),
		["gap"] = -0.08
	},
	["TiltedGrip"] = {
		["p"] = Vector3.new(0, -0.01, 0),
		["side"] = Vector3.new(-1, -0.3, 0.15),
		["gap"] = -0.08
	}
}
local v_u_28 = {
	["Rifle"] = v_u_3(-0.16, 0.02, 0.06) * v_u_4(-0.2617993877991494, 0.6981317007977318, 0.3490658503988659),
	["SmallSMG"] = v_u_3(-0.1, -0.04, 0.06) * v_u_4(-0.3839724354387525, 0.5235987755982988, 0.24434609527920614),
	["Pistol"] = v_u_3(-0.04, -0.14, 0.12) * v_u_4(-0.6108652381980153, 0.24434609527920614, 0.06981317007977318),
	["Melee"] = v_u_3(0.05, -0.15, 0.1) * v_u_4(-0.2617993877991494, 0, 0.17453292519943295),
	["Throwable"] = v_u_3(0, -0.25, 0.15) * v_u_4(-0.3490658503988659, 0, 0)
}
function v_u_1.sprint(p29) -- name: sprint
	-- upvalues: (copy) v_u_28
	return v_u_28[p29] or v_u_28.Rifle
end
v_u_1.LOWERED = v_u_3(0.15, -1.25, 0.35) * v_u_4(-0.9599310885968813, 0.2617993877991494, 0.17453292519943295)
function v_u_1.eyeDist(p30, p31) -- name: eyeDist
	-- upvalues: (copy) v_u_1
	local v32 = v_u_1.holdKind(p30)
	local v33
	if v32 == "Pistol" or v32 == "SmallSMG" then
		v33 = (v32 == "Pistol" and v_u_1.PISTOL_EYE or 1.15) * 1
	else
		local v34 = v_u_1.CHEEK * 1 - p31.Position.Z
		local v35 = v_u_1.MIN_EYE * 1
		v33 = math.max(v34, v35)
	end
	local v36
	if p30 then
		v36 = p30.opticCfg
	else
		v36 = p30
	end
	if v36 then
		local v37 = v36.EyeRelief
		if type(v37) == "number" and v32 ~= "Pistol" then
			local v38 = v36.EyeRelief * 0.8 * 1
			v33 = math.max(v33, v38)
		end
	end
	if p30 then
		p30 = p30.cfg
	end
	if p30 then
		local v39 = p30.VmEyeRelief
		if type(v39) == "number" then
			v33 = v33 + p30.VmEyeRelief * 1
		end
	end
	return v33
end
function v_u_1.adsRoot(p40, p41) -- name: adsRoot
	-- upvalues: (copy) v_u_3
	return v_u_3(0, 0, -p41) * p40:Inverse()
end
function v_u_1.track(p42, p43) -- name: track
	local v44 = #p42
	if p43 <= p42[1][1] then
		return p42[1][2]
	end
	for v45 = 2, v44 do
		local v46 = p42[v45 - 1]
		local v47 = p42[v45]
		if p43 > v47[1] then
			continue
		end
		local v48 = p43 - v46[1]
		local v49 = v47[1] - v46[1]
		local v50 = v48 / math.max(v49, 1e-6)
		local v51 = math.clamp(v50, 0, 1)
		local v52 = v51 * v51 * (3 - v51 * 2)
		local v53 = v46[2]
		local v54 = v47[2]
		if typeof(v53) == "CFrame" then
			return v53:Lerp(v54, v52)
		else
			return v53 + (v54 - v53) * v52
		end
	end
	return p42[v44][2]
end
local v_u_55 = v_u_3(-0.06, -0.1, 0.06) * v_u_4(0.17453292519943295, -0.17453292519943295, -0.4537856055185257)
local v_u_56 = v_u_3(-0.05, -0.06, 0.12) * v_u_4(0.3141592653589793, -0.13962634015954636, -0.3839724354387525)
function v_u_1.reloadMag(p57, p58, p59) -- name: reloadMag
	-- upvalues: (copy) v_u_56, (copy) v_u_55, (copy) v_u_1, (copy) v_u_4, (copy) v_u_3
	local v60 = p58.info
	local v61 = {
		["motors"] = nil,
		["left"] = "grip",
		["right"] = "grip",
		["motors"] = {}
	}
	local v62 = p58.kind == "Pistol" and v_u_56 or v_u_55
	v61.gun = v_u_1.track({
		{ 0, CFrame.identity },
		{ 0.12, v62 },
		{ 0.8, v62 },
		{ 0.95, CFrame.identity }
	}, p57)
	local v63 = v60.magMotor
	if v63 then
		local v_u_64 = p58.magInsert or "Straight"
		local v_u_65 = p58.magDrop or 0.9
		local function v71(p66) -- name: magCF
			-- upvalues: (copy) v_u_64, (ref) v_u_4, (ref) v_u_3, (copy) v_u_65
			if v_u_64 == "Rock" then
				local v67 = v_u_4(math.min(p66, 1) * 0.5585053606381855, 0, 0)
				local v68 = v_u_3
				local v69 = -v_u_65
				local v70 = p66 - 0.35
				return v67 * v68(0, v69 * math.max(v70, 0), 0)
			elseif v_u_64 == "Box" then
				return v_u_3(-v_u_65 * 0.45 * p66, -v_u_65 * 0.7 * p66, 0)
			else
				return v_u_3(0, -v_u_65 * p66, 0)
			end
		end
		local v72 = v_u_1.track({
			{ 0.14, 0 },
			{ 0.3, 1 },
			{ 0.36, 2.5 },
			{ 0.5, 2.5 },
			{ 0.58, 1 },
			{ 0.7, 0 }
		}, p57)
		v61.motors[v63] = v71(v72)
		v61.magHidden = v72 > 2
	end
	if p57 >= 0.1 and p57 < 0.3 then
		v61.left = "mag"
	elseif p57 >= 0.3 and p57 < 0.52 then
		v61.left = "down"
	elseif p57 >= 0.52 and p57 < 0.72 then
		v61.left = "mag"
	end
	if p59 then
		local v73
		if p58 then
			v73 = p58.model
		else
			v73 = p58
		end
		if v73 then
			v73 = v73:GetAttribute("BoltTravel")
		end
		local v74 = type(v73) ~= "number" and 0.3 or v73 * v_u_1.SCALE
		local v75
		if p58 then
			v75 = p58.model
		else
			v75 = p58
		end
		if v75 then
			v75 = v75:GetAttribute("ChargeTravel")
		end
		local v76
		if type(v75) == "number" then
			v76 = v75 * v_u_1.SCALE
		else
			v76 = v74
		end
		local v77 = v_u_1.track({
			{ 0.74, 0 },
			{ 0.82, 1 },
			{ 0.86, 1 },
			{ 0.9, 0 }
		}, p57)
		if v60.bolt then
			v61.motors[v60.bolt] = v_u_3(0, 0, v74 * v77)
		end
		if v60.chargingHandle then
			v61.motors[v60.chargingHandle] = v_u_3(0, 0, v76 * v77)
		end
		if v60.slide then
			local v78 = v_u_1.track({
				{ 0, 1 },
				{ 0.8, 1 },
				{ 0.86, 0 }
			}, p57)
			v61.motors[v60.slide] = v_u_3(0, 0, (p58.slideTravel or 0.16) * v78)
		end
		local v79
		if p57 >= 0.72 then
			v79 = p57 < 0.9
		else
			v79 = false
		end
		if v79 and (v60.chargingHandle or v60.bolt) and p58.kind ~= "Pistol" then
			v61.left = "charge"
		end
	end
	return v61
end
function v_u_1.reloadShell(p80, p81, p82, p83) -- name: reloadShell
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_1
	local v84 = p81.info
	local v85 = {
		["motors"] = nil,
		["left"] = "grip",
		["right"] = "grip",
		["motors"] = {}
	}
	local v86 = v_u_3(-0.04, -0.06, 0.04) * v_u_4(0.10471975511965978, -0.10471975511965978, -0.5235987755982988)
	local v87 = p80 / math.max(p83, 0.05)
	v85.gun = v_u_1.track({
		{ 0, CFrame.identity },
		{ 0.08, v86 },
		{ 0.9, v86 },
		{ 1, CFrame.identity }
	}, v87)
	local v88 = p82.Start or 0
	if v88 < p80 and p80 < p83 - (p82.End or 0) then
		local v89 = p80 - v88
		local v90 = p82.First or 0.6
		local v91 = p82.Each or 0.6
		local v92
		if v89 < v90 then
			v92 = v89 / v90
		else
			v92 = (v89 - v90) % v91 / v91
		end
		v85.left = v92 < 0.45 and "down" or "port"
	end
	if p81.boltAction and (v84.boltHandle or v84.bolt) and not (v84.pump or v84.lever) then
		local v93 = v_u_1.track({
			{ 0, 0 },
			{ 0.12, 1 },
			{ 0.88, 1 },
			{ 0.98, 0 }
		}, v87)
		v_u_1.applyBolt(v85, p81, v93)
		v85.right = v93 > 0.05 and v93 < 0.999 and "bolt" or "grip"
	end
	return v85
end
function v_u_1.applyBolt(p94, p95, p96) -- name: applyBolt
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v97 = p95.info
	local v98 = p96 * 2
	local v99 = math.clamp(v98, 0, 1)
	local v100 = p96 * 2 - 1
	local v101 = math.clamp(v100, 0, 1)
	local v102 = (p95.boltTravel or 0.32) * v101
	if v97.boltHandle then
		p94.motors[v97.boltHandle] = v_u_3(0, 0, v102) * v_u_4(0, 0, v99 * 1.2217304763960306)
	end
	if v97.bolt then
		p94.motors[v97.bolt] = v_u_3(0, 0, v102)
	end
end
function v_u_1.bolt(p103, p104) -- name: bolt
	-- upvalues: (copy) v_u_1, (copy) v_u_4
	local v105 = {
		["motors"] = nil,
		["left"] = "grip",
		["right"] = "bolt",
		["motors"] = {}
	}
	local v106 = v_u_1.track({
		{ 0, 0 },
		{ 0.45, 1 },
		{ 0.55, 1 },
		{ 1, 0 }
	}, p103)
	v_u_1.applyBolt(v105, p104, v106)
	v105.gun = v_u_1.track({
		{ 0, CFrame.identity },
		{ 0.3, v_u_4(0.05235987755982989, -0.06981317007977318, -0.13962634015954636) },
		{ 0.8, v_u_4(0.05235987755982989, -0.06981317007977318, -0.13962634015954636) },
		{ 1, CFrame.identity }
	}, p103)
	if p103 < 0.08 or p103 > 0.95 then
		v105.right = "grip"
	end
	return v105
end
function v_u_1.pump(p107, p108) -- name: pump
	-- upvalues: (copy) v_u_1, (copy) v_u_3, (copy) v_u_4
	local v109 = {
		["motors"] = nil,
		["left"] = "pump",
		["right"] = "grip",
		["motors"] = {}
	}
	local v110 = v_u_1.track({
		{ 0, 0 },
		{ 0.45, 1 },
		{ 0.55, 1 },
		{ 1, 0 }
	}, p107)
	local v111 = (p108.pumpTravel or 0.36) * v110
	if p108.info.pump then
		v109.motors[p108.info.pump] = v_u_3(0, 0, v111)
	end
	v109.pumpOffset = v111
	v109.gun = v_u_4(0.03490658503988659 * v110, 0, -0.05235987755982989 * v110)
	return v109
end
function v_u_1.lever(p112, p113) -- name: lever
	-- upvalues: (copy) v_u_1, (copy) v_u_4, (copy) v_u_3
	local v114 = {
		["motors"] = nil,
		["left"] = "grip",
		["right"] = "lever",
		["motors"] = {}
	}
	local v115 = v_u_1.track({
		{ 0, 0 },
		{ 0.45, 1 },
		{ 0.55, 1 },
		{ 1, 0 }
	}, p112)
	if p113.info.lever then
		v114.motors[p113.info.lever] = v_u_4(0.8377580409572782 * v115, 0, 0)
	end
	if p113.info.bolt then
		v114.motors[p113.info.bolt] = v_u_3(0, 0, 0.18 * v115)
	end
	if p113.info.hammer then
		v114.motors[p113.info.hammer] = v_u_4(-0.6108652381980153 * v115, 0, 0)
	end
	v114.gun = v_u_4(0.06981317007977318 * v115, 0, -0.06981317007977318 * v115)
	return v114
end
function v_u_1.breakOpen(p116, p117) -- name: breakOpen
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_1
	local v118 = {
		["motors"] = nil,
		["left"] = "grip",
		["right"] = "grip",
		["motors"] = {}
	}
	local v119 = v_u_3(-0.04, -0.08, 0.05) * v_u_4(0.2792526803190927, -0.13962634015954636, -0.3490658503988659)
	v118.gun = v_u_1.track({
		{ 0, CFrame.identity },
		{ 0.12, v119 },
		{ 0.85, v119 },
		{ 1, CFrame.identity }
	}, p116)
	local v120 = v_u_1.track({
		{ 0.08, 0 },
		{ 0.22, 1 },
		{ 0.8, 1 },
		{ 0.9, 0 }
	}, p116)
	if p117.info.barrels then
		v118.motors[p117.info.barrels] = v_u_4(0.6632251157578453 * v120, 0, 0)
	end
	if p116 > 0.25 and p116 < 0.42 then
		v118.left = "down"
		return v118
	else
		if p116 > 0.42 and p116 < 0.72 then
			v118.left = "port"
		end
		return v118
	end
end
local function v_u_134(p121, p122) -- name: ktrack
	if p122 <= p121[1][1] then
		return p121[1][2]
	end
	for v123 = 2, #p121 do
		local v124 = p121[v123 - 1]
		local v125 = p121[v123]
		if p122 > v125[1] then
			continue
		end
		local v126 = v124[2]
		local v127 = v125[2]
		local v128 = p122 - v124[1]
		local v129 = v125[1] - v124[1]
		local v130 = v128 / math.max(v129, 1e-6)
		local v131 = v125[3]
		local v132 = math.clamp(v130, 0, 1)
		if v131 == "i" then
			v132 = v132 * v132 * v132
		elseif v131 == "o" then
			local v133 = 1 - v132
			v132 = 1 - v133 * v133 * v133
		elseif v131 ~= "l" then
			v132 = v132 * v132 * v132 * (v132 * (v132 * 6 - 15) + 10)
		end
		return v126:Lerp(v127, v132)
	end
	return p121[#p121][2]
end
v_u_1.ktrack = v_u_134
local v_u_135 = {
	{
		{ 0, v_u_8.Melee },
		{ 0.16, v_u_3(0.8, 0, -0.6) * v_u_4(1.4835298641951802, -0.5235987755982988, -0.6108652381980153), "o" },
		{ 0.24, v_u_3(0.9, 0.08, -0.5) * v_u_4(1.7802358370342162, -0.6632251157578453, -0.7330382858376184), "o" },
		{ 0.38, v_u_3(0.12, -0.28, -1.22) * v_u_4(0.4363323129985824, 0.3839724354387525, 0.3839724354387525), "i" },
		{ 0.5, v_u_3(-0.48, -0.66, -1.02) * v_u_4(-0.3141592653589793, 1.0471975511965976, 0.9773843811168246), "o" },
		{ 0.62, v_u_3(-0.56, -0.78, -0.95) * v_u_4(-0.47123889803846897, 1.1519173063162575, 1.064650843716541), "o" },
		{ 1, v_u_8.Melee }
	},
	{
		{ 0, v_u_8.Melee },
		{ 0.16, v_u_3(0.9, -0.22, -0.62) * v_u_4(0.17453292519943295, -0.9599310885968813, -1.4835298641951802), "o" },
		{ 0.24, v_u_3(1, -0.2, -0.52) * v_u_4(0.20943951023931956, -1.1519173063162575, -1.5009831567151235), "o" },
		{ 0.38, v_u_3(0.15, -0.3, -1.22) * v_u_4(0.13962634015954636, 0, -1.4835298641951802), "i" },
		{ 0.5, v_u_3(-0.58, -0.4, -0.96) * v_u_4(0.05235987755982989, 1.0821041362364843, -1.4311699866353502), "o" },
		{ 0.62, v_u_3(-0.72, -0.48, -0.8) * v_u_4(0, 1.239183768915974, -1.3962634015954636), "o" },
		{ 1, v_u_8.Melee }
	},
	{
		{ 0, v_u_8.Melee },
		{ 0.17, v_u_3(0.35, 0.2, -0.46) * v_u_4(1.9547687622336491, -0.08726646259971647, -0.08726646259971647), "o" },
		{ 0.25, v_u_3(0.36, 0.3, -0.38) * v_u_4(2.2689280275926285, -0.08726646259971647, -0.10471975511965978), "o" },
		{ 0.38, v_u_3(0.2, -0.2, -1.3) * v_u_4(0.5585053606381855, 0.08726646259971647, 0), "i" },
		{ 0.5, v_u_3(0.14, -0.7, -1.2) * v_u_4(-0.4363323129985824, 0.08726646259971647, 0), "o" },
		{ 0.62, v_u_3(0.12, -0.86, -1.1) * v_u_4(-0.6283185307179586, 0.08726646259971647, 0), "o" },
		{ 1, v_u_8.Melee }
	}
}
function v_u_1.swing(p136, p137) -- name: swing
	-- upvalues: (copy) v_u_135, (copy) v_u_134, (copy) v_u_3
	local v138 = v_u_134(v_u_135[(p137 - 1) % #v_u_135 + 1], p136)
	local v139 = (p136 - 0.5) / 0.2
	local v140 = math.clamp(v139, 0, 1)
	local v141 = v140 * 3.141592653589793 * 3
	return v138 * v_u_3(0, math.sin(v141) * (1 - v140) * 0.012, 0)
end
v_u_1.FIST_IDLE = v_u_3(0.55, -0.85, -0.9) * v_u_4(-0.17453292519943295, 0, -1.3962634015954636)
local v_u_142 = {
	{ 0, v_u_1.FIST_IDLE },
	{ 0.12, v_u_3(0.6, -0.8, -0.72) * v_u_4(-0.24434609527920614, -0.10471975511965978, -1.4311699866353502), "o" },
	{ 0.3, v_u_3(0.2, -0.3, -1.68) * v_u_4(0, 0.17453292519943295, -1.6406094968746698), "i" },
	{ 0.4, v_u_3(0.19, -0.3, -1.6) * v_u_4(0.03490658503988659, 0.17453292519943295, -1.5707963267948966), "o" },
	{ 1, v_u_1.FIST_IDLE }
}
function v_u_1.punch(p143) -- name: punch
	-- upvalues: (copy) v_u_134, (copy) v_u_142
	return v_u_134(v_u_142, p143)
end
v_u_1.THROW_READY_OVER = v_u_3(0.62, 0.02, -0.55) * v_u_4(1.2217304763960306, -0.17453292519943295, -0.2617993877991494)
v_u_1.THROW_READY_UNDER = v_u_3(0.5, -0.95, -0.55) * v_u_4(-0.6108652381980153, 0.08726646259971647, 0.08726646259971647)
v_u_1.THROW_PIN = v_u_3(0.3, -0.38, -1.15) * v_u_4(0.3141592653589793, -0.5235987755982988, 0.13962634015954636)
local v_u_144 = v_u_3(0.45, -1.45, -0.75) * v_u_4(-0.8726646259971648, 0.17453292519943295, -0.10471975511965978)
local v_u_145 = {
	["phase"] = "Idle",
	["prev"] = "Idle",
	["t0"] = 0,
	["from"] = nil,
	["last"] = nil
}
function v_u_1.throwable(p146, p147, p148) -- name: throwable
	-- upvalues: (copy) v_u_145, (copy) v_u_1, (copy) v_u_8, (copy) v_u_3, (copy) v_u_4, (copy) v_u_134, (copy) v_u_144
	local v149 = os.clock()
	if p146 ~= v_u_145.phase then
		local v150 = v_u_145
		local v151 = v_u_145
		local v152 = v_u_145
		local v153 = v_u_145
		local v154 = v_u_145.phase
		local v155 = v_u_145.last
		v150.prev = v154
		v151.phase = p146
		v152.t0 = v149
		v153.from = v155
	end
	local v156 = v149 - v_u_145.t0
	local v157 = p147 and v_u_1.THROW_READY_UNDER or v_u_1.THROW_READY_OVER
	local v158
	if p146 == "Ready" then
		local v159 = v_u_1.THROW_PIN
		if v156 < 0.12 then
			local v160 = v_u_145.from or v_u_8.Throwable
			local v161 = v156 / 0.12
			local v162 = 1 - math.clamp(v161, 0, 1)
			v158 = v160:Lerp(v159, 1 - v162 * v162 * v162)
		elseif v156 < 0.36 then
			local v163 = (v156 - 0.18) / 0.14
			local v164 = math.clamp(v163, 0, 1) * 3.141592653589793
			local v165 = math.sin(v164)
			v158 = v159 * v_u_3(v165 * 0.012, v165 * 0.008, 0) * v_u_4(0, v165 * 0.05235987755982989, v165 * -0.06981317007977318)
		elseif v156 < 0.64 then
			local v166 = (v156 - 0.36) / 0.28
			local v167 = math.clamp(v166, 0, 1)
			local v168 = v167 * v167 * v167 * (v167 * (v167 * 6 - 15) + 10)
			local v169 = v168 * 3.141592653589793
			local v170 = math.sin(v169) * 0.25
			v158 = v159:Lerp(v157, v168) * v_u_3(0, v170 * 0.03, v170 * 0.05)
		else
			local v171 = v_u_3
			local v172 = v156 * 1.7
			local v173 = v157 * v171(0, math.sin(v172) * 0.006, 0)
			local v174 = v_u_4
			local v175 = v156 * 2.2
			local v176 = math.sin(v175) * 0.020943951023931952
			local v177 = v156 * 1.3
			v158 = v173 * v174(v176, 0, math.sin(v177) * 0.010471975511965976)
		end
	elseif p146 == "Throw" then
		if p147 then
			v158 = v_u_134({
				{ 0, v_u_1.THROW_READY_UNDER },
				{ 0.16, v_u_1.THROW_READY_UNDER * v_u_3(0.04, -0.1, 0.2) * v_u_4(-0.3839724354387525, 0, 0), "o" },
				{ 0.42, v_u_3(0.2, -0.42, -1.6) * v_u_4(0.7853981633974483, 0, 0), "i" },
				{ 0.66, v_u_3(0.22, -0.22, -1.5) * v_u_4(1.0821041362364843, 0, 0), "o" },
				{ 1, v_u_3(0.3, -1.3, -0.9) * v_u_4(-0.6981317007977318, 0, 0) }
			}, p148)
		else
			v158 = v_u_134({
				{ 0, v_u_1.THROW_READY_OVER },
				{ 0.14, v_u_1.THROW_READY_OVER * v_u_3(0.05, 0.06, 0.14) * v_u_4(0.24434609527920614, 0, 0), "o" },
				{ 0.4, v_u_3(0.12, -0.26, -1.75) * v_u_4(-0.6108652381980153, 0.17453292519943295, -0.17453292519943295), "i" },
				{ 0.62, v_u_3(0, -0.9, -1.3) * v_u_4(-1.0821041362364843, 0.13962634015954636, 0.17453292519943295), "o" },
				{ 1, v_u_3(0.15, -1.45, -1) * v_u_4(-1.1519173063162575, 0, 0) }
			}, p148)
		end
	else
		v158 = v_u_8.Throwable
		if v_u_145.prev == "Throw" and v156 < 0.4 then
			local v178 = v_u_144
			local v179 = v156 / 0.4
			local v180 = 1 - math.clamp(v179, 0, 1)
			v158 = v178:Lerp(v158, 1 - v180 * v180 * v180)
		elseif v_u_145.prev == "Ready" and (v_u_145.from and v156 < 0.25) then
			local v181 = v_u_145.from
			local v182 = v156 / 0.25
			local v183 = math.clamp(v182, 0, 1)
			v158 = v181:Lerp(v158, v183 * v183 * v183 * (v183 * (v183 * 6 - 15) + 10))
		end
	end
	v_u_145.last = v158
	return v158
end
v_u_1.LEFT_DOWN = v_u_3(-0.25, -1.75, -0.7) * v_u_4(-1.0471975511965976, 0, 0)
v_u_1.ITEM_LEFT = v_u_3(-0.12, -0.55, -1.05) * v_u_4(0.4363323129985824, -0.3490658503988659, 0.17453292519943295)
v_u_1.ITEM_RIGHT = v_u_3(0.22, -0.62, -1) * v_u_4(0.3490658503988659, 0.2617993877991494, -0.2617993877991494)
return v_u_1