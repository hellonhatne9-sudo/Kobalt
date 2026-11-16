-- Decompiled by Executor
-- Path: ReplicatedStorage.Client.Controllers.ViewmodelController.Actions

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Shared.Config.WeaponConfig)
local v_u_3 = require(v1.Shared.Config.AudioConfig)
local v_u_4 = {}
local v_u_5 = require(script.Parent.Pose).SCALE
local v_u_6 = Vector3.new
local v_u_7 = CFrame.new
local v_u_8 = CFrame.Angles
local v_u_9 = CFrame.identity
local v_u_10 = math.rad
local v_u_11 = math.clamp
local function v_u_14(p12) -- name: io
	-- upvalues: (copy) v_u_11
	local v13 = v_u_11(p12, 0, 1)
	return v13 * v13 * v13 * (v13 * (v13 * 6 - 15) + 10)
end
local function v17(p15) -- name: ein
	-- upvalues: (copy) v_u_11
	local v16 = v_u_11(p15, 0, 1)
	return v16 * v16 * v16
end
local function v20(p18) -- name: eout
	-- upvalues: (copy) v_u_11
	local v19 = 1 - v_u_11(p18, 0, 1)
	return 1 - v19 * v19 * v19
end
local v_u_22 = {
	["io"] = v_u_14,
	["i"] = v17,
	["o"] = v20,
	["l"] = function(p21) -- name: c01
		-- upvalues: (copy) v_u_11
		return v_u_11(p21, 0, 1)
	end
}
local function v_u_35(p23, p24) -- name: track
	-- upvalues: (copy) v_u_22, (copy) v_u_14
	local v25 = #p23
	if p24 <= p23[1][1] then
		return p23[1][2]
	end
	for v26 = 2, v25 do
		local v27 = p23[v26 - 1]
		local v28 = p23[v26]
		if p24 > v28[1] then
			continue
		end
		local v29 = v_u_22[v28[3] or "io"] or v_u_14
		local v30 = p24 - v27[1]
		local v31 = v28[1] - v27[1]
		local v32 = v29(v30 / math.max(v31, 1e-6))
		local v33 = v27[2]
		local v34 = v28[2]
		if typeof(v33) == "CFrame" or typeof(v33) == "Vector3" then
			return v33:Lerp(v34, v32)
		else
			return v33 + (v34 - v33) * v32
		end
	end
	return p23[v25][2]
end
v_u_4.io = v_u_14
v_u_4.ein = v17
v_u_4.eout = v20
function v_u_4.seg(p36, p37, p38) -- name: seg
	-- upvalues: (copy) v_u_11
	local v39 = p36 - p37
	local v40 = p38 - p37
	return v_u_11(v39 / math.max(v40, 0.0001), 0, 1)
end
function v_u_4.bell(p41) -- name: bell
	-- upvalues: (copy) v_u_11
	local v42 = v_u_11(p41, 0, 1) * 3.141592653589793
	local v43 = math.sin(v42)
	return v43 * v43
end
function v_u_4.settle(p44, p45, p46, p47) -- name: settle
	if p44 <= 0 then
		return 0
	end
	local v48 = -(p47 or 9) * p44
	local v49 = p45 * math.exp(v48)
	local v50 = (p46 or 18) * p44
	return v49 * math.sin(v50)
end
v_u_4.track = v_u_35
local v_u_51 = {
	["HK416"] = {
		["pose"] = "Rifle",
		["ins"] = "Straight",
		["charge"] = "Release"
	},
	["M16A4"] = {
		["pose"] = "Rifle",
		["ins"] = "Straight",
		["charge"] = "Release"
	},
	["Mk47"] = {
		["pose"] = "Rifle",
		["ins"] = "Rock",
		["charge"] = "Release"
	},
	["Mk12"] = {
		["pose"] = "Rifle",
		["ins"] = "Straight",
		["charge"] = "Pull",
		["part"] = "ChargingHandle",
		["at"] = Vector3.new(0, 0.515, 0.4),
		["side"] = 0
	},
	["SCARL"] = {
		["pose"] = "Rifle",
		["ins"] = "Straight",
		["charge"] = "Pull",
		["part"] = "ChargingHandle",
		["at"] = Vector3.new(-0.25, 0.46, -0.86),
		["side"] = -1
	},
	["G36C"] = {
		["pose"] = "Rifle",
		["ins"] = "Rock",
		["charge"] = "Pull",
		["part"] = "ChargingHandle",
		["at"] = Vector3.new(0.07, 0.515, -0.9),
		["side"] = 0
	},
	["K2"] = {
		["pose"] = "Rifle",
		["ins"] = "Straight",
		["charge"] = "Pull",
		["part"] = "ChargingHandle",
		["at"] = Vector3.new(0.17, 0.43, -0.25),
		["side"] = 1
	},
	["AKM"] = {
		["pose"] = "Rifle",
		["ins"] = "Rock",
		["charge"] = "Pull",
		["part"] = "Bolt",
		["at"] = Vector3.new(0.15, 0.45, -0.62),
		["side"] = 1
	},
	["BerylM762"] = {
		["pose"] = "Rifle",
		["ins"] = "Rock",
		["charge"] = "Pull",
		["part"] = "Bolt",
		["at"] = Vector3.new(0.15, 0.45, -0.62),
		["side"] = 1
	},
	["ACE32"] = {
		["pose"] = "Rifle",
		["ins"] = "Rock",
		["charge"] = "Pull",
		["part"] = "Bolt",
		["at"] = Vector3.new(-0.15, 0.45, -0.62),
		["side"] = -1
	},
	["VSS"] = {
		["pose"] = "Rifle",
		["ins"] = "Rock",
		["charge"] = "Pull",
		["part"] = "Bolt",
		["at"] = Vector3.new(0.155, 0.45, -0.66),
		["side"] = 1
	},
	["SVD"] = {
		["pose"] = "Rifle",
		["ins"] = "Rock",
		["charge"] = "Pull",
		["part"] = "Bolt",
		["at"] = Vector3.new(0.16, 0.455, -0.81),
		["side"] = 1
	},
	["S12K"] = {
		["pose"] = "Rifle",
		["ins"] = "Rock",
		["charge"] = "Pull",
		["part"] = "Bolt",
		["at"] = Vector3.new(0.16, 0.445, -0.78),
		["side"] = 1
	},
	["AUG"] = {
		["pose"] = "Bullpup",
		["ins"] = "Straight",
		["charge"] = "Pull",
		["part"] = "ChargingHandle",
		["at"] = Vector3.new(-0.2, 0.45, -0.59),
		["side"] = -1
	},
	["FAMAS"] = {
		["pose"] = "Bullpup",
		["ins"] = "Straight",
		["charge"] = "Pull",
		["part"] = "ChargingHandle",
		["at"] = Vector3.new(0, 0.545, -0.59),
		["side"] = 0
	},
	["QBZ"] = {
		["pose"] = "Bullpup",
		["ins"] = "Rock",
		["charge"] = "Pull",
		["part"] = "ChargingHandle",
		["at"] = Vector3.new(0, 0.535, -0.24),
		["side"] = 0
	},
	["Groza"] = {
		["pose"] = "Bullpup",
		["ins"] = "Rock",
		["charge"] = "Pull",
		["part"] = "Bolt",
		["at"] = Vector3.new(0.15, 0.445, 0.51),
		["side"] = 1
	},
	["SKS"] = {
		["pose"] = "Rifle",
		["ins"] = "Straight",
		["charge"] = "Pull",
		["part"] = "Bolt",
		["at"] = Vector3.new(0.205, 0.32, -0.61),
		["side"] = 1
	},
	["Mini14"] = {
		["pose"] = "Rifle",
		["ins"] = "Rock",
		["charge"] = "Pull",
		["part"] = "Bolt",
		["at"] = Vector3.new(0.2, 0.3, -0.465),
		["side"] = 1
	},
	["Mk14"] = {
		["pose"] = "Rifle",
		["ins"] = "Rock",
		["charge"] = "Pull",
		["part"] = "Bolt",
		["at"] = Vector3.new(0.17, 0.43, -0.2),
		["side"] = 1
	},
	["SLR"] = {
		["pose"] = "Rifle",
		["ins"] = "Rock",
		["charge"] = "Pull",
		["part"] = "Bolt",
		["at"] = Vector3.new(-0.2, 0.46, -0.88),
		["side"] = -1
	},
	["O12"] = {
		["pose"] = "Rifle",
		["ins"] = "Straight",
		["charge"] = "Pull",
		["part"] = "Bolt",
		["at"] = Vector3.new(-0.17, 0.47, -0.64),
		["side"] = -1
	},
	["UMP45"] = {
		["pose"] = "SMG",
		["ins"] = "Straight",
		["charge"] = "Slap",
		["part"] = "Bolt",
		["at"] = Vector3.new(-0.23, 0.54, -1.04),
		["side"] = -1
	},
	["MP5K"] = {
		["pose"] = "SMG",
		["ins"] = "Straight",
		["charge"] = "Slap",
		["part"] = "Bolt",
		["at"] = Vector3.new(-0.11, 0.51, -0.84),
		["side"] = -1
	},
	["JS9"] = {
		["pose"] = "SMG",
		["ins"] = "Straight",
		["charge"] = "Slap",
		["part"] = "Bolt",
		["at"] = Vector3.new(-0.15, 0.52, -0.9),
		["side"] = -1
	},
	["Vector"] = {
		["pose"] = "SMG",
		["ins"] = "Straight",
		["charge"] = "Pull",
		["part"] = "Bolt",
		["at"] = Vector3.new(-0.215, 0.567, -0.73),
		["side"] = -1
	},
	["Tommy"] = {
		["pose"] = "SMG",
		["ins"] = "Straight",
		["charge"] = "Pull",
		["part"] = "Bolt",
		["at"] = Vector3.new(0, 0.58, -0.05),
		["side"] = 0
	},
	["MicroUZI"] = {
		["pose"] = "Pistol",
		["ins"] = "Grip",
		["charge"] = "Pull",
		["part"] = "Bolt",
		["at"] = Vector3.new(0, 0.555, -0.25),
		["side"] = 0
	},
	["MP9"] = {
		["pose"] = "Pistol",
		["ins"] = "Grip",
		["charge"] = "Pull",
		["part"] = "Bolt",
		["at"] = Vector3.new(0, 0.465, 0.48),
		["side"] = 0
	},
	["P90"] = {
		["pose"] = "Top",
		["ins"] = "Top",
		["charge"] = "Pull",
		["part"] = "Bolt",
		["at"] = Vector3.new(-0.155, 0.35, -0.87),
		["side"] = -1
	},
	["M249"] = {
		["pose"] = "LMG",
		["ins"] = "Belt",
		["charge"] = "Pull",
		["part"] = "ChargingHandle",
		["at"] = Vector3.new(0.27, 0.47, -0.81),
		["side"] = 1,
		["cover"] = Vector3.new(0, 0.73, -0.2)
	},
	["RPD"] = {
		["pose"] = "LMG",
		["ins"] = "Belt",
		["charge"] = "Pull",
		["part"] = "ChargingHandle",
		["at"] = Vector3.new(0.22, 0.43, -0.15),
		["side"] = 1,
		["cover"] = Vector3.new(0, 0.65, -0.2)
	},
	["MG3"] = {
		["pose"] = "LMG",
		["ins"] = "Belt",
		["charge"] = "Pull",
		["part"] = "ChargingHandle",
		["at"] = Vector3.new(0.25, 0.43, -0.59),
		["side"] = 1,
		["cover"] = Vector3.new(0, 0.67, -0.7)
	},
	["P92"] = {
		["pose"] = "Pistol",
		["ins"] = "Grip",
		["charge"] = "Slide",
		["at"] = Vector3.new(0, 0.42, 0.12)
	},
	["P18C"] = {
		["pose"] = "Pistol",
		["ins"] = "Grip",
		["charge"] = "Slide",
		["at"] = Vector3.new(0, 0.38, 0.1)
	},
	["Deagle"] = {
		["pose"] = "Pistol",
		["ins"] = "Grip",
		["charge"] = "Slide",
		["at"] = Vector3.new(0, 0.47, 0.15)
	},
	["Skorpion"] = {
		["pose"] = "Pistol",
		["ins"] = "Straight",
		["charge"] = "Pull",
		["part"] = "Slide",
		["at"] = Vector3.new(-0.14, 0.46, -0.45),
		["side"] = -1
	},
	["M24"] = {
		["pose"] = "Sniper",
		["ins"] = "Straight",
		["charge"] = "Bolt"
	},
	["AWM"] = {
		["pose"] = "Sniper",
		["ins"] = "Straight",
		["charge"] = "Bolt"
	},
	["Lynx"] = {
		["pose"] = "Sniper",
		["ins"] = "Straight",
		["charge"] = "Bolt"
	},
	["Kar98k"] = {
		["pose"] = "Clip",
		["ins"] = "Clip",
		["charge"] = "Bolt"
	},
	["Win94"] = {
		["pose"] = "Gate",
		["ins"] = "Gate",
		["port"] = Vector3.new(0.1, 0.07, -0.62)
	},
	["S1897"] = {
		["pose"] = "Tube",
		["ins"] = "Tube",
		["port"] = Vector3.new(0, 0, -0.66)
	},
	["DBS"] = {
		["pose"] = "TubeB",
		["ins"] = "Tube",
		["port"] = Vector3.new(0, 0, 0.7)
	},
	["R1895"] = {
		["pose"] = "Revolver",
		["ins"] = "Cylinder",
		["port"] = Vector3.new(0.08, 0.25, 0.1)
	},
	["S686"] = {
		["pose"] = "Break",
		["ins"] = "Break",
		["ou"] = true
	},
	["SawedOff"] = {
		["pose"] = "Break",
		["ins"] = "Break"
	},
	["FlareGun"] = {
		["pose"] = "BreakP",
		["ins"] = "Break",
		["flare"] = true
	},
	["Crossbow"] = {
		["pose"] = "Crossbow",
		["ins"] = "String"
	}
}
v_u_4.PROF = v_u_51
local v_u_52 = {
	["Kar98k"] = Vector3.new(0.32, 0.225, 0.09),
	["M24"] = Vector3.new(0.26, 0.17, 0.18),
	["AWM"] = Vector3.new(0.3, 0.25, 0.17),
	["Lynx"] = Vector3.new(0.45, 0.31, 1.08)
}
local v_u_53 = {
	["Ammo_556"] = "556",
	["Ammo_762"] = "762",
	["Ammo_9mm"] = "9mm",
	["Ammo_45"] = "45",
	["Ammo_12g"] = "12g",
	["Ammo_300"] = "300",
	["Ammo_57"] = "57",
	["Ammo_50"] = "300",
	["FlareRound"] = "flare"
}
v_u_4.SHELL_OF = v_u_53
function v_u_4.profile(p54, p55) -- name: profile
	-- upvalues: (copy) v_u_51
	if p54 then
		p54 = v_u_51[p54]
	end
	if p54 then
		return p54
	end
	if p55 then
		p55 = p55.class
	end
	return p55 == "Pistol" and {
		["pose"] = "Pistol",
		["ins"] = "Grip",
		["charge"] = "Slide",
		["at"] = Vector3.new(0, 0.4, 0.1)
	} or (p55 == "SMG" and {
		["pose"] = "SMG",
		["ins"] = "Straight",
		["charge"] = "Pull",
		["part"] = "Bolt",
		["side"] = -1
	} or (p55 == "LMG" and {
		["pose"] = "LMG",
		["ins"] = "Belt",
		["charge"] = "Pull",
		["part"] = "ChargingHandle",
		["side"] = 1
	} or {
		["pose"] = "Rifle",
		["ins"] = "Straight",
		["charge"] = "Pull",
		["part"] = "ChargingHandle",
		["side"] = 1
	}))
end
local v_u_56 = {
	["Rifle"] = v_u_7(-0.05, 0.08, 0.02) * v_u_8(0.5585053606381855, 0.17453292519943295, -0.4188790204786391),
	["Bullpup"] = v_u_7(-0.22, 0, -0.34) * v_u_8(0.17453292519943295, 0.4188790204786391, -0.5235987755982988),
	["SMG"] = v_u_7(-0.08, 0.06, -0.04) * v_u_8(0.4886921905584123, 0.20943951023931956, -0.4537856055185257),
	["Pistol"] = v_u_7(-0.16, 0.06, 0.08) * v_u_8(0.4537856055185257, 0.24434609527920614, -0.3839724354387525),
	["LMG"] = v_u_7(-0.14, -0.06, 0.04) * v_u_8(0.06981317007977318, 0.3141592653589793, 0.4188790204786391),
	["Sniper"] = v_u_7(-0.06, 0.05, 0.02) * v_u_8(0.3839724354387525, 0.17453292519943295, -0.3490658503988659),
	["Top"] = v_u_7(-0.12, -0.02, 0.04) * v_u_8(0.20943951023931956, 0.2792526803190927, 0.4537856055185257),
	["Clip"] = v_u_7(-0.16, 0.2, 0.02) * v_u_8(-0.05235987755982989, 0.20943951023931956, -0.17453292519943295),
	["Tube"] = v_u_7(-0.12, 0.08, 0) * v_u_8(0.24434609527920614, 0.17453292519943295, -0.8028514559173916),
	["TubeB"] = v_u_7(-0.2, 0.02, -0.3) * v_u_8(0.13962634015954636, 0.3839724354387525, -0.767944870877505),
	["Gate"] = v_u_7(-0.22, 0, 0) * v_u_8(0.13962634015954636, 0.24434609527920614, 0.5585053606381855),
	["Revolver"] = v_u_7(-0.14, 0.04, 0.08) * v_u_8(0.3490658503988659, 0.20943951023931956, 0.7330382858376184),
	["Break"] = v_u_7(-0.14, 0.16, -0.08) * v_u_8(0.2792526803190927, 0.20943951023931956, 0.20943951023931956),
	["BreakP"] = v_u_7(-0.14, 0.12, 0.02) * v_u_8(0.13962634015954636, 0.24434609527920614, 0.3141592653589793),
	["Crossbow"] = v_u_7(-0.12, 0.1, 0) * v_u_8(-0.20943951023931956, 0.17453292519943295, 0.06981317007977318)
}
v_u_4.POSE = v_u_56
local v_u_57 = {
	[1] = v_u_7(-0.12, 0.17, 0) * v_u_8(0.13962634015954636, -0.06981317007977318, 0.8377580409572782),
	[-1] = v_u_7(-0.06, 0.1, -0.05) * v_u_8(0.20943951023931956, 0.20943951023931956, -0.8377580409572782),
	[0] = v_u_7(-0.08, 0.12, 0.05) * v_u_8(-0.24434609527920614, 0.17453292519943295, -0.4188790204786391)
}
local v_u_58 = {
	[1] = Vector3.new(0.17, -0.13, 0.02),
	[-1] = Vector3.new(-0.15, -0.06, 0),
	[0] = Vector3.new(-0.15, 0.15, 0.04)
}
local v_u_59 = v_u_7(-0.05, 0.13, 0) * v_u_8(-0.08726646259971647, 0.08726646259971647, 0.17453292519943295)
local v_u_60 = v_u_7(0, -0.01, 0.02) * v_u_8(0.06981317007977318, 0.03490658503988659, -0.10471975511965978)
local v_u_61 = nil
local function v_u_62() -- name: newOut
	return {
		["motors"] = nil,
		["left"] = "grip",
		["leftK"] = 0,
		["right"] = "grip",
		["rightK"] = 0,
		["props"] = nil,
		["hide"] = nil,
		["motors"] = {},
		["props"] = {},
		["hide"] = {}
	}
end
function v_u_4.fist(p63, p64) -- name: fist
	local v65 = p64 and (p64.Magnitude > 0.0001 and p64.Unit) or Vector3.new(0, 1, 0)
	local v66 = v65.Z
	local v67 = v65:Cross(math.abs(v66) < 0.95 and Vector3.new(0, 0, -1) or Vector3.new(1, 0, 0)).Unit
	return CFrame.fromMatrix(p63, v67, v65)
end
function v_u_4.mv(p68, p69, p70) -- name: mv
	local v71 = p68.C0
	return v71 * p69 * v71:Inverse() * p70
end
function v_u_4.partAt(p72, p73) -- name: partAt
	return p72.C0 * p73 * p72.C1:Inverse()
end
local function v_u_82(p74) -- name: magGeo
	-- upvalues: (copy) v_u_5, (copy) v_u_6
	local v75 = p74.actMag
	if v75 ~= nil then
		return v75 or nil
	end
	local v76 = p74.info
	local v77 = v76.magMotor
	local v78 = v76.mag
	if not (v77 and v78) then
		p74.actMag = false
		return nil
	end
	local v79 = v77.C1:Inverse()
	local v80 = v78.Size
	local v81 = {
		["m"] = v77,
		["part"] = v78,
		["c0"] = v77.C0,
		["rest"] = v79,
		["up"] = v79.UpVector,
		["len"] = v80.Y,
		["depth"] = v80.Z,
		["width"] = v80.X,
		["lug"] = v_u_6(0, -0.02 * v_u_5, v79.Position.Z - v80.Z * 0.32),
		["hand"] = v79 * v_u_6(-(v80.X * 0.5 + 0.1), -v80.Y * 0.15, v80.Z * 0.05)
	}
	p74.actMag = v81
	return v81
end
local function v_u_100(p83, p84) -- name: chargeGeo
	-- upvalues: (copy) v_u_5, (copy) v_u_9, (copy) v_u_6
	local v85 = p83.actCharge
	if v85 then
		return v85
	end
	local v86 = p83.info
	local v87 = nil
	if p84.part == "ChargingHandle" then
		v87 = v86.chargingHandle
	elseif p84.part == "Slide" or p84.charge == "Slide" then
		v87 = v86.slide
	elseif p84.part == "Bolt" then
		v87 = v86.bolt
	end
	local v88 = p84.side or 0
	local v89
	if p84.at then
		v89 = p84.at * v_u_5
	elseif v87 and v87.Part1 then
		local v90 = v_u_9
		local v91 = v87.C0 * v90 * v87.C1:Inverse()
		local v92 = v87.Part1.Size / 2
		v89 = v88 ~= 0 and v91 * v_u_6(v88 * v92.X, 0, 0) or v91 * v_u_6(0, v92.Y, v92.Z * 0.6)
	else
		v89 = Vector3.new(0.1, 0.35, -0.3) * v_u_5
	end
	local v93
	if p84.charge == "Slide" or p84.part == "Slide" then
		v93 = p83.slideTravel or 0.16
	elseif p84.part == "ChargingHandle" then
		local v94 = p83.model
		if v94 then
			v94 = p83.model:GetAttribute("BoltTravel")
		end
		v93 = type(v94) ~= "number" and 0.3 or v94 * v_u_5
		local v95 = p83.model
		if v95 then
			v95 = p83.model:GetAttribute("ChargeTravel")
		end
		if type(v95) == "number" then
			v93 = v95 * v_u_5
		end
	else
		local v96 = p83.model
		if v96 then
			v96 = p83.model:GetAttribute("BoltTravel")
		end
		v93 = type(v96) ~= "number" and 0.3 or v96 * v_u_5
	end
	local v97 = v88 == 0 and Vector3.new(0, 0.11, 0.04) or (v_u_6(v88 * 0.11, -0.01, 0.03) or Vector3.new(0, 0.11, 0.04))
	local v98 = v88 == 0 and Vector3.new(0, -1, 0) or (v_u_6(-v88, 0, 0) or Vector3.new(0, -1, 0))
	local v99 = {
		["m"] = v87,
		["at"] = v89,
		["grab"] = v89 + v97,
		["tr"] = v93,
		["side"] = v88,
		["up"] = v98
	}
	p83.actCharge = v99
	return v99
end
local function v_u_117(p101, p102, p103) -- name: boltState
	-- upvalues: (copy) v_u_11, (copy) v_u_7, (copy) v_u_8, (copy) v_u_52, (copy) v_u_9, (copy) v_u_6, (copy) v_u_5
	local v104 = p102.info
	local v105 = v_u_11(v_u_11(p103 * 2, 0, 1), 0, 1)
	local v106 = v105 * v105 * v105 * (v105 * (v105 * 6 - 15) + 10)
	local v107 = v_u_11(v_u_11(p103 * 2 - 1, 0, 1), 0, 1)
	local v108 = v107 * v107 * v107 * (v107 * (v107 * 6 - 15) + 10)
	local v109 = (p102.boltTravel or 0.32) * v108
	local v110 = v_u_7(0, 0, v109) * v_u_8(0, 0, v106 * 1.4311699866353502)
	if v104.boltHandle then
		p101.motors[v104.boltHandle] = v110
	end
	if v104.bolt then
		p101.motors[v104.bolt] = v_u_7(0, 0, v109)
	end
	local v111 = v_u_52[p102.id]
	local v112 = v104.boltHandle or v104.bolt
	if not v112 then
		return nil
	end
	if not v111 then
		local v113 = v112.Part1
		local v114 = v_u_9
		v111 = v112.C0 * v114 * v112.C1:Inverse() * v_u_6((v113 and v113.Size.X or 0.3) * 0.45, 0, 0) / v_u_5
	end
	local v115 = v111 * v_u_5
	local v116 = v112.C0
	return v116 * v110 * v116:Inverse() * v115 + Vector3.new(0.07, 0.05, 0.01)
end
v_u_4.boltState = v_u_117
local function v_u_186(p118) -- name: magTimeline
	local v119 = p118.c
	local v120
	if p118.empty then
		v120 = p118.prof.charge or nil
	else
		v120 = nil
	end
	local v121 = (v120 == "Slap" or v120 == "Bolt") and 0.2 or 0
	local v122 = {
		["c"] = v119,
		["seat"] = v119
	}
	local v123 = v119 * 0.2
	v122.inA = 0
	v122.inB = v123
	if v121 > 0 then
		local v124 = v119 * 0.015
		local v125 = v119 * v121
		v122.preA = v124
		v122.preB = v125
	end
	if p118.empty then
		local v126 = v119 * (v121 + (1 - v121) * 0.02)
		local v127 = v119 * (v121 + (1 - v121) * 0.15)
		v122.reachA = v126
		v122.reachB = v127
		v122.drop = v119 * (v121 + (1 - v121) * 0.18)
		local v128 = v119 * (v121 + (1 - v121) * 0.18)
		local v129 = v119 * (v121 + (1 - v121) * 0.44)
		v122.awayA = v128
		v122.awayB = v129
		local v130 = v119 * (v121 + (1 - v121) * 0.44)
		local v131 = v119 * (v121 + (1 - v121) * 0.78)
		v122.backA = v130
		v122.backB = v131
	else
		local v132 = v119 * (v121 + (1 - v121) * 0.03)
		local v133 = v119 * (v121 + (1 - v121) * 0.18)
		v122.reachA = v132
		v122.reachB = v133
		local v134 = v119 * (v121 + (1 - v121) * 0.19)
		local v135 = v119 * (v121 + (1 - v121) * 0.36)
		v122.pullA = v134
		v122.pullB = v135
		local v136 = v119 * (v121 + (1 - v121) * 0.36)
		local v137 = v119 * (v121 + (1 - v121) * 0.56)
		v122.awayA = v136
		v122.awayB = v137
		local v138 = v119 * (v121 + (1 - v121) * 0.56)
		local v139 = v119 * (v121 + (1 - v121) * 0.8)
		v122.backA = v138
		v122.backB = v139
	end
	v122.alignB = v119 * (v121 + (1 - v121) * 0.9)
	local v140 = 1 - v119
	if v120 then
		local v141 = v119 + v140 * 0.04
		local v142 = v119 + v140 * 0.24
		v122.chA = v141
		v122.chB = v142
		local v143 = v119 + v140 * 0.24
		local v144 = v119 + v140 * 0.4
		v122.pA = v143
		v122.pB = v144
		v122.rel = v119 + v140 * (v120 == "Release" and 0.36 or 0.45)
		local v145 = v122.rel + v140 * 0.06
		local v146 = v122.rel + v140 * 0.32
		v122.homeA = v145
		v122.homeB = v146
		local v147 = v122.rel
		local v148 = v122.rel + v140 * 0.48
		local v149 = math.min(v148, 0.985)
		v122.outA = v147
		v122.outB = v149
	else
		local v150 = v119 + v140 * 0.08
		local v151 = v119 + v140 * 0.48
		v122.homeA = v150
		v122.homeB = v151
		local v152 = v119 + v140 * 0.22
		local v153 = v119 + v140 * 0.86
		v122.outA = v152
		v122.outB = v153
	end
	p118.T = v122
	local v154 = p118.events
	local v155 = p118.snd
	if p118.empty then
		local v156 = {
			["u"] = v122.drop,
			["name"] = "MagDrop"
		}
		table.insert(v154, v156)
		local v157 = {
			["vol"] = 0.7
		} or {}
		v157.u = v122.drop
		v157.name = "MagOut"
		table.insert(v155, v157)
	else
		local v158 = {
			["vol"] = 0.7
		} or {}
		v158.u = v122.pullA + (v122.pullB - v122.pullA) * 0.3
		v158.name = "MagOut"
		table.insert(v155, v158)
	end
	local v159 = {
		["vol"] = 0.75
	} or {}
	v159.u = v122.seat - 0.015
	v159.name = "MagIn"
	table.insert(v155, v159)
	if v120 == "Pull" then
		local v160 = {
			["vol"] = 0.7
		} or {}
		v160.u = v122.pA
		v160.name = "ChargingHandle"
		table.insert(v155, v160)
		local v161 = {
			["vol"] = 0.75
		} or {}
		v161.u = v122.rel
		v161.name = "ChargingHandleForward"
		table.insert(v155, v161)
	elseif v120 == "Release" or v120 == "Slide" then
		local v162 = {
			["vol"] = 0.75
		} or {}
		v162.u = v122.rel
		v162.name = "ChargingHandleForward"
		table.insert(v155, v162)
	elseif v120 == "Slap" then
		local v163 = {
			["vol"] = 0.65
		} or {}
		v163.u = v122.preA + (v122.preB - v122.preA) * 0.6
		v163.name = "ChargingHandle"
		table.insert(v155, v163)
		local v164 = {
			["vol"] = 0.8
		} or {}
		v164.u = v122.rel
		v164.name = "ChargingHandleForward"
		table.insert(v155, v164)
	elseif v120 == "Bolt" then
		local v165 = {
			["vol"] = 0.7
		} or {}
		v165.u = v122.preA + (v122.preB - v122.preA) * 0.3
		v165.name = "Bolt"
		table.insert(v155, v165)
		if p118.boltAction then
			local v166 = v122.preA + (v122.preB - v122.preA) * 0.72
			local v167 = {
				["kind"] = p118.shell
			} or {}
			v167.u = v166
			v167.name = "Eject"
			table.insert(v154, v167)
		end
		local v168 = {
			["vol"] = 0.6
		} or {}
		v168.u = v122.pA
		v168.name = "ChargingHandleForward"
		table.insert(v155, v168)
	end
	local v169 = p118.clk
	local v170 = {
		["u"] = nil,
		["name"] = "MagRelease",
		["vol"] = 0.55,
		["fb"] = nil,
		["u"] = v122.reachB
	}
	table.insert(v169, v170)
	if p118.empty then
		local v171 = {
			["u"] = nil,
			["name"] = "MagOut",
			["vol"] = 0.7,
			["fb"] = "MagOut",
			["u"] = v122.drop - 0.005
		}
		table.insert(v169, v171)
	else
		local v172 = {
			["u"] = nil,
			["name"] = "MagOut",
			["vol"] = 0.7,
			["fb"] = "MagOut",
			["u"] = v122.pullA + (v122.pullB - v122.pullA) * 0.3
		}
		table.insert(v169, v172)
	end
	local v173 = {
		["u"] = nil,
		["name"] = "MagIn",
		["vol"] = 0.8,
		["fb"] = "MagIn",
		["u"] = v122.seat - 0.015
	}
	table.insert(v169, v173)
	if v120 == "Pull" then
		local v174 = {
			["u"] = nil,
			["name"] = "ChargeBack",
			["vol"] = 0.7,
			["fb"] = "ChargingHandle",
			["u"] = v122.pA + (v122.pB - v122.pA) * 0.7
		}
		table.insert(v169, v174)
		local v175 = {
			["u"] = nil,
			["name"] = "ChargeForward",
			["vol"] = 0.8,
			["fb"] = "ChargingHandleForward",
			["u"] = v122.rel
		}
		table.insert(v169, v175)
		return
	elseif v120 == "Release" then
		local v176 = {
			["u"] = nil,
			["name"] = "BoltCatch",
			["vol"] = 0.8,
			["fb"] = "ChargingHandleForward",
			["u"] = v122.rel
		}
		table.insert(v169, v176)
		return
	elseif v120 == "Slide" then
		local v177 = {
			["u"] = nil,
			["name"] = "SlideBack",
			["vol"] = 0.65,
			["fb"] = nil,
			["u"] = v122.pA + (v122.pB - v122.pA) * 0.75
		}
		table.insert(v169, v177)
		local v178 = {
			["u"] = nil,
			["name"] = "SlideRelease",
			["vol"] = 0.8,
			["fb"] = "ChargingHandleForward",
			["u"] = v122.rel
		}
		table.insert(v169, v178)
		return
	elseif v120 == "Slap" then
		local v179 = {
			["u"] = nil,
			["name"] = "ChargeBack",
			["vol"] = 0.65,
			["fb"] = "ChargingHandle",
			["u"] = v122.preA + (v122.preB - v122.preA) * 0.6
		}
		table.insert(v169, v179)
		local v180 = {
			["u"] = nil,
			["name"] = "ChargeSlap",
			["vol"] = 0.85,
			["fb"] = "ChargingHandleForward",
			["u"] = v122.rel
		}
		table.insert(v169, v180)
	elseif v120 == "Bolt" then
		local v181 = v122.preB - v122.preA
		local v182 = {
			["u"] = nil,
			["name"] = "BoltUp",
			["vol"] = 0.7,
			["fb"] = "Bolt",
			["u"] = v122.preA + v181 * 0.56
		}
		table.insert(v169, v182)
		local v183 = {
			["u"] = nil,
			["name"] = "BoltBack",
			["vol"] = 0.7,
			["fb"] = nil,
			["u"] = v122.preA + v181 * 0.84
		}
		table.insert(v169, v183)
		local v184 = {
			["u"] = nil,
			["name"] = "BoltForward",
			["vol"] = 0.7,
			["fb"] = "ChargingHandleForward",
			["u"] = v122.pA + (v122.rel - v122.pA) * 0.48
		}
		table.insert(v169, v184)
		local v185 = {
			["u"] = nil,
			["name"] = "BoltDown",
			["vol"] = 0.65,
			["fb"] = nil,
			["u"] = v122.rel - 0.005
		}
		table.insert(v169, v185)
	end
end
local function v_u_235(p187) -- name: beltTimeline
	local v188 = p187.c
	local v189 = {
		["c"] = v188,
		["seat"] = v188
	}
	local v190 = v188 * 0.13
	v189.inA = 0
	v189.inB = v190
	local v191 = v188 * 0.03
	local v192 = v188 * 0.13
	v189.cvA = v191
	v189.cvB = v192
	local v193 = v188 * 0.13
	local v194 = v188 * 0.22
	v189.opA = v193
	v189.opB = v194
	local v195 = v188 * 0.22
	local v196 = v188 * 0.33
	v189.blA = v195
	v189.blB = v196
	local v197 = v188 * 0.33
	local v198 = v188 * 0.5
	v189.bxA = v197
	v189.bxB = v198
	v189.drop = v188 * 0.39
	local v199 = v188 * 0.5
	local v200 = v188 * 0.72
	v189.nbA = v199
	v189.nbB = v200
	local v201 = v188 * 0.74
	local v202 = v188 * 0.87
	v189.biA = v201
	v189.biB = v202
	v189.clA = v188 * 0.88
	v189.clB = v188
	local v203 = 1 - v188
	if p187.empty then
		local v204 = v188 + v203 * 0.05
		local v205 = v188 + v203 * 0.28
		v189.chA = v204
		v189.chB = v205
		local v206 = v188 + v203 * 0.28
		local v207 = v188 + v203 * 0.45
		v189.pA = v206
		v189.pB = v207
		v189.rel = v188 + v203 * 0.5
		local v208 = v188 + v203 * 0.56
		local v209 = v188 + v203 * 0.82
		v189.homeA = v208
		v189.homeB = v209
		local v210 = v188 + v203 * 0.5
		local v211 = v188 + v203 * 0.94
		v189.outA = v210
		v189.outB = v211
	else
		local v212 = v188 + v203 * 0.1
		local v213 = v188 + v203 * 0.5
		v189.homeA = v212
		v189.homeB = v213
		local v214 = v188 + v203 * 0.2
		local v215 = v188 + v203 * 0.85
		v189.outA = v214
		v189.outB = v215
	end
	p187.T = v189
	local v216 = p187.snd
	local v217 = {
		["vol"] = 0.55
	} or {}
	v217.u = v189.opA + 0.01
	v217.name = "MagOut"
	table.insert(v216, v217)
	if p187.empty then
		local v218 = p187.events
		local v219 = {
			["u"] = v189.drop,
			["name"] = "MagDrop"
		}
		table.insert(v218, v219)
		local v220 = {
			["vol"] = 0.65
		} or {}
		v220.u = v189.drop
		v220.name = "MagOut"
		table.insert(v216, v220)
	else
		local v221 = {
			["vol"] = 0.65
		} or {}
		v221.u = v189.bxA + (v189.bxB - v189.bxA) * 0.3
		v221.name = "MagOut"
		table.insert(v216, v221)
	end
	local v222 = {
		["vol"] = 0.7
	} or {}
	v222.u = v189.nbB - 0.01
	v222.name = "MagIn"
	table.insert(v216, v222)
	local v223 = {
		["vol"] = 0.8
	} or {}
	v223.u = v189.clB - 0.01
	v223.name = "MagIn"
	table.insert(v216, v223)
	if p187.empty then
		local v224 = {
			["vol"] = 0.75
		} or {}
		v224.u = v189.pA
		v224.name = "ChargingHandle"
		table.insert(v216, v224)
		local v225 = {
			["vol"] = 0.8
		} or {}
		v225.u = v189.rel
		v225.name = "ChargingHandleForward"
		table.insert(v216, v225)
	end
	local v226 = p187.clk
	local v227 = {
		["u"] = nil,
		["name"] = "CoverOpen",
		["vol"] = 0.6,
		["fb"] = "MagOut",
		["u"] = v189.opA + (v189.opB - v189.opA) * 0.5
	}
	table.insert(v226, v227)
	if p187.empty then
		local v228 = {
			["u"] = nil,
			["name"] = "BoxOut",
			["vol"] = 0.65,
			["fb"] = "MagOut",
			["u"] = v189.drop
		}
		table.insert(v226, v228)
	else
		local v229 = {
			["u"] = nil,
			["name"] = "BoxOut",
			["vol"] = 0.65,
			["fb"] = "MagOut",
			["u"] = v189.bxA + (v189.bxB - v189.bxA) * 0.3
		}
		table.insert(v226, v229)
	end
	local v230 = {
		["u"] = nil,
		["name"] = "BoxIn",
		["vol"] = 0.7,
		["fb"] = "MagIn",
		["u"] = v189.nbB - 0.01
	}
	table.insert(v226, v230)
	local v231 = {
		["u"] = nil,
		["name"] = "BeltIn",
		["vol"] = 0.6,
		["fb"] = nil,
		["u"] = v189.biB - 0.01
	}
	table.insert(v226, v231)
	local v232 = {
		["u"] = nil,
		["name"] = "CoverClose",
		["vol"] = 0.85,
		["fb"] = "MagIn",
		["u"] = v189.clB - 0.01
	}
	table.insert(v226, v232)
	if p187.empty then
		local v233 = {
			["u"] = nil,
			["name"] = "ChargeBack",
			["vol"] = 0.75,
			["fb"] = "ChargingHandle",
			["u"] = v189.pA + (v189.pB - v189.pA) * 0.7
		}
		table.insert(v226, v233)
		local v234 = {
			["u"] = nil,
			["name"] = "ChargeForward",
			["vol"] = 0.8,
			["fb"] = "ChargingHandleForward",
			["u"] = v189.rel
		}
		table.insert(v226, v234)
	end
end
local function v_u_282(p236) -- name: topTimeline
	local v237 = p236.c
	local v238 = {
		["c"] = v237,
		["seat"] = v237
	}
	local v239 = v237 * 0.16
	v238.inA = 0
	v238.inB = v239
	local v240 = v237 * 0.03
	local v241 = v237 * 0.18
	v238.reachA = v240
	v238.reachB = v241
	local v242 = v237 * 0.2
	local v243 = v237 * 0.32
	v238.liftA = v242
	v238.liftB = v243
	v238.drop = v237 * 0.36
	local v244 = v237 * 0.32
	local v245 = v237 * 0.42
	v238.pullA = v244
	v238.pullB = v245
	local v246 = v237 * 0.42
	local v247 = v237 * 0.58
	v238.awayA = v246
	v238.awayB = v247
	local v248 = v237 * 0.58
	local v249 = v237 * 0.8
	v238.backA = v248
	v238.backB = v249
	v238.frontB = v237 * 0.9
	local v250 = 1 - v237
	if p236.empty then
		local v251 = v237 + v250 * 0.05
		local v252 = v237 + v250 * 0.26
		v238.chA = v251
		v238.chB = v252
		local v253 = v237 + v250 * 0.26
		local v254 = v237 + v250 * 0.42
		v238.pA = v253
		v238.pB = v254
		v238.rel = v237 + v250 * 0.47
		local v255 = v237 + v250 * 0.52
		local v256 = v237 + v250 * 0.8
		v238.homeA = v255
		v238.homeB = v256
		local v257 = v237 + v250 * 0.47
		local v258 = v237 + v250 * 0.92
		v238.outA = v257
		v238.outB = v258
	else
		local v259 = v237 + v250 * 0.08
		local v260 = v237 + v250 * 0.48
		v238.homeA = v259
		v238.homeB = v260
		local v261 = v237 + v250 * 0.22
		local v262 = v237 + v250 * 0.86
		v238.outA = v261
		v238.outB = v262
	end
	p236.T = v238
	if p236.empty then
		local v263 = p236.events
		local v264 = {
			["u"] = v238.drop,
			["name"] = "MagDrop"
		}
		table.insert(v263, v264)
		local v265 = p236.snd
		local v266 = {
			["vol"] = 0.7
		} or {}
		v266.u = v238.drop - 0.04
		v266.name = "MagOut"
		table.insert(v265, v266)
	else
		local v267 = p236.snd
		local v268 = {
			["vol"] = 0.7
		} or {}
		v268.u = v238.liftA + 0.03
		v268.name = "MagOut"
		table.insert(v267, v268)
	end
	local v269 = p236.snd
	local v270 = {
		["vol"] = 0.75
	} or {}
	v270.u = v238.seat - 0.015
	v270.name = "MagIn"
	table.insert(v269, v270)
	if p236.empty then
		local v271 = p236.snd
		local v272 = {
			["vol"] = 0.65
		} or {}
		v272.u = v238.pA
		v272.name = "ChargingHandle"
		table.insert(v271, v272)
		local v273 = p236.snd
		local v274 = {
			["vol"] = 0.75
		} or {}
		v274.u = v238.rel
		v274.name = "ChargingHandleForward"
		table.insert(v273, v274)
	end
	local v275 = p236.clk
	local v276 = {
		["u"] = nil,
		["name"] = "MagRelease",
		["vol"] = 0.55,
		["fb"] = nil,
		["u"] = v238.liftA + 0.01
	}
	table.insert(v275, v276)
	if p236.empty then
		local v277 = {
			["u"] = nil,
			["name"] = "MagOut",
			["vol"] = 0.7,
			["fb"] = "MagOut",
			["u"] = v238.drop - 0.04
		}
		table.insert(v275, v277)
	else
		local v278 = {
			["u"] = nil,
			["name"] = "MagOut",
			["vol"] = 0.7,
			["fb"] = "MagOut",
			["u"] = v238.pullA + (v238.pullB - v238.pullA) * 0.4
		}
		table.insert(v275, v278)
	end
	local v279 = {
		["u"] = nil,
		["name"] = "MagIn",
		["vol"] = 0.8,
		["fb"] = "MagIn",
		["u"] = v238.seat - 0.015
	}
	table.insert(v275, v279)
	if p236.empty then
		local v280 = {
			["u"] = nil,
			["name"] = "ChargeBack",
			["vol"] = 0.65,
			["fb"] = "ChargingHandle",
			["u"] = v238.pA + (v238.pB - v238.pA) * 0.7
		}
		table.insert(v275, v280)
		local v281 = {
			["u"] = nil,
			["name"] = "ChargeForward",
			["vol"] = 0.75,
			["fb"] = "ChargingHandleForward",
			["u"] = v238.rel
		}
		table.insert(v275, v281)
	end
end
local function v_u_318(p283) -- name: clipTimeline
	local v284 = p283.c
	local v285 = {
		["c"] = v284,
		["seat"] = v284,
		["inA"] = 0,
		["inB"] = 0.1,
		["rA"] = 0.02,
		["rB"] = 0.1,
		["liftA"] = 0.1,
		["liftB"] = 0.16,
		["backA"] = 0.16,
		["backB"] = 0.24,
		["ej"] = 0.22,
		["awayA"] = 0.25,
		["awayB"] = 0.36
	}
	local v286 = v284 * 0.77
	v285.cA = 0.36
	v285.cB = v286
	local v287 = v284 * 0.77
	local v288 = v284 * 0.84
	v285.inGA = v287
	v285.inGB = v288
	v285.pushA = v284 * 0.84
	v285.pushB = v284
	v285.flick = v284 + 0.06
	local v289 = v284 + 0.08
	local v290 = v284 + 0.13
	v285.kA = v289
	v285.kB = v290
	local v291 = v284 + 0.13
	local v292 = v284 + 0.2
	v285.fwdA = v291
	v285.fwdB = v292
	local v293 = v284 + 0.2
	local v294 = v284 + 0.24
	v285.dnA = v293
	v285.dnB = v294
	local v295 = v284 + 0.25
	local v296 = v284 + 0.34
	local v297 = math.min(v296, 0.97)
	v285.homeA = v295
	v285.homeB = v297
	v285.outA = v284 + 0.24
	v285.outB = 0.97
	p283.T = v285
	local v298 = p283.snd
	local v299 = {
		["vol"] = 0.7
	} or {}
	v299.u = v285.liftA
	v299.name = "Bolt"
	table.insert(v298, v299)
	if p283.ammo <= 0 then
		local v300 = p283.events
		local v301 = v285.ej
		local v302 = {
			["kind"] = p283.shell
		} or {}
		v302.u = v301
		v302.name = "Eject"
		table.insert(v300, v302)
	end
	local v303 = p283.snd
	local v304 = {
		["vol"] = 0.55
	} or {}
	v304.u = v285.inGB - 0.01
	v304.name = "MagIn"
	table.insert(v303, v304)
	local v305 = p283.snd
	local v306 = {
		["vol"] = 0.75
	} or {}
	v306.u = v285.pushB - 0.04
	v306.name = "ShellInsert"
	table.insert(v305, v306)
	local v307 = p283.events
	local v308 = {
		["u"] = v285.flick,
		["name"] = "ClipFlick"
	}
	table.insert(v307, v308)
	local v309 = p283.snd
	local v310 = {
		["vol"] = 0.7
	} or {}
	v310.u = v285.fwdA
	v310.name = "ChargingHandleForward"
	table.insert(v309, v310)
	local v311 = p283.clk
	local v312 = {
		["u"] = nil,
		["name"] = "BoltUp",
		["vol"] = 0.7,
		["fb"] = "Bolt",
		["u"] = v285.liftB
	}
	table.insert(v311, v312)
	local v313 = {
		["u"] = nil,
		["name"] = "BoltBack",
		["vol"] = 0.7,
		["fb"] = nil,
		["u"] = v285.backB - 0.005
	}
	table.insert(v311, v313)
	local v314 = {
		["u"] = nil,
		["name"] = "ClipIn",
		["vol"] = 0.6,
		["fb"] = "MagIn",
		["u"] = v285.inGB - 0.01
	}
	table.insert(v311, v314)
	local v315 = {
		["u"] = nil,
		["name"] = "ClipStrip",
		["vol"] = 0.75,
		["fb"] = "ShellInsert",
		["u"] = v285.pushB - 0.04
	}
	table.insert(v311, v315)
	local v316 = {
		["u"] = nil,
		["name"] = "BoltForward",
		["vol"] = 0.7,
		["fb"] = "ChargingHandleForward",
		["u"] = v285.fwdB
	}
	table.insert(v311, v316)
	local v317 = {
		["u"] = nil,
		["name"] = "BoltDown",
		["vol"] = 0.65,
		["fb"] = nil,
		["u"] = v285.dnB
	}
	table.insert(v311, v317)
end
local function v_u_344(p319) -- name: breakTimeline
	local v320 = p319.c
	local v321 = {
		["c"] = v320,
		["seat"] = v320,
		["inA"] = 0,
		["inB"] = 0.12,
		["opA"] = 0.08,
		["opB"] = 0.18,
		["ej"] = 0.19,
		["awayA"] = 0.2,
		["awayB"] = 0.42
	}
	local v322 = v320 - 0.12
	v321.backA = 0.42
	v321.backB = v322
	local v323 = v320 - 0.12
	local v324 = v320 - 0.03
	v321.insA = v323
	v321.insB = v324
	local v325 = v320 - 0.02
	local v326 = v320 + 0.05
	v321.clA = v325
	v321.clB = v326
	local v327 = v320 + 0.05
	local v328 = v320 + 0.14
	v321.homeA = v327
	v321.homeB = v328
	v321.outA = v320 + 0.06
	v321.outB = 0.97
	p319.T = v321
	local v329 = (p319.magSize or 2) - (p319.ammo or 0)
	p319.spent = math.max(1, v329)
	local v330 = p319.snd
	local v331 = {
		["vol"] = 0.6
	} or {}
	v331.u = v321.opA
	v331.name = "ChargingHandle"
	table.insert(v330, v331)
	local v332 = p319.events
	local v333 = v321.ej
	local v334 = {
		["n"] = p319.spent,
		["kind"] = p319.shell
	} or {}
	v334.u = v333
	v334.name = "EjectN"
	table.insert(v332, v334)
	local v335 = p319.snd
	local v336 = {
		["vol"] = 0.7
	} or {}
	v336.u = v321.insB - 0.02
	v336.name = "ShellInsert"
	table.insert(v335, v336)
	local v337 = p319.snd
	local v338 = {
		["vol"] = 0.8
	} or {}
	v338.u = v321.clB - 0.02
	v338.name = "MagIn"
	table.insert(v337, v338)
	local v339 = p319.clk
	local v340 = {
		["u"] = nil,
		["name"] = "BreakOpen",
		["vol"] = 0.65,
		["fb"] = "ChargingHandle",
		["u"] = v321.opA + (v321.opB - v321.opA) * 0.6
	}
	table.insert(v339, v340)
	local v341 = {
		["u"] = nil,
		["name"] = "BreakEject",
		["vol"] = 0.6,
		["fb"] = nil,
		["u"] = v321.ej
	}
	table.insert(v339, v341)
	local v342 = {
		["u"] = nil,
		["name"] = "ShellIn",
		["vol"] = 0.7,
		["fb"] = "ShellInsert",
		["u"] = v321.insB - 0.02
	}
	table.insert(v339, v342)
	local v343 = {
		["u"] = nil,
		["name"] = "BreakClose",
		["vol"] = 0.85,
		["fb"] = "MagIn",
		["u"] = v321.clB - 0.02
	}
	table.insert(v339, v343)
end
local function v_u_361(p345) -- name: stringTimeline
	local v346 = p345.c
	local v347 = {
		["c"] = v346,
		["seat"] = v346,
		["inA"] = 0,
		["inB"] = 0.12,
		["hA"] = 0.06,
		["hB"] = 0.18,
		["pullA"] = 0.18,
		["pullB"] = 0.46,
		["latch"] = 0.46,
		["rHomeA"] = 0.48,
		["rHomeB"] = 0.58,
		["awayA"] = 0.48,
		["awayB"] = 0.58
	}
	local v348 = v346 - 0.1
	v347.backA = 0.58
	v347.backB = v348
	v347.layA = v346 - 0.1
	v347.layB = v346
	local v349 = v346 + 0.02
	local v350 = v346 + 0.12
	v347.homeA = v349
	v347.homeB = v350
	v347.outA = v346 + 0.04
	v347.outB = 0.96
	p345.T = v347
	local v351 = p345.snd
	local v352 = {
		["vol"] = 0.55
	} or {}
	v352.u = v347.pullA + 0.02
	v352.name = "ChargingHandle"
	table.insert(v351, v352)
	local v353 = p345.snd
	local v354 = {
		["vol"] = 0.75
	} or {}
	v354.u = v347.latch - 0.01
	v354.name = "ChargingHandleForward"
	table.insert(v353, v354)
	local v355 = p345.snd
	local v356 = {
		["vol"] = 0.55
	} or {}
	v356.u = v347.layB - 0.03
	v356.name = "MagIn"
	table.insert(v355, v356)
	local v357 = p345.clk
	local v358 = {
		["u"] = nil,
		["name"] = "StringPull",
		["vol"] = 0.6,
		["fb"] = "ChargingHandle",
		["u"] = v347.pullA + 0.02
	}
	table.insert(v357, v358)
	local v359 = {
		["u"] = nil,
		["name"] = "StringLatch",
		["vol"] = 0.8,
		["fb"] = "ChargingHandleForward",
		["u"] = v347.latch - 0.01
	}
	table.insert(v357, v359)
	local v360 = {
		["u"] = nil,
		["name"] = "BoltLoad",
		["vol"] = 0.6,
		["fb"] = "MagIn",
		["u"] = v347.layB - 0.03
	}
	table.insert(v357, v360)
end
function v_u_4.plan(p362, p363, p364, p365, p366) -- name: plan
	-- upvalues: (copy) v_u_4, (copy) v_u_53, (copy) v_u_2, (copy) v_u_186, (copy) v_u_235, (copy) v_u_282, (copy) v_u_318, (copy) v_u_344, (copy) v_u_361
	local v367
	if p364 then
		v367 = p364.id
	else
		v367 = p364
	end
	local v368 = v_u_4.profile(v367, p364)
	local v369 = {
		["kind"] = p362,
		["dur"] = math.max(p363 or 2, 0.3),
		["empty"] = p365 == true,
		["prof"] = v368,
		["id"] = v367,
		["ammo"] = p366 or 0,
		["magSize"] = p364 and (p364.magSize or 30) or 30,
		["shell"] = v_u_53[p364 and (p364.ammo or "") or ""] or "556"
	}
	local v370
	if p364 == nil then
		v370 = false
	else
		v370 = p364.boltAction == true
	end
	v369.boltAction = v370
	v369.events = {}
	v369.snd = {}
	v369.clk = {}
	if v369.empty then
		v369.ammo = 0
	end
	local v371 = v368.ins
	if p362 == "Shell" then
		v369.type = "Shell"
		local v372 = p364 and (p364.reload and p364.reload.Shell) or {}
		v369.sh = {
			["Start"] = v372.Start or 0,
			["First"] = v372.First or 0.6,
			["Each"] = v372.Each or 0.6,
			["End"] = v372.End or 0
		}
		local v373 = v369.dur - v369.sh.Start - v369.sh.First - v369.sh.End
		local v374 = v369.sh.Each
		local v375 = v373 / math.max(v374, 0.05) + 0.5
		local v376 = math.floor(v375) + 1
		v369.n = math.max(1, v376)
		v369.c = 1
		local v377 = v369.sh
		if v371 == "Cylinder" then
			local v378 = v369.magSize - v369.ammo
			local v379 = math.max(0, v378)
			local v380 = v369.n
			for v381 = 0, math.min(v379, v380) - 1 do
				local v382 = v381 == 0 and v377.Start or v377.Start + v377.First + v377.Each * (v381 - 1)
				local v383 = v369.events
				local v384 = (v382 + 0.12) / v369.dur
				local v385 = {
					["kind"] = nil,
					["gate"] = true,
					["kind"] = v369.shell
				} or {}
				v385.u = v384
				v385.name = "Eject"
				table.insert(v383, v385)
			end
		elseif v371 == "Clip" and v369.ammo <= 0 then
			local v386 = v369.events
			local v387 = v377.Start * 0.7 / v369.dur
			local v388 = {
				["kind"] = v369.shell
			} or {}
			v388.u = v387
			v388.name = "Eject"
			table.insert(v386, v388)
		elseif v371 == "Tube" and v369.ammo <= 0 then
			local v389 = v369.events
			local v390 = v377.Start * 0.55
			local v391 = math.min(v390, 0.2) / v369.dur
			local v392 = {
				["kind"] = v369.shell
			} or {}
			v392.u = v391
			v392.name = "Eject"
			table.insert(v389, v392)
		end
		local v393 = v369.dur - v377.End
		if v369.ammo <= 0 and v371 == "Gate" then
			local v394 = v369.events
			local v395 = (v393 + v377.End * 0.3) / v369.dur
			local v396 = {
				["kind"] = nil,
				["up"] = true,
				["kind"] = v369.shell
			} or {}
			v396.u = v395
			v396.name = "Eject"
			table.insert(v394, v396)
		end
		if v371 == "Clip" then
			local v397 = v369.snd
			local v398 = {
				["vol"] = 0.65
			} or {}
			v398.u = v377.Start * 0.3 / v369.dur
			v398.name = "ChargingHandle"
			table.insert(v397, v398)
			local v399 = v369.snd
			local v400 = {
				["vol"] = 0.7
			} or {}
			v400.u = (v393 + v377.End * 0.3) / v369.dur
			v400.name = "ChargingHandleForward"
			table.insert(v399, v400)
		elseif v371 == "Tube" and v369.ammo <= 0 then
			local v401 = v369.snd
			local v402 = {
				["vol"] = 0.7
			} or {}
			v402.u = 0.02 / v369.dur
			v402.name = "Pump"
			table.insert(v401, v402)
			local v403 = v369.snd
			local v404 = {
				["vol"] = 0.75
			} or {}
			v404.u = (v393 + v377.End * 0.05) / v369.dur
			v404.name = "Pump"
			table.insert(v403, v404)
		elseif v371 == "Gate" and v369.ammo <= 0 then
			local v405 = v369.snd
			local v406 = {
				["vol"] = 0.75
			} or {}
			v406.u = (v393 + v377.End * 0.05) / v369.dur
			v406.name = "Lever"
			table.insert(v405, v406)
		elseif v371 == "Cylinder" then
			local v407 = v369.snd
			local v408 = {
				["vol"] = 0.5
			} or {}
			v408.u = v377.Start * 0.4 / v369.dur
			v408.name = "FireMode"
			table.insert(v407, v408)
			local v409 = v369.snd
			local v410 = {
				["vol"] = 0.5
			} or {}
			v410.u = (v393 + v377.End * 0.3) / v369.dur
			v410.name = "FireMode"
			table.insert(v409, v410)
		end
		local v411 = v369.clk
		local v412 = v369.dur
		if v371 == "Clip" then
			local v413 = {
				["u"] = nil,
				["name"] = "BoltUp",
				["vol"] = 0.65,
				["fb"] = "ChargingHandle",
				["u"] = v377.Start * 0.3 / v412
			}
			table.insert(v411, v413)
			local v414 = {
				["u"] = nil,
				["name"] = "BoltBack",
				["vol"] = 0.65,
				["fb"] = nil,
				["u"] = v377.Start * 0.65 / v412
			}
			table.insert(v411, v414)
			local v415 = {
				["u"] = nil,
				["name"] = "BoltForward",
				["vol"] = 0.7,
				["fb"] = "ChargingHandleForward",
				["u"] = (v393 + v377.End * 0.3) / v412
			}
			table.insert(v411, v415)
			local v416 = {
				["u"] = nil,
				["name"] = "BoltDown",
				["vol"] = 0.65,
				["fb"] = nil,
				["u"] = (v393 + v377.End * 0.6) / v412
			}
			table.insert(v411, v416)
		elseif v371 == "Tube" and v369.ammo <= 0 then
			local v417 = {
				["u"] = nil,
				["name"] = "PumpBack",
				["vol"] = 0.7,
				["fb"] = "Pump",
				["u"] = 0.02 / v412
			}
			table.insert(v411, v417)
			local v418 = {
				["u"] = nil,
				["name"] = "PumpForward",
				["vol"] = 0.75,
				["fb"] = "Pump",
				["u"] = (v393 + v377.End * 0.05) / v412
			}
			table.insert(v411, v418)
		elseif v371 == "Gate" and v369.ammo <= 0 then
			local v419 = {
				["u"] = nil,
				["name"] = "LeverOpen",
				["vol"] = 0.75,
				["fb"] = "Lever",
				["u"] = (v393 + v377.End * 0.05) / v412
			}
			table.insert(v411, v419)
			local v420 = {
				["u"] = nil,
				["name"] = "LeverClose",
				["vol"] = 0.75,
				["fb"] = nil,
				["u"] = (v393 + v377.End * 0.5) / v412
			}
			table.insert(v411, v420)
		elseif v371 == "Cylinder" then
			local v421 = {
				["u"] = nil,
				["name"] = "GateOpen",
				["vol"] = 0.55,
				["fb"] = "FireMode",
				["u"] = v377.Start * 0.4 / v412
			}
			table.insert(v411, v421)
			for _, v422 in v369.events do
				if v422.name ~= "Eject" or not v422.gate then
					continue
				end
				local v423 = {
					["u"] = nil,
					["name"] = "EjectRod",
					["vol"] = 0.55,
					["fb"] = nil,
					["u"] = v422.u
				}
				table.insert(v411, v423)
			end
			local v424 = {
				["u"] = nil,
				["name"] = "GateClose",
				["vol"] = 0.55,
				["fb"] = "FireMode",
				["u"] = (v393 + v377.End * 0.3) / v412
			}
			table.insert(v411, v424)
		end
		local v425 = v371 == "Tube" and "ShellIn" or "RoundIn"
		for v426 = 1, v369.n do
			local v427 = v377.Start + v377.First + v377.Each * (v426 - 1) - 0.06
			if v427 >= v412 then
				continue
			end
			local v428 = {
				["u"] = nil,
				["name"] = nil,
				["vol"] = 0.7,
				["fb"] = "ShellInsert",
				["u"] = math.max(v427, 0) / v412,
				["name"] = v425
			}
			table.insert(v411, v428)
		end
	elseif v371 == "Clip" then
		v369.type = "Clip"
	elseif v371 == "Break" then
		v369.type = "Break"
	elseif v371 == "Belt" then
		v369.type = "Belt"
	elseif v371 == "Top" then
		v369.type = "Top"
	elseif v371 == "String" then
		v369.type = "String"
	else
		v369.type = "Mag"
	end
	if v369.type ~= "Shell" then
		v369.c = v_u_2.reloadCommit(v367, v369.empty)
		if v369.type == "Mag" then
			v_u_186(v369)
		elseif v369.type == "Belt" then
			v_u_235(v369)
		elseif v369.type == "Top" then
			v_u_282(v369)
		elseif v369.type == "Clip" then
			v_u_318(v369)
		elseif v369.type == "Break" then
			v_u_344(v369)
		elseif v369.type == "String" then
			v_u_361(v369)
		end
	end
	for _, v429 in { v369.events, v369.snd, v369.clk } do
		for _, v430 in v429 do
			v430.t = v430.u * v369.dur
		end
		table.sort(v429, function(p431, p432)
			return p431.t < p432.t
		end)
	end
	return v369
end
function v_u_4.sounds(p433) -- name: sounds
	-- upvalues: (copy) v_u_3
	local v434 = {}
	local v435
	if p433.clk then
		local v436 = v_u_3.reloadKit
		if type(v436) == "function" then
			v435 = v_u_3.reloadKit(p433.id) or nil
		else
			v435 = nil
		end
	else
		v435 = nil
	end
	if v435 then
		for _, v437 in p433.clk do
			local v438 = v435[v437.name]
			if v438 then
				local v439 = {
					["t"] = v437.t,
					["key"] = "RC:" .. v438,
					["vol"] = v437.vol or 0.75
				}
				table.insert(v434, v439)
			else
				if not v437.fb then
					continue
				end
				local v440 = {
					["t"] = v437.t,
					["key"] = "RC>" .. v437.fb,
					["vol"] = v437.vol or 0.7
				}
				table.insert(v434, v440)
			end
		end
		return v434
	else
		for _, v441 in p433.snd do
			local v442 = {
				["t"] = v441.t,
				["key"] = v441.name,
				["vol"] = v441.vol or 0.7
			}
			table.insert(v434, v442)
		end
		return v434
	end
end
local function v_u_457(p443, p444) -- name: alive
	-- upvalues: (copy) v_u_9, (copy) v_u_7, (copy) v_u_8
	if p444 <= 0.001 then
		return v_u_9
	end
	local v445 = p443 * 2.3
	local v446 = math.sin(v445)
	local v447 = p443 * 3.7 + 1.3
	local v448 = v446 + math.sin(v447) * 0.6
	local v449 = p443 * 1.9 + 0.7
	local v450 = math.sin(v449)
	local v451 = p443 * 4.3 + 2.1
	local v452 = v450 + math.sin(v451) * 0.5
	local v453 = p443 * 2.7 + 2.4
	local v454 = math.sin(v453)
	local v455 = p443 * 5.3 + 0.4
	local v456 = v454 + math.sin(v455) * 0.4
	return v_u_7(v452 * 0.0035 * p444, v448 * 0.0045 * p444, v456 * 0.002 * p444) * v_u_8(v448 * 0.009599310885968814 * p444, v452 * 0.007853981633974483 * p444, v456 * 0.013962634015954637 * p444)
end
v_u_4.alive = v_u_457
local function v_u_470(p458, p459, p460, p461) -- name: shove
	-- upvalues: (copy) v_u_11
	if not (p459 and p460) then
		return 0
	end
	local v462 = p461 or 0.04
	if p458 < p459 or p460 + v462 < p458 then
		return 0
	end
	if p458 <= p460 then
		local v463 = p458 - p459
		local v464 = p460 - p459
		local v465 = v_u_11(v_u_11(v463 / math.max(v464, 0.0001), 0, 1), 0, 1)
		return v465 * v465 * v465
	end
	local v466 = p460 + v462
	local v467 = p458 - p460
	local v468 = v466 - p460
	local v469 = 1 - v_u_11(v_u_11(v467 / math.max(v468, 0.0001), 0, 1), 0, 1)
	return 1 - (1 - v469 * v469 * v469)
end
v_u_4.shove = v_u_470
local function v_u_544(p471, p472) -- name: reactions
	-- upvalues: (copy) v_u_9, (copy) v_u_470, (copy) v_u_7, (copy) v_u_8, (copy) v_u_11, (copy) v_u_35, (copy) v_u_457
	local v473 = p471.T
	local v474 = p471.dur
	local v475 = p471.type
	local v476 = v_u_9
	local v477 = nil
	local v478 = nil
	if v475 == "Mag" or v475 == "Top" then
		v477 = v473.pullA
		v478 = v473.pullB
	elseif v475 == "Belt" then
		v477 = v473.bxA
		v478 = v473.bxB
	end
	if v477 and (v478 and not p471.empty) then
		local v479 = v477 + (v478 - v477) * 0.3
		local v480 = v_u_470(p472, v477, v479, 0.025)
		local v481 = (p472 - v479) * v474
		local v482
		if v481 <= 0 then
			v482 = 0
		else
			local v483 = -9 * v481
			local v484 = math.exp(v483) * 1
			local v485 = 19 * v481
			v482 = v484 * math.sin(v485)
		end
		v476 = v476 * (v_u_7(0, v480 * -0.028 + v482 * 0.01, v480 * 0.006) * v_u_8(v480 * -0.05585053606381855 + v482 * 0.031415926535897934, v480 * 0.013962634015954637, v480 * 0.041887902047863905 - v482 * 0.017453292519943295))
	end
	if p471.empty and v473.drop then
		local v486 = v473.drop - 0.025
		local v487 = v473.drop + 0.07
		local v488 = p472 - v486
		local v489 = v487 - v486
		local v490 = v_u_11(v_u_11(v488 / math.max(v489, 0.0001), 0, 1), 0, 1) * 3.141592653589793
		local v491 = math.sin(v490)
		local v492 = v491 * v491
		local v493 = (p472 - v473.drop) * v474
		local v494
		if v493 <= 0 then
			v494 = 0
		else
			local v495 = -11 * v493
			local v496 = math.exp(v495) * 1
			local v497 = 22 * v493
			v494 = v496 * math.sin(v497)
		end
		v476 = v476 * (v_u_7(v492 * 0.006, v492 * 0.01, 0) * v_u_8(v492 * 0.027925268031909273 + v494 * 0.013962634015954637, 0, v492 * -0.07853981633974483))
	end
	local v498 = 0
	if v473.awayA and v473.backB then
		local v499 = v473.alignB or (v473.frontB or v473.insA or (v473.layA or v473.seat))
		if v499 and v473.awayA + 0.08 < v499 then
			local v500 = v_u_35
			local v501 = {}
			local v502 = { v473.awayA, 0 }
			local v503 = { v473.awayA + 0.08, 1 }
			local v504 = {}
			local v505 = v499 + 0.06
			__set_list(v504, 1, {math.min(v505, 1), 0})
			__set_list(v501, 1, {v502, v503, { v499, 1 }, v504})
			v498 = v500(v501, p472)
			v476 = v476 * (v_u_7(0, v498 * -0.014, v498 * 0.004) * v_u_8(v498 * -0.031415926535897934, v498 * -0.010471975511965976, v498 * 0.024434609527920613))
		end
	end
	local v506 = v473.alignB or (v473.frontB or v473.nbA and v473.nbA + (v473.nbB - v473.nbA) * 0.7 or (v473.insA or v473.layA))
	if v506 and (v473.seat and (v475 ~= "Clip" and v506 < v473.seat)) then
		local v507 = v_u_470(p472, v506, v473.seat, 0.035)
		v476 = v476 * (v_u_7(0, v507 * 0.022, v507 * 0.007) * v_u_8(v507 * 0.048869219055841226, 0, v507 * -0.024434609527920613))
	end
	if v475 == "Clip" and v473.pushA then
		local v508 = (v473.pushA + v473.pushB) / 2
		local v509 = v_u_470(p472, v473.pushA, v508 - 0.01, 0.02) + v_u_470(p472, v508 + 0.005, v473.pushB, 0.025)
		v476 = v476 * (v_u_7(0, v509 * -0.014, 0) * v_u_8(v509 * -0.031415926535897934, 0, v509 * 0.013962634015954637))
	end
	if v473.pA and (v473.pB and (p471.prof and p471.prof.charge ~= "Release")) then
		local v510 = p471.prof.side or 1
		local v511 = v473.rel or v473.pB
		local v512 = v473.pB + 0.001
		local v513 = math.max(v511, v512)
		local v514 = v_u_35({
			{ v473.pA, 0 },
			{ v473.pB, 1, "i" },
			{ v513, 1 },
			{ v513 + 0.02, 0, "o" }
		}, p472)
		v476 = v476 * (v_u_7(-0.006 * v514 * v510, 0.004 * v514, 0.018 * v514) * v_u_8(-0.020943951023931952 * v514, -0.026179938779914945 * v514 * v510, 0.038397243543875255 * v514 * v510))
	end
	if v475 == "Break" and v473.opA then
		local v515 = v_u_470(p472, v473.opA, v473.opB, 0.05)
		local v516 = (p472 - v473.opB) * v474
		local v517
		if v516 <= 0 then
			v517 = 0
		else
			local v518 = -10 * v516
			local v519 = math.exp(v518) * 1
			local v520 = 20 * v516
			v517 = v519 * math.sin(v520)
		end
		local v521 = (p472 - v473.clB) * v474
		local v522
		if v521 <= 0 then
			v522 = 0
		else
			local v523 = -12 * v521
			local v524 = math.exp(v523) * 1
			local v525 = 24 * v521
			v522 = v524 * math.sin(v525)
		end
		v476 = v476 * (v_u_7(0, v515 * -0.012, 0) * v_u_8(v515 * -0.04363323129985824 - v517 * 0.020943951023931952 + v522 * 0.03490658503988659, 0, v522 * 0.020943951023931952))
	end
	if v475 == "String" and (v473.pullA and v473.latch) then
		local v526 = v_u_470(p472, v473.pullA, v473.latch, 0.04)
		local v527 = (p472 - v473.latch) * v474
		local v528
		if v527 <= 0 then
			v528 = 0
		else
			local v529 = -11 * v527
			local v530 = math.exp(v529) * 1
			local v531 = 22 * v527
			v528 = v530 * math.sin(v531)
		end
		v476 = v476 * (v_u_7(0, v526 * -0.01, v526 * 0.02) * v_u_8(v526 * -0.03490658503988659 + v528 * 0.026179938779914945, 0, 0))
	end
	local v532 = v473.inA or 0
	local v533 = (v473.inB or 0.1) + 0.05
	local v534 = p472 - v532
	local v535 = v533 - v532
	local v536 = v_u_11(v_u_11(v534 / math.max(v535, 0.0001), 0, 1), 0, 1)
	local v537 = v536 * v536 * v536 * (v536 * (v536 * 6 - 15) + 10)
	local v538 = v473.outA or 0.9
	local v539 = v473.outB or 1
	local v540 = p472 - v538
	local v541 = v539 - v538
	local v542 = v_u_11(v_u_11(v540 / math.max(v541, 0.0001), 0, 1), 0, 1)
	local v543 = v537 * (1 - v542 * v542 * v542 * (v542 * (v542 * 6 - 15) + 10))
	return v476 * v_u_457(p472 * v474, v543 * (v498 * 0.8 + 0.7))
end
local function v_u_589(p545, p546, p547, p548) -- name: gunCurve
	-- upvalues: (copy) v_u_9, (copy) v_u_11, (copy) v_u_544, (copy) v_u_7, (copy) v_u_8
	local v549 = p545.T
	local v550 = p545.dur
	local v551 = v_u_9
	local v552 = v549.inA
	local v553 = v549.inB
	local v554 = p546 - v552
	local v555 = v553 - v552
	local v556 = v_u_11(v_u_11(v554 / math.max(v555, 0.0001), 0, 1), 0, 1)
	local v557 = v551:Lerp(p547, v556 * v556 * v556 * (v556 * (v556 * 6 - 15) + 10))
	if p548 and v549.chB then
		local v558 = v549.seat
		local v559 = v549.chB
		local v560 = p546 - v558
		local v561 = v559 - v558
		local v562 = v_u_11(v_u_11(v560 / math.max(v561, 0.0001), 0, 1), 0, 1)
		v557 = v557:Lerp(p548, v562 * v562 * v562 * (v562 * (v562 * 6 - 15) + 10))
	end
	local v563 = v_u_9
	local v564 = v549.outA
	local v565 = v549.outB
	local v566 = p546 - v564
	local v567 = v565 - v564
	local v568 = v_u_11(v_u_11(v566 / math.max(v567, 0.0001), 0, 1), 0, 1)
	local v569 = v557:Lerp(v563, v568 * v568 * v568 * (v568 * (v568 * 6 - 15) + 10))
	local v570 = (p546 - v549.seat) * v550
	local v571
	if v570 <= 0 then
		v571 = 0
	else
		local v572 = -11 * v570
		local v573 = math.exp(v572) * 1
		local v574 = 24 * v570
		v571 = v573 * math.sin(v574)
	end
	local v575
	if v549.rel then
		local v576 = (p546 - v549.rel) * v550
		local v577
		if v576 <= 0 then
			v577 = 0
		else
			local v578 = -12 * v576
			local v579 = math.exp(v578) * 1
			local v580 = 28 * v576
			v577 = v579 * math.sin(v580)
		end
		v575 = v577 or 0
	else
		v575 = 0
	end
	local v581 = v549.outA + (v549.outB - v549.outA) * 0.55
	local v582 = v549.outB + (v549.outB - v549.outA) * 0.25
	local v583 = math.min(v582, 1)
	local v584 = p546 - v581
	local v585 = v583 - v581
	local v586 = v_u_11(v_u_11(v584 / math.max(v585, 0.0001), 0, 1), 0, 1) * 3.141592653589793
	local v587 = math.sin(v586)
	local v588 = v587 * v587
	return v569 * v_u_544(p545, p546) * v_u_7(0, v571 * 0.014, 0.016 * v575) * v_u_8(v571 * 0.05585053606381855 - 0.031415926535897934 * v575 - v588 * 0.03490658503988659, -0.010471975511965976 * v575, v571 * 0.020943951023931952 + v588 * 0.019198621771937627)
end
local function v_u_638(p590, p591, p592, p593) -- name: chargeStep
	-- upvalues: (copy) v_u_5, (copy) v_u_11, (copy) v_u_7, (copy) v_u_35, (copy) v_u_6, (copy) v_u_100
	local v594 = p590.T
	local v595 = p590.prof
	local v596 = v595.charge
	local v597 = p591.info
	if v596 ~= "Release" then
		local v598 = v_u_100(p591, v595)
		local v599, v600
		if v596 == "Slap" then
			local v601 = v598.tr
			local v602 = v594.rel
			local v603 = v594.rel + 0.03
			local v604 = p592 - v602
			local v605 = v603 - v602
			local v606 = v_u_11(v_u_11(v604 / math.max(v605, 0.0001), 0, 1), 0, 1)
			v599 = v601 * (1 - v606 * v606 * v606)
			local v607 = v_u_35({
				{ v594.chB, 0 },
				{ v594.pB, 1 },
				{ v594.rel, 0, "i" }
			}, p592)
			v600 = v598.grab + v_u_6(0, 0, v598.tr) + v_u_6(0, 0.06 * v607, 0.02 * v607)
		elseif v596 == "Slide" then
			local v608 = v598.tr
			local v609 = v594.pA
			local v610 = v594.pB
			local v611 = p592 - v609
			local v612 = v610 - v609
			local v613 = v_u_11(v_u_11(v611 / math.max(v612, 0.0001), 0, 1), 0, 1)
			v599 = v608 + v613 * v613 * v613 * (v613 * (v613 * 6 - 15) + 10) * 0.025
			if v594.rel <= p592 then
				local v614 = v598.tr + 0.025
				local v615 = v594.rel
				local v616 = v594.rel + 0.03
				local v617 = p592 - v615
				local v618 = v616 - v615
				local v619 = v_u_11(v_u_11(v617 / math.max(v618, 0.0001), 0, 1), 0, 1)
				v599 = v614 * (1 - v619 * v619 * v619)
			end
			local v620 = v598.grab
			local v621 = v594.rel <= p592 and (v598.tr + 0.025 or 0) or 0
			v600 = v620 + v_u_6(0, 0, (math.max(v599, v621)))
		else
			local v622 = v_u_35({
				{ v594.pA, 0 },
				{ v594.pB, 1 }
			}, p592)
			if v594.rel <= p592 then
				local v623 = v594.rel
				local v624 = v594.rel + 0.035
				local v625 = p592 - v623
				local v626 = v624 - v623
				local v627 = v_u_11(v_u_11(v625 / math.max(v626, 0.0001), 0, 1), 0, 1)
				v622 = 1 - v627 * v627 * v627
			end
			v599 = v598.tr * v622
			v600 = v598.grab + v_u_6(0, 0, v598.tr * (v594.rel <= p592 and 1 or v622))
		end
		if v598.m then
			p593.motors[v598.m] = v_u_7(0, 0, v599)
		end
		if v595.part == "ChargingHandle" and (v597.bolt and v598.m ~= v597.bolt) then
			p593.motors[v597.bolt] = v_u_7(0, 0, v599 * 0.95)
		end
		return v600
	end
	local v628 = p591.boltTravel or 0.3
	local v629 = p591.model
	if v629 then
		v629 = p591.model:GetAttribute("BoltTravel")
	end
	if type(v629) == "number" then
		v628 = v629 * v_u_5
	end
	local v630 = v594.rel
	local v631 = v594.rel + 0.03
	local v632 = p592 - v630
	local v633 = v631 - v630
	local v634 = v_u_11(v_u_11(v632 / math.max(v633, 0.0001), 0, 1), 0, 1)
	local v635 = 1 - v634 * v634 * v634
	if v597.bolt then
		p593.motors[v597.bolt] = v_u_7(0, 0, v628 * v635)
	end
	local v636 = p591.info.root:FindFirstChild("MountMag")
	local v637
	if v636 and v636:IsA("Attachment") then
		v637 = v636.Position
	else
		v637 = nil
	end
	return (v637 or Vector3.new(0, 0.3, -0.5) * v_u_5) + Vector3.new(-0.1, 0.06, 0.15) * v_u_5 + v_u_6(-0.04 + 0.035 * v_u_35({
		{ v594.pA, 0 },
		{ v594.rel, 1, "i" },
		{ v594.rel + 0.04, 0.3, "o" }
	}, p592), 0, 0)
end
local function v_u_806(p639, p640, p_u_641) -- name: magReload
	-- upvalues: (copy) v_u_62, (copy) v_u_56, (copy) v_u_57, (copy) v_u_589, (copy) v_u_82, (copy) v_u_9, (copy) v_u_7, (copy) v_u_8, (copy) v_u_6, (copy) v_u_11, (copy) v_u_100, (copy) v_u_35, (copy) v_u_117, (copy) v_u_638, (copy) v_u_58, (copy) v_u_5, (ref) v_u_61
	-- control flow flattened: this region could not be structured without a goto (unsupported in Luau), so it was lowered to the state-machine dispatch loop below to keep the output runnable.
	local v642, v643, v644, v645, v646, v647, v648, v649, v650, v651, v652, v653, v654, v655, v656, v657, v658, v659, v660, v661, v662, v663, v_u_664, v_u_665, v666, v667, v668, v669, v670, v671, v672, v673, v674, v675, v676, v677, v678, v679, v680, v681, v682, v683, v684, v685, v686, v687, v688, v689, v690, v691, v692, v693, v694, v695, v696, v697, v698, v699, v700, v701, v702, v703, v704, v705, v706, v_u_707, v708, v709, v710, v711, v712, v713, v714, v715, v716, v717, v718, v719, v720, v721, v722, v723, v724, v725, v726, v727, v728, v729, v730, v731, v732, v733, v734, v735, v736, v737, v738, v739, v740, v741, v742, v743, v744, v745, v746, v747, v748, v749, v750, v751, v752, v753, v754, v755, v756, v757, v758, v759, v760, v761, v762, v763, v764, v_u_765, v766, v767, v768, v769, v770, v771, v772, v773, v774, v_u_775, v_u_776, v777, v778, v779, v780
	local v781 = 13
	while true do
		if v781 == 1 then
			v678.motors[v_u_775.m] = v714
			v678.magHidden = v689
			v736 = v_u_775.c0 * v_u_775.hand
			if p_u_641 < v_u_664.reachB then
				v671 = v_u_664.reachA
				v666 = v_u_664.reachB
				v778 = p_u_641 - v671
				v769 = v666 - v671
				v656 = v_u_11(v_u_11(v778 / math.max(v769, 0.0001), 0, 1), 0, 1)
				v657 = v656 * v656 * v656 * (v656 * (v656 * 6 - 15) + 10)
			elseif p639.empty and p_u_641 < v_u_664.backA then
				v679 = v_u_775.c0 * (v_u_707 * v_u_775.hand)
				v757 = v_u_664.drop - 0.01
				v642 = v_u_664.awayB
				v768 = p_u_641 - v757
				v744 = v642 - v757
				v720 = v_u_11(v_u_11(v768 / math.max(v744, 0.0001), 0, 1), 0, 1)
				v736 = v736:Lerp(v679, v720 * v720 * v720 * (v720 * (v720 * 6 - 15) + 10))
				v657 = 1
			elseif p_u_641 <= v_u_664.seat then
				v736 = v_u_775.c0 * (v714 * v_u_775.hand)
				v643 = v714.Rotation * Vector3.new(1, 0, 0)
				v657 = 1
			else
				v737 = v_u_664.seat
				v715 = v_u_664.seat + 0.05
				v691 = p_u_641 - v737
				v680 = v715 - v737
				v672 = v_u_11(v_u_11(v691 / math.max(v680, 0.0001), 0, 1), 0, 1) * 3.141592653589793
				v658 = math.sin(v672)
				v736 = v736 + v_u_6(0, v658 * v658 * 0.02, 0)
				v657 = 1
			end
			v781 = 4
		elseif v781 == 2 then
			v734 = v_u_11((v655 - 0.3) / 0.7, 0, 1)
			v714 = v732:Lerp(v713, v734 * v734 * v734)
			v781 = 3
		elseif v781 == 3 then
			v678.motors[v_u_775.m] = v714
			v678.magHidden = v689
			v736 = v_u_775.c0 * v_u_775.hand
			if p_u_641 < v_u_664.reachB then
				v671 = v_u_664.reachA
				v666 = v_u_664.reachB
				v778 = p_u_641 - v671
				v769 = v666 - v671
				v656 = v_u_11(v_u_11(v778 / math.max(v769, 0.0001), 0, 1), 0, 1)
				v657 = v656 * v656 * v656 * (v656 * (v656 * 6 - 15) + 10)
			elseif p639.empty and p_u_641 < v_u_664.backA then
				v679 = v_u_775.c0 * (v_u_707 * v_u_775.hand)
				v757 = v_u_664.drop - 0.01
				v642 = v_u_664.awayB
				v768 = p_u_641 - v757
				v744 = v642 - v757
				v720 = v_u_11(v_u_11(v768 / math.max(v744, 0.0001), 0, 1), 0, 1)
				v736 = v736:Lerp(v679, v720 * v720 * v720 * (v720 * (v720 * 6 - 15) + 10))
				v657 = 1
			elseif p_u_641 <= v_u_664.seat then
				v736 = v_u_775.c0 * (v714 * v_u_775.hand)
				v643 = v714.Rotation * Vector3.new(1, 0, 0)
				v657 = 1
			else
				v737 = v_u_664.seat
				v715 = v_u_664.seat + 0.05
				v691 = p_u_641 - v737
				v680 = v715 - v737
				v672 = v_u_11(v_u_11(v691 / math.max(v680, 0.0001), 0, 1), 0, 1) * 3.141592653589793
				v658 = math.sin(v672)
				v736 = v736 + v_u_6(0, v658 * v658 * 0.02, 0)
				v657 = 1
			end
			v781 = 4
		elseif v781 == 4 then
			if v712 == "Slap" and v_u_664.preA then
				v745 = v_u_100(p640, v730)
				v673 = v_u_664.preA + (v_u_664.preB - v_u_664.preA) * 0.4
				v770 = v_u_664.preB - (v_u_664.preB - v_u_664.preA) * 0.08
				v746 = p_u_641 - v673
				v735 = v770 - v673
				v670 = v_u_11(v_u_11(v746 / math.max(v735, 0.0001), 0, 1), 0, 1)
				v721 = v670 * v670 * v670 * (v670 * (v670 * 6 - 15) + 10)
				if p_u_641 < v_u_664.reachA then
					v692 = v_u_664.preA
					v644 = v_u_664.preA + (v_u_664.preB - v_u_664.preA) * 0.4
					v771 = p_u_641 - v692
					v758 = v644 - v692
					v722 = v_u_11(v_u_11(v771 / math.max(v758, 0.0001), 0, 1), 0, 1)
					v657 = v722 * v722 * v722 * (v722 * (v722 * 6 - 15) + 10)
					v736 = v745.grab + v_u_6(0, v721 * 0.03, v745.tr * v721)
					v643 = v745.up
				end
				if v745.m and p_u_641 < (v_u_664.rel or 1) then
					v678.motors[v745.m] = v_u_7(0, 0, v745.tr * v721)
				end
			elseif v712 == "Bolt" and v_u_664.preA then
				v681 = v_u_664.preB - v_u_664.preA
				v759 = v_u_35({
					{ v_u_664.preA + v681 * 0.3, 0 },
					{ v_u_664.preA + v681 * 0.85, 1 }
				}, p_u_641)
				v738 = v_u_664.preA
				v708 = v_u_664.preA + v681 * 0.3
				v702 = p_u_641 - v738
				v659 = v708 - v738
				v693 = v_u_11(v_u_11(v702 / math.max(v659, 0.0001), 0, 1), 0, 1)
				v747 = v693 * v693 * v693 * (v693 * (v693 * 6 - 15) + 10)
				v733 = v_u_664.preB
				v709 = v_u_664.preB + v681 * 0.6
				v701 = p_u_641 - v733
				v694 = v709 - v733
				v772 = v_u_11(v_u_11(v701 / math.max(v694, 0.0001), 0, 1), 0, 1)
				v674 = v747 * (1 - v772 * v772 * v772 * (v772 * (v772 * 6 - 15) + 10))
				if v_u_664.seat < p_u_641 then
					v759 = 1 - v_u_35({
						{ v_u_664.pA, 0 },
						{ v_u_664.rel, 1 }
					}, p_u_641)
					v682 = v_u_664.chA
					v649 = v_u_664.chB
					v645 = p_u_641 - v682
					v748 = v649 - v682
					v767 = v_u_11(v_u_11(v645 / math.max(v748, 0.0001), 0, 1), 0, 1)
					v690 = v767 * v767 * v767 * (v767 * (v767 * 6 - 15) + 10)
					v683 = v_u_664.homeA
					v675 = v_u_664.homeB
					v667 = p_u_641 - v683
					v650 = v675 - v683
					v739 = v_u_11(v_u_11(v667 / math.max(v650, 0.0001), 0, 1), 0, 1)
					v674 = v690 * (1 - v739 * v739 * v739 * (v739 * (v739 * 6 - 15) + 10))
				end
				v646 = v_u_117(v678, p640, v759)
				if v646 and v674 > 0.002 then
					v723 = (Vector3.new(-0.8, -0.6, 0)).Magnitude > 0.0001 and (Vector3.new(-0.8, -0.6, 0)).Unit or Vector3.new(0, 1, 0)
					v716 = v723.Z
					v779 = v723:Cross(math.abs(v716) < 0.95 and Vector3.new(0, 0, -1) or Vector3.new(1, 0, 0)).Unit
					v703 = CFrame.fromMatrix(v646, v779, v723)
					v647 = math.min(v674, 1)
					v678.right = "bolt"
					v678.rightAt = v703
					v678.rightK = v647
				else
					v678.right = "grip"
					v678.rightK = 0
					v678.rightAt = nil
				end
			end
			if v_u_664.chA and (v_u_664.seat < p_u_641 and v712 ~= "Bolt") then
				v724 = v_u_638(p639, p640, p_u_641, v678)
				v710 = v_u_664.homeA
				v704 = v_u_664.homeB
				v695 = p_u_641 - v710
				v660 = v704 - v710
				v773 = v_u_11(v_u_11(v695 / math.max(v660, 0.0001), 0, 1), 0, 1)
				v657 = 1 - v773 * v773 * v773 * (v773 * (v773 * 6 - 15) + 10)
				if v724 then
					v774 = v_u_664.seat + 0.01
					v749 = v_u_664.chB
					v705 = p_u_641 - v774
					v696 = v749 - v774
					v668 = v_u_11(v_u_11(v705 / math.max(v696, 0.0001), 0, 1), 0, 1)
					v697 = v668 * v668 * v668 * (v668 * (v668 * 6 - 15) + 10)
					v706 = v712 == "Release" and Vector3.new(0, 0, 0) or ((v_u_58[v730.side or 0] or v_u_58[0]) * v_u_5 / 0.66 or Vector3.new(0, 0, 0))
					v740 = (v736 or v724):Lerp(v724, v697)
					v750 = v_u_11(v697, 0, 1) * 3.141592653589793
					v725 = math.sin(v750)
					v736 = v740 + v706 * (v725 * v725)
					v676 = v712 == "Release" and Vector3.new(1, 0, 0) or (v712 == "Slide" and Vector3.new(0, -1, 0) or v_u_100(p640, v730).up)
					v643 = v643:Lerp(v676, v697)
					v688 = v_u_664.homeA
					v669 = v_u_664.homeB
					v726 = p_u_641 - v688
					v717 = v669 - v688
					v751 = v_u_11(v_u_11(v726 / math.max(v717, 0.0001), 0, 1), 0, 1)
					v661 = v751 * v751 * v751 * (v751 * (v751 * 6 - 15) + 10)
					v727 = v_u_61
					if v727 then
						v727 = v_u_61(p640)
					end
					if v661 > 0 and (v727 and v706.Magnitude > 0) then
						v684 = v724:Lerp(v727, v661)
						v752 = v_u_11(v661, 0, 1) * 3.141592653589793
						v718 = math.sin(v752)
						v736 = v684 + v706 * (v718 * v718)
						v643 = v676:Lerp(Vector3.new(0, 1, 0), v661)
						v728 = v_u_664.homeB - (v_u_664.homeB - v_u_664.homeA) * 0.2
						v700 = v_u_664.homeB
						v685 = p_u_641 - v728
						v677 = v700 - v728
						v651 = v_u_11(v_u_11(v685 / math.max(v677, 0.0001), 0, 1), 0, 1)
						v657 = 1 - v651 * v651 * v651 * (v651 * (v651 * 6 - 15) + 10)
					end
				end
			elseif v_u_664.seat < p_u_641 then
				v760 = v_u_664.homeA
				v741 = v_u_664.homeB
				v662 = p_u_641 - v760
				v652 = v741 - v760
				v719 = v_u_11(v_u_11(v662 / math.max(v652, 0.0001), 0, 1), 0, 1)
				v657 = 1 - v719 * v719 * v719 * (v719 * (v719 * 6 - 15) + 10)
			elseif v712 == "Release" or v712 == "Slide" then
				v_u_638(p639, p640, 0, v678)
			elseif v712 == "Slap" and v_u_664.reachA <= p_u_641 then
				v653 = v_u_100(p640, v730)
				if v653.m then
					v678.motors[v653.m] = v_u_7(0, 0, v653.tr)
				end
			end
			if not v736 or v657 <= 0.002 then
				v678.left = "grip"
				v678.leftK = 0
				return v678
			end
			v761 = v643 and (v643.Magnitude > 0.0001 and v643.Unit) or Vector3.new(0, 1, 0)
			v753 = v761.Z
			v711 = v761:Cross(math.abs(v753) < 0.95 and Vector3.new(0, 0, -1) or Vector3.new(1, 0, 0)).Unit
			v654 = CFrame.fromMatrix(v736, v711, v761)
			v729 = math.min(v657, 1)
			v678.left = v654
			v678.leftK = v729
			return v678
		elseif v781 == 5 then
			if p_u_641 < v_u_664.drop then
				v714 = v_u_9
			elseif p_u_641 < v_u_664.backA then
				v714 = v_u_707
				v689 = true
			else
				v714 = v687()
			end
			v678.motors[v_u_775.m] = v714
			v678.magHidden = v689
			v736 = v_u_775.c0 * v_u_775.hand
			if p_u_641 < v_u_664.reachB then
				v671 = v_u_664.reachA
				v666 = v_u_664.reachB
				v778 = p_u_641 - v671
				v769 = v666 - v671
				v656 = v_u_11(v_u_11(v778 / math.max(v769, 0.0001), 0, 1), 0, 1)
				v657 = v656 * v656 * v656 * (v656 * (v656 * 6 - 15) + 10)
			elseif p639.empty and p_u_641 < v_u_664.backA then
				v679 = v_u_775.c0 * (v_u_707 * v_u_775.hand)
				v757 = v_u_664.drop - 0.01
				v642 = v_u_664.awayB
				v768 = p_u_641 - v757
				v744 = v642 - v757
				v720 = v_u_11(v_u_11(v768 / math.max(v744, 0.0001), 0, 1), 0, 1)
				v736 = v736:Lerp(v679, v720 * v720 * v720 * (v720 * (v720 * 6 - 15) + 10))
				v657 = 1
			elseif p_u_641 <= v_u_664.seat then
				v736 = v_u_775.c0 * (v714 * v_u_775.hand)
				v643 = v714.Rotation * Vector3.new(1, 0, 0)
				v657 = 1
			else
				v737 = v_u_664.seat
				v715 = v_u_664.seat + 0.05
				v691 = p_u_641 - v737
				v680 = v715 - v737
				v672 = v_u_11(v_u_11(v691 / math.max(v680, 0.0001), 0, 1), 0, 1) * 3.141592653589793
				v658 = math.sin(v672)
				v736 = v736 + v_u_6(0, v658 * v658 * 0.02, 0)
				v657 = 1
			end
			v781 = 4
		elseif v781 == 6 then
			if p_u_641 < v_u_664.pullA then
				v781 = 7
			else
				v781 = 8
			end
		elseif v781 == 7 then
			v714 = v_u_9
			v678.motors[v_u_775.m] = v714
			v678.magHidden = v689
			v736 = v_u_775.c0 * v_u_775.hand
			if p_u_641 < v_u_664.reachB then
				v671 = v_u_664.reachA
				v666 = v_u_664.reachB
				v778 = p_u_641 - v671
				v769 = v666 - v671
				v656 = v_u_11(v_u_11(v778 / math.max(v769, 0.0001), 0, 1), 0, 1)
				v657 = v656 * v656 * v656 * (v656 * (v656 * 6 - 15) + 10)
			elseif p639.empty and p_u_641 < v_u_664.backA then
				v679 = v_u_775.c0 * (v_u_707 * v_u_775.hand)
				v757 = v_u_664.drop - 0.01
				v642 = v_u_664.awayB
				v768 = p_u_641 - v757
				v744 = v642 - v757
				v720 = v_u_11(v_u_11(v768 / math.max(v744, 0.0001), 0, 1), 0, 1)
				v736 = v736:Lerp(v679, v720 * v720 * v720 * (v720 * (v720 * 6 - 15) + 10))
				v657 = 1
			elseif p_u_641 <= v_u_664.seat then
				v736 = v_u_775.c0 * (v714 * v_u_775.hand)
				v643 = v714.Rotation * Vector3.new(1, 0, 0)
				v657 = 1
			else
				v737 = v_u_664.seat
				v715 = v_u_664.seat + 0.05
				v691 = p_u_641 - v737
				v680 = v715 - v737
				v672 = v_u_11(v_u_11(v691 / math.max(v680, 0.0001), 0, 1), 0, 1) * 3.141592653589793
				v658 = math.sin(v672)
				v736 = v736 + v_u_6(0, v658 * v658 * 0.02, 0)
				v657 = 1
			end
			v781 = 4
		elseif v781 == 8 then
			if p_u_641 < v_u_664.pullB then
				v781 = 9
			else
				v781 = 10
			end
		elseif v781 == 9 then
			v777 = v_u_664.pullA
			v766 = v_u_664.pullB
			v754 = p_u_641 - v777
			v742 = v766 - v777
			v655 = v_u_11(v754 / math.max(v742, 0.0001), 0, 1)
			if v655 < 0.3 then
				v781 = 11
			else
				v781 = 12
			end
		elseif v781 == 10 then
			if p_u_641 < v_u_664.awayB then
				v648 = v_u_664.awayA
				v780 = v_u_664.awayB
				v762 = p_u_641 - v648
				v755 = v780 - v648
				v663 = v_u_11(v762 / math.max(v755, 0.0001), 0, 1)
				v698 = v_u_11(v663, 0, 1)
				v714 = v713:Lerp(v_u_707, v698 * v698 * v698 * (v698 * (v698 * 6 - 15) + 10))
				v689 = v663 > 0.85
			else
				v714 = v687()
				if p_u_641 < v_u_664.backA + (v_u_664.backB - v_u_664.backA) * 0.12 then
					v689 = true
				else
					v689 = false
				end
			end
			v678.motors[v_u_775.m] = v714
			v678.magHidden = v689
			v736 = v_u_775.c0 * v_u_775.hand
			if p_u_641 < v_u_664.reachB then
				v671 = v_u_664.reachA
				v666 = v_u_664.reachB
				v778 = p_u_641 - v671
				v769 = v666 - v671
				v656 = v_u_11(v_u_11(v778 / math.max(v769, 0.0001), 0, 1), 0, 1)
				v657 = v656 * v656 * v656 * (v656 * (v656 * 6 - 15) + 10)
			elseif p639.empty and p_u_641 < v_u_664.backA then
				v679 = v_u_775.c0 * (v_u_707 * v_u_775.hand)
				v757 = v_u_664.drop - 0.01
				v642 = v_u_664.awayB
				v768 = p_u_641 - v757
				v744 = v642 - v757
				v720 = v_u_11(v_u_11(v768 / math.max(v744, 0.0001), 0, 1), 0, 1)
				v736 = v736:Lerp(v679, v720 * v720 * v720 * (v720 * (v720 * 6 - 15) + 10))
				v657 = 1
			elseif p_u_641 <= v_u_664.seat then
				v736 = v_u_775.c0 * (v714 * v_u_775.hand)
				v643 = v714.Rotation * Vector3.new(1, 0, 0)
				v657 = 1
			else
				v737 = v_u_664.seat
				v715 = v_u_664.seat + 0.05
				v691 = p_u_641 - v737
				v680 = v715 - v737
				v672 = v_u_11(v_u_11(v691 / math.max(v680, 0.0001), 0, 1), 0, 1) * 3.141592653589793
				v658 = math.sin(v672)
				v736 = v736 + v_u_6(0, v658 * v658 * 0.02, 0)
				v657 = 1
			end
			v781 = 4
		elseif v781 == 11 then
			v763 = v_u_9
			v743 = v_u_11(v655 / 0.3, 0, 1)
			v714 = v763:Lerp(v732, v743 * v743 * v743 * (v743 * (v743 * 6 - 15) + 10))
			if v714 then
				v781 = 1
			else
				v781 = 2
			end
		elseif v781 == 12 then
			v734 = v_u_11((v655 - 0.3) / 0.7, 0, 1)
			v714 = v732:Lerp(v713, v734 * v734 * v734)
			v781 = 3
		else
			v678 = v_u_62()
			v730 = p639.prof
			v_u_664 = p639.T
			if p639.empty then
				v712 = v730.charge or nil
			else
				v712 = nil
			end
			v764 = v_u_56[v730.pose] or v_u_56.Rifle
			v731 = nil
			if v712 == "Pull" or v712 == "Slap" then
				v731 = v_u_57[v730.side or 0] or v_u_57[0]
			elseif v712 == "Release" then
				v731 = v_u_57[-1]
			end
			v756 = v_u_589(p639, p_u_641, v764, v731)
			v678.gun = v756
			v_u_775 = v_u_82(p640)
			v643 = Vector3.new(1, 0, 0)
			if not v_u_775 then
				v736 = nil
				v657 = 0
				if v712 == "Slap" and v_u_664.preA then
					v745 = v_u_100(p640, v730)
					v673 = v_u_664.preA + (v_u_664.preB - v_u_664.preA) * 0.4
					v770 = v_u_664.preB - (v_u_664.preB - v_u_664.preA) * 0.08
					v746 = p_u_641 - v673
					v735 = v770 - v673
					v670 = v_u_11(v_u_11(v746 / math.max(v735, 0.0001), 0, 1), 0, 1)
					v721 = v670 * v670 * v670 * (v670 * (v670 * 6 - 15) + 10)
					if p_u_641 < v_u_664.reachA then
						v692 = v_u_664.preA
						v644 = v_u_664.preA + (v_u_664.preB - v_u_664.preA) * 0.4
						v771 = p_u_641 - v692
						v758 = v644 - v692
						v722 = v_u_11(v_u_11(v771 / math.max(v758, 0.0001), 0, 1), 0, 1)
						v657 = v722 * v722 * v722 * (v722 * (v722 * 6 - 15) + 10)
						v736 = v745.grab + v_u_6(0, v721 * 0.03, v745.tr * v721)
						v643 = v745.up
					end
					if v745.m and p_u_641 < (v_u_664.rel or 1) then
						v678.motors[v745.m] = v_u_7(0, 0, v745.tr * v721)
					end
				elseif v712 == "Bolt" and v_u_664.preA then
					v681 = v_u_664.preB - v_u_664.preA
					v759 = v_u_35({
						{ v_u_664.preA + v681 * 0.3, 0 },
						{ v_u_664.preA + v681 * 0.85, 1 }
					}, p_u_641)
					v738 = v_u_664.preA
					v708 = v_u_664.preA + v681 * 0.3
					v702 = p_u_641 - v738
					v659 = v708 - v738
					v693 = v_u_11(v_u_11(v702 / math.max(v659, 0.0001), 0, 1), 0, 1)
					v747 = v693 * v693 * v693 * (v693 * (v693 * 6 - 15) + 10)
					v733 = v_u_664.preB
					v709 = v_u_664.preB + v681 * 0.6
					v701 = p_u_641 - v733
					v694 = v709 - v733
					v772 = v_u_11(v_u_11(v701 / math.max(v694, 0.0001), 0, 1), 0, 1)
					v674 = v747 * (1 - v772 * v772 * v772 * (v772 * (v772 * 6 - 15) + 10))
					if v_u_664.seat < p_u_641 then
						v759 = 1 - v_u_35({
							{ v_u_664.pA, 0 },
							{ v_u_664.rel, 1 }
						}, p_u_641)
						v682 = v_u_664.chA
						v649 = v_u_664.chB
						v645 = p_u_641 - v682
						v748 = v649 - v682
						v767 = v_u_11(v_u_11(v645 / math.max(v748, 0.0001), 0, 1), 0, 1)
						v690 = v767 * v767 * v767 * (v767 * (v767 * 6 - 15) + 10)
						v683 = v_u_664.homeA
						v675 = v_u_664.homeB
						v667 = p_u_641 - v683
						v650 = v675 - v683
						v739 = v_u_11(v_u_11(v667 / math.max(v650, 0.0001), 0, 1), 0, 1)
						v674 = v690 * (1 - v739 * v739 * v739 * (v739 * (v739 * 6 - 15) + 10))
					end
					v646 = v_u_117(v678, p640, v759)
					if v646 and v674 > 0.002 then
						v723 = (Vector3.new(-0.8, -0.6, 0)).Magnitude > 0.0001 and (Vector3.new(-0.8, -0.6, 0)).Unit or Vector3.new(0, 1, 0)
						v716 = v723.Z
						v779 = v723:Cross(math.abs(v716) < 0.95 and Vector3.new(0, 0, -1) or Vector3.new(1, 0, 0)).Unit
						v703 = CFrame.fromMatrix(v646, v779, v723)
						v647 = math.min(v674, 1)
						v678.right = "bolt"
						v678.rightAt = v703
						v678.rightK = v647
					else
						v678.right = "grip"
						v678.rightK = 0
						v678.rightAt = nil
					end
				end
				if v_u_664.chA and (v_u_664.seat < p_u_641 and v712 ~= "Bolt") then
					v724 = v_u_638(p639, p640, p_u_641, v678)
					v710 = v_u_664.homeA
					v704 = v_u_664.homeB
					v695 = p_u_641 - v710
					v660 = v704 - v710
					v773 = v_u_11(v_u_11(v695 / math.max(v660, 0.0001), 0, 1), 0, 1)
					v657 = 1 - v773 * v773 * v773 * (v773 * (v773 * 6 - 15) + 10)
					if v724 then
						v774 = v_u_664.seat + 0.01
						v749 = v_u_664.chB
						v705 = p_u_641 - v774
						v696 = v749 - v774
						v668 = v_u_11(v_u_11(v705 / math.max(v696, 0.0001), 0, 1), 0, 1)
						v697 = v668 * v668 * v668 * (v668 * (v668 * 6 - 15) + 10)
						v706 = v712 == "Release" and Vector3.new(0, 0, 0) or ((v_u_58[v730.side or 0] or v_u_58[0]) * v_u_5 / 0.66 or Vector3.new(0, 0, 0))
						v740 = (v736 or v724):Lerp(v724, v697)
						v750 = v_u_11(v697, 0, 1) * 3.141592653589793
						v725 = math.sin(v750)
						v736 = v740 + v706 * (v725 * v725)
						v676 = v712 == "Release" and Vector3.new(1, 0, 0) or (v712 == "Slide" and Vector3.new(0, -1, 0) or v_u_100(p640, v730).up)
						v643 = v643:Lerp(v676, v697)
						v688 = v_u_664.homeA
						v669 = v_u_664.homeB
						v726 = p_u_641 - v688
						v717 = v669 - v688
						v751 = v_u_11(v_u_11(v726 / math.max(v717, 0.0001), 0, 1), 0, 1)
						v661 = v751 * v751 * v751 * (v751 * (v751 * 6 - 15) + 10)
						v727 = v_u_61
						if v727 then
							v727 = v_u_61(p640)
						end
						if v661 > 0 and (v727 and v706.Magnitude > 0) then
							v684 = v724:Lerp(v727, v661)
							v752 = v_u_11(v661, 0, 1) * 3.141592653589793
							v718 = math.sin(v752)
							v736 = v684 + v706 * (v718 * v718)
							v643 = v676:Lerp(Vector3.new(0, 1, 0), v661)
							v728 = v_u_664.homeB - (v_u_664.homeB - v_u_664.homeA) * 0.2
							v700 = v_u_664.homeB
							v685 = p_u_641 - v728
							v677 = v700 - v728
							v651 = v_u_11(v_u_11(v685 / math.max(v677, 0.0001), 0, 1), 0, 1)
							v657 = 1 - v651 * v651 * v651 * (v651 * (v651 * 6 - 15) + 10)
						end
					end
				elseif v_u_664.seat < p_u_641 then
					v760 = v_u_664.homeA
					v741 = v_u_664.homeB
					v662 = p_u_641 - v760
					v652 = v741 - v760
					v719 = v_u_11(v_u_11(v662 / math.max(v652, 0.0001), 0, 1), 0, 1)
					v657 = 1 - v719 * v719 * v719 * (v719 * (v719 * 6 - 15) + 10)
				elseif v712 == "Release" or v712 == "Slide" then
					v_u_638(p639, p640, 0, v678)
				elseif v712 == "Slap" and v_u_664.reachA <= p_u_641 then
					v653 = v_u_100(p640, v730)
					if v653.m then
						v678.motors[v653.m] = v_u_7(0, 0, v653.tr)
					end
				end
				if not v736 or v657 <= 0.002 then
					v678.left = "grip"
					v678.leftK = 0
					return v678
				end
				v761 = v643 and (v643.Magnitude > 0.0001 and v643.Unit) or Vector3.new(0, 1, 0)
				v753 = v761.Z
				v711 = v761:Cross(math.abs(v753) < 0.95 and Vector3.new(0, 0, -1) or Vector3.new(1, 0, 0)).Unit
				v654 = CFrame.fromMatrix(v736, v711, v761)
				v729 = math.min(v657, 1)
				v678.left = v654
				v678.leftK = v729
				return v678
			end
			v699 = v_u_775.up
			v686 = v_u_775.len
			v_u_765 = v730.ins == "Rock"
			v713 = v_u_765 and v_u_7((v_u_6(0, -v686 * 0.92, -v686 * 0.16))) * (v_u_7(v_u_775.lug) * v_u_8(0.4188790204786391, 0, 0) * v_u_7(-v_u_775.lug)) or v_u_7(-v699 * v686 * 1.08)
			v732 = v_u_765 and v_u_7(v_u_775.lug) * v_u_8(0.15707963267948966, 0, 0) * v_u_7(-v_u_775.lug) or v_u_7(-v699 * 0.022)
			v_u_665 = v_u_765 and v_u_7((v_u_6(0, -v686 * 0.3, -v686 * 0.05))) * (v_u_7(v_u_775.lug) * v_u_8(0.4188790204786391, 0, 0) * v_u_7(-v_u_775.lug)) or v_u_7(-v699 * v686 * 0.72) * v_u_8(-0.08726646259971647, 0, 0)
			v_u_776 = v_u_765 and v_u_7(v_u_775.lug) * v_u_8(0.4188790204786391, 0, 0) * v_u_7(-v_u_775.lug) or v_u_7(-v699 * v686 * 0.3)
			v_u_707 = v_u_7(v756.Rotation:Inverse() * Vector3.new(-0.3, -1.35, 0.3)) * v_u_8(-0.6981317007977318, 0.5235987755982988, 0.4363323129985824)
			v689 = false
			v687 = function() -- name: insertD
				-- upvalues: (copy) p_u_641, (copy) v_u_664, (copy) v_u_707, (copy) v_u_665, (ref) v_u_11, (copy) v_u_776, (copy) v_u_765, (ref) v_u_7, (copy) v_u_775, (ref) v_u_8, (ref) v_u_9
				if p_u_641 < v_u_664.backB then
					local v782 = v_u_707
					local v783 = v_u_665
					local v784 = p_u_641
					local v785 = v_u_664.backA
					local v786 = v_u_664.backB
					local v787 = v784 - v785
					local v788 = v786 - v785
					local v789 = v_u_11(v_u_11(v787 / math.max(v788, 0.0001), 0, 1), 0, 1)
					return v782:Lerp(v783, v789 * v789 * v789 * (v789 * (v789 * 6 - 15) + 10))
				end
				if p_u_641 < v_u_664.alignB then
					local v790 = v_u_665
					local v791 = v_u_776
					local v792 = p_u_641
					local v793 = v_u_664.backB
					local v794 = v_u_664.alignB
					local v795 = v792 - v793
					local v796 = v794 - v793
					local v797 = 1 - v_u_11(v_u_11(v795 / math.max(v796, 0.0001), 0, 1), 0, 1)
					return v790:Lerp(v791, 1 - v797 * v797 * v797)
				end
				if p_u_641 >= v_u_664.seat then
					return v_u_9
				end
				local v798 = p_u_641
				local v799 = v_u_664.alignB
				local v800 = v_u_664.seat
				local v801 = v798 - v799
				local v802 = v800 - v799
				local v803 = v_u_11(v_u_11(v801 / math.max(v802, 0.0001), 0, 1), 0, 1)
				local v804 = v803 * v803 * v803
				if not v_u_765 then
					return v_u_776:Lerp(v_u_9, v804)
				end
				local v805 = (1 - v804) * 0.4188790204786391
				return v_u_7(v_u_775.lug) * v_u_8(v805, 0, 0) * v_u_7(-v_u_775.lug)
			end
			if p639.empty then
				v781 = 5
			else
				v781 = 6
			end
		end
	end
end
local function v_u_889(p807, p808, p809) -- name: beltReload
	-- upvalues: (copy) v_u_62, (copy) v_u_589, (copy) v_u_56, (copy) v_u_57, (copy) v_u_35, (copy) v_u_8, (copy) v_u_10, (copy) v_u_5, (copy) v_u_9, (copy) v_u_7, (copy) v_u_82, (copy) v_u_6, (copy) v_u_11, (copy) v_u_638, (copy) v_u_58, (copy) v_u_100
	local v810 = v_u_62()
	local v811 = p808.info
	local v812 = p807.prof
	local v813 = p807.T
	local v814 = p807.empty and "Pull" or nil
	local v815 = v_u_589
	local v816 = v_u_56[v812.pose] or v_u_56.LMG
	local v817
	if v814 then
		v817 = v_u_57[v812.side or 1] or nil
	else
		v817 = nil
	end
	local v818 = v815(p807, p809, v816, v817)
	v810.gun = v818
	local v819 = nil
	local v820 = 0
	local v821 = v811.feedCover
	local v822 = v_u_35({
		{ v813.opA, 0 },
		{ v813.opB, 1, "o" },
		{ v813.clA, 1 },
		{ v813.clB, 0, "i" }
	}, p809)
	local v823 = v_u_8(v_u_10(p808.model and (p808.model:GetAttribute("FeedCoverOpenDeg") or -65) or -65) * v822, 0, 0)
	if v821 then
		v810.motors[v821] = v823
	end
	local v824 = (v812.cover or Vector3.new(0, 0.7, -0.2)) * v_u_5
	local v825
	if v821 then
		local v826 = v821.C0
		v825 = v826 * v823 * v826:Inverse() * v824 or v824
	else
		v825 = v824
	end
	local v827 = v825 + Vector3.new(-0.02, 0.12, 0)
	local v828 = Vector3.new(0, -1, 0)
	local v829 = p808.info.root:FindFirstChild("Belt")
	if v829 and not v829:IsA("Motor6D") then
		v829 = nil
	end
	if v829 then
		local v830 = v_u_9
		v824 = (v829.C0 * v830 * v829.C1:Inverse()).Position or v824
	end
	local v831 = v_u_9:Lerp(v_u_7(-0.05, 0.16, 0.03), (v_u_35({
		{ v813.blA, 0 },
		{ v813.blB, 1 },
		{ v813.biA, 1 },
		{ v813.biB, 0 }
	}, p809)))
	if v829 and v829:IsA("Motor6D") then
		v810.motors[v829] = v831
	end
	if v829 and (v829.Part1 and (v813.blB - 0.01 < p809 and p809 < v813.biA)) then
		v810.hide.Belt = true
	end
	local v832 = v_u_82(p808)
	local v833, v834, v835, v836, v837, v838, v839, v840, v841, v842, v843, v844, v845, v846, v847, v848, v849, v850, v851, v852, v853, v854
	if not v832 then
		v833 = v819
		if p809 < v813.bxA - 0.03 then
			if p809 < v813.blA then
				v834 = v813.cvA
				v835 = v813.cvB
				v836 = p809 - v834
				v837 = v835 - v834
				v838 = v_u_11(v_u_11(v836 / math.max(v837, 0.0001), 0, 1), 0, 1)
				v820 = v838 * v838 * v838 * (v838 * (v838 * 6 - 15) + 10)
				v833 = v827
			else
				v833 = v824 + v831.Position + Vector3.new(-0.02, 0.11, 0)
				v820 = 1
			end
		elseif v813.nbB + 0.01 <= p809 and p809 < v813.clA then
			v833 = v824 + v831.Position + Vector3.new(-0.02, 0.11, 0)
			v820 = 1
		elseif v813.clA <= p809 and p809 <= v813.seat + 0.001 then
			v833 = v827
			v820 = 1
		end
		if v813.seat < p809 then
			v828 = Vector3.new(0, -1, 0)
			if v814 then
				v839 = v_u_638(p807, p808, p809, v810)
				if v839 then
					v840 = v813.seat
					v841 = v813.chB
					v842 = p809 - v840
					v843 = v841 - v840
					v844 = v_u_11(v_u_11(v842 / math.max(v843, 0.0001), 0, 1), 0, 1)
					v845 = v844 * v844 * v844 * (v844 * (v844 * 6 - 15) + 10)
					v846 = (v_u_58[v812.side or 1] or v_u_58[1]) * v_u_5 / 0.66
					v847 = v827:Lerp(v839, v845)
					v848 = v_u_11(v845, 0, 1) * 3.141592653589793
					v849 = math.sin(v848)
					v827 = v847 + v846 * (v849 * v849)
					v828 = (Vector3.new(0, -1, 0)):Lerp(v_u_100(p808, v812).up, v845)
				end
			end
			v850 = v813.homeA
			v851 = v813.homeB
			v852 = p809 - v850
			v853 = v851 - v850
			v854 = v_u_11(v_u_11(v852 / math.max(v853, 0.0001), 0, 1), 0, 1)
			v820 = 1 - v854 * v854 * v854 * (v854 * (v854 * 6 - 15) + 10)
		else
			v827 = v833
		end
		if not v827 or v820 <= 0.002 then
			v810.left = "grip"
			v810.leftK = 0
			return v810
		end
		v884 = v828 and (v828.Magnitude > 0.0001 and v828.Unit) or Vector3.new(0, 1, 0)
		v885 = v884.Z
		v886 = v884:Cross(math.abs(v885) < 0.95 and Vector3.new(0, 0, -1) or Vector3.new(1, 0, 0)).Unit
		v887 = CFrame.fromMatrix(v827, v886, v884)
		v888 = math.min(v820, 1)
		v810.left = v887
		v810.leftK = v888
		return v810
	end
	local v855 = v832.len
	local v856 = v_u_7((v_u_6(-0.1, -v855 * 0.85, 0.02)))
	local v857 = v_u_7(v818.Rotation:Inverse() * Vector3.new(-0.3, -1.35, 0.3)) * v_u_8(-0.5235987755982988, 0.4363323129985824, 0.3490658503988659)
	local v858 = v_u_7((v_u_6(-0.08, -v855 * 0.55, 0.02)))
	local v859 = v_u_9
	local v860 = false
	local v861, v862, v863, v864, v865, v866, v867
	if p809 < v813.bxA then
		v859 = v_u_9
		v810.motors[v832.m] = v859
		v810.magHidden = v860
		v833 = v832.c0 * (v859 * v832.hand)
		if v813.bxA - 0.03 <= p809 and p809 < v813.nbB + 0.01 then
			if p809 < v813.bxA then
				v833 = v832.c0 * v832.hand or v833
			end
			v820 = 1
			v828 = v859.Rotation * Vector3.new(1, 0, 0)
			if p807.empty and (v813.drop <= p809 and p809 < v813.nbA) then
				v861 = v832.c0 * v832.hand
				v862 = v832.c0 * (v857 * v832.hand)
				v863 = v813.drop
				v864 = v813.bxB
				v865 = p809 - v863
				v866 = v864 - v863
				v867 = v_u_11(v_u_11(v865 / math.max(v866, 0.0001), 0, 1), 0, 1)
				v833 = v861:Lerp(v862, v867 * v867 * v867 * (v867 * (v867 * 6 - 15) + 10))
			end
		else
			v833 = v819
		end
	elseif p809 < v813.nbA then
		if p807.empty then
			if p809 < v813.drop then
				v859 = v_u_9 or v857
			else
				v859 = v857
			end
			v860 = v813.drop <= p809
			v810.motors[v832.m] = v859
			v810.magHidden = v860
			v833 = v832.c0 * (v859 * v832.hand)
			if v813.bxA - 0.03 <= p809 and p809 < v813.nbB + 0.01 then
				if p809 < v813.bxA then
					v833 = v832.c0 * v832.hand or v833
				end
				v820 = 1
				v828 = v859.Rotation * Vector3.new(1, 0, 0)
				if p807.empty and (v813.drop <= p809 and p809 < v813.nbA) then
					v861 = v832.c0 * v832.hand
					v862 = v832.c0 * (v857 * v832.hand)
					v863 = v813.drop
					v864 = v813.bxB
					v865 = p809 - v863
					v866 = v864 - v863
					v867 = v_u_11(v_u_11(v865 / math.max(v866, 0.0001), 0, 1), 0, 1)
					v833 = v861:Lerp(v862, v867 * v867 * v867 * (v867 * (v867 * 6 - 15) + 10))
				end
			else
				v833 = v819
			end
		else
			local v868 = v813.bxA
			local v869 = v813.bxB
			local v870 = p809 - v868
			local v871 = v869 - v868
			local v872 = v_u_11(v870 / math.max(v871, 0.0001), 0, 1)
			local v873
			if v872 < 0.4 then
				local v874 = v_u_9
				local v875 = v_u_11(v872 / 0.4, 0, 1)
				v859 = v874:Lerp(v856, v875 * v875 * v875)
				if v859 then
					v860 = v872 > 0.9
				else
					v873 = v_u_11((v872 - 0.4) / 0.6, 0, 1)
					v859 = v856:Lerp(v857, v873 * v873 * v873 * (v873 * (v873 * 6 - 15) + 10))
					v860 = v872 > 0.9
				end
			else
				v873 = v_u_11((v872 - 0.4) / 0.6, 0, 1)
				v859 = v856:Lerp(v857, v873 * v873 * v873 * (v873 * (v873 * 6 - 15) + 10))
				v860 = v872 > 0.9
			end
			v810.motors[v832.m] = v859
			v810.magHidden = v860
			v833 = v832.c0 * (v859 * v832.hand)
			if v813.bxA - 0.03 <= p809 and p809 < v813.nbB + 0.01 then
				if p809 < v813.bxA then
					v833 = v832.c0 * v832.hand or v833
				end
				v820 = 1
				v828 = v859.Rotation * Vector3.new(1, 0, 0)
				if p807.empty and (v813.drop <= p809 and p809 < v813.nbA) then
					v861 = v832.c0 * v832.hand
					v862 = v832.c0 * (v857 * v832.hand)
					v863 = v813.drop
					v864 = v813.bxB
					v865 = p809 - v863
					v866 = v864 - v863
					v867 = v_u_11(v_u_11(v865 / math.max(v866, 0.0001), 0, 1), 0, 1)
					v833 = v861:Lerp(v862, v867 * v867 * v867 * (v867 * (v867 * 6 - 15) + 10))
				end
			else
				v833 = v819
			end
		end
	elseif p809 < v813.nbB then
		local v876 = v813.nbA
		local v877 = v813.nbB
		local v878 = p809 - v876
		local v879 = v877 - v876
		local v880 = v_u_11(v878 / math.max(v879, 0.0001), 0, 1)
		local v881, v882
		if v880 < 0.7 then
			local v883 = v_u_11(v880 / 0.7, 0, 1)
			v859 = v857:Lerp(v858, v883 * v883 * v883 * (v883 * (v883 * 6 - 15) + 10))
			if v859 then
				if v880 < 0.08 then
					v860 = true
				else
					v860 = false
				end
			else
				v881 = v_u_9
				v882 = v_u_11((v880 - 0.7) / 0.3, 0, 1)
				v859 = v858:Lerp(v881, v882 * v882 * v882)
				if v880 < 0.08 then
					v860 = true
				else
					v860 = false
				end
			end
		else
			v881 = v_u_9
			v882 = v_u_11((v880 - 0.7) / 0.3, 0, 1)
			v859 = v858:Lerp(v881, v882 * v882 * v882)
			if v880 < 0.08 then
				v860 = true
			else
				v860 = false
			end
		end
		v810.motors[v832.m] = v859
		v810.magHidden = v860
		v833 = v832.c0 * (v859 * v832.hand)
		if v813.bxA - 0.03 <= p809 and p809 < v813.nbB + 0.01 then
			if p809 < v813.bxA then
				v833 = v832.c0 * v832.hand or v833
			end
			v820 = 1
			v828 = v859.Rotation * Vector3.new(1, 0, 0)
			if p807.empty and (v813.drop <= p809 and p809 < v813.nbA) then
				v861 = v832.c0 * v832.hand
				v862 = v832.c0 * (v857 * v832.hand)
				v863 = v813.drop
				v864 = v813.bxB
				v865 = p809 - v863
				v866 = v864 - v863
				v867 = v_u_11(v_u_11(v865 / math.max(v866, 0.0001), 0, 1), 0, 1)
				v833 = v861:Lerp(v862, v867 * v867 * v867 * (v867 * (v867 * 6 - 15) + 10))
			end
		else
			v833 = v819
		end
	else
		v810.motors[v832.m] = v859
		v810.magHidden = v860
		v833 = v832.c0 * (v859 * v832.hand)
		if v813.bxA - 0.03 <= p809 and p809 < v813.nbB + 0.01 then
			if p809 < v813.bxA then
				v833 = v832.c0 * v832.hand or v833
			end
			v820 = 1
			v828 = v859.Rotation * Vector3.new(1, 0, 0)
			if p807.empty and (v813.drop <= p809 and p809 < v813.nbA) then
				v861 = v832.c0 * v832.hand
				v862 = v832.c0 * (v857 * v832.hand)
				v863 = v813.drop
				v864 = v813.bxB
				v865 = p809 - v863
				v866 = v864 - v863
				v867 = v_u_11(v_u_11(v865 / math.max(v866, 0.0001), 0, 1), 0, 1)
				v833 = v861:Lerp(v862, v867 * v867 * v867 * (v867 * (v867 * 6 - 15) + 10))
			end
		else
			v833 = v819
		end
	end
	if p809 < v813.bxA - 0.03 then
		if p809 < v813.blA then
			v834 = v813.cvA
			v835 = v813.cvB
			v836 = p809 - v834
			v837 = v835 - v834
			v838 = v_u_11(v_u_11(v836 / math.max(v837, 0.0001), 0, 1), 0, 1)
			v820 = v838 * v838 * v838 * (v838 * (v838 * 6 - 15) + 10)
			v833 = v827
		else
			v833 = v824 + v831.Position + Vector3.new(-0.02, 0.11, 0)
			v820 = 1
		end
	elseif v813.nbB + 0.01 <= p809 and p809 < v813.clA then
		v833 = v824 + v831.Position + Vector3.new(-0.02, 0.11, 0)
		v820 = 1
	elseif v813.clA <= p809 and p809 <= v813.seat + 0.001 then
		v833 = v827
		v820 = 1
	end
	if v813.seat < p809 then
		v828 = Vector3.new(0, -1, 0)
		if v814 then
			v839 = v_u_638(p807, p808, p809, v810)
			if v839 then
				v840 = v813.seat
				v841 = v813.chB
				v842 = p809 - v840
				v843 = v841 - v840
				v844 = v_u_11(v_u_11(v842 / math.max(v843, 0.0001), 0, 1), 0, 1)
				v845 = v844 * v844 * v844 * (v844 * (v844 * 6 - 15) + 10)
				v846 = (v_u_58[v812.side or 1] or v_u_58[1]) * v_u_5 / 0.66
				v847 = v827:Lerp(v839, v845)
				v848 = v_u_11(v845, 0, 1) * 3.141592653589793
				v849 = math.sin(v848)
				v827 = v847 + v846 * (v849 * v849)
				v828 = (Vector3.new(0, -1, 0)):Lerp(v_u_100(p808, v812).up, v845)
			end
		end
		v850 = v813.homeA
		v851 = v813.homeB
		v852 = p809 - v850
		v853 = v851 - v850
		v854 = v_u_11(v_u_11(v852 / math.max(v853, 0.0001), 0, 1), 0, 1)
		v820 = 1 - v854 * v854 * v854 * (v854 * (v854 * 6 - 15) + 10)
	else
		v827 = v833
	end
	if not v827 or v820 <= 0.002 then
		v810.left = "grip"
		v810.leftK = 0
		return v810
	end
	local v884 = v828 and (v828.Magnitude > 0.0001 and v828.Unit) or Vector3.new(0, 1, 0)
	local v885 = v884.Z
	local v886 = v884:Cross(math.abs(v885) < 0.95 and Vector3.new(0, 0, -1) or Vector3.new(1, 0, 0)).Unit
	local v887 = CFrame.fromMatrix(v827, v886, v884)
	local v888 = math.min(v820, 1)
	v810.left = v887
	v810.leftK = v888
	return v810
end
local function v_u_986(p890, p891, p892) -- name: topReload
	-- upvalues: (copy) v_u_62, (copy) v_u_589, (copy) v_u_56, (copy) v_u_57, (copy) v_u_82, (copy) v_u_6, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_11, (copy) v_u_638, (copy) v_u_100
	local v893 = v_u_62()
	local v894 = p890.prof
	local v895 = p890.T
	local v896 = p890.empty and "Pull" or nil
	local v897 = v_u_589
	local v898 = v_u_56.Top
	local v899
	if v896 then
		v899 = v_u_57[v894.side or -1] or nil
	else
		v899 = nil
	end
	local v900 = v897(p890, p892, v898, v899)
	v893.gun = v900
	local v901 = v_u_82(p891)
	local v902, v903
	if v901 then
		local v904 = v901.depth * 0.5
		local v905 = v901.rest.Position + v_u_6(0, 0, -v904)
		local v906 = v_u_7(v905) * v_u_8(-0.24434609527920614, 0, 0) * v_u_7(-v905)
		local v907 = v_u_7(0, 0.16, 0.5) * (v_u_7(v905) * v_u_8(-0.17453292519943295, 0, 0) * v_u_7(-v905))
		local v908 = v_u_7(v900.Rotation:Inverse() * Vector3.new(-0.3, -1.35, 0.3)) * v_u_8(-0.3490658503988659, 0.6981317007977318, 0.17453292519943295)
		local v909 = v_u_7(0, 0.12, 0.2) * (v_u_7(v905) * v_u_8(-0.20943951023931956, 0, 0) * v_u_7(-v905))
		local v910 = v_u_7(v905) * v_u_8(-0.20943951023931956, 0, 0) * v_u_7(-v905)
		local v911 = v_u_9
		local v912 = false
		if p892 < v895.liftA then
			v911 = v_u_9
		elseif p892 < v895.pullA then
			local v913 = v_u_9
			local v914 = v895.liftA
			local v915 = v895.liftB
			local v916 = p892 - v914
			local v917 = v915 - v914
			local v918 = v_u_11(v_u_11(v916 / math.max(v917, 0.0001), 0, 1), 0, 1)
			v911 = v913:Lerp(v906, v918 * v918 * v918 * (v918 * (v918 * 6 - 15) + 10))
		elseif p890.empty and (v895.drop <= p892 and p892 < v895.backA) then
			v911 = v908
			v912 = true
		elseif p892 < v895.pullB then
			local v919 = v895.pullA
			local v920 = v895.pullB
			local v921 = p892 - v919
			local v922 = v920 - v919
			local v923 = v_u_11(v_u_11(v921 / math.max(v922, 0.0001), 0, 1), 0, 1)
			v911 = v906:Lerp(v907, v923 * v923 * v923 * (v923 * (v923 * 6 - 15) + 10))
		elseif p892 < v895.awayB then
			local v924 = v895.awayA
			local v925 = v895.awayB
			local v926 = p892 - v924
			local v927 = v925 - v924
			local v928 = v_u_11(v926 / math.max(v927, 0.0001), 0, 1)
			local v929 = v_u_11(v928, 0, 1)
			v911 = v907:Lerp(v908, v929 * v929 * v929 * (v929 * (v929 * 6 - 15) + 10))
			v912 = v928 > 0.85
		elseif p892 < v895.backB then
			local v930 = v895.backA
			local v931 = v895.backB
			local v932 = p892 - v930
			local v933 = v931 - v930
			local v934 = v_u_11(v932 / math.max(v933, 0.0001), 0, 1)
			local v935 = v_u_11(v934, 0, 1)
			v911 = v908:Lerp(v909, v935 * v935 * v935 * (v935 * (v935 * 6 - 15) + 10))
			v912 = v934 < 0.12
		elseif p892 < v895.frontB then
			local v936 = v895.backB
			local v937 = v895.frontB
			local v938 = p892 - v936
			local v939 = v937 - v936
			local v940 = 1 - v_u_11(v_u_11(v938 / math.max(v939, 0.0001), 0, 1), 0, 1)
			v911 = v909:Lerp(v910, 1 - v940 * v940 * v940)
		elseif p892 < v895.seat then
			local v941 = v895.frontB
			local v942 = v895.seat
			local v943 = p892 - v941
			local v944 = v942 - v941
			local v945 = v_u_11(v_u_11(v943 / math.max(v944, 0.0001), 0, 1), 0, 1)
			local v946 = (1 - v945 * v945 * v945) * -0.20943951023931956
			v911 = v_u_7(v905) * v_u_8(v946, 0, 0) * v_u_7(-v905)
		end
		v893.motors[v901.m] = v911
		v893.magHidden = v912
		local v947 = v901.rest.Position + v_u_6(-0.03, v901.len * 0.5 + 0.11, v904 * 0.45)
		local v948 = (v911 * v_u_7(v947)).Position
		if p892 < v895.reachB then
			v902 = v901.c0 * v947
			local v949 = v895.reachA
			local v950 = v895.reachB
			local v951 = p892 - v949
			local v952 = v950 - v949
			local v953 = v_u_11(v_u_11(v951 / math.max(v952, 0.0001), 0, 1), 0, 1)
			v903 = v953 * v953 * v953 * (v953 * (v953 * 6 - 15) + 10)
		elseif p892 <= v895.seat then
			v902 = v901.c0 * v948
			v903 = 1
			if p890.empty and (v895.drop <= p892 and p892 < v895.backA) then
				local v954 = v901.c0 * v947
				local v955 = v901.c0 * (v908 * v947)
				local v956 = v895.drop
				local v957 = v895.awayB
				local v958 = p892 - v956
				local v959 = v957 - v956
				local v960 = v_u_11(v_u_11(v958 / math.max(v959, 0.0001), 0, 1), 0, 1)
				v902 = v954:Lerp(v955, v960 * v960 * v960 * (v960 * (v960 * 6 - 15) + 10))
			end
		else
			local v961 = v901.c0 * v947
			local v962 = v895.seat
			local v963 = v895.seat + 0.05
			local v964 = p892 - v962
			local v965 = v963 - v962
			local v966 = v_u_11(v_u_11(v964 / math.max(v965, 0.0001), 0, 1), 0, 1) * 3.141592653589793
			local v967 = math.sin(v966)
			v902 = v961 + v_u_6(0, v967 * v967 * 0.02, 0)
			v903 = 1
		end
	else
		v903 = 0
		v902 = nil
	end
	local v968 = Vector3.new(0, -1, 0)
	if v895.seat < p892 then
		if v896 then
			local v969 = v_u_638(p890, p891, p892, v893)
			if v969 and v902 then
				local v970 = v895.seat
				local v971 = v895.chB
				local v972 = p892 - v970
				local v973 = v971 - v970
				local v974 = v_u_11(v_u_11(v972 / math.max(v973, 0.0001), 0, 1), 0, 1)
				local v975 = v974 * v974 * v974 * (v974 * (v974 * 6 - 15) + 10)
				v902 = v902:Lerp(v969, v975)
				v968 = (Vector3.new(0, -1, 0)):Lerp(v_u_100(p891, v894).up, v975)
			end
		end
		local v976 = v895.homeA
		local v977 = v895.homeB
		local v978 = p892 - v976
		local v979 = v977 - v976
		local v980 = v_u_11(v_u_11(v978 / math.max(v979, 0.0001), 0, 1), 0, 1)
		v903 = 1 - v980 * v980 * v980 * (v980 * (v980 * 6 - 15) + 10)
	end
	if not v902 or v903 <= 0.002 then
		v893.left = "grip"
		v893.leftK = 0
		return v893
	end
	local v981 = v968 and (v968.Magnitude > 0.0001 and v968.Unit) or Vector3.new(0, 1, 0)
	local v982 = v981.Z
	local v983 = v981:Cross(math.abs(v982) < 0.95 and Vector3.new(0, 0, -1) or Vector3.new(1, 0, 0)).Unit
	local v984 = CFrame.fromMatrix(v902, v983, v981)
	local v985 = math.min(v903, 1)
	v893.left = v984
	v893.leftK = v985
	return v893
end
local function v_u_1082(p987, p988, p989) -- name: clipReload
	-- upvalues: (copy) v_u_62, (copy) v_u_589, (copy) v_u_56, (copy) v_u_11, (copy) v_u_117, (copy) v_u_5, (copy) v_u_7, (copy) v_u_8, (copy) v_u_6
	local v990 = v_u_62()
	local v991 = p987.T
	local v992 = v_u_589(p987, p989, v_u_56.Clip, nil)
	v990.gun = v992
	local v993 = 0
	if v991.fwdA <= p989 then
		local v994 = v991.fwdA
		local v995 = v991.fwdB
		local v996 = p989 - v994
		local v997 = v995 - v994
		local v998 = v_u_11(v_u_11(v996 / math.max(v997, 0.0001), 0, 1), 0, 1)
		local v999 = 1 - v998 * v998 * v998 * (v998 * (v998 * 6 - 15) + 10) * 0.5
		local v1000 = v991.dnA
		local v1001 = v991.dnB
		local v1002 = p989 - v1000
		local v1003 = v1001 - v1000
		local v1004 = v_u_11(v_u_11(v1002 / math.max(v1003, 0.0001), 0, 1), 0, 1)
		v993 = v999 - v1004 * v1004 * v1004 * (v1004 * (v1004 * 6 - 15) + 10) * 0.5
	elseif v991.liftA <= p989 then
		local v1005 = v991.liftA
		local v1006 = v991.liftB
		local v1007 = p989 - v1005
		local v1008 = v1006 - v1005
		local v1009 = v_u_11(v_u_11(v1007 / math.max(v1008, 0.0001), 0, 1), 0, 1)
		local v1010 = v1009 * v1009 * v1009 * (v1009 * (v1009 * 6 - 15) + 10) * 0.5
		local v1011 = v991.backA
		local v1012 = v991.backB
		local v1013 = p989 - v1011
		local v1014 = v1012 - v1011
		local v1015 = v_u_11(v_u_11(v1013 / math.max(v1014, 0.0001), 0, 1), 0, 1)
		v993 = v1010 + v1015 * v1015 * v1015 * (v1015 * (v1015 * 6 - 15) + 10) * 0.5
	end
	local v1016 = v_u_117(v990, p988, v993)
	local v1017 = Vector3.new(0, 0.36, -0.06) * v_u_5
	local v1018 = v1017 + v992.Rotation:Inverse() * Vector3.new(0.45, -1.3, 0.35)
	local v1019, v1020
	if v991.cA <= p989 and p989 < v991.flick then
		local v1021 = v_u_7(v1017 + Vector3.new(0.02, 0.12, 0.03)) * v_u_8(0.17453292519943295, 0, -0.20943951023931956)
		if p989 < v991.cB then
			local v1022 = v_u_7(v1018) * v_u_8(-0.8726646259971648, 0.5235987755982988, 0)
			local v1023 = v991.cA
			local v1024 = v991.cB
			local v1025 = p989 - v1023
			local v1026 = v1024 - v1023
			local v1027 = v_u_11(v_u_11(v1025 / math.max(v1026, 0.0001), 0, 1), 0, 1)
			v1019 = v1022:Lerp(v1021, v1027 * v1027 * v1027 * (v1027 * (v1027 * 6 - 15) + 10))
		elseif p989 < v991.inGB then
			local v1028 = v_u_7(v1017)
			local v1029 = v991.cB
			local v1030 = v991.inGB
			local v1031 = p989 - v1029
			local v1032 = v1030 - v1029
			local v1033 = 1 - v_u_11(v_u_11(v1031 / math.max(v1032, 0.0001), 0, 1), 0, 1)
			v1019 = v1021:Lerp(v1028, 1 - v1033 * v1033 * v1033)
		else
			v1019 = v_u_7(v1017)
		end
		local v1034 = (v991.pushA + v991.pushB) / 2
		local v1035 = v991.pushA
		local v1036 = v1034 - 0.01
		local v1037 = p989 - v1035
		local v1038 = v1036 - v1035
		local v1039 = v_u_11(v_u_11(v1037 / math.max(v1038, 0.0001), 0, 1), 0, 1)
		local v1040 = v1039 * v1039 * v1039 * (v1039 * (v1039 * 6 - 15) + 10) * 0.55
		local v1041 = v1034 + 0.005
		local v1042 = v991.pushB
		local v1043 = p989 - v1041
		local v1044 = v1042 - v1041
		local v1045 = v_u_11(v_u_11(v1043 / math.max(v1044, 0.0001), 0, 1), 0, 1)
		v1020 = v1040 + v1045 * v1045 * v1045 * (v1045 * (v1045 * 6 - 15) + 10) * 0.45
	else
		v1019 = nil
		v1020 = 0
	end
	local v1046 = Vector3.new(-0.8, -0.6, 0)
	local v1047
	if p989 < v991.awayA then
		local v1048 = v991.rA
		local v1049 = v991.rB
		local v1050 = p989 - v1048
		local v1051 = v1049 - v1048
		local v1052 = v_u_11(v_u_11(v1050 / math.max(v1051, 0.0001), 0, 1), 0, 1)
		v1047 = v1052 * v1052 * v1052 * (v1052 * (v1052 * 6 - 15) + 10)
	elseif p989 < v991.cA then
		local v1053 = v991.awayA
		local v1054 = v991.awayB
		local v1055 = p989 - v1053
		local v1056 = v1054 - v1053
		local v1057 = v_u_11(v_u_11(v1055 / math.max(v1056, 0.0001), 0, 1), 0, 1)
		v1016 = (v1016 or v1017):Lerp(v1018, v1057 * v1057 * v1057 * (v1057 * (v1057 * 6 - 15) + 10))
		v1047 = 1
	elseif p989 < v991.inGB then
		v1016 = v1019 * Vector3.new(0.1, 0.06, 0.06)
		v1047 = 1
		v1046 = Vector3.new(-1, -0.3, 0)
	elseif p989 < v991.flick then
		local v1058 = 0.21 * v_u_5 * v1020
		v1016 = v1017 + Vector3.new(0.03, 0.11, 0.05) + v_u_6(0, 0.2 * v_u_5 - v1058, 0)
		v1047 = 1
		v1046 = Vector3.new(0, -1, 0)
	elseif p989 < v991.kA then
		local v1059 = v1017 + Vector3.new(0.03, 0.11, 0.05)
		local v1060 = v991.flick - 0.02
		local v1061 = v991.kA
		local v1062 = p989 - v1060
		local v1063 = v1061 - v1060
		local v1064 = v_u_11(v_u_11(v1062 / math.max(v1063, 0.0001), 0, 1), 0, 1) * 3.141592653589793
		local v1065 = math.sin(v1064)
		v1016 = v1059 + Vector3.new(0.12, 0.1, 0.04) * (v1065 * v1065)
		v1047 = 1
		v1046 = Vector3.new(0, -1, 0)
	else
		local v1066 = v991.kA
		local v1067 = v991.kB
		local v1068 = p989 - v1066
		local v1069 = v1067 - v1066
		local v1070 = v_u_11(v_u_11(v1068 / math.max(v1069, 0.0001), 0, 1), 0, 1)
		local v1071 = v1070 * v1070 * v1070 * (v1070 * (v1070 * 6 - 15) + 10)
		v1016 = (v1017 + Vector3.new(0.03, 0.11, 0.05)):Lerp(v1016 or v1017, v1071)
		local v1072 = v991.homeA
		local v1073 = v991.homeB
		local v1074 = p989 - v1072
		local v1075 = v1073 - v1072
		local v1076 = v_u_11(v_u_11(v1074 / math.max(v1075, 0.0001), 0, 1), 0, 1)
		v1047 = 1 - v1076 * v1076 * v1076 * (v1076 * (v1076 * 6 - 15) + 10)
		v1046 = (Vector3.new(0, -1, 0)):Lerp(Vector3.new(-0.8, -0.6, 0), v1071)
	end
	if v1016 and v1047 > 0.002 then
		local v1077 = v1046 and (v1046.Magnitude > 0.0001 and v1046.Unit) or Vector3.new(0, 1, 0)
		local v1078 = v1077.Z
		local v1079 = v1077:Cross(math.abs(v1078) < 0.95 and Vector3.new(0, 0, -1) or Vector3.new(1, 0, 0)).Unit
		local v1080 = CFrame.fromMatrix(v1016, v1079, v1077)
		local v1081 = math.min(v1047, 1)
		v990.right = "bolt"
		v990.rightAt = v1080
		v990.rightK = v1081
	else
		v990.right = "grip"
		v990.rightK = 0
		v990.rightAt = nil
	end
	if v1019 then
		v990.props.ClipStrip = v1019
		if v1020 < 0.98 then
			v990.props.ClipRounds = v1019 * v_u_7(0, -0.21 * v_u_5 * v1020, v1020 * -0.01)
		end
	end
	return v990
end
v_u_61 = function(p1083)
	local v1084 = p1083.info
	local v1085 = v1084.gripAtt or v1084.gripL
	if v1085 then
		return v1084.root.CFrame:PointToObjectSpace(v1085.WorldPosition)
	else
		return nil
	end
end
v_u_4.defaultGripOf = v_u_61
local function v_u_1162(p1086, p1087, p1088) -- name: breakReload
	-- upvalues: (copy) v_u_62, (copy) v_u_589, (copy) v_u_56, (copy) v_u_35, (copy) v_u_8, (copy) v_u_11, (copy) v_u_9, (copy) v_u_6, (copy) v_u_5, (copy) v_u_7, (ref) v_u_61
	local v1089 = v_u_62()
	local v1090 = p1087.info
	local v1091 = p1086.prof
	local v1092 = p1086.T
	local v1093 = v_u_589(p1086, p1088, v_u_56[v1091.pose] or v_u_56.Break, nil)
	v1089.gun = v1093
	local v1094 = v1090.barrels
	local v1095 = v_u_35({
		{ v1092.opA, 0 },
		{ v1092.opB, 1, "o" },
		{ v1092.clA, 1 },
		{ v1092.clB, 0, "i" }
	}, p1088)
	local v1096 = (p1088 - v1092.opB) * p1086.dur
	local v1097
	if v1096 <= 0 then
		v1097 = 0
	else
		local v1098 = -12 * v1096
		local v1099 = math.exp(v1098) * 0.06
		local v1100 = 24 * v1096
		v1097 = v1099 * math.sin(v1100)
	end
	local v1101 = v1095 + v1097
	local v1102 = v_u_8((v1091.flare and -0.7330382858376184 or -0.6283185307179586) * v1101, 0, 0)
	if v1094 then
		v1089.motors[v1094] = v1102
	end
	if v1090.bolt and not v1091.flare then
		local v1103 = v1089.motors
		local v1104 = v1090.bolt
		local v1105 = v_u_8
		local v1106 = v1092.opA - 0.04
		local v1107 = v1092.opB + 0.06
		local v1108 = p1088 - v1106
		local v1109 = v1107 - v1106
		local v1110 = v_u_11(v_u_11(v1108 / math.max(v1109, 0.0001), 0, 1), 0, 1) * 3.141592653589793
		local v1111 = math.sin(v1110)
		v1103[v1104] = v1105(0, v1111 * v1111 * -0.4886921905584123, 0)
	end
	local v1112
	if v1094 and v1094.Part1 then
		local v1113 = v_u_9
		v1112 = v1094.C0 * v1113 * v1094.C1:Inverse() * v_u_6(0, 0, v1094.Part1.Size.Z * 0.5 - 0.02)
	else
		v1112 = Vector3.new(0, 0.2, -0.55) * v_u_5
	end
	if v1094 then
		local v1114 = v1094.C0
		v1112 = v1114 * v1102 * v1114:Inverse() * v1112 or v1112
	end
	local v1115 = v1094 and (v1094.C0 * v1102 * v1094.C0:Inverse()).Rotation or v_u_9
	v1089.breech = v1112
	if v1091.flare and v1090.magMotor then
		local v1116 = v1090.magMotor
		local v1117 = v1094 and v1116.C0:Inverse() * (v1094.C0 * v1102 * v1094.C0:Inverse()) * v1116.C0 or v_u_9
		v1089.motors[v1116] = v1117
		local v1118
		if v1092.ej <= p1088 then
			v1118 = p1088 < v1092.seat
		else
			v1118 = false
		end
		v1089.magHidden = v1118
	end
	local v1119 = p1086.spent or 1
	local v1120 = v1091.flare and "Flare" or (v1119 >= 2 and (v1091.ou and "Shells2V" or "Shells2H") or "Shell1")
	local v1121 = v1112 + v1093.Rotation:Inverse() * Vector3.new(-0.3, -1.35, 0.3)
	local v1122 = nil
	local v1123 = 0
	local v1124 = v_u_7(v1112) * v1115 * v_u_7(0, 0.02, 0.24 * v_u_5)
	if p1088 < v1092.awayA then
		v1123 = 0
	elseif p1088 < v1092.backA then
		local v1125 = v_u_61(p1087) or v1112
		local v1126 = v1092.awayA
		local v1127 = v1092.awayB
		local v1128 = p1088 - v1126
		local v1129 = v1127 - v1126
		local v1130 = v_u_11(v_u_11(v1128 / math.max(v1129, 0.0001), 0, 1), 0, 1)
		v1122 = v1125:Lerp(v1121, v1130 * v1130 * v1130 * (v1130 * (v1130 * 6 - 15) + 10))
		v1123 = 1
	elseif p1088 < v1092.insB then
		local v1131
		if p1088 < v1092.backB then
			local v1132 = v_u_7(v1121) * v1115 * v_u_8(-0.6981317007977318, 0.3490658503988659, 0)
			local v1133 = v1092.backA
			local v1134 = v1092.backB
			local v1135 = p1088 - v1133
			local v1136 = v1134 - v1133
			local v1137 = v_u_11(v_u_11(v1135 / math.max(v1136, 0.0001), 0, 1), 0, 1)
			v1131 = v1132:Lerp(v1124, v1137 * v1137 * v1137 * (v1137 * (v1137 * 6 - 15) + 10))
		else
			local v1138 = v_u_7(v1112) * v1115 * v_u_7(0, 0, -0.04 * v_u_5)
			local v1139 = v1092.insA
			local v1140 = v1092.insB
			local v1141 = p1088 - v1139
			local v1142 = v1140 - v1139
			local v1143 = 1 - v_u_11(v_u_11(v1141 / math.max(v1142, 0.0001), 0, 1), 0, 1)
			v1131 = v1124:Lerp(v1138, 1 - v1143 * v1143 * v1143)
		end
		v1089.props[v1120] = v1131
		v1122 = (v1131 * v_u_7(-0.02, -0.09, 0.1)).Position
		v1123 = 1
	elseif p1088 < v1092.homeB then
		local v1144 = (v_u_61(p1087) or v1112) + Vector3.new(0, -0.06, 0)
		local v1145 = v1112 + Vector3.new(0, -0.12, -0.12)
		local v1146 = v1092.insB
		local v1147 = v1092.clB
		local v1148 = p1088 - v1146
		local v1149 = v1147 - v1146
		local v1150 = v_u_11(v_u_11(v1148 / math.max(v1149, 0.0001), 0, 1), 0, 1)
		v1122 = v1145:Lerp(v1144, v1150 * v1150 * v1150 * (v1150 * (v1150 * 6 - 15) + 10))
		local v1151 = v1092.homeA
		local v1152 = v1092.homeB
		local v1153 = p1088 - v1151
		local v1154 = v1152 - v1151
		local v1155 = v_u_11(v_u_11(v1153 / math.max(v1154, 0.0001), 0, 1), 0, 1)
		v1123 = 1 - v1155 * v1155 * v1155 * (v1155 * (v1155 * 6 - 15) + 10)
	end
	local v1156 = v1092.insB <= p1088 and Vector3.new(0, 1, 0) or Vector3.new(0, 0.7, -0.7)
	if not v1122 or v1123 <= 0.002 then
		v1089.left = "grip"
		v1089.leftK = 0
		return v1089
	end
	local v1157 = v1156 and (v1156.Magnitude > 0.0001 and v1156.Unit) or Vector3.new(0, 1, 0)
	local v1158 = v1157.Z
	local v1159 = v1157:Cross(math.abs(v1158) < 0.95 and Vector3.new(0, 0, -1) or Vector3.new(1, 0, 0)).Unit
	local v1160 = CFrame.fromMatrix(v1122, v1159, v1157)
	local v1161 = math.min(v1123, 1)
	v1089.left = v1160
	v1089.leftK = v1161
	return v1089
end
local function v_u_1253(p1163, p1164, p1165) -- name: stringReload
	-- upvalues: (copy) v_u_62, (copy) v_u_589, (copy) v_u_56, (copy) v_u_35, (copy) v_u_5, (copy) v_u_6, (copy) v_u_11, (copy) v_u_7, (copy) v_u_9, (copy) v_u_8
	local v1166 = v_u_62()
	local v1167 = p1164.info
	local v1168 = p1163.T
	local v1169 = v_u_589(p1163, p1165, v_u_56.Crossbow, nil)
	v1166.gun = v1169
	local v1170 = (-2.190000057220459 + 1.701000057220459 * v_u_35({
		{ v1168.pullA, 0 },
		{ v1168.pullB, 1 }
	}, p1165)) * v_u_5
	local v1171 = v_u_6(0, 0.4000000059604645 * v_u_5, v1170)
	if p1165 < v1168.latch then
		v1166.hide.String = true
		v1166.props.StringL = {
			["a"] = Vector3.new(-1.408, 0.4, -2.19) * v_u_5,
			["b"] = v1171
		}
		v1166.props.StringR = {
			["a"] = Vector3.new(1.408, 0.4, -2.19) * v_u_5,
			["b"] = v1171
		}
	end
	local v1172 = v1168.hA
	local v1173 = v1168.hB
	local v1174 = p1165 - v1172
	local v1175 = v1173 - v1172
	local v1176 = v_u_11(v_u_11(v1174 / math.max(v1175, 0.0001), 0, 1), 0, 1)
	local v1177 = v1176 * v1176 * v1176 * (v1176 * (v1176 * 6 - 15) + 10)
	if p1165 < v1168.latch + 0.02 then
		local v1178 = v1171 + Vector3.new(-0.16, 0.04, 0.05)
		if v1178 and v1177 > 0.002 then
			local v1179 = (Vector3.new(1, 0, 0)).Magnitude > 0.0001 and (Vector3.new(1, 0, 0)).Unit or Vector3.new(0, 1, 0)
			local v1180 = v1179.Z
			local v1181 = v1179:Cross(math.abs(v1180) < 0.95 and Vector3.new(0, 0, -1) or Vector3.new(1, 0, 0)).Unit
			local v1182 = CFrame.fromMatrix(v1178, v1181, v1179)
			local v1183 = math.min(v1177, 1)
			v1166.left = v1182
			v1166.leftK = v1183
		else
			v1166.left = "grip"
			v1166.leftK = 0
		end
		local v1184 = v1171 + Vector3.new(0.16, 0.04, 0.05)
		local v1185 = v1168.rHomeA
		local v1186 = v1168.rHomeB
		local v1187 = p1165 - v1185
		local v1188 = v1186 - v1185
		local v1189 = v_u_11(v_u_11(v1187 / math.max(v1188, 0.0001), 0, 1), 0, 1)
		local v1190 = v1177 * (1 - v1189 * v1189 * v1189 * (v1189 * (v1189 * 6 - 15) + 10))
		if v1184 and v1190 > 0.002 then
			local v1191 = (Vector3.new(-1, 0, 0)).Magnitude > 0.0001 and (Vector3.new(-1, 0, 0)).Unit or Vector3.new(0, 1, 0)
			local v1192 = v1191.Z
			local v1193 = v1191:Cross(math.abs(v1192) < 0.95 and Vector3.new(0, 0, -1) or Vector3.new(1, 0, 0)).Unit
			local v1194 = CFrame.fromMatrix(v1184, v1193, v1191)
			local v1195 = math.min(v1190, 1)
			v1166.right = "bolt"
			v1166.rightAt = v1194
			v1166.rightK = v1195
		else
			v1166.right = "grip"
			v1166.rightK = 0
			v1166.rightAt = nil
		end
	else
		local v1196 = v1171 + Vector3.new(0.16, 0.04, 0.05)
		local v1197 = v1168.rHomeA
		local v1198 = v1168.rHomeB
		local v1199 = p1165 - v1197
		local v1200 = v1198 - v1197
		local v1201 = v_u_11(v_u_11(v1199 / math.max(v1200, 0.0001), 0, 1), 0, 1)
		local v1202 = 1 - v1201 * v1201 * v1201 * (v1201 * (v1201 * 6 - 15) + 10)
		if v1196 and v1202 > 0.002 then
			local v1203 = (Vector3.new(-1, 0, 0)).Magnitude > 0.0001 and (Vector3.new(-1, 0, 0)).Unit or Vector3.new(0, 1, 0)
			local v1204 = v1203.Z
			local v1205 = v1203:Cross(math.abs(v1204) < 0.95 and Vector3.new(0, 0, -1) or Vector3.new(1, 0, 0)).Unit
			local v1206 = CFrame.fromMatrix(v1196, v1205, v1203)
			local v1207 = math.min(v1202, 1)
			v1166.right = "bolt"
			v1166.rightAt = v1206
			v1166.rightK = v1207
		else
			v1166.right = "grip"
			v1166.rightK = 0
			v1166.rightAt = nil
		end
	end
	local v1208 = v1167.bolt
	if not v1208 then
		return v1166
	end
	local v1209 = v1169.Rotation:Inverse() * Vector3.new(-0.3, -1.35, 0.3)
	local v1210 = v_u_7(0, 0.16, -0.25)
	local v1211 = v_u_7(0, 0, -0.22)
	local v1212 = v_u_9
	local v1213 = false
	if p1165 < v1168.backA then
		v1213 = true
	elseif p1165 < v1168.backB then
		local v1214 = v_u_7(v1209) * v_u_8(-1.0471975511965976, 0.5235987755982988, 0)
		local v1215 = v1168.backA
		local v1216 = v1168.backB
		local v1217 = p1165 - v1215
		local v1218 = v1216 - v1215
		local v1219 = v_u_11(v_u_11(v1217 / math.max(v1218, 0.0001), 0, 1), 0, 1)
		v1212 = v1214:Lerp(v1210, v1219 * v1219 * v1219 * (v1219 * (v1219 * 6 - 15) + 10))
	elseif p1165 < v1168.layA + (v1168.layB - v1168.layA) * 0.4 then
		local v1220 = v1168.backB
		local v1221 = v1168.layA + (v1168.layB - v1168.layA) * 0.4
		local v1222 = p1165 - v1220
		local v1223 = v1221 - v1220
		local v1224 = 1 - v_u_11(v_u_11(v1222 / math.max(v1223, 0.0001), 0, 1), 0, 1)
		v1212 = v1210:Lerp(v1211, 1 - v1224 * v1224 * v1224)
	elseif p1165 < v1168.layB then
		local v1225 = v_u_9
		local v1226 = v1168.layA + (v1168.layB - v1168.layA) * 0.4
		local v1227 = v1168.layB
		local v1228 = p1165 - v1226
		local v1229 = v1227 - v1226
		local v1230 = v_u_11(v_u_11(v1228 / math.max(v1229, 0.0001), 0, 1), 0, 1)
		v1212 = v1211:Lerp(v1225, v1230 * v1230 * v1230 * (v1230 * (v1230 * 6 - 15) + 10))
	end
	v1166.motors[v1208] = v1212
	if v1213 then
		v1166.hide.Bolt = true
		v1166.hide.BoltVanes = true
	end
	if v1168.latch > p1165 then
		return v1166
	end
	local v1231 = v_u_9
	local v1232 = v1208.C0 * v1231 * v1208.C1:Inverse() * v_u_6(0, 0, -0.5 * v_u_5)
	local v1233 = v1208.C0
	local v1234 = v1233 * v1212 * v1233:Inverse() * v1232
	local v1235, v1236, v1237, v1238, v1239, v1240, v1241, v1242, v1243, v1244, v1245, v1246
	if p1165 < v1168.backA then
		local v1247 = v1171 + v1209
		local v1248 = v1168.awayA
		local v1249 = v1168.awayB
		local v1250 = p1165 - v1248
		local v1251 = v1249 - v1248
		local v1252 = v_u_11(v_u_11(v1250 / math.max(v1251, 0.0001), 0, 1), 0, 1)
		v1235 = v1171:Lerp(v1247, v1252 * v1252 * v1252 * (v1252 * (v1252 * 6 - 15) + 10))
		if v1235 then
			v1236 = v1168.homeA
			v1237 = v1168.homeB
			v1238 = p1165 - v1236
			v1239 = v1237 - v1236
			v1240 = v_u_11(v_u_11(v1238 / math.max(v1239, 0.0001), 0, 1), 0, 1)
			v1241 = 1 - v1240 * v1240 * v1240 * (v1240 * (v1240 * 6 - 15) + 10)
			if not v1235 or v1241 <= 0.002 then
				v1166.left = "grip"
				v1166.leftK = 0
				return v1166
			end
			v1242 = (Vector3.new(0, -1, 0)).Magnitude > 0.0001 and (Vector3.new(0, -1, 0)).Unit or Vector3.new(0, 1, 0)
			v1243 = v1242.Z
			v1244 = v1242:Cross(math.abs(v1243) < 0.95 and Vector3.new(0, 0, -1) or Vector3.new(1, 0, 0)).Unit
			v1245 = CFrame.fromMatrix(v1235, v1244, v1242)
			v1246 = math.min(v1241, 1)
			v1166.left = v1245
			v1166.leftK = v1246
		else
			v1235 = v1234 + Vector3.new(-0.03, 0.11, 0)
			v1236 = v1168.homeA
			v1237 = v1168.homeB
			v1238 = p1165 - v1236
			v1239 = v1237 - v1236
			v1240 = v_u_11(v_u_11(v1238 / math.max(v1239, 0.0001), 0, 1), 0, 1)
			v1241 = 1 - v1240 * v1240 * v1240 * (v1240 * (v1240 * 6 - 15) + 10)
			if not v1235 or v1241 <= 0.002 then
				v1166.left = "grip"
				v1166.leftK = 0
				return v1166
			end
			v1242 = (Vector3.new(0, -1, 0)).Magnitude > 0.0001 and (Vector3.new(0, -1, 0)).Unit or Vector3.new(0, 1, 0)
			v1243 = v1242.Z
			v1244 = v1242:Cross(math.abs(v1243) < 0.95 and Vector3.new(0, 0, -1) or Vector3.new(1, 0, 0)).Unit
			v1245 = CFrame.fromMatrix(v1235, v1244, v1242)
			v1246 = math.min(v1241, 1)
			v1166.left = v1245
			v1166.leftK = v1246
		end
	else
		v1235 = v1234 + Vector3.new(-0.03, 0.11, 0)
		v1236 = v1168.homeA
		v1237 = v1168.homeB
		v1238 = p1165 - v1236
		v1239 = v1237 - v1236
		v1240 = v_u_11(v_u_11(v1238 / math.max(v1239, 0.0001), 0, 1), 0, 1)
		v1241 = 1 - v1240 * v1240 * v1240 * (v1240 * (v1240 * 6 - 15) + 10)
		if not v1235 or v1241 <= 0.002 then
			v1166.left = "grip"
			v1166.leftK = 0
			return v1166
		end
		v1242 = (Vector3.new(0, -1, 0)).Magnitude > 0.0001 and (Vector3.new(0, -1, 0)).Unit or Vector3.new(0, 1, 0)
		v1243 = v1242.Z
		v1244 = v1242:Cross(math.abs(v1243) < 0.95 and Vector3.new(0, 0, -1) or Vector3.new(1, 0, 0)).Unit
		v1245 = CFrame.fromMatrix(v1235, v1244, v1242)
		v1246 = math.min(v1241, 1)
		v1166.left = v1245
		v1166.leftK = v1246
	end
	return v1166
end
local function v_u_1263(p1254, p1255) -- name: shellPhase
	-- upvalues: (copy) v_u_11
	local v1256 = p1254.sh
	local v1257 = v1256.Start
	for v1258 = 0, p1254.n - 1 do
		local v1259 = v1256.Start + v1256.First + v1256.Each * v1258
		if p1255 >= v1259 then
			continue
		end
		local v1260 = v1258 == 0 and v1257 and v1257 or v1259 - v1256.Each
		local v1261 = p1255 - v1260
		local v1262 = v1259 - v1260
		return v1258, v_u_11(v1261 / math.max(v1262, 0.05), 0, 1), v1259
	end
	return p1254.n, 1, v1256.Start + v1256.First + v1256.Each * (p1254.n - 1)
end
local function v_u_1413(p1264, p1265, p1266) -- name: shellReload
	-- upvalues: (copy) v_u_62, (copy) v_u_56, (copy) v_u_11, (copy) v_u_9, (copy) v_u_8, (copy) v_u_1263, (copy) v_u_7, (copy) v_u_457, (copy) v_u_5, (copy) v_u_117, (copy) v_u_10, (copy) v_u_4
	local v1267 = v_u_62()
	local v1268 = p1265.info
	local v1269 = p1264.prof
	local v1270 = p1264.sh
	local v1271 = p1264.dur
	local v1272 = v1269.ins
	local v1273 = v1271 - v1270.End
	local v1274 = v_u_56[v1269.pose] or v_u_56.Tube
	local v1275 = v1270.Start
	local v1276 = math.min(v1275, 0.3)
	local v1277 = v_u_11(v_u_11(p1266 / math.max(v1276, 0.18), 0, 1), 0, 1)
	local v1278 = v1277 * v1277 * v1277 * (v1277 * (v1277 * 6 - 15) + 10)
	local v1279 = v1273 + v1270.End * (p1264.ammo <= 0 and (v1272 == "Tube" or v1272 == "Gate") and 0.6 or 0.25)
	local v1280 = p1266 - v1279
	local v1281 = v1271 - v1279 - 0.02
	local v1282 = v_u_11(v_u_11(v1280 / math.max(v1281, 0.12), 0, 1), 0, 1)
	local v1283 = v1282 * v1282 * v1282 * (v1282 * (v1282 * 6 - 15) + 10)
	local v1284 = v_u_9:Lerp(v1274, v1278):Lerp(v_u_9, v1283)
	local v1285 = p1266 - (v1279 + (v1271 - v1279) * 0.55)
	local v1286 = (v1271 - v1279) * 0.55
	local v1287 = v_u_11(v_u_11(v1285 / math.max(v1286, 0.05), 0, 1), 0, 1) * 3.141592653589793
	local v1288 = math.sin(v1287)
	local v1289 = v1288 * v1288
	local v1290 = v1284 * v_u_8(v1289 * -0.024434609527920613, 0, v1289 * 0.013962634015954637)
	local v1291, v1292 = v_u_1263(p1264, p1266)
	local v1293
	if v1270.Start <= p1266 then
		v1293 = v1291 < p1264.n
	else
		v1293 = false
	end
	local v1294 = v1270.Start + v1270.First
	local v1295 = v1270.Each
	local v1296 = v1291 - 1
	local v1297 = p1266 - (v1294 + v1295 * math.max(v1296, 0))
	if v1291 >= 1 then
		local v1298 = v_u_8
		local v1299
		if v1297 <= 0 then
			v1299 = 0
		else
			local v1300 = -12 * v1297
			local v1301 = math.exp(v1300) * 1
			local v1302 = 22 * v1297
			v1299 = v1301 * math.sin(v1302)
		end
		local v1303 = v1299 * 0.031415926535897934
		local v1304 = 0
		local v1305
		if v1297 <= 0 then
			v1305 = 0
		else
			local v1306 = -12 * v1297
			local v1307 = math.exp(v1306) * 1
			local v1308 = 18 * v1297
			v1305 = v1307 * math.sin(v1308)
		end
		v1290 = v1290 * v1298(v1303, v1304, v1305 * 0.010471975511965976)
	end
	if v1270.Start <= p1266 and (v1291 < p1264.n and v1292 >= 0.78) then
		local v1309 = v_u_11(v_u_11((v1292 - 0.78) / 0.22, 0, 1), 0, 1)
		local v1310 = v1309 * v1309 * v1309
		local v1311 = v1269.ins == "Tube" and 1 or (v1269.ins == "Clip" and -1 or 0.35)
		local v1312 = (v1269.ins == "Gate" or v1269.ins == "Cylinder") and 1 or 0
		v1290 = v1290 * v_u_7(0, v1310 * 0.013 * v1311, v1310 * -0.008 * v1312) * v_u_8(v1310 * 0.031415926535897934 * v1311, v1310 * -0.013962634015954637 * v1312, v1310 * -0.013962634015954637)
	end
	local v1313 = v1290 * v_u_457(p1266, v1278 * (1 - v1283) * 1.1)
	v1267.gun = v1313
	local v1314 = (v1269.port or Vector3.new(0, 0.3, -0.3)) * v_u_5
	local v1315 = "Round"
	local v1316 = false
	local v1317, v1318, v1319, v1320
	if v1272 == "Tube" then
		v1317 = v_u_7(v1314 + Vector3.new(0, -0.03, 0.06))
		v1318 = v_u_7(v1314 + Vector3.new(0, 0.02, -0.16))
		v1319 = Vector3.new(0, -0.1, 0.07)
		v1315 = "Shell1"
		v1320 = Vector3.new(0, 1, 0)
	elseif v1272 == "Gate" then
		v1317 = v_u_7(v1314 + Vector3.new(0.03, 0, 0.16)) * v_u_8(0, 0.13962634015954636, 0)
		v1318 = v_u_7(v1314 + Vector3.new(0, 0, -0.1))
		v1319 = Vector3.new(0.09, -0.03, 0.1)
		v1316 = true
		v1320 = Vector3.new(-0.5, 0.2, -0.85)
	elseif v1272 == "Cylinder" then
		v1317 = v_u_7(v1314 + Vector3.new(0.01, 0, 0.14))
		v1318 = v_u_7(v1314 + Vector3.new(0, 0, -0.03))
		v1319 = Vector3.new(0.08, -0.06, 0.1)
		v1320 = Vector3.new(-0.4, 0.3, -0.85)
	else
		v1314 = Vector3.new(0, 0.33, -0.3) * v_u_5
		v1317 = v_u_7(v1314 + Vector3.new(0, 0.07, 0))
		v1318 = v_u_7(v1314 + Vector3.new(0, -0.07, 0))
		v1319 = Vector3.new(0.03, 0.1, 0.03)
		v1316 = true
		v1320 = Vector3.new(0, -1, 0)
	end
	local v1321 = v_u_7(v1314 + v1313.Rotation:Inverse() * (v1316 and Vector3.new(0.45, -1.3, 0.35) or Vector3.new(-0.3, -1.35, 0.3))) * v_u_8(-0.8726646259971648, 0.4363323129985824, 0)
	local v1322 = 0
	local v1323
	if v1272 == "Clip" then
		local v1324
		if p1266 < v1273 then
			local v1325 = p1266 - v1270.Start * 0.25
			local v1326 = v1270.Start * 0.7
			local v1327 = v_u_11(v_u_11(v1325 / math.max(v1326, 0.1), 0, 1), 0, 1)
			v1324 = v1327 * v1327 * v1327 * (v1327 * (v1327 * 6 - 15) + 10)
		else
			local v1328 = p1266 - v1273
			local v1329 = v1270.End
			local v1330 = v1328 / math.max(v1329, 0.1)
			local v1331 = v_u_11(v_u_11((v1330 - 0.2) / 0.42, 0, 1), 0, 1)
			local v1332 = 1 - v1331 * v1331 * v1331 * (v1331 * (v1331 * 6 - 15) + 10) * 0.5
			local v1333 = v_u_11(v_u_11((v1330 - 0.62) / 0.19999999999999996, 0, 1), 0, 1)
			v1324 = v1332 - v1333 * v1333 * v1333 * (v1333 * (v1333 * 6 - 15) + 10) * 0.5
		end
		v1323 = v_u_117(v1267, p1265, v1324)
		if p1266 < v1270.Start then
			local v1334 = v1270.Start * 0.3
			local v1335 = v_u_11(v_u_11(p1266 / math.max(v1334, 0.05), 0, 1), 0, 1)
			v1322 = v1335 * v1335 * v1335 * (v1335 * (v1335 * 6 - 15) + 10)
		elseif v1273 <= p1266 then
			local v1336 = p1266 - v1273
			local v1337 = v1270.End
			local v1338 = v1336 / math.max(v1337, 0.1)
			local v1339 = v_u_11(v_u_11((v1338 - 0) / 0.2, 0, 1), 0, 1)
			local v1340 = v1339 * v1339 * v1339 * (v1339 * (v1339 * 6 - 15) + 10)
			local v1341 = v_u_11(v_u_11((v1338 - 0.85) / 0.15000000000000002, 0, 1), 0, 1)
			v1322 = v1340 * (1 - v1341 * v1341 * v1341 * (v1341 * (v1341 * 6 - 15) + 10))
		end
	else
		v1323 = nil
	end
	local v1342 = nil
	local v1343 = 0
	local v1344 = nil
	if v1293 then
		local _ = v1291 == 0
		if v1292 < 0.38 then
			local v1345
			if v1317 then
				v1345 = v1317.Position or v1314
			else
				v1345 = v1314
			end
			local v1346 = v1321.Position
			local v1347 = v_u_11(v1292 / 0.38, 0, 1)
			v1342 = v1345:Lerp(v1346, v1347 * v1347 * v1347 * (v1347 * (v1347 * 6 - 15) + 10))
			if v1291 == 0 then
				local v1348 = v_u_11(v1292 / 0.2, 0, 1)
				v1343 = v1348 * v1348 * v1348 * (v1348 * (v1348 * 6 - 15) + 10) or 1
			else
				v1343 = 1
			end
		elseif v1292 < 0.8 then
			local v1349 = v_u_11((v1292 - 0.38) / 0.42, 0, 1)
			v1344 = v1321:Lerp(v1317, v1349 * v1349 * v1349 * (v1349 * (v1349 * 6 - 15) + 10))
			v1343 = 1
		else
			local v1350 = v_u_11((v1292 - 0.8) / 0.2, 0, 1)
			v1344 = v1317:Lerp(v1318, v1350 * v1350 * v1350)
			v1343 = 1
		end
		if v1344 then
			v1342 = (v1344 * v_u_7(v1319)).Position
		end
		if v1272 == "Clip" and (v1291 == 0 and v1292 < 0.38) then
			local v1351 = v1321.Position
			local v1352 = v_u_11(v1292 / 0.38, 0, 1)
			v1342 = (v1323 or v1314):Lerp(v1351, v1352 * v1352 * v1352 * (v1352 * (v1352 * 6 - 15) + 10))
			v1343 = 1
		end
	elseif v1273 <= p1266 and p1264.n <= v1291 then
		local v1353 = p1266 - v1273
		local v1354 = v1270.End
		local v1355 = v1353 / math.max(v1354, 0.1)
		v1342 = v1318.Position
		local v1356 = v_u_11(v_u_11((v1355 - 0.05) / 0.45, 0, 1), 0, 1)
		v1343 = 1 - v1356 * v1356 * v1356 * (v1356 * (v1356 * 6 - 15) + 10)
	elseif p1266 < v1270.Start then
		if v1272 == "Clip" then
			v1343 = v1322
			v1342 = v1323
		end
	end
	if v1344 then
		v1267.props[v1315] = v1344
	end
	if v1272 == "Clip" then
		if p1266 < v1270.Start or v1273 <= p1266 then
			if v1323 and v1322 > 0.002 then
				local v1357 = (Vector3.new(-0.8, -0.6, 0)).Magnitude > 0.0001 and (Vector3.new(-0.8, -0.6, 0)).Unit or Vector3.new(0, 1, 0)
				local v1358 = v1357.Z
				local v1359 = v1357:Cross(math.abs(v1358) < 0.95 and Vector3.new(0, 0, -1) or Vector3.new(1, 0, 0)).Unit
				local v1360 = CFrame.fromMatrix(v1323, v1359, v1357)
				local v1361 = math.min(v1322, 1)
				v1267.right = "bolt"
				v1267.rightAt = v1360
				v1267.rightK = v1361
			else
				v1267.right = "grip"
				v1267.rightK = 0
				v1267.rightAt = nil
			end
		elseif v1342 and v1343 > 0.002 then
			local v1362 = v1320 and (v1320.Magnitude > 0.0001 and v1320.Unit) or Vector3.new(0, 1, 0)
			local v1363 = v1362.Z
			local v1364 = v1362:Cross(math.abs(v1363) < 0.95 and Vector3.new(0, 0, -1) or Vector3.new(1, 0, 0)).Unit
			local v1365 = CFrame.fromMatrix(v1342, v1364, v1362)
			local v1366 = math.min(v1343, 1)
			v1267.right = "bolt"
			v1267.rightAt = v1365
			v1267.rightK = v1366
		else
			v1267.right = "grip"
			v1267.rightK = 0
			v1267.rightAt = nil
		end
	elseif v1316 then
		if v1342 and v1343 > 0.002 then
			local v1367 = v1320 and (v1320.Magnitude > 0.0001 and v1320.Unit) or Vector3.new(0, 1, 0)
			local v1368 = v1367.Z
			local v1369 = v1367:Cross(math.abs(v1368) < 0.95 and Vector3.new(0, 0, -1) or Vector3.new(1, 0, 0)).Unit
			local v1370 = CFrame.fromMatrix(v1342, v1369, v1367)
			local v1371 = math.min(v1343, 1)
			v1267.right = "bolt"
			v1267.rightAt = v1370
			v1267.rightK = v1371
		else
			v1267.right = "grip"
			v1267.rightK = 0
			v1267.rightAt = nil
		end
	elseif v1342 and v1343 > 0.002 then
		local v1372 = v1320 and (v1320.Magnitude > 0.0001 and v1320.Unit) or Vector3.new(0, 1, 0)
		local v1373 = v1372.Z
		local v1374 = v1372:Cross(math.abs(v1373) < 0.95 and Vector3.new(0, 0, -1) or Vector3.new(1, 0, 0)).Unit
		local v1375 = CFrame.fromMatrix(v1342, v1374, v1372)
		local v1376 = math.min(v1343, 1)
		v1267.left = v1375
		v1267.leftK = v1376
	else
		v1267.left = "grip"
		v1267.leftK = 0
	end
	if v1272 == "Cylinder" and v1268.cylinder then
		local v1377
		if v1291 >= 1 then
			local v1378 = v1291 - 1
			local v1379 = v_u_11(v_u_11(v1297 / 0.18, 0, 1), 0, 1)
			v1377 = v1378 + v1379 * v1379 * v1379 * (v1379 * (v1379 * 6 - 15) + 10) or 0
		else
			v1377 = 0
		end
		local v1380 = v1267.motors
		local v1381 = v1268.cylinder
		local v1382 = v_u_8
		local v1383 = p1264.magSize
		v1380[v1381] = v1382(0, 0, v_u_10(360 / math.max(v1383, 1)) * v1377)
		if v1268.hammer then
			local v1384 = v1267.motors
			local v1385 = v1268.hammer
			local v1386 = v_u_8
			local v1387 = v_u_11(v_u_11(p1266 / 0.25, 0, 1), 0, 1)
			local v1388 = v1387 * v1387 * v1387 * (v1387 * (v1387 * 6 - 15) + 10) * 0.3141592653589793
			local v1389 = v_u_11(v_u_11((p1266 - v1273) / 0.2, 0, 1), 0, 1)
			v1384[v1385] = v1386(v1388 * (1 - v1389 * v1389 * v1389 * (v1389 * (v1389 * 6 - 15) + 10)), 0, 0)
		end
	end
	if p1264.ammo <= 0 and (v1273 <= p1266 and (v1272 == "Tube" or v1272 == "Gate")) then
		local v1390 = p1266 - v1273
		local v1391 = v1270.End
		local v1392 = v_u_11((v_u_11(v1390 / math.max(v1391, 0.1), 0, 1) - 0.05) / 0.6499999999999999, 0, 1)
		if v1272 == "Tube" then
			local v1393 = v_u_4.cycle("Pump", p1265, v1392, 1, true)
			for v1394, v1395 in v1393.motors do
				v1267.motors[v1394] = v1395
			end
			local v1396 = v1393.left
			local v1397 = v1393.leftK
			local v1398 = v1393.pumpOffset
			v1267.left = v1396
			v1267.leftK = v1397
			v1267.pumpOffset = v1398
		else
			local v1399 = v_u_4.cycle("Lever", p1265, v1392, 1, true)
			for v1400, v1401 in v1399.motors do
				v1267.motors[v1400] = v1401
			end
			local v1402 = v1399.right
			local v1403 = v1399.rightAt
			local v1404 = v1399.rightK
			v1267.right = v1402
			v1267.rightAt = v1403
			v1267.rightK = v1404
		end
	end
	if p1264.ammo <= 0 and (v1272 == "Tube" and p1266 < v1270.Start) then
		local v1405 = v_u_4.cycle
		local v1406 = v1270.Start * 0.95
		local v1407 = v1405("Pump", p1265, v_u_11(p1266 / math.max(v1406, 0.1), 0, 1), 1, true)
		for v1408, v1409 in v1407.motors do
			v1267.motors[v1408] = v1409
		end
		local v1410 = v1407.left
		local v1411 = v1407.leftK
		local v1412 = v1407.pumpOffset
		v1267.left = v1410
		v1267.leftK = v1411
		v1267.pumpOffset = v1412
	end
	return v1267
end
function v_u_4.reload(p1414, p1415, p1416) -- name: reload
	-- upvalues: (copy) v_u_11, (copy) v_u_1413, (copy) v_u_889, (copy) v_u_986, (copy) v_u_1082, (copy) v_u_1162, (copy) v_u_1253, (copy) v_u_806
	local v1417 = p1414.dur
	local v1418 = v_u_11(p1416 / math.max(v1417, 0.05), 0, 1)
	if p1414.type == "Shell" then
		return v_u_1413(p1414, p1415, p1416)
	elseif p1414.type == "Belt" then
		return v_u_889(p1414, p1415, v1418)
	elseif p1414.type == "Top" then
		return v_u_986(p1414, p1415, v1418)
	elseif p1414.type == "Clip" then
		return v_u_1082(p1414, p1415, v1418)
	elseif p1414.type == "Break" then
		return v_u_1162(p1414, p1415, v1418)
	elseif p1414.type == "String" then
		return v_u_1253(p1414, p1415, v1418)
	else
		return v_u_806(p1414, p1415, v1418)
	end
end
local v_u_1419 = {
	["Bolt"] = 1.05,
	["Pump"] = 0.5,
	["Lever"] = 0.55
}
function v_u_4.cycle(p1420, p1421, p1422, p1423, p1424) -- name: cycle
	-- upvalues: (copy) v_u_62, (copy) v_u_1419, (copy) v_u_11, (copy) v_u_117, (copy) v_u_9, (copy) v_u_59, (copy) v_u_8, (copy) v_u_7, (copy) v_u_457, (copy) v_u_35, (copy) v_u_5, (copy) v_u_60
	local v1425 = v_u_62()
	local v1426 = p1421.info
	local v1427 = p1423 or 1
	local v1428
	if p1424 then
		v1428 = 1
	else
		local v1429 = (v_u_1419[p1420] or 1) / math.max(v1427, 0.05)
		v1428 = math.min(1, v1429)
	end
	local v1430 = v_u_11(p1422 / v1428, 0, 1)
	if p1420 == "Bolt" then
		local v1431
		if v1430 < 0.12 then
			v1431 = 0
		elseif v1430 < 0.26 then
			local v1432 = v_u_11(v_u_11((v1430 - 0.12) / 0.14, 0, 1), 0, 1)
			v1431 = v1432 * v1432 * v1432 * (v1432 * (v1432 * 6 - 15) + 10) * 0.5
		elseif v1430 < 0.42 then
			local v1433 = v_u_11(v_u_11((v1430 - 0.26) / 0.15999999999999998, 0, 1), 0, 1)
			v1431 = v1433 * v1433 * v1433 * (v1433 * (v1433 * 6 - 15) + 10) * 0.5 + 0.5
		elseif v1430 < 0.5 then
			v1431 = 1
		elseif v1430 < 0.64 then
			local v1434 = v_u_11(v_u_11((v1430 - 0.5) / 0.14, 0, 1), 0, 1)
			v1431 = 1 - v1434 * v1434 * v1434 * (v1434 * (v1434 * 6 - 15) + 10) * 0.5
		else
			local v1435 = v_u_11(v_u_11((v1430 - 0.64) / 0.09999999999999998, 0, 1), 0, 1)
			v1431 = 0.5 - v1435 * v1435 * v1435 * (v1435 * (v1435 * 6 - 15) + 10) * 0.5
		end
		local v1436 = v_u_117(v1425, p1421, v1431)
		local v1437 = v_u_11(v_u_11((v1430 - 0) / 0.12, 0, 1), 0, 1)
		local v1438 = v1437 * v1437 * v1437 * (v1437 * (v1437 * 6 - 15) + 10)
		local v1439 = v_u_11(v_u_11((v1430 - 0.74) / 0.18000000000000005, 0, 1), 0, 1)
		local v1440 = v1438 * (1 - v1439 * v1439 * v1439 * (v1439 * (v1439 * 6 - 15) + 10))
		if v1436 and v1440 > 0.002 then
			local v1441 = (Vector3.new(-0.8, -0.6, 0)).Magnitude > 0.0001 and (Vector3.new(-0.8, -0.6, 0)).Unit or Vector3.new(0, 1, 0)
			local v1442 = v1441.Z
			local v1443 = v1441:Cross(math.abs(v1442) < 0.95 and Vector3.new(0, 0, -1) or Vector3.new(1, 0, 0)).Unit
			local v1444 = CFrame.fromMatrix(v1436, v1443, v1441)
			local v1445 = math.min(v1440, 1)
			v1425.right = "bolt"
			v1425.rightAt = v1444
			v1425.rightK = v1445
		else
			v1425.right = "grip"
			v1425.rightK = 0
			v1425.rightAt = nil
		end
		if not p1424 then
			local v1446 = v_u_9
			local v1447 = v_u_59
			local v1448 = v_u_11(v_u_11((v1430 - 0) / 0.16, 0, 1), 0, 1)
			local v1449 = v1446:Lerp(v1447, v1448 * v1448 * v1448 * (v1448 * (v1448 * 6 - 15) + 10))
			local v1450 = v_u_9
			local v1451 = v1428 * 0.7
			local v1452 = p1422 - v1451
			local v1453 = 1 - v1451
			local v1454 = v_u_11(v_u_11(v1452 / math.max(v1453, 0.0001), 0, 1), 0, 1)
			local v1455 = v1449:Lerp(v1450, v1454 * v1454 * v1454 * (v1454 * (v1454 * 6 - 15) + 10))
			local v1456 = v_u_8
			local v1457 = (v1430 - 0.64) * v1427 * v1428
			local v1458
			if v1457 <= 0 then
				v1458 = 0
			else
				local v1459 = -12 * v1457
				local v1460 = math.exp(v1459) * 1
				local v1461 = 22 * v1457
				v1458 = v1460 * math.sin(v1461)
			end
			local v1462 = v1455 * v1456(v1458 * 0.027925268031909273, 0, 0)
			local v1463
			if v1430 < 0.12 or v1430 > 0.29000000000000004 then
				v1463 = 0
			elseif v1430 <= 0.26 then
				local v1464 = v_u_11(v_u_11((v1430 - 0.12) / 0.14, 0, 1), 0, 1)
				v1463 = v1464 * v1464 * v1464
			else
				local v1465 = 1 - v_u_11(v_u_11((v1430 - 0.26) / 0.030000000000000027, 0, 1), 0, 1)
				v1463 = 1 - (1 - v1465 * v1465 * v1465)
			end
			local v1466
			if v1430 < 0.26 or v1430 > 0.45999999999999996 then
				v1466 = 0
			elseif v1430 <= 0.42 then
				local v1467 = v_u_11(v_u_11((v1430 - 0.26) / 0.15999999999999998, 0, 1), 0, 1)
				v1466 = v1467 * v1467 * v1467
			else
				local v1468 = 1 - v_u_11(v_u_11((v1430 - 0.42) / 0.03999999999999998, 0, 1), 0, 1)
				v1466 = 1 - (1 - v1468 * v1468 * v1468)
			end
			local v1469
			if v1430 < 0.5 or v1430 > 0.67 then
				v1469 = 0
			elseif v1430 <= 0.64 then
				local v1470 = v_u_11(v_u_11((v1430 - 0.5) / 0.14, 0, 1), 0, 1)
				v1469 = v1470 * v1470 * v1470
			else
				local v1471 = 1 - v_u_11(v_u_11((v1430 - 0.64) / 0.030000000000000027, 0, 1), 0, 1)
				v1469 = 1 - (1 - v1471 * v1471 * v1471)
			end
			local v1472 = (v1430 - 0.42) * v1427 * v1428
			local v1473
			if v1472 <= 0 then
				v1473 = 0
			else
				local v1474 = -11 * v1472
				local v1475 = math.exp(v1474) * 1
				local v1476 = 20 * v1472
				v1473 = v1475 * math.sin(v1476)
			end
			local v1477 = v1462 * v_u_7(0, 0, v1466 * 0.012 - v1469 * 0.01) * v_u_8(v1466 * -0.013962634015954637 + v1469 * 0.013962634015954637 + v1473 * 0.010471975511965976, v1466 * -0.020943951023931952, v1463 * 0.04363323129985824 + v1473 * 0.017453292519943295)
			local v1478 = v_u_457
			local v1479 = p1422 * v1427
			local v1480 = v_u_11(v_u_11((v1430 - 0) / 0.1, 0, 1), 0, 1)
			local v1481 = v1480 * v1480 * v1480 * (v1480 * (v1480 * 6 - 15) + 10)
			local v1482 = v1428 * 0.7
			local v1483 = p1422 - v1482
			local v1484 = 1 - v1482
			local v1485 = v_u_11(v_u_11(v1483 / math.max(v1484, 0.0001), 0, 1), 0, 1)
			v1425.gun = v1477 * v1478(v1479, v1481 * (1 - v1485 * v1485 * v1485 * (v1485 * (v1485 * 6 - 15) + 10)))
		end
		v1425.ejectU = v1428 * 0.4
		return v1425
	end
	if p1420 ~= "Pump" then
		if p1420 == "Lever" then
			local v1486 = v_u_35({
				{ 0, 0 },
				{ 0.45, 1, "o" },
				{ 0.52, 1 },
				{ 0.92, 0, "io" }
			}, v1430)
			local v1487 = v_u_8(0.8726646259971648 * v1486, 0, 0)
			if v1426.lever then
				v1425.motors[v1426.lever] = v1487
			end
			if v1426.bolt then
				v1425.motors[v1426.bolt] = v_u_7(0, 0, 0.2 * v1486)
			end
			if v1426.hammer then
				v1425.motors[v1426.hammer] = v_u_8(v_u_11(v1486 * 1.4, 0, 1) * 0.5585053606381855, 0, 0)
			end
			if v1426.lever then
				local v1488 = v1426.lever
				local v1489 = Vector3.new(0, -0.24, -0.08) * v_u_5
				local v1490 = v1488.C0
				local v1491 = v1490 * v1487 * v1490:Inverse() * v1489 + Vector3.new(0.02, -0.06, 0.03)
				local v1492 = v_u_11(v_u_11((v1430 - 0) / 0.08, 0, 1), 0, 1)
				local v1493 = v1492 * v1492 * v1492 * (v1492 * (v1492 * 6 - 15) + 10)
				local v1494 = v_u_11(v_u_11((v1430 - 0.9) / 0.09999999999999998, 0, 1), 0, 1)
				local v1495 = v1493 * (1 - v1494 * v1494 * v1494 * (v1494 * (v1494 * 6 - 15) + 10))
				local v1496 = (v1487 * v_u_7(0, 1, 0)).Position
				if v1491 and v1495 > 0.002 then
					local v1497 = v1496 and (v1496.Magnitude > 0.0001 and v1496.Unit) or Vector3.new(0, 1, 0)
					local v1498 = v1497.Z
					local v1499 = v1497:Cross(math.abs(v1498) < 0.95 and Vector3.new(0, 0, -1) or Vector3.new(1, 0, 0)).Unit
					local v1500 = CFrame.fromMatrix(v1491, v1499, v1497)
					local v1501 = math.min(v1495, 1)
					v1425.right = "bolt"
					v1425.rightAt = v1500
					v1425.rightK = v1501
				else
					v1425.right = "grip"
					v1425.rightK = 0
					v1425.rightAt = nil
				end
			end
			if not p1424 then
				local v1502 = (v1430 - 0.45) * v1427 * v1428
				local v1503
				if v1502 <= 0 then
					v1503 = 0
				else
					local v1504 = -12 * v1502
					local v1505 = math.exp(v1504) * 1
					local v1506 = 22 * v1502
					v1503 = v1505 * math.sin(v1506)
				end
				local v1507 = (v1430 - 0.92) * v1427 * v1428
				local v1508
				if v1507 <= 0 then
					v1508 = 0
				else
					local v1509 = -12 * v1507
					local v1510 = math.exp(v1509) * 1
					local v1511 = 22 * v1507
					v1508 = v1510 * math.sin(v1511)
				end
				local v1512 = v_u_9
				local v1513 = v_u_60
				local v1514 = v_u_11(v_u_11((v1430 - 0) / 1, 0, 1), 0, 1) * 3.141592653589793
				local v1515 = math.sin(v1514)
				local v1516 = v1512:Lerp(v1513, v1515 * v1515) * v_u_8(v1503 * -0.020943951023931952 + v1508 * 0.020943951023931952, 0, v1503 * 0.013962634015954637)
				local v1517 = v_u_457
				local v1518 = p1422 * v1427
				local v1519 = v_u_11(v_u_11((v1430 - 0) / 1, 0, 1), 0, 1) * 3.141592653589793
				local v1520 = math.sin(v1519)
				v1425.gun = v1516 * v1517(v1518, v1520 * v1520 * 0.8)
			end
			v1425.ejectU = v1428 * 0.4
		end
		return v1425
	end
	local v1521 = v_u_35({
		{ 0, 0 },
		{ 0.42, 1, "o" },
		{ 0.52, 1 },
		{ 0.9, 0, "io" }
	}, v1430)
	local v1522 = (p1421.pumpTravel or 0.36) * v1521
	if v1426.pump then
		v1425.motors[v1426.pump] = v_u_7(0, 0, v1522)
	end
	if v1426.bolt then
		v1425.motors[v1426.bolt] = v_u_7(0, 0, v1522 * 0.9)
	end
	if v1426.hammer then
		v1425.motors[v1426.hammer] = v_u_8(v_u_11(v1521 * 1.6, 0, 1) * 0.6108652381980153, 0, 0)
	end
	v1425.left = "pump"
	v1425.leftK = 1
	v1425.pumpOffset = v1522
	if not p1424 then
		local v1523 = (v1430 - 0.42) * v1427 * v1428
		local v1524
		if v1523 <= 0 then
			v1524 = 0
		else
			local v1525 = -12 * v1523
			local v1526 = math.exp(v1525) * 1
			local v1527 = 24 * v1523
			v1524 = v1526 * math.sin(v1527)
		end
		local v1528 = (v1430 - 0.9) * v1427 * v1428
		local v1529
		if v1528 <= 0 then
			v1529 = 0
		else
			local v1530 = -12 * v1528
			local v1531 = math.exp(v1530) * 1
			local v1532 = 24 * v1528
			v1529 = v1531 * math.sin(v1532)
		end
		local v1533 = v_u_8(0.04363323129985824 * v1521 + v1524 * 0.024434609527920613 - v1529 * 0.020943951023931952, -0.017453292519943295 * v1521, -0.05235987755982989 * v1521 + v1529 * 0.010471975511965976) * v_u_7(0, 0, 0.02 * v1521 + v1524 * 0.006)
		local v1534 = v_u_457
		local v1535 = p1422 * v1427
		local v1536 = v_u_11(v_u_11((v1430 - 0) / 1, 0, 1), 0, 1) * 3.141592653589793
		local v1537 = math.sin(v1536)
		v1425.gun = v1533 * v1534(v1535, v1537 * v1537 * 0.8)
	end
	v1425.ejectU = v1428 * 0.38
	return v1425
end
function v_u_4.idle(p1538, p1539) -- name: idle
	-- upvalues: (copy) v_u_4, (copy) v_u_62, (copy) v_u_7, (copy) v_u_5
	if p1539 > 0 then
		return nil
	end
	local v1540 = v_u_4.profile(p1538.id, p1538.stats)
	local v1541 = p1538.info
	if v1540.charge == "Release" and v1541.bolt then
		local v1542 = v_u_62()
		local v1543 = v1542.motors
		local v1544 = v1541.bolt
		local v1545 = v_u_7
		local v1546 = 0
		local v1547 = 0
		local v1548 = p1538.boltTravel or 0.3
		local v1549 = p1538.model
		if v1549 then
			v1549 = p1538.model:GetAttribute("BoltTravel")
		end
		if type(v1549) == "number" then
			v1548 = v1549 * v_u_5
		end
		v1543[v1544] = v1545(v1546, v1547, v1548)
		return v1542
	end
	if v1540.ins ~= "String" then
		return nil
	end
	local v1550 = v_u_62()
	local v1551 = v1550.hide
	local v1552 = v1550.hide
	local v1553 = v1550.hide
	v1551.String = true
	v1552.Bolt = true
	v1553.BoltVanes = true
	local v1554 = Vector3.new(-1.408, 0.4, -2.19) * v_u_5
	local v1555 = Vector3.new(1.408, 0.4, -2.19) * v_u_5
	local v1556 = (v1554 + v1555) / 2
	v1550.props.StringL = {
		["a"] = v1554,
		["b"] = v1556
	}
	v1550.props.StringR = {
		["a"] = v1555,
		["b"] = v1556
	}
	return v1550
end
return v_u_4