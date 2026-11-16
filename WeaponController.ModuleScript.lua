-- Decompiled by Executor
-- Path: ReplicatedStorage.Client.Controllers.WeaponController

local v1 = game:GetService("Players")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("CollectionService")
local v_u_5 = require(v_u_3.Shared.Net)
local v6 = require(v_u_3.Shared.Util.Signal)
local v_u_7 = require(v_u_3.Shared.Util.Participant)
local v_u_8 = require(v_u_3.Shared.Util.Units)
local v_u_9 = require(v_u_3.Shared.Config.WeaponConfig)
local v_u_10 = require(v_u_3.Shared.Config.AnimConfig)
local v_u_11 = require(v_u_3.Shared.Config.AudioConfig)
local v_u_12 = require(v_u_3.Shared.Config.DamageConfig)
local v_u_13 = require(v_u_3.Shared.Combat.Ballistics)
local v_u_14 = require(v_u_3.Shared.Combat.Hitbox)
local v_u_15 = require(v_u_3.Shared.Combat.WeaponStats)
local v16 = require
local v17 = v_u_3.Shared.Combat.VehicleFire
local v18, v_u_19 = pcall(v16, v17)
local v_u_20 = require(v_u_3.Shared.Combat.FlareSky)
if not v18 then
	v_u_19 = nil
end
local v_u_21 = {
	["Changed"] = v6.new(),
	["HitMarker"] = v6.new(),
	["Fired"] = v6.new()
}
local v_u_22 = v1.LocalPlayer
local v_u_23 = Random.new()
local v_u_24 = {}
local v_u_25 = nil
local v_u_26 = {}
local function v_u_36(p27, p28, ...) -- name: call
	-- upvalues: (copy) v_u_26
	local v29 = v_u_26[p27]
	if not v29 then
		local v30 = script.Parent:FindFirstChild(p27)
		if v30 then
			local v31 = require
			local v32
			v32, v29 = pcall(v31, v30)
			if v32 and type(v29) == "table" then
				v_u_26[p27] = v29
			else
				v29 = nil
			end
		else
			v29 = nil
		end
	end
	if v29 then
		v29 = v29[p28]
	end
	if type(v29) == "function" then
		local v33, v34, v35 = pcall(v29, ...)
		if v33 then
			return v34, v35
		else
			return nil
		end
	else
		return nil
	end
end
local v_u_37 = nil
local function v_u_46() -- name: anim
	-- upvalues: (copy) v_u_22, (ref) v_u_37, (copy) v_u_3
	local v38 = v_u_22.Character
	if not v38 then
		return nil
	end
	local v39 = not v_u_37 and v_u_3.Shared.Util:FindFirstChild("CharAnim")
	if v39 then
		local v40 = require
		local v41, v42 = pcall(v40, v39)
		if v41 then
			v_u_37 = v42
		end
	end
	if not v_u_37 then
		return nil
	end
	local v43 = v_u_37.get
	local v44, v45 = pcall(v43, v38)
	return v44 and v45 and v45 or nil
end
local function v_u_57(p47, p48, p_u_49, p50) -- name: playAnim
	-- upvalues: (copy) v_u_46, (copy) v_u_10
	local v51 = v_u_46()
	if p47 then
		p47 = v_u_10.Weapons[p47]
	end
	if p47 then
		p47 = p47[p48]
	end
	if not (v51 and p47) then
		return nil
	end
	local v52 = v51.play
	local v53 = {
		["priority"] = Enum.AnimationPriority.Action2,
		["fade"] = p50 or 0.08
	}
	local v54, v_u_55 = pcall(v52, v51, p47, v53)
	if not (v54 and v_u_55) then
		return nil
	end
	if p_u_49 and p_u_49 > 0 then
		task.spawn(function()
			-- upvalues: (copy) v_u_55, (copy) p_u_49
			local v56 = os.clock()
			while v_u_55.Length <= 0 and os.clock() - v56 < 1 do
				task.wait()
			end
			if v_u_55.Length > 0 and v_u_55.IsPlaying then
				v_u_55:AdjustSpeed(v_u_55.Length / p_u_49)
			end
		end)
	end
	return v_u_55
end
local v_u_58 = {
	["slot"] = nil,
	["weaponId"] = nil,
	["uid"] = nil,
	["sig"] = nil,
	["stats"] = nil,
	["ammo"] = 0,
	["fireMode"] = nil,
	["zeroing"] = 100,
	["reloading"] = false,
	["reloadKind"] = nil,
	["reloadStart"] = 0,
	["reloadDur"] = 0,
	["reloadToken"] = 0,
	["readyAt"] = 0,
	["trigger"] = false,
	["pendingSemi"] = false,
	["burstLeft"] = 0,
	["nextShot"] = 0,
	["lastShot"] = -10,
	["sprayCount"] = 0,
	["sprayPitch0"] = 0,
	["recoilAccum"] = 0,
	["recovering"] = 0,
	["hDrift"] = 0,
	["bloom"] = 0,
	["shotId"] = 0,
	["pumpCount"] = 0,
	["breath"] = 1,
	["holding"] = false,
	["holdKey"] = false,
	["exhausted"] = false,
	["swayT"] = 0,
	["swayOff"] = Vector2.zero,
	["varZoom"] = nil
}
local v_u_59 = {}
local v_u_60 = -10
local v_u_61 = 0
local v_u_62 = 0
local v_u_63 = nil
local v_u_64 = 0
local v_u_65 = nil
local v_u_66 = nil
local v_u_67 = false
local function v_u_78() -- name: pushADS
	-- upvalues: (copy) v_u_58, (copy) v_u_36
	local v68 = v_u_58.stats
	if v68 and v68.isGun then
		local v69 = v68.hfov or 70
		if v68.variable and v_u_58.varZoom then
			local v70 = 0.7002075382097097 / v_u_58.varZoom
			local v71 = math.atan(v70) * 2
			v69 = math.deg(v71)
		end
		local v72 = v_u_36
		local v73 = "CameraController"
		local v74 = "setADSOptions"
		local v75 = {
			["fov"] = v69
		}
		local v76 = v_u_58.stats
		local v77
		if v76 then
			if v76.variable and v_u_58.varZoom then
				v77 = v_u_58.varZoom
			else
				v77 = v76.zoom or 1
			end
		else
			v77 = 1
		end
		v75.zoom = v77 < 1.6 and 1 or (v77 < 2.5 and 2 or (v77 < 3.5 and 3 or (v77 < 5 and 4 or (v77 < 7 and 6 or (v77 < 11 and 8 or 15)))))
		v75.time = v68.adsTime
		v75.scope = v68.scopeMask
		v72(v73, v74, v75)
	end
end
local function v_u_94() -- name: canFire
	-- upvalues: (copy) v_u_22, (copy) v_u_58, (copy) v_u_7, (ref) v_u_25, (ref) v_u_60, (ref) v_u_19, (copy) v_u_36
	local v79 = v_u_22.Character
	if not (v79 and v79.Parent) then
		v79 = nil
	end
	if not v79 then
		return false
	end
	local v80
	if v_u_58.stats == nil then
		v80 = false
	else
		v80 = v_u_58.stats.isGun == true
	end
	if not v80 then
		return false
	end
	if not v_u_7.isStanding(v79) or (v79:GetAttribute("Deploy") ~= nil or v79:GetAttribute("UsingItem") ~= nil) then
		return false
	end
	local v81 = v_u_25 and v_u_25.getContext() or "Game"
	if v81 ~= "Game" and v81 ~= "Vehicle" then
		return false
	end
	if os.clock() < v_u_58.readyAt then
		return false
	end
	if v_u_58.reloading and v_u_58.reloadKind ~= "Shell" then
		return false
	end
	if v79:GetAttribute("Sprinting") == true or os.clock() - v_u_60 < 0.16 then
		return false
	end
	local v82
	if v79 == nil then
		v82 = false
	else
		v82 = v79:GetAttribute("InVehicle") == true
	end
	if v82 then
		v82 = v79:GetAttribute("VehicleSeat") == 1
	end
	if v82 and v_u_58.slot ~= "Pistol" then
		return false
	end
	if not v_u_19 then
		return true
	end
	local v83
	if v79 == nil then
		v83 = false
	else
		v83 = v79:GetAttribute("InVehicle") == true
	end
	if not v83 then
		return true
	end
	local v84
	if v79 == nil then
		v84 = false
	else
		v84 = v79:GetAttribute("InVehicle") == true
	end
	if v84 then
		v84 = v79:GetAttribute("VehicleSeat") == 1
	end
	if v84 then
		if not v_u_19.Config.DriverCanShoot then
			return false
		end
		return true
	end
	local v85, v86 = v_u_19.firing(v79)
	if v86 then
		v86 = v86.PrimaryPart
	end
	if not (v85 and v86) then
		return false
	end
	local v87 = v_u_22.Character
	if not (v87 and v87.Parent) then
		v87 = nil
	end
	local v88
	if v87 == nil then
		v88 = false
	else
		v88 = v87:GetAttribute("InVehicle") == true
	end
	local v89, v90, v91, v92
	if v88 then
		local v93
		v93, v89 = v_u_36("VehicleController", "getAimRay")
		if v93 and v89 then
			if v89 then
				v90, v91 = v_u_19.angles(v_u_19.flat(v86.CFrame), v89)
				if not v_u_19.inArc(v85, v90, v91, v_u_19.Config.SoftOver or 10) then
					return false
				end
			end
		else
			v92, v89 = v_u_36("CameraController", "getAimRay")
			if v89 then
				v90, v91 = v_u_19.angles(v_u_19.flat(v86.CFrame), v89)
				if not v_u_19.inArc(v85, v90, v91, v_u_19.Config.SoftOver or 10) then
					return false
				end
			end
		end
	else
		v92, v89 = v_u_36("CameraController", "getAimRay")
		if v89 then
			v90, v91 = v_u_19.angles(v_u_19.flat(v86.CFrame), v89)
			if not v_u_19.inArc(v85, v90, v91, v_u_19.Config.SoftOver or 10) then
				return false
			end
		end
	end
	return true
end
local v_u_95 = -10
local v_u_96 = {
	["t"] = -1,
	["blocked"] = false
}
local function v_u_113() -- name: flareAim
	-- upvalues: (copy) v_u_58, (copy) v_u_22, (copy) v_u_36, (copy) v_u_96, (copy) v_u_20
	local v97 = v_u_58.stats
	if not (v97 and v97.flare) then
		return false, true, 0, nil
	end
	local v98 = v_u_22.Character
	if not (v98 and v98.Parent) then
		v98 = nil
	end
	local v99
	if v98 == nil then
		v99 = false
	else
		v99 = v98:GetAttribute("InVehicle") == true
	end
	local v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v111, v112
	if v99 then
		v100, v101 = v_u_36("VehicleController", "getAimRay")
		if v100 and v101 then
			if typeof(v101) ~= "Vector3" or v101.Magnitude < 0.001 then
				v101 = workspace.CurrentCamera.CFrame.LookVector
			end
			v102 = v101.Unit.Y
			v103 = math.clamp(v102, -1, 1)
			v104 = math.asin(v103)
			v105 = math.deg(v104)
			v106 = v97.cfg
			if v106 then
				v106 = v97.cfg.MinAimPitch
			end
			if v105 < (tonumber(v106) or 45) then
				return true, false, v105, "pitch"
			else
				v107 = os.clock()
				if v107 - v_u_96.t > 0.1 then
					v_u_96.t = v107
					v108 = v_u_22.Character
					if v108 then
						v109 = v108:FindFirstChild("Head")
					else
						v109 = v108
					end
					v110 = v_u_96
					v111 = v_u_20.blocked
					v112 = v109 and v109.Position or nil
					if typeof(v100) ~= "Vector3" then
						v100 = nil
					end
					v110.blocked = v111(v112, v100, v101, v108)
				end
				if v_u_96.blocked then
					return true, false, v105, "cover"
				else
					return true, true, v105, nil
				end
			end
		else
			v100, v101 = v_u_36("CameraController", "getAimRay")
			if typeof(v101) ~= "Vector3" or v101.Magnitude < 0.001 then
				v101 = workspace.CurrentCamera.CFrame.LookVector
			end
			v102 = v101.Unit.Y
			v103 = math.clamp(v102, -1, 1)
			v104 = math.asin(v103)
			v105 = math.deg(v104)
			v106 = v97.cfg
			if v106 then
				v106 = v97.cfg.MinAimPitch
			end
			if v105 < (tonumber(v106) or 45) then
				return true, false, v105, "pitch"
			else
				v107 = os.clock()
				if v107 - v_u_96.t > 0.1 then
					v_u_96.t = v107
					v108 = v_u_22.Character
					if v108 then
						v109 = v108:FindFirstChild("Head")
					else
						v109 = v108
					end
					v110 = v_u_96
					v111 = v_u_20.blocked
					v112 = v109 and v109.Position or nil
					if typeof(v100) ~= "Vector3" then
						v100 = nil
					end
					v110.blocked = v111(v112, v100, v101, v108)
				end
				if v_u_96.blocked then
					return true, false, v105, "cover"
				else
					return true, true, v105, nil
				end
			end
		end
	else
		v100, v101 = v_u_36("CameraController", "getAimRay")
		if typeof(v101) ~= "Vector3" or v101.Magnitude < 0.001 then
			v101 = workspace.CurrentCamera.CFrame.LookVector
		end
		v102 = v101.Unit.Y
		v103 = math.clamp(v102, -1, 1)
		v104 = math.asin(v103)
		v105 = math.deg(v104)
		v106 = v97.cfg
		if v106 then
			v106 = v97.cfg.MinAimPitch
		end
		if v105 < (tonumber(v106) or 45) then
			return true, false, v105, "pitch"
		else
			v107 = os.clock()
			if v107 - v_u_96.t > 0.1 then
				v_u_96.t = v107
				v108 = v_u_22.Character
				if v108 then
					v109 = v108:FindFirstChild("Head")
				else
					v109 = v108
				end
				v110 = v_u_96
				v111 = v_u_20.blocked
				v112 = v109 and v109.Position or nil
				if typeof(v100) ~= "Vector3" then
					v100 = nil
				end
				v110.blocked = v111(v112, v100, v101, v108)
			end
			if v_u_96.blocked then
				return true, false, v105, "cover"
			else
				return true, true, v105, nil
			end
		end
	end
end
v_u_21.flareAim = v_u_113
local function v_u_133() -- name: currentSpread
	-- upvalues: (copy) v_u_58, (copy) v_u_36, (copy) v_u_22, (copy) v_u_9, (copy) v_u_8
	-- control flow flattened: this region could not be structured without a goto (unsupported in Luau), so it was lowered to the state-machine dispatch loop below to keep the output runnable.
	local v114, v115, v116, v117, v118, v119, v120, v121, v122, v123, v124, v125, v126, v127, v128, v129, v130, v131
	local v132 = 9
	while true do
		if v132 == 1 then
			v129 = v121:GetAttribute("Stance")
			if v129 == "Crouch" then
				v118 = v118 * v122.Crouch
			elseif v129 == "Prone" then
				v118 = v118 * v122.Prone
			end
			if v121:GetAttribute("InVehicle") == true then
				v118 = v118 * v122.VehicleSpread
			end
			v132 = 2
		elseif v132 == 2 then
			if v127 == "ADS" then
				v118 = 1 + (v118 - 1) * v122.ADSMoveScale
			end
			return v128 * v118 * (1 + v_u_58.bloom)
		elseif v132 == 3 then
			v130 = v_u_8.toMeters(v115)
			if v130 > 0.25 then
				if v130 <= 1.7 then
					v118 = 1 + (v122.Walk - 1) * (v130 / 1.7)
				else
					v119 = v122.Walk
					v131 = v122.Run - v122.Walk
					v114 = (v130 - 1.7) / 3
					v118 = v119 + v131 * math.clamp(v114, 0, 1)
				end
			end
			v132 = 1
		elseif v132 == 4 then
			v129 = v121:GetAttribute("Stance")
			if v129 == "Crouch" then
				v118 = v118 * v122.Crouch
			elseif v129 == "Prone" then
				v118 = v118 * v122.Prone
			end
			if v121:GetAttribute("InVehicle") == true then
				v118 = v118 * v122.VehicleSpread
			end
			v132 = 2
		elseif v132 == 5 then
			v120 = v123.AssemblyLinearVelocity
			v115 = Vector2.new(v120.X, v120.Z).Magnitude
			if v116.FloorMaterial == Enum.Material.Air then
				v132 = 6
			else
				v132 = 7
			end
		elseif v132 == 6 then
			v124 = v120.Y
			if math.abs(v124) > 2 then
				v132 = 8
			else
				v132 = 3
			end
		elseif v132 == 7 then
			v130 = v_u_8.toMeters(v115)
			if v130 > 0.25 then
				if v130 <= 1.7 then
					v118 = 1 + (v122.Walk - 1) * (v130 / 1.7)
				else
					v119 = v122.Walk
					v131 = v122.Run - v122.Walk
					v114 = (v130 - 1.7) / 3
					v118 = v119 + v131 * math.clamp(v114, 0, 1)
				end
			end
			v132 = 1
		elseif v132 == 8 then
			v118 = v122.Jump
			v129 = v121:GetAttribute("Stance")
			if v129 == "Crouch" then
				v118 = v118 * v122.Crouch
			elseif v129 == "Prone" then
				v118 = v118 * v122.Prone
			end
			if v121:GetAttribute("InVehicle") == true then
				v118 = v118 * v122.VehicleSpread
			end
			v132 = 2
		else
			v125 = v_u_58.stats
			if not (v125 and v125.isGun) then
				return 0
			end
			v126 = v125.spread
			v117 = v_u_36("CameraController", "getMode") or "TPP"
			v127 = v117 == "Vehicle" and v_u_36("CameraController", "isADS") == true and "ADS" or v117
			v128 = v126.Hip * (v127 == "ADS" and v126.ADS or (v127 == "Aim" and v126.Aim or 1))
			v121 = v_u_22.Character
			if not (v121 and v121.Parent) then
				v121 = nil
			end
			v122 = v_u_9.MoveSpread
			v118 = 1
			if not v121 then
				if v127 == "ADS" then
					v118 = 1 + (v118 - 1) * v122.ADSMoveScale
				end
				return v128 * v118 * (1 + v_u_58.bloom)
			end
			v123 = v121:FindFirstChild("HumanoidRootPart")
			v116 = v121:FindFirstChildOfClass("Humanoid")
			if v123 and v116 then
				v132 = 5
			else
				v132 = 4
			end
		end
	end
end
local function v_u_142(p134, p135) -- name: patternAt
	local v136 = p134[1]
	if p135 <= v136[1] then
		return v136[2]
	end
	for v137 = 2, #p134 do
		local v138 = p134[v137]
		if p135 <= v138[1] then
			local v139 = p135 - v136[1]
			local v140 = v138[1] - v136[1]
			local v141 = v139 / math.max(v140, 1)
			return v136[2] + (v138[2] - v136[2]) * v141
		end
		v136 = v138
	end
	return v136[2]
end
local function v_u_194(p143) -- name: applyRecoil
	-- upvalues: (copy) v_u_22, (copy) v_u_36, (copy) v_u_9, (copy) v_u_58, (copy) v_u_142, (copy) v_u_23
	local v144 = p143.recoil
	local v145 = v144.Feel or {}
	local v146 = v_u_22.Character
	if not (v146 and v146.Parent) then
		v146 = nil
	end
	local v147
	if v146 then
		v147 = v146:GetAttribute("Stance")
	else
		v147 = v146
	end
	local v148 = v147 == "Crouch" and v144.Crouch or v147 == "Prone" and v144.Prone or (v144.Stand or 1)
	local v149 = v_u_36("CameraController", "getMode") or "TPP"
	local v150 = v_u_9.RecoilScale or {}
	local v151
	if v149 == "ADS" then
		v151 = v150.ADS or 1
	elseif v149 == "Aim" then
		v151 = v150.Aim or 0.85
	else
		v151 = v150.Hip or 0.7
	end
	local v152 = v151 * (v150.All or 1)
	local v153 = v_u_58.sprayCount + 1
	local v154 = v144.Ramp[1] or 10
	local v155 = (v144.Ramp[2] or 1.15) - 1
	local v156 = v153 - 1
	local v157 = v154 - 1
	local v158 = v156 / math.max(v157, 1)
	local v159 = 1 + v155 * math.clamp(v158, 0, 1)
	local v160 = v153 == 1 and (v144.First or 1) or 1
	local v161 = v146 and v146:GetAttribute("InVehicle") == true and (v_u_9.MoveSpread.VehicleRecoil or 1) or 1
	local v162 = v148 * v152 * v161
	local v163 = v144.V * v159 * v160 * v162
	if v153 == 1 then
		v_u_58.hDrift = 0
	end
	local v164 = v144.Pattern
	local v165
	if type(v164) == "table" and #v144.Pattern > 0 then
		v165 = v_u_142(v144.Pattern, v153)
	else
		local v166 = v145.Freq or 0.25
		local v167 = v145.Phase or 0
		local v168 = v144.H * (v145.Wander or 0.8)
		local v169 = v153 * v166 + v167
		local v170 = math.sin(v169) * 0.75
		local v171 = v153 * v166 * 3.1 + (v145.Phase2 or 1)
		v165 = v168 * (v170 + math.sin(v171) * 0.35)
	end
	local v172 = v145.Drift or 0.5
	local v173 = math.clamp(v172, 0, 0.95)
	local v174 = v_u_58
	local v175 = v_u_58.hDrift * v173
	local v176 = (v_u_23:NextNumber() * 2 - 1) * v144.H * (1 - v173 * 0.45)
	local v177 = 0.55 + v153 * 0.09
	v174.hDrift = v175 + v176 * math.min(1, v177)
	local v178 = v144.H * 2.2
	local v179 = v_u_58
	local v180 = v_u_58.hDrift
	local v181 = -v178
	v179.hDrift = math.clamp(v180, v181, v178)
	local v182 = (v144.Bias + v165 + v_u_58.hDrift) * v162
	local v183 = v145.Climb or 0.7
	local v184 = math.clamp(v183, 0.1, 1)
	if v153 == 1 then
		v_u_58.sprayPitch0 = v_u_36("CameraController", "getPitch") or 0
		v_u_58.recoilAccum = 0
	end
	local v185 = v_u_58
	v185.recoilAccum = v185.recoilAccum + v163 * v184
	v_u_58.recovering = 0
	local v186 = v163 * v184
	local v187 = v182 * v184
	local v188 = v_u_22.Character
	if not (v188 and v188.Parent) then
		v188 = nil
	end
	local v189
	if v188 == nil then
		v189 = false
	else
		v189 = v188:GetAttribute("InVehicle") == true
	end
	if v189 then
		v_u_36("VehicleController", "addRecoil", v186, v187)
	else
		v_u_36("CameraController", "addRecoil", v186, v187)
	end
	local v190
	if v146 == nil then
		v190 = false
	else
		v190 = v146:GetAttribute("InVehicle") == true
	end
	if not v190 then
		local v191 = v144.KickMul or 1
		local v192 = v182 >= 0 and 1 or -1
		if v_u_23:NextNumber() < 0.3 then
			v192 = -v192
		end
		local v193 = (v145.Roll or 1) * v191 * v192 * (0.55 + v_u_23:NextNumber() * 0.45)
		v_u_36("CameraController", "kick", v163 * (1 - v184) * 1.6 + (v153 == 1 and (v163 * 0.25 or 0) or 0), v182 * (1 - v184) * 1.4, v193, v145.KickSpeed, v145.KickDamp)
		v_u_36("CameraController", "shake", (v145.Shake or v144.Kick * 0.12) * v191)
	end
	return v182
end
local v_u_195 = RaycastParams.new()
v_u_195.FilterType = Enum.RaycastFilterType.Exclude
v_u_195.IgnoreWater = false
local v_u_196 = RaycastParams.new()
v_u_196.FilterType = Enum.RaycastFilterType.Include
local function v_u_209() -- name: refreshParams
	-- upvalues: (copy) v_u_26, (copy) v_u_22, (copy) v_u_36, (copy) v_u_195, (copy) v_u_14, (ref) v_u_19
	local v197 = v_u_26.BallisticsFx
	if not v197 then
		local v198 = script.Parent:FindFirstChild("BallisticsFx")
		if v198 then
			local v199 = require
			local v200
			v200, v197 = pcall(v199, v198)
			if v200 and type(v197) == "table" then
				v_u_26.BallisticsFx = v197
			else
				v197 = nil
			end
		else
			v197 = nil
		end
	end
	local v201 = v_u_22.Character
	local v202
	if v201 == nil then
		v202 = false
	else
		v202 = v201:GetAttribute("InVehicle") == true
	end
	local v203 = v202 and v_u_36("VehicleController", "getVehicle") or nil
	if v197 and v197.excludeList then
		v_u_195.FilterDescendantsInstances = v197.excludeList(v203)
	else
		local v204 = {}
		if v_u_22.Character then
			local v205 = v_u_22.Character
			table.insert(v204, v205)
		end
		local v206 = workspace.CurrentCamera
		table.insert(v204, v206)
		v_u_14.addGhosts(v204)
		v_u_195.FilterDescendantsInstances = v204
	end
	if v203 and v_u_19 then
		local v207 = v_u_195.FilterDescendantsInstances
		for _, v208 in v_u_19.occupants(v203) do
			table.insert(v207, v208)
		end
		v_u_195.FilterDescendantsInstances = v207
	end
end
local function v_u_247(p210, p211, p212, p213) -- name: stepSegment
	-- upvalues: (copy) v_u_13, (copy) v_u_195, (copy) v_u_14, (ref) v_u_19, (copy) v_u_7, (copy) v_u_22, (copy) v_u_4, (copy) v_u_24, (copy) v_u_26, (copy) v_u_12, (copy) v_u_196
	local v214 = p213 - p212
	local v215 = v_u_13.position(p210.origin, p210.dir, p211.v0, p211.drag, p212)
	local v216 = v_u_13.position(p210.origin, p210.dir, p211.v0, p211.drag, p213)
	local v217 = v215
	local v218 = 0
	local v219 = false
	while v218 < 8 do
		v218 = v218 + 1
		local v220 = v216 - v215
		local v221 = v220.Magnitude >= 0.001 and workspace:Raycast(v215, v220, v_u_195)
		if not v221 then
			break
		end
		local v222 = v221.Instance
		if v_u_14.passThrough(v222) then
			v215 = v221.Position + v220.Unit * 0.05
		else
			local v223
			if v_u_19 and not v_u_7.fromPart(v222) then
				local v224, v225
				v223, v224, v225 = v_u_19.throughHit(v222, v221.Position, v220, 20, v_u_22.Character)
				if v223 and (v224 and v225) then
					v221 = {
						["Instance"] = v223,
						["Position"] = v224,
						["Normal"] = v225,
						["Material"] = v223.Material
					}
				else
					v223 = v222
				end
			else
				v223 = v222
			end
			local v226 = (v221.Position - v217).Magnitude
			local v227 = (v216 - v217).Magnitude
			local v228 = v226 / math.max(v227, 0.0001)
			local v229 = p212 + v214 * math.clamp(v228, 0, 1)
			if not v_u_4:HasTag(v223, "Glass") then
				local v230 = v_u_7.fromPart(v223)
				local v231 = v_u_26.BallisticsFx
				if not v231 then
					local v232 = script.Parent:FindFirstChild("BallisticsFx")
					if v232 then
						local v233 = require
						local v234
						v234, v231 = pcall(v233, v232)
						if v234 and type(v231) == "table" then
							v_u_26.BallisticsFx = v231
						else
							v231 = nil
						end
					else
						v231 = nil
					end
				end
				if not v230 or (v230 == v_u_22.Character or not v_u_12.friendlyBlocked(v_u_22.Character, v230, "Bullet")) then
					if v230 and v230 ~= v_u_22.Character then
						local v235 = p211.damageClass or (p211.class or "AR")
						local v236 = v_u_14.zoneFor(v230, v223, v221.Position)
						local v237 = v221.Position
						local v238
						if v_u_14.isLimb(v236) then
							v_u_196.FilterDescendantsInstances = { v230 }
							local v239 = v_u_13.velocity(p210.dir, p211.v0, p211.drag, v229).Unit
							local v240 = workspace:Raycast(v221.Position + v239 * 0.02, v239 * 4, v_u_196)
							if v240 then
								local v241 = v_u_14.zoneFor(v230, v240.Instance, v240.Position)
								if v_u_14.mult(v235, v241) > v_u_14.mult(v235, v236) then
									v238 = v240.Instance
									v237 = v240.Position
								else
									v238 = v223
								end
							else
								v238 = v223
							end
						else
							v238 = v223
						end
						if p210.claims then
							v_u_24.Hit:FireServer({
								["shotId"] = p210.id,
								["part"] = v238,
								["hitPos"] = v237,
								["hitNormal"] = v221.Normal,
								["fly"] = v229,
								["pellet"] = p210.pellet
							})
						end
						if v231 then
							v231.impact(v221.Position, v221.Normal, nil, v223, {
								["flesh"] = true
							})
						end
					else
						local v242 = workspace:FindFirstChild("Vehicles")
						if p210.claims and (v242 and v223:IsDescendantOf(v242)) then
							v_u_24.Hit:FireServer({
								["shotId"] = p210.id,
								["part"] = v223,
								["hitPos"] = v221.Position,
								["hitNormal"] = v221.Normal,
								["fly"] = v229,
								["pellet"] = p210.pellet
							})
						end
						if v231 then
							v231.impact(v221.Position, v221.Normal, v221.Material, v223, {})
						end
					end
				end
				if v231 and p210.tr then
					v231.stopTracer(p210.tr, v229)
				end
				return true
			end
			if p210.claims then
				v_u_24.Hit:FireServer({
					["shotId"] = p210.id,
					["part"] = v223,
					["hitPos"] = v221.Position,
					["hitNormal"] = v221.Normal,
					["fly"] = v229,
					["pellet"] = p210.pellet
				})
			end
			local v243 = v_u_26.BallisticsFx
			if not v243 then
				local v244 = script.Parent:FindFirstChild("BallisticsFx")
				if v244 then
					local v245 = require
					local v246
					v246, v243 = pcall(v245, v244)
					if v246 and type(v243) == "table" then
						v_u_26.BallisticsFx = v243
					else
						v243 = nil
					end
				else
					v243 = nil
				end
			end
			if v243 then
				v243.impact(v221.Position, v221.Normal, Enum.Material.Glass, v223, {})
			end
			v215 = v221.Position + v220.Unit * 0.05
		end
	end
	return v219
end
local function v_u_260(_) -- name: stepBullets
	-- upvalues: (copy) v_u_59, (copy) v_u_209, (copy) v_u_13, (copy) v_u_247
	if #v_u_59 ~= 0 then
		v_u_209()
		local v248 = os.clock()
		for v249 = #v_u_59, 1, -1 do
			local v250 = v_u_59[v249]
			local v251 = v250.stats
			local v252 = v248 - v250.c0
			local v253 = v250.maxT
			local v254 = math.min(v252, v253)
			local v255 = false
			local v256 = 0
			while not v255 and (v250.t < v254 - 0.00001 and v256 < 8) do
				v256 = v256 + 1
				local v257 = v250.t
				local v258 = v257 + v_u_13.MAX_SEG
				local v259 = math.min(v254, v258)
				v250.t = v259
				v255 = v_u_247(v250, v251, v257, v259)
			end
			if not v255 and v250.t < v250.maxT - 0.00001 then
				break
			end
			table.remove(v_u_59, v249)
		end
	end
end
local function v_u_341() -- name: fireOne
	-- upvalues: (copy) v_u_58, (copy) v_u_22, (copy) v_u_36, (ref) v_u_62, (copy) v_u_209, (copy) v_u_195, (copy) v_u_13, (copy) v_u_15, (copy) v_u_133, (copy) v_u_23, (copy) v_u_24, (copy) v_u_26, (copy) v_u_59, (copy) v_u_194, (copy) v_u_57, (copy) v_u_21
	local v_u_261 = v_u_58.stats
	local v262 = v_u_22.Character
	if not (v262 and v262.Parent) then
		v262 = nil
	end
	if not (v_u_261 and v262) then
		return
	end
	v_u_36("MovementController", "cancelSprint", 0.35)
	local v263 = v_u_62 + 0.35
	v_u_62 = math.min(v263, 1.5)
	local v264 = workspace.CurrentCamera
	local v265 = v_u_36("CameraController", "getMode") or "TPP"
	local v266 = v_u_36("CameraController", "getEyeAlpha")
	local v267
	if v265 == "ADS" or v265 == "FPP" then
		v267 = type(v266) ~= "number" and true or v266 >= 0.97
	else
		v267 = false
	end
	local v268 = v_u_22.Character
	if not (v268 and v268.Parent) then
		v268 = nil
	end
	local v269
	if v268 == nil then
		v269 = false
	else
		v269 = v268:GetAttribute("InVehicle") == true
	end
	local v270, v271
	if v269 then
		v270, v271 = v_u_36("VehicleController", "getAimRay")
		if not (v270 and v271) then
			v270, v271 = v_u_36("CameraController", "getAimRay")
		end
	else
		v270, v271 = v_u_36("CameraController", "getAimRay")
	end
	if not (v270 and v271) then
		v270 = v264.CFrame.Position
		v271 = v264.CFrame.LookVector
	end
	v_u_209()
	local v272 = v262:FindFirstChild("Head")
	if v267 then
		v270 = v270 + v271 * 0.3
	else
		local v273
		if v272 then
			local v274 = (v272.Position - v270):Dot(v271) - 1.5
			v273 = math.max(0, v274)
		else
			v273 = 0
		end
		local v275 = workspace:Raycast(v270 + v271 * v273, v271 * 3000, v_u_195)
		local v276 = v275 and v275.Position or v270 + v271 * (v273 + 3000)
		local v277 = v_u_22.Character
		if not (v277 and v277.Parent) then
			v277 = nil
		end
		if v277 then
			v277 = v277:FindFirstChild("Right Arm")
		end
		if v277 then
			v277 = v277:FindFirstChild("RootPart")
		end
		local v278 = v277 and (v277:IsA("Motor6D") and v277.Part1) or nil
		local v279
		if v278 then
			v279 = v278:FindFirstChild("MuzzleTip") or v278:FindFirstChild("Muzzle")
		else
			v279 = nil
		end
		local v280 = v279 and v279.WorldPosition
		if v280 then
			v270 = v280
		elseif v272 then
			v270 = v272.Position or v270
		end
		if v279 and (v272 and workspace:Raycast(v272.Position, v270 - v272.Position, v_u_195)) then
			v270 = v272.Position
		end
		local v281 = v276 - v270
		local v282
		if v281.Magnitude > 0.5 then
			v282 = v281.Unit or v271
		else
			v282 = v271
		end
		if v282:Dot(v271) >= 0.2 then
			v271 = v282
		end
	end
	local v283 = v_u_13.elevate(v271, v_u_15.zeroAngle(v_u_261, v_u_58.zeroing))
	local v284 = v_u_13.cone(v283, v_u_133(), v_u_23)
	local v285 = v_u_23:NextInteger(1, 2147483000)
	local v286 = v_u_58
	v286.shotId = v286.shotId + 1
	local v287 = v_u_58.shotId
	local v288 = os.clock()
	v_u_24.Fire:FireServer({
		["shotId"] = v287,
		["origin"] = v270,
		["dir"] = v284,
		["t"] = workspace:GetServerTimeNow(),
		["seed"] = v285
	})
	local v_u_289 = v_u_26.ViewmodelController
	if not v_u_289 then
		local v290 = script.Parent:FindFirstChild("ViewmodelController")
		if v290 then
			local v291 = require
			local v292
			v292, v_u_289 = pcall(v291, v290)
			if v292 and type(v_u_289) == "table" then
				v_u_26.ViewmodelController = v_u_289
			else
				v_u_289 = nil
			end
		else
			v_u_289 = nil
		end
	end
	local v293
	if v_u_289 and v_u_289.isVisible then
		v293 = v_u_289.isVisible() or false
	else
		v293 = false
	end
	local v294 = v293 and v_u_289.getMuzzle and v_u_289.getMuzzle()
	if not v294 then
		local v295 = v_u_22.Character
		if not (v295 and v295.Parent) then
			v295 = nil
		end
		if v295 then
			v295 = v295:FindFirstChild("Right Arm")
		end
		if v295 then
			v295 = v295:FindFirstChild("RootPart")
		end
		local v296 = v295 and (v295:IsA("Motor6D") and v295.Part1) or nil
		if v296 then
			v294 = v296:FindFirstChild("MuzzleTip") or v296:FindFirstChild("Muzzle")
		else
			v294 = nil
		end
	end
	local v_u_297 = v_u_26.BallisticsFx
	if not v_u_297 then
		local v298 = script.Parent:FindFirstChild("BallisticsFx")
		if v298 then
			local v299 = require
			local v300
			v300, v_u_297 = pcall(v299, v298)
			if v300 and type(v_u_297) == "table" then
				v_u_26.BallisticsFx = v_u_297
			else
				v_u_297 = nil
			end
		else
			v_u_297 = nil
		end
	end
	local v301 = v_u_13.pelletDirs(v284, v285, v_u_261.pellets, v_u_261.pelletH, v_u_261.pelletV)
	local v302 = not v_u_261.explosion
	if v302 then
		v302 = not v_u_261.flare
	end
	for v303, v304 in v301 do
		local v305
		if v_u_297 and v303 <= 2 then
			local v306
			if v294 then
				v306 = v294.WorldPosition or v270
			else
				v306 = v270
			end
			v305 = v_u_297.tracer(v306, v304, v_u_261.v0, v_u_261.drag, true)
		else
			v305 = nil
		end
		local v307 = v_u_59
		local v308 = {
			["id"] = nil,
			["pellet"] = nil,
			["origin"] = nil,
			["dir"] = nil,
			["t"] = 0,
			["c0"] = nil,
			["stats"] = nil,
			["tr"] = nil,
			["maxT"] = nil,
			["claims"] = nil,
			["id"] = v287,
			["pellet"] = v303,
			["origin"] = v270,
			["dir"] = v304,
			["c0"] = v288,
			["stats"] = v_u_261,
			["tr"] = v305
		}
		local v309 = v_u_13.timeFor(v_u_261.v0, v_u_261.drag, v_u_261.range) or 3
		v308.maxT = math.min(v309, 4)
		v308.claims = v302
		table.insert(v307, v308)
	end
	local v310 = v_u_58
	local v311 = v_u_58.ammo - 1
	v310.ammo = math.max(0, v311)
	v_u_58.lastShot = os.clock()
	local v312 = v_u_194(v_u_261)
	local v313 = v_u_58
	local v314 = v_u_261.spread.BloomMax
	local v315 = v_u_58.bloom + v_u_261.spread.Bloom
	v313.bloom = math.min(v314, v315)
	local v316 = v_u_58
	v316.sprayCount = v316.sprayCount + 1
	if v_u_297 and v_u_297.localShot then
		local v317 = v_u_297.localShot
		local v318 = v293 and v_u_289.getEject and v_u_289.getEject()
		if not v318 then
			local v319 = v_u_22.Character
			if not (v319 and v319.Parent) then
				v319 = nil
			end
			if v319 then
				v319 = v319:FindFirstChild("Right Arm")
			end
			if v319 then
				v319 = v319:FindFirstChild("RootPart")
			end
			local v320 = v319 and (v319:IsA("Motor6D") and v319.Part1) or nil
			if v320 then
				v318 = v320:FindFirstChild("Eject")
			else
				v318 = nil
			end
		end
		v317(v_u_261, v294, v318, v293, v_u_58.fireMode)
	end
	if v_u_289 and v_u_289.kick then
		local v321 = v_u_289.kick
		local v322 = v_u_58.sprayCount
		pcall(v321, v_u_261, v312, v322)
	end
	local v323 = v_u_57
	local v324 = v_u_261.animPack
	local v325 = v_u_15.tbs(v_u_261, v_u_58.fireMode) * 1.6
	v323(v324, "Fire", math.clamp(v325, 0.12, 0.6), 0.03)
	if v_u_261.boltAction and v_u_58.ammo > 0 then
		local v_u_326 = v_u_15.tbs(v_u_261, v_u_58.fireMode)
		local v327 = v_u_326 * 0.25
		local v_u_328 = math.min(0.22, v327)
		task.delay(v_u_328, function()
			-- upvalues: (ref) v_u_58, (copy) v_u_261, (copy) v_u_297, (copy) v_u_289, (copy) v_u_326, (copy) v_u_328, (ref) v_u_57, (ref) v_u_22
			if v_u_58.stats == v_u_261 then
				local v329 = v_u_261.class == "SG" and "Pump" or (v_u_261.id == "Win94" and "Lever" or "Bolt")
				if v_u_297 then
					v_u_297.play2D(v329, 0.7)
				end
				local v330
				if v_u_289 and v_u_289.playBolt then
					local v331 = v_u_289.playBolt
					local v332 = v_u_326 - v_u_328 - 0.04
					local v333 = math.max(v332, 0.2)
					local v334
					v330, v334 = pcall(v331, v333)
					if v330 then
						v330 = v334 == true
					end
				else
					v330 = false
				end
				if v_u_261.animPack == "Shotgun" then
					v_u_57("Shotgun", "Pump", v_u_326 * 0.7)
				else
					v_u_57(v_u_261.animPack, "FireMode", v_u_326 * 0.7)
				end
				if not v330 then
					local v335 = task.delay
					local v336 = v_u_326 * 0.35
					v335(math.min(v336, 0.45), function()
						-- upvalues: (ref) v_u_297, (ref) v_u_58, (ref) v_u_261, (ref) v_u_22
						if v_u_297 and v_u_58.stats == v_u_261 then
							local v337 = v_u_297.ejectShell
							local v338 = v_u_22.Character
							if not (v338 and v338.Parent) then
								v338 = nil
							end
							if v338 then
								v338 = v338:FindFirstChild("Right Arm")
							end
							if v338 then
								v338 = v338:FindFirstChild("RootPart")
							end
							local v339 = v338 and (v338:IsA("Motor6D") and v338.Part1) or nil
							local v340
							if v339 then
								v340 = v339:FindFirstChild("Eject")
							else
								v340 = nil
							end
							v337(v340, v_u_261.class)
						end
					end)
				end
			end
		end)
	end
	v_u_21.Fired:Fire(v_u_261)
	v_u_21.Changed:Fire()
end
local function v_u_387() -- name: tryShots
	-- upvalues: (copy) v_u_58, (copy) v_u_94, (copy) v_u_113, (ref) v_u_95, (copy) v_u_36, (copy) v_u_26, (copy) v_u_341, (copy) v_u_15
	local v342 = v_u_58.stats
	if v342 then
		if v_u_58.trigger or (v_u_58.pendingSemi or v_u_58.burstLeft > 0) then
			if v_u_94() then
				local v343, v344, _, v345 = v_u_113()
				if v343 and not v344 then
					local v346 = v_u_58
					v_u_58.pendingSemi = false
					v346.burstLeft = 0
					local v347 = os.clock()
					if v347 - v_u_95 > 2.5 then
						v_u_95 = v347
						v_u_36("UI_Notify", "show", v345 == "cover" and "You need open sky to fire the flare" or "Aim at the sky to fire the flare", "Warning", 2.5)
					end
					return
				else
					if v_u_58.reloading and v_u_58.reloadKind == "Shell" then
						v_u_58.reloading = false
						local v348 = v_u_58
						v348.reloadToken = v348.reloadToken + 1
						local v349 = v_u_26.ViewmodelController
						if not v349 then
							local v350 = script.Parent:FindFirstChild("ViewmodelController")
							if v350 then
								local v351 = require
								local v352
								v352, v349 = pcall(v351, v350)
								if v352 and type(v349) == "table" then
									v_u_26.ViewmodelController = v349
								else
									v349 = nil
								end
							else
								v349 = nil
							end
						end
						if v349 and v349.stopReload then
							local v353 = v349.stopReload
							pcall(v353)
						end
					end
					local v354 = os.clock()
					if v342.boltAction and (v354 < v_u_58.nextShot and v354 - (v_u_58.semiAt or 0) > 0.2) then
						v_u_58.pendingSemi = false
						v_u_58.trigger = false
					else
						local v355 = 0
						if v_u_58.nextShot <= v354 and v355 < 2 then
							v355 = v355 + 1
							if v_u_58.ammo <= 0 then
								local v356 = v_u_58
								local v357 = v_u_58
								v_u_58.pendingSemi = false
								v356.burstLeft = 0
								v357.trigger = false
								local v358 = v_u_58.stats
								local v359
								if v358 and v358.ammo then
									local v360 = v_u_26.InventoryClient
									if not v360 then
										local v361 = script.Parent:FindFirstChild("InventoryClient")
										if v361 then
											local v362 = require
											local v363
											v363, v360 = pcall(v362, v361)
											if v363 and type(v360) == "table" then
												v_u_26.InventoryClient = v360
											else
												v360 = nil
											end
										else
											v360 = nil
										end
									end
									v359 = v360 and (v360.count(v358.ammo) or 0) or 0
								else
									v359 = 0
								end
								if v359 <= 0 then
									local v364 = v_u_26.BallisticsFx
									if not v364 then
										local v365 = script.Parent:FindFirstChild("BallisticsFx")
										if v365 then
											local v366 = require
											local v367
											v367, v364 = pcall(v366, v365)
											if v367 and type(v364) == "table" then
												v_u_26.BallisticsFx = v364
											else
												v364 = nil
											end
										else
											v364 = nil
										end
									end
									if v364 then
										v364.play2D("DryFire", 0.6)
									end
								end
								return
							end
							v_u_341()
							local v368 = v_u_58.fireMode
							local v369 = v_u_15.tbs(v342, v368)
							if v342.pumpEvery then
								local v370 = v_u_58
								v370.pumpCount = v370.pumpCount + 1
								if v_u_58.pumpCount >= v342.pumpEvery then
									v_u_58.pumpCount = 0
									v369 = v369 + (v342.pumpTime or 0)
									local v_u_371 = v_u_26.BallisticsFx
									if not v_u_371 then
										local v372 = script.Parent:FindFirstChild("BallisticsFx")
										if v372 then
											local v373 = require
											local v374
											v374, v_u_371 = pcall(v373, v372)
											if v374 and type(v_u_371) == "table" then
												v_u_26.BallisticsFx = v_u_371
											else
												v_u_371 = nil
											end
										else
											v_u_371 = nil
										end
									end
									task.delay(0.15, function()
										-- upvalues: (copy) v_u_371
										if v_u_371 then
											v_u_371.play2D("Pump", 0.7)
										end
									end)
									local v375 = v_u_26.ViewmodelController
									if not v375 then
										local v376 = script.Parent:FindFirstChild("ViewmodelController")
										if v376 then
											local v377 = require
											local v378
											v378, v375 = pcall(v377, v376)
											if v378 and type(v375) == "table" then
												v_u_26.ViewmodelController = v375
											else
												v375 = nil
											end
										else
											v375 = nil
										end
									end
									if v375 and v375.playPump then
										local v379 = v375.playPump
										local v380 = v342.pumpTime or 0.45
										pcall(v379, v380)
									end
								end
							end
							local v381 = v_u_58
							local v382 = v_u_58.nextShot + v369
							local v383 = v354 - v369 * 0.5
							v381.nextShot = math.max(v382, v383)
							if v_u_58.nextShot < v354 then
								v_u_58.nextShot = v354 + v369
							end
							if v368 == "Single" or v342.boltAction then
								v_u_58.pendingSemi = false
								v_u_58.trigger = false
								return
							end
							if v368 == "Burst" then
								local v384 = v_u_58
								v384.burstLeft = v384.burstLeft - 1
								if v_u_58.burstLeft > 0 then
									continue
								end
								v_u_58.burstLeft = 0
								v_u_58.trigger = false
								local v385 = v_u_58
								local v386 = v369 * 2.5
								v385.nextShot = v354 + math.max(v386, 0.2)
								return
							end
							if v_u_58.trigger then
								continue
							end
						end
					end
				end
			else
				if v_u_58.pendingSemi and os.clock() - (v_u_58.semiAt or 0) > 0.45 then
					v_u_58.pendingSemi = false
				end
				return
			end
		else
			return
		end
	else
		return
	end
end
local function v_u_469()
	-- upvalues: (copy) v_u_58, (copy) v_u_22, (copy) v_u_26, (copy) v_u_7, (copy) v_u_15, (copy) v_u_36, (copy) v_u_24, (copy) v_u_9, (copy) v_u_11, (copy) v_u_57, (copy) v_u_21
	local v_u_388 = v_u_58.stats
	local v389 = v_u_22.Character
	if not (v389 and v389.Parent) then
		v389 = nil
	end
	if v_u_388 and (v_u_388.isGun and (v389 and (not v_u_388.singleUse and v_u_388.ammo))) then
		if not v_u_58.reloading and v_u_58.ammo < v_u_388.magSize then
			local v390 = v_u_58.stats
			local v391
			if v390 and v390.ammo then
				local v392 = v_u_26.InventoryClient
				if not v392 then
					local v393 = script.Parent:FindFirstChild("InventoryClient")
					if v393 then
						local v394 = require
						local v395
						v395, v392 = pcall(v394, v393)
						if v395 and type(v392) == "table" then
							v_u_26.InventoryClient = v392
						else
							v392 = nil
						end
					else
						v392 = nil
					end
				end
				v391 = v392 and (v392.count(v390.ammo) or 0) or 0
			else
				v391 = 0
			end
			if v391 > 0 then
				if v_u_7.isStanding(v389) and v389:GetAttribute("UsingItem") == nil then
					local v396 = v_u_388.reload
					local v397 = v_u_58.ammo <= 0
					local v398, v399
					if v396.Shell and not (v396.Clip and v397) then
						v398 = "Shell"
						local v400 = v_u_388.magSize - v_u_58.ammo
						local v401 = v_u_58.stats
						local v402
						if v401 and v401.ammo then
							local v403 = v_u_26.InventoryClient
							if not v403 then
								local v404 = script.Parent:FindFirstChild("InventoryClient")
								if v404 then
									local v405 = require
									local v406
									v406, v403 = pcall(v405, v404)
									if v406 and type(v403) == "table" then
										v_u_26.InventoryClient = v403
									else
										v403 = nil
									end
								else
									v403 = nil
								end
							end
							v402 = v403 and (v403.count(v401.ammo) or 0) or 0
						else
							v402 = 0
						end
						local v407 = math.min(v400, v402)
						local v408 = v396.Shell.Start + v396.Shell.First
						local v409 = v396.Shell.Each
						local v410 = v407 - 1
						v399 = v408 + v409 * math.max(v410, 0) + v396.Shell.End
					else
						v399 = v396.Clip and v397 and v396.Clip or v_u_15.reloadTime(v_u_388, v_u_58.ammo)
						v398 = "Mag"
					end
					v_u_58.reloading = true
					v_u_58.reloadKind = v398
					v_u_58.reloadStart = os.clock()
					v_u_58.reloadDur = v399
					local v411 = v_u_58
					v411.reloadToken = v411.reloadToken + 1
					local v_u_412 = v_u_58.reloadToken
					v_u_36("CameraController", "setADS", false)
					v_u_24.Reload:FireServer()
					local v_u_413 = v_u_26.BallisticsFx
					if not v_u_413 then
						local v414 = script.Parent:FindFirstChild("BallisticsFx")
						if v414 then
							local v415 = require
							local v416
							v416, v_u_413 = pcall(v415, v414)
							if v416 and type(v_u_413) == "table" then
								v_u_26.BallisticsFx = v_u_413
							else
								v_u_413 = nil
							end
						else
							v_u_413 = nil
						end
					end
					local v417 = v_u_26.ViewmodelController
					if not v417 then
						local v418 = script.Parent:FindFirstChild("ViewmodelController")
						if v418 then
							local v419 = require
							local v420
							v420, v417 = pcall(v419, v418)
							if v420 and type(v417) == "table" then
								v_u_26.ViewmodelController = v417
							else
								v417 = nil
							end
						else
							v417 = nil
						end
					end
					if not v397 then
						if v398 == "Mag" then
							v397 = v_u_9.emptyStyleReload(v_u_388.id)
						else
							v397 = false
						end
					end
					if v417 and v417.playReload then
						local v421 = v417.playReload
						pcall(v421, v398, v399, v_u_388, v397)
					end
					local v422 = nil
					local v_u_423
					if v417 and v417.reloadSounds then
						local v424 = v417.reloadSounds
						local v425 = v_u_58.ammo
						local v426
						v426, v_u_423 = pcall(v424, v398, v399, v_u_388, v397, v425)
						if not v426 or type(v_u_423) ~= "table" then
							v_u_423 = v422
						end
					else
						v_u_423 = v422
					end
					local v427 = v_u_11.Guns
					if v427 then
						v427 = v_u_11.Guns[v_u_388.id]
					end
					local v_u_428 = not v427 or v398 == "Shell" and v427.ReloadShell
					if not v_u_428 then
						if v398 == "Mag" then
							v_u_428 = v427.Reload or nil
						else
							v_u_428 = nil
						end
					end
					local v_u_429
					if v427 then
						v_u_429 = v427.RL or v399
					else
						v_u_429 = v399
					end
					if v_u_428 and (v_u_413 and v_u_413.reloadClip) then
						local v430 = v399 * 0.75 <= v_u_429
						local v_u_431
						if v430 then
							local v432 = v_u_429 / v399
							v_u_431 = math.clamp(v432, 0.85, 1.2) or 1
						else
							v_u_431 = 1
						end
						local v433
						if v430 then
							v433 = 0
						else
							local v434 = (v399 - v_u_429) * 0.35
							v433 = math.max(0, v434)
						end
						local v435 = {
							["MagOut"] = true,
							["MagIn"] = true,
							["ShellInsert"] = true
						}
						if v_u_429 >= 2 then
							v435.ChargingHandle = true
							v435.ChargingHandleForward = true
						end
						if v_u_423 then
							v_u_423 = {}
							for _, v436 in v_u_423 do
								if v435[v436.key] then
									continue
								end
								table.insert(v_u_423, v436)
							end
						else
							v_u_423 = {}
						end
						task.delay(v433, function()
							-- upvalues: (ref) v_u_58, (copy) v_u_412, (copy) v_u_388, (copy) v_u_413, (copy) v_u_428, (copy) v_u_431, (copy) v_u_429
							local v437 = v_u_58.reloadToken == v_u_412 and v_u_58.reloading
							if v437 then
								v437 = v_u_58.stats == v_u_388
							end
							if v437 then
								v_u_413.reloadClip(v_u_428, 0.8, v_u_431)
								local v438 = os.clock()
								if os.clock() - v438 < v_u_429 / v_u_431 + 0.1 then
									task.wait(0.05)
									local v439 = v_u_58.reloadToken == v_u_412 and v_u_58.reloading
									if v439 then
										v439 = v_u_58.stats == v_u_388
									end
									if v439 then
										continue
									end
									local v440
									if v_u_58.reloadToken == v_u_412 then
										v440 = not v_u_58.reloading
									else
										v440 = false
									end
									if v440 then
										task.wait(0.25)
									end
									v_u_413.stopReloadClip(v440 and 0.2 or 0.1)
								end
							else
								return
							end
						end)
					end
					if v_u_423 then
						for _, v_u_441 in v_u_423 do
							task.delay(v_u_441.t, function()
								-- upvalues: (ref) v_u_58, (copy) v_u_412, (copy) v_u_388, (copy) v_u_413, (copy) v_u_441
								local v442 = v_u_58.reloadToken == v_u_412 and v_u_58.reloading
								if v442 then
									v442 = v_u_58.stats == v_u_388
								end
								if v442 and v_u_413 then
									v_u_413.play2D(v_u_441.key, v_u_441.vol or 0.7)
								end
							end)
						end
					end
					if v398 == "Mag" then
						local v443 = v_u_57
						local v444 = v_u_388.animPack
						local _ = v_u_388.animPack == "Shotgun"
						local v445 = "Reload"
						v443(v444, v445, v399)
						if not v_u_423 then
							task.delay(v399 * 0.22, function()
								-- upvalues: (ref) v_u_58, (copy) v_u_412, (copy) v_u_388, (copy) v_u_413
								local v446 = v_u_58.reloadToken == v_u_412 and v_u_58.reloading
								if v446 then
									v446 = v_u_58.stats == v_u_388
								end
								if v446 and v_u_413 then
									v_u_413.play2D("MagOut", 0.7)
								end
							end)
							task.delay(v399 * 0.6, function()
								-- upvalues: (ref) v_u_58, (copy) v_u_412, (copy) v_u_388, (copy) v_u_413
								local v447 = v_u_58.reloadToken == v_u_412 and v_u_58.reloading
								if v447 then
									v447 = v_u_58.stats == v_u_388
								end
								if v447 and v_u_413 then
									v_u_413.play2D("MagIn", 0.75)
								end
							end)
							if v397 then
								task.delay(v399 * 0.84, function()
									-- upvalues: (ref) v_u_58, (copy) v_u_412, (copy) v_u_388, (copy) v_u_413
									local v448 = v_u_58.reloadToken == v_u_412 and v_u_58.reloading
									if v448 then
										v448 = v_u_58.stats == v_u_388
									end
									if v448 and v_u_413 then
										v_u_413.play2D("ChargingHandle", 0.7)
									end
								end)
								task.delay(v399 * 0.9, function()
									-- upvalues: (ref) v_u_58, (copy) v_u_412, (copy) v_u_388, (copy) v_u_413
									local v449 = v_u_58.reloadToken == v_u_412 and v_u_58.reloading
									if v449 then
										v449 = v_u_58.stats == v_u_388
									end
									if v449 and v_u_413 then
										v_u_413.play2D("ChargingHandleForward", 0.7)
									end
								end)
							end
						end
					else
						local v_u_450 = v396.Shell
						if v_u_388.animPack == "Shotgun" then
							local v451 = v_u_57
							local v452 = v_u_450.Start
							v451("Shotgun", "PreReload", (math.max(v452, 0.2)))
						end
						task.spawn(function()
							-- upvalues: (copy) v_u_450, (ref) v_u_58, (copy) v_u_412, (copy) v_u_388, (ref) v_u_57, (copy) v_u_413, (copy) v_u_428, (ref) v_u_21, (ref) v_u_26, (ref) v_u_423
							task.wait(v_u_450.Start)
							local v453 = true
							local v454 = v_u_58.reloadToken == v_u_412 and v_u_58.reloading
							if v454 then
								v454 = v_u_58.stats == v_u_388
							end
							if v454 then
								local v455 = v453 and v_u_450.First or v_u_450.Each
								if v_u_388.animPack == "Shotgun" then
									v_u_57("Shotgun", "PostReload", v455)
								else
									v_u_57(v_u_388.animPack, "Reload", v455 * 3)
								end
								task.wait(v455)
								v453 = false
								local v456 = v_u_58.reloadToken == v_u_412 and v_u_58.reloading
								if v456 then
									v456 = v_u_58.stats == v_u_388
								end
								if not v456 then
									return
								end
								if v_u_413 and not v_u_428 then
									v_u_413.play2D("ShellInsert", 0.7)
								end
								local v457 = v_u_58
								local v458 = v_u_388.magSize
								local v459 = v_u_58.ammo + 1
								v457.ammo = math.min(v458, v459)
								v_u_21.Changed:Fire()
								if v_u_58.ammo < v_u_388.magSize then
									local v460 = v_u_58.stats
									local v461
									if v460 and v460.ammo then
										local v462 = v_u_26.InventoryClient
										if not v462 then
											local v463 = script.Parent:FindFirstChild("InventoryClient")
											if v463 then
												local v464 = require
												local v465
												v465, v462 = pcall(v464, v463)
												if v465 and type(v462) == "table" then
													v_u_26.InventoryClient = v462
												else
													v462 = nil
												end
											else
												v462 = nil
											end
										end
										v461 = v462 and (v462.count(v460.ammo) or 0) or 0
									else
										v461 = 0
									end
									if v461 > 0 then
										continue
									end
								end
							end
							local v466 = v_u_58.reloadToken == v_u_412 and v_u_58.reloading
							if v466 then
								v466 = v_u_58.stats == v_u_388
							end
							if v466 then
								if v_u_413 and not v_u_423 then
									v_u_413.play2D(v_u_388.class == "SG" and "Pump" or "Bolt", 0.7)
								end
								if v_u_388.animPack == "Shotgun" then
									local v467 = v_u_57
									local v468 = v_u_450.End
									v467("Shotgun", "Pump", (math.max(v468, 0.35)))
								end
							end
						end)
					end
					task.delay(v399 + 1.5, function()
						-- upvalues: (ref) v_u_58, (copy) v_u_412, (ref) v_u_21
						if v_u_58.reloadToken == v_u_412 and v_u_58.reloading then
							v_u_58.reloading = false
							v_u_21.Changed:Fire()
						end
					end)
					v_u_21.Changed:Fire()
				end
			end
		end
	end
end
local function v_u_480() -- name: autoReload
	-- upvalues: (copy) v_u_58, (copy) v_u_22, (copy) v_u_7, (ref) v_u_25, (copy) v_u_26, (ref) v_u_469
	local v470 = v_u_58.stats
	if v470 and (v470.isGun and (v_u_58.ammo <= 0 and (not v_u_58.reloading and (not v470.singleUse and v470.ammo)))) then
		local v471 = os.clock()
		if v471 < v_u_58.readyAt + 0.05 or (v471 - v_u_58.lastShot < 0.2 or v471 < (v_u_58.autoRetry or 0)) then
			return
		else
			local v472 = v_u_22.Character
			if not (v472 and v472.Parent) then
				v472 = nil
			end
			if v472 and (v_u_7.isStanding(v472) and (v472:GetAttribute("Deploy") == nil and v472:GetAttribute("UsingItem") == nil)) then
				local v473 = v_u_25 and v_u_25.getContext() or "Game"
				if v473 == "Game" or v473 == "Vehicle" then
					local v474 = v_u_58.stats
					local v475
					if v474 and v474.ammo then
						local v476 = v_u_26.InventoryClient
						if not v476 then
							local v477 = script.Parent:FindFirstChild("InventoryClient")
							if v477 then
								local v478 = require
								local v479
								v479, v476 = pcall(v478, v477)
								if v479 and type(v476) == "table" then
									v_u_26.InventoryClient = v476
								else
									v476 = nil
								end
							else
								v476 = nil
							end
						end
						v475 = v476 and (v476.count(v474.ammo) or 0) or 0
					else
						v475 = 0
					end
					if v475 > 0 then
						v_u_58.autoRetry = v471 + 1
						v_u_469()
					end
				else
					return
				end
			else
				return
			end
		end
	else
		return
	end
end
local v_u_481 = {
	["Slot1"] = "Primary1",
	["Slot2"] = "Primary2",
	["Slot3"] = "Pistol",
	["Slot4"] = "Melee",
	["Slot5"] = "Throwable"
}
local v_u_482 = {
	"Primary1",
	"Primary2",
	"Pistol",
	"Melee",
	"Throwable"
}
local function v_u_490(p483) -- name: hasSlot
	-- upvalues: (copy) v_u_26
	local v484 = v_u_26.InventoryClient
	if not v484 then
		local v485 = script.Parent:FindFirstChild("InventoryClient")
		if v485 then
			local v486 = require
			local v487
			v487, v484 = pcall(v486, v485)
			if v487 and type(v484) == "table" then
				v_u_26.InventoryClient = v484
			else
				v484 = nil
			end
		else
			v484 = nil
		end
	end
	if v484 then
		v484 = v484.get()
	end
	if v484 then
		if p483 == "Throwable" then
			for _, v488 in {
				"Frag",
				"Smoke",
				"Stun",
				"Molotov"
			} do
				if (v484.items and (v484.items[v488] or 0) or 0) <= 0 then
					continue
				end
				return true
			end
			return false
		else
			local v489
			if v484.weapons == nil then
				v489 = false
			else
				v489 = v484.weapons[p483] ~= nil
			end
			return v489
		end
	else
		return false
	end
end
local function v_u_493() -- name: canSwitch
	-- upvalues: (copy) v_u_22, (copy) v_u_7, (ref) v_u_25
	local v491 = v_u_22.Character
	if not (v491 and v491.Parent) then
		v491 = nil
	end
	if not v491 or (not v_u_7.isStanding(v491) or v491:GetAttribute("Deploy") ~= nil) then
		return false
	end
	local v492 = v_u_25 and v_u_25.getContext() or "Game"
	return v492 == "Game" and true or v492 == "Vehicle"
end
local function v_u_500(p494) -- name: requestEquip
	-- upvalues: (copy) v_u_493, (copy) v_u_490, (copy) v_u_22, (copy) v_u_58, (copy) v_u_36, (copy) v_u_24
	if v_u_493() then
		if p494 and not v_u_490(p494) then
			return
		else
			local v495 = v_u_22.Character
			if not (v495 and v495.Parent) then
				v495 = nil
			end
			if p494 then
				local v496
				if v495 == nil then
					v496 = false
				else
					v496 = v495:GetAttribute("InVehicle") == true
				end
				if v496 then
					local v497
					if v495 == nil then
						v497 = false
					else
						v497 = v495:GetAttribute("InVehicle") == true
					end
					if v497 then
						v497 = v495:GetAttribute("VehicleSeat") == 1
					end
					if v497 and p494 ~= "Pistol" then
						return
					end
					if p494 == "Melee" or p494 == "Throwable" then
						return
					end
				end
			end
			if p494 == v_u_58.slot then
				if p494 == "Throwable" then
					v_u_36("InventoryClient", "cycleThrowable")
				end
			else
				local v498 = v_u_58
				local v499 = v_u_58
				v_u_58.trigger = false
				v498.pendingSemi = false
				v499.burstLeft = 0
				v_u_36("CameraController", "setADS", false)
				v_u_24.Equip:FireServer(p494)
			end
		end
	else
		return
	end
end
v_u_21.equip = v_u_500
local function v_u_505(p501) -- name: cycleWeapon
	-- upvalues: (copy) v_u_482, (copy) v_u_58, (copy) v_u_490, (copy) v_u_500
	local v502 = table.find(v_u_482, v_u_58.slot or "") or (p501 > 0 and 0 or #v_u_482 + 1)
	for v503 = 1, #v_u_482 do
		local v504 = v_u_482[(v502 - 1 + p501 * v503) % #v_u_482 + 1]
		if not v_u_490(v504) then
			continue
		end
		v_u_500(v504)
		return
	end
end
local function v_u_536(p506, p507, p508) -- name: onEquipped
	-- upvalues: (copy) v_u_58, (copy) v_u_15, (copy) v_u_9, (copy) v_u_78, (copy) v_u_57, (copy) v_u_26, (copy) v_u_21
	local v509 = v_u_58
	local v510 = v_u_58
	local v511 = v_u_58
	local v512
	if p508 then
		v512 = p508.uid
	else
		v512 = p508
	end
	v509.slot = p506
	v510.weaponId = p507
	v511.uid = v512
	local v513 = v_u_58
	local v514
	if p507 then
		local v515 = v_u_15.get
		local v516
		if p508 then
			v516 = p508.attachments
		else
			v516 = p508
		end
		v514 = v515(p507, v516) or nil
	else
		v514 = nil
	end
	v513.stats = v514
	local v517 = v_u_58
	local v518
	if p508 then
		v518 = v_u_15.sig(p508.id, p508.attachments) or p507
	else
		v518 = p507
	end
	v517.sig = v518
	v_u_58.reloading = false
	local v519 = v_u_58
	v519.reloadToken = v519.reloadToken + 1
	local v520 = v_u_58
	local v521 = v_u_58
	v_u_58.trigger = false
	v520.pendingSemi = false
	v521.burstLeft = 0
	local v522 = v_u_58
	local v523 = v_u_58
	v_u_58.sprayCount = 0
	v522.bloom = 0
	v523.pumpCount = 0
	v_u_58.varZoom = nil
	local v_u_524 = v_u_58.stats
	if v_u_524 then
		v_u_58.readyAt = os.clock() + (v_u_524.equipTime or 0.4)
		v_u_58.nextShot = v_u_58.readyAt
		if v_u_524.isGun then
			v_u_58.ammo = p508 and (p508.ammo or 0) or 0
			local v525 = v_u_58
			local v526
			if p508 then
				v526 = p508.fireMode
			else
				v526 = p508
			end
			if not (v526 and table.find(v_u_524.fireModes, v526)) then
				v526 = v_u_9.pickDefaultMode(v_u_524.fireModes) or v_u_524.fireModes[1]
			end
			v525.fireMode = v526
			v_u_58.zeroing = p508 and (p508.zeroing or 100) or 100
			if v_u_524.variable then
				v_u_58.varZoom = v_u_524.variable.Max
			end
			v_u_78()
		end
		v_u_57(v_u_524.animPack, "Equip", v_u_524.equipTime)
		local v_u_527 = v_u_26.BallisticsFx
		if not v_u_527 then
			local v528 = script.Parent:FindFirstChild("BallisticsFx")
			if v528 then
				local v529 = require
				local v530
				v530, v_u_527 = pcall(v529, v528)
				if v530 and type(v_u_527) == "table" then
					v_u_26.BallisticsFx = v_u_527
				else
					v_u_527 = nil
				end
			else
				v_u_527 = nil
			end
		end
		if v_u_527 and (v_u_524.isGun and not v_u_527.play2D("Equip", 0.45)) then
			task.delay(v_u_524.equipTime * 0.7, function()
				-- upvalues: (ref) v_u_58, (copy) v_u_524, (copy) v_u_527
				if v_u_58.stats == v_u_524 then
					v_u_527.play2D("ChargingHandleForward", 0.45)
				end
			end)
		end
	end
	local v531 = v_u_26.ViewmodelController
	if not v531 then
		local v532 = script.Parent:FindFirstChild("ViewmodelController")
		if v532 then
			local v533 = require
			local v534
			v534, v531 = pcall(v533, v532)
			if v534 and type(v531) == "table" then
				v_u_26.ViewmodelController = v531
			else
				v531 = nil
			end
		else
			v531 = nil
		end
	end
	if v531 and v531.onEquip then
		local v535 = v531.onEquip
		pcall(v535, p506, p507, p508)
	end
	v_u_21.Changed:Fire()
end
local function v_u_554() -- name: refresh
	-- upvalues: (copy) v_u_22, (copy) v_u_26, (copy) v_u_58, (copy) v_u_536, (copy) v_u_15, (copy) v_u_78, (copy) v_u_9, (copy) v_u_21
	local v537 = v_u_22.Character
	if not (v537 and v537.Parent) then
		v537 = nil
	end
	local v538
	if v537 then
		v538 = v537:GetAttribute("EquippedSlot")
	else
		v538 = v537
	end
	if v537 then
		v537 = v537:GetAttribute("Equipped")
	end
	local v539 = v_u_26.InventoryClient
	if not v539 then
		local v540 = script.Parent:FindFirstChild("InventoryClient")
		if v540 then
			local v541 = require
			local v542
			v542, v539 = pcall(v541, v540)
			if v542 and type(v539) == "table" then
				v_u_26.InventoryClient = v539
			else
				v539 = nil
			end
		else
			v539 = nil
		end
	end
	if v539 then
		v539 = v539.get()
	end
	local v543
	if v538 and (v538 ~= "Throwable" and (v539 and v539.weapons)) then
		v543 = v539.weapons[v538] or nil
	else
		v543 = nil
	end
	if not v543 or (type(v537) ~= "string" or v543.id == v537) then
		if v538 == v_u_58.slot and v537 == v_u_58.weaponId then
			local v544
			if v543 then
				v544 = v543.uid
			else
				v544 = v543
			end
			if v544 == v_u_58.uid then
				if v543 then
					local v545 = v_u_15.sig(v543.id, v543.attachments)
					if v545 ~= v_u_58.sig then
						v_u_58.sig = v545
						v_u_58.stats = v_u_15.get(v543.id, v543.attachments)
						v_u_78()
						local v546 = v_u_26.ViewmodelController
						if not v546 then
							local v547 = script.Parent:FindFirstChild("ViewmodelController")
							if v547 then
								local v548 = require
								local v549
								v549, v546 = pcall(v548, v547)
								if v549 and type(v546) == "table" then
									v_u_26.ViewmodelController = v546
								else
									v546 = nil
								end
							else
								v546 = nil
							end
						end
						if v546 and v546.onEquip then
							local v550 = v546.onEquip
							pcall(v550, v538, v537, v543)
						end
					end
					if os.clock() - v_u_58.lastShot > 0.4 and not v_u_58.reloading then
						v_u_58.ammo = v543.ammo or 0
					end
					if v_u_58.stats and v_u_58.stats.isGun then
						local v551 = v_u_58
						local v552 = v_u_58.stats
						local v553 = v543.fireMode
						if not (v553 and table.find(v552.fireModes, v553)) then
							v553 = v_u_9.pickDefaultMode(v552.fireModes) or v552.fireModes[1]
						end
						v551.fireMode = v553
						v_u_58.zeroing = v543.zeroing or v_u_58.zeroing
					end
				end
				v_u_21.Changed:Fire()
				return
			end
		end
		v_u_536(v538, v537, v543)
	end
end
local function v_u_584(p555, p556, p557) -- name: stepSwayLevel
	-- upvalues: (copy) v_u_8, (ref) v_u_67, (ref) v_u_62, (ref) v_u_63, (copy) v_u_36, (ref) v_u_64, (ref) v_u_65, (ref) v_u_66, (copy) v_u_58, (ref) v_u_61
	local v558 = 0
	if p555 then
		local v559 = p555:FindFirstChild("HumanoidRootPart")
		local v560 = p555:FindFirstChildOfClass("Humanoid")
		if v559 then
			local v561 = v559.AssemblyLinearVelocity
			local v562 = v_u_8.toMeters(Vector2.new(v561.X, v561.Z).Magnitude) / 3
			v558 = v558 + math.clamp(v562, 0, 1.5)
		end
		local v563
		if v560 == nil then
			v563 = false
		else
			v563 = v560.FloorMaterial == Enum.Material.Air
		end
		if v563 then
			v558 = math.max(v558, 1)
		end
		if v_u_67 and not v563 then
			v_u_62 = v_u_62 + 1.2
		end
		v_u_67 = v563
		local v564 = p555:GetAttribute("Stance")
		if v_u_63 ~= nil and v564 ~= v_u_63 then
			v_u_62 = v_u_62 + 0.8
		end
		v_u_63 = v564
		local v565 = p555:GetAttribute("Lean")
		local v566 = v_u_36("MovementController", "getState")
		if type(v566) == "table" then
			local v567 = v566.lean
			if type(v567) == "number" then
				v565 = v566.lean
			end
		end
		local v568 = tonumber(v565) or 0
		local v569 = v568 - v_u_64
		local v570 = math.abs(v569) / math.max(p556, 0.001) / 2.5
		v558 = v558 + math.clamp(v570, 0, 1)
		v_u_64 = v568
	end
	local v571 = v_u_36("CameraController", "getYaw")
	local v572 = v_u_36("CameraController", "getPitch")
	if type(v571) == "number" and type(v572) == "number" then
		if v_u_65 and v_u_66 then
			local v573 = (v571 - v_u_65 + 180) % 360 - 180
			local v574 = math.abs(v573)
			local v575 = v572 - v_u_66
			local v576 = (v574 + math.abs(v575)) / math.max(p556, 0.001) / 240
			v558 = v558 + math.clamp(v576, 0, 1)
		end
		v_u_65 = v571
		v_u_66 = v572
	end
	if p557 ~= nil then
		local v577 = 1 - p557 / 60
		v558 = v558 + 1.3 * math.clamp(v577, 0, 1) ^ 1.5
	end
	if v_u_58.exhausted then
		v558 = v558 + 1
	end
	local v578 = v_u_62 - p556 * 1.6
	v_u_62 = math.max(0, v578)
	local v579 = v558 + v_u_62
	local v580 = v_u_61 < v579 and 7 or 1.6
	local v581 = v_u_61
	local v582 = v579 - v_u_61
	local v583 = p556 * v580
	v_u_61 = v581 + v582 * math.min(1, v583)
end
local function v_u_600(p585) -- name: stepBreath
	-- upvalues: (copy) v_u_58, (copy) v_u_36, (copy) v_u_9, (copy) v_u_22, (copy) v_u_584
	local v586 = v_u_58.stats
	local v587 = v_u_36("CameraController", "getMode") or "TPP"
	local v588 = v_u_9.Breath
	local v589 = v586 and v586.isGun
	if v589 then
		v589 = v587 == "ADS"
	end
	local v590 = v_u_22.Character
	if not (v590 and v590.Parent) then
		v590 = nil
	end
	local v591 = v_u_36("MovementController", "getStamina")
	if type(v591) ~= "number" then
		if v590 then
			v591 = v590:GetAttribute("Stamina")
		else
			v591 = v590
		end
		if type(v591) ~= "number" then
			v591 = nil
		end
	end
	v_u_58.holding = false
	if v_u_58.holding then
		local v592 = v_u_58
		local v593 = v_u_58.breath - p585 / v588.HoldMax
		v592.breath = math.max(0, v593)
		if v_u_58.breath <= 0 then
			v_u_58.exhausted = true
		end
		v_u_36("MovementController", "drainStamina", 6 * p585)
	else
		local v594 = v_u_58
		local v595 = v_u_58.breath + p585 * v588.Regen / v588.HoldMax
		v594.breath = math.min(1, v595)
		if v_u_58.exhausted and v_u_58.breath > 0.35 then
			v_u_58.exhausted = false
		end
	end
	v_u_584(v590, p585, v591)
	local v596 = Vector2.zero - v_u_58.swayOff
	local v597 = p585 * (v589 and 10 or 6)
	local v598 = v596 * math.min(1, v597)
	if v598.Magnitude > 0.00001 then
		local v599 = v_u_58
		v599.swayOff = v599.swayOff + v598
		v_u_36("CameraController", "addRecoil", v598.X, v598.Y)
	end
end
local function v_u_623(p601) -- name: update
	-- upvalues: (copy) v_u_58, (copy) v_u_22, (copy) v_u_36, (copy) v_u_15, (ref) v_u_60, (copy) v_u_387, (copy) v_u_480, (copy) v_u_600
	local v602 = v_u_58.stats
	local v603 = v_u_22.Character
	if not (v603 and v603.Parent) then
		v603 = nil
	end
	if v603 and (v_u_36("CameraController", "getMode") or "TPP") == "ADS" then
		local v604 = v603:GetAttribute("BlindUntil")
		if type(v604) == "number" and workspace:GetServerTimeNow() < v604 or v603:GetAttribute("Burning") == true then
			v_u_36("CameraController", "setADS", false)
		end
	end
	if v602 and v602.isGun then
		local v605 = v_u_15.tbs(v602, v_u_58.fireMode)
		local v606 = os.clock() - v_u_58.lastShot
		local v607 = v_u_58
		local v608 = v_u_58.bloom - v602.spread.BloomRecover * p601 * (v605 * 1.5 < v606 and 1 or 0.35)
		v607.bloom = math.max(0, v608)
		local v609 = v605 * 1.6
		if math.max(v609, 0.12) < v606 and v_u_58.sprayCount > 0 then
			if v_u_58.recovering == 0 and v_u_58.recoilAccum > 0 then
				local v610 = (v_u_36("CameraController", "getPitch") or 0) - v_u_58.sprayPitch0
				local v611 = v_u_58
				local v612 = v_u_58.recoilAccum
				local v613 = math.min(v612, v610)
				v611.recovering = math.max(0, v613) * v602.recoil.Recovery
				v_u_58.recoilAccum = 0
			end
			v_u_58.sprayCount = 0
		end
		if v_u_58.recovering > 0 then
			local v614 = v_u_58.recovering
			local v615 = v602.recoil.RecoverySpeed * p601
			local v616 = math.min(v614, v615)
			local v617 = v_u_58
			v617.recovering = v617.recovering - v616
			local v618 = -v616
			local v619 = v_u_22.Character
			if not (v619 and v619.Parent) then
				v619 = nil
			end
			local v620
			if v619 == nil then
				v620 = false
			else
				v620 = v619:GetAttribute("InVehicle") == true
			end
			if v620 then
				v_u_36("VehicleController", "addRecoil", v618, 0)
			else
				v_u_36("CameraController", "addRecoil", v618, 0)
			end
			if v_u_58.trigger then
				v_u_58.recovering = 0
			end
		end
	end
	if v603 then
		local v621 = v603:GetAttribute("Sprinting") == true
		if not v621 then
			local v622 = v_u_36("MovementController", "getState")
			if type(v622) == "table" then
				v621 = v622.sprinting == true
			else
				v621 = false
			end
		end
		if v621 then
			v_u_60 = os.clock()
		end
	end
	v_u_387()
	v_u_480()
	v_u_600(p601)
	if v_u_58.reloading and v_u_58.reloadKind == "Mag" then
		local _ = os.clock() > v_u_58.reloadStart + v_u_58.reloadDur + 0.05
	end
end
function v_u_21.getState() -- name: getState
	-- upvalues: (copy) v_u_58, (copy) v_u_36, (copy) v_u_26, (copy) v_u_15, (copy) v_u_133
	local v624 = v_u_58.stats
	local v625 = v_u_36("CameraController", "getMode") or "TPP"
	local v626 = {
		["slot"] = v_u_58.slot,
		["weaponId"] = v_u_58.weaponId,
		["ammo"] = v_u_58.ammo
	}
	local v627 = v_u_58.stats
	local v628
	if v627 and v627.ammo then
		local v629 = v_u_26.InventoryClient
		if not v629 then
			local v630 = script.Parent:FindFirstChild("InventoryClient")
			if v630 then
				local v631 = require
				local v632
				v632, v629 = pcall(v631, v630)
				if v632 and type(v629) == "table" then
					v_u_26.InventoryClient = v629
				else
					v629 = nil
				end
			else
				v629 = nil
			end
		end
		v628 = v629 and (v629.count(v627.ammo) or 0) or 0
	else
		v628 = 0
	end
	v626.reserve = v628
	local v633
	if v624 then
		v633 = v624.magSize
	else
		v633 = v624
	end
	v626.magSize = v633
	v626.fireMode = v_u_58.fireMode
	v626.reloading = v_u_58.reloading
	local v634
	if v624 and v624.isGun then
		v634 = v_u_15.zeroFor(v624, v_u_58.zeroing) or nil
	else
		v634 = nil
	end
	v626.zeroing = v634
	local v635
	if v_u_58.reloading then
		local v636 = os.clock() - v_u_58.reloadStart
		local v637 = v_u_58.reloadDur
		local v638 = v636 / math.max(v637, 0.01)
		v635 = math.clamp(v638, 0, 1) or nil
	else
		v635 = nil
	end
	v626.reloadProgress = v635
	local v639 = v_u_58.stats
	local v640
	if v639 then
		if v639.variable and v_u_58.varZoom then
			v640 = v_u_58.varZoom
		else
			v640 = v639.zoom or 1
		end
	else
		v640 = 1
	end
	v626.adsZoom = v640
	local v641
	if v625 == "ADS" then
		v641 = true
	elseif v625 == "Vehicle" then
		v641 = v_u_36("CameraController", "isADS") == true
	else
		v641 = false
	end
	v626.ads = v641
	v626.aiming = v625 == "Aim"
	v626.spread = v_u_133()
	v626.breath = v_u_58.breath
	v626.holdingBreath = v_u_58.holding
	v626.exhausted = v_u_58.exhausted
	v626.equipping = os.clock() < v_u_58.readyAt
	local v642
	if v624 then
		v642 = v624.optic
	else
		v642 = v624
	end
	v626.optic = v642
	if v624 then
		v624 = v624.scopeMask
	end
	v626.scope = v624
	local v643
	if v_u_58.stats == nil then
		v643 = false
	else
		v643 = v_u_58.stats.isGun == true
	end
	v626.isGun = v643
	if v_u_58.slot == "Throwable" then
		v626.throwable = v_u_36("ThrowableController", "getState")
	end
	return v626
end
function v_u_21.getStats() -- name: getStats
	-- upvalues: (copy) v_u_58
	return v_u_58.stats
end
function v_u_21.getVariableZoom() -- name: getVariableZoom
	-- upvalues: (copy) v_u_58
	return v_u_58.varZoom
end
function v_u_21.isFiring() -- name: isFiring
	-- upvalues: (copy) v_u_58
	return os.clock() - v_u_58.lastShot < 0.2
end
function v_u_21.wantsFire() -- name: wantsFire
	-- upvalues: (copy) v_u_58
	local v644
	if v_u_58.stats == nil then
		v644 = false
	else
		v644 = v_u_58.stats.isGun == true
	end
	if v644 then
		v644 = v_u_58.trigger or v_u_58.pendingSemi or v_u_58.burstLeft > 0
	end
	return v644
end
function v_u_21.getSwayLevel() -- name: getSwayLevel
	-- upvalues: (ref) v_u_61
	return v_u_61
end
function v_u_21.isReloading() -- name: isReloading
	-- upvalues: (copy) v_u_58
	return v_u_58.reloading == true
end
function v_u_21.getAmmo() -- name: getAmmo
	-- upvalues: (copy) v_u_58
	return v_u_58.ammo or 0
end
function v_u_21.getZeroing() -- name: getZeroing
	-- upvalues: (copy) v_u_15, (copy) v_u_58
	return v_u_15.zeroFor(v_u_58.stats, v_u_58.zeroing)
end
function v_u_21.reload() -- name: reload
	-- upvalues: (ref) v_u_469
	v_u_469()
end
local function v_u_708() -- name: bindInputs
	-- upvalues: (ref) v_u_25, (copy) v_u_58, (copy) v_u_36, (copy) v_u_94, (copy) v_u_26, (ref) v_u_469, (copy) v_u_22, (copy) v_u_7, (copy) v_u_24, (copy) v_u_57, (copy) v_u_21, (copy) v_u_481, (copy) v_u_500, (copy) v_u_493, (copy) v_u_78, (copy) v_u_505, (copy) v_u_15
	v_u_25.bind("Fire", function(p645)
		-- upvalues: (ref) v_u_58, (ref) v_u_36, (ref) v_u_94, (ref) v_u_26, (ref) v_u_469
		local v646
		if v_u_58.stats == nil then
			v646 = false
		else
			v646 = v_u_58.stats.isGun == true
		end
		if not v646 then
			return false
		end
		if p645 == "Begin" then
			v_u_36("MovementController", "cancelSprint", 0.5)
			v_u_58.trigger = true
			local v647 = v_u_58.fireMode
			if v647 == "Single" or v_u_58.stats and v_u_58.stats.boltAction then
				v_u_58.pendingSemi = true
				v_u_58.semiAt = os.clock()
			elseif v647 == "Burst" and v_u_58.burstLeft <= 0 then
				v_u_58.burstLeft = v_u_58.stats.burst or 3
			end
			if v_u_58.ammo <= 0 and (v_u_94() and os.clock() >= v_u_58.nextShot) then
				local v648 = v_u_58
				local v649 = v_u_58
				v_u_58.trigger = false
				v648.pendingSemi = false
				v649.burstLeft = 0
				local v650 = v_u_58.stats
				local v651
				if v650 and v650.ammo then
					local v652 = v_u_26.InventoryClient
					if not v652 then
						local v653 = script.Parent:FindFirstChild("InventoryClient")
						if v653 then
							local v654 = require
							local v655
							v655, v652 = pcall(v654, v653)
							if v655 and type(v652) == "table" then
								v_u_26.InventoryClient = v652
							else
								v652 = nil
							end
						else
							v652 = nil
						end
					end
					v651 = v652 and (v652.count(v650.ammo) or 0) or 0
				else
					v651 = 0
				end
				if v651 > 0 then
					v_u_469()
				else
					local v656 = v_u_26.BallisticsFx
					if not v656 then
						local v657 = script.Parent:FindFirstChild("BallisticsFx")
						if v657 then
							local v658 = require
							local v659
							v659, v656 = pcall(v658, v657)
							if v659 and type(v656) == "table" then
								v_u_26.BallisticsFx = v656
							else
								v656 = nil
							end
						else
							v656 = nil
						end
					end
					if v656 then
						v656.play2D("DryFire", 0.6)
					end
				end
			end
		else
			v_u_58.trigger = false
		end
		return false
	end, 50)
	v_u_25.bind("Aim", function(p660)
		-- upvalues: (ref) v_u_22, (ref) v_u_7, (ref) v_u_36
		if p660 ~= "Begin" then
			return false
		end
		local v661 = v_u_22.Character
		if not (v661 and v661.Parent) then
			v661 = nil
		end
		if not v661 or (v661:GetAttribute("Equipped") ~= nil or not v_u_7.isStanding(v661)) then
			return false
		end
		v_u_36("MeleeController", "kick")
		return true
	end, 5)
	v_u_25.bind("Reload", function(p662)
		-- upvalues: (ref) v_u_58, (ref) v_u_469
		if p662 == "Begin" then
			local v663
			if v_u_58.stats == nil then
				v663 = false
			else
				v663 = v_u_58.stats.isGun == true
			end
			if v663 then
				v_u_469()
			end
		end
		return false
	end, 50)
	v_u_25.bind("FireMode", function(p664)
		-- upvalues: (ref) v_u_58, (ref) v_u_24, (ref) v_u_26, (ref) v_u_57, (ref) v_u_21
		if p664 == "Begin" then
			local v665
			if v_u_58.stats == nil then
				v665 = false
			else
				v665 = v_u_58.stats.isGun == true
			end
			if v665 then
				local v666 = v_u_58.stats
				if #v666.fireModes < 2 then
					return false
				end
				local v667 = table.find(v666.fireModes, v_u_58.fireMode) or 1
				v_u_58.fireMode = v666.fireModes[v667 % #v666.fireModes + 1]
				v_u_58.burstLeft = 0
				v_u_24.FireMode:FireServer()
				local v668 = v_u_26.BallisticsFx
				if not v668 then
					local v669 = script.Parent:FindFirstChild("BallisticsFx")
					if v669 then
						local v670 = require
						local v671
						v671, v668 = pcall(v670, v669)
						if v671 and type(v668) == "table" then
							v_u_26.BallisticsFx = v668
						else
							v668 = nil
						end
					else
						v668 = nil
					end
				end
				if v668 then
					v668.play2D("FireMode", 0.6)
				end
				v_u_57(v666.animPack, "FireMode", 0.45)
				v_u_21.Changed:Fire()
				return true
			end
		end
		return false
	end, 50)
	for v672, v_u_673 in v_u_481 do
		v_u_25.bind(v672, function(p674)
			-- upvalues: (ref) v_u_500, (copy) v_u_673
			if p674 == "Begin" then
				v_u_500(v_u_673)
			end
			return false
		end, 50)
	end
	v_u_25.bind("Holster", function(p675)
		-- upvalues: (ref) v_u_58, (ref) v_u_493, (ref) v_u_36, (ref) v_u_24
		if p675 == "Begin" and (v_u_58.slot ~= nil and v_u_493()) then
			v_u_36("CameraController", "setADS", false)
			v_u_24.Equip:FireServer(nil)
		end
		return false
	end, 50)
	local function v_u_683(p676, p677) -- name: wheel
		-- upvalues: (ref) v_u_58, (ref) v_u_36, (ref) v_u_78, (ref) v_u_21, (ref) v_u_505
		local v678 = v_u_58.stats
		if not v678 or (not v678.variable or (v_u_36("CameraController", "getMode") or "TPP") ~= "ADS") then
			v_u_505(p677)
			return false
		end
		local v679 = (v_u_58.varZoom or v678.variable.Max) + p676
		local v680 = v678.variable.Min
		local v681 = v678.variable.Max
		local v682 = math.clamp(v679, v680, v681)
		if v682 ~= v_u_58.varZoom then
			v_u_58.varZoom = v682
			v_u_78()
			v_u_21.Changed:Fire()
		end
		return true
	end
	v_u_25.bind("NextWeapon", function(p684)
		-- upvalues: (copy) v_u_683
		if p684 == "Begin" then
			return v_u_683(-1, 1)
		else
			return false
		end
	end, 50)
	v_u_25.bind("PrevWeapon", function(p685)
		-- upvalues: (copy) v_u_683
		if p685 == "Begin" then
			return v_u_683(1, -1)
		else
			return false
		end
	end, 50)
	v_u_25.bind("ZeroUp", function(p686)
		-- upvalues: (ref) v_u_58, (ref) v_u_24, (ref) v_u_15, (ref) v_u_26, (ref) v_u_21
		if p686 == "Begin" then
			local v687
			if v_u_58.stats == nil then
				v687 = false
			else
				v687 = v_u_58.stats.isGun == true
			end
			if v687 then
				v_u_24.Zero:FireServer(1)
				local v688 = v_u_58.stats.zeroList
				local v689 = table.find(v688, v_u_15.zeroFor(v_u_58.stats, v_u_58.zeroing)) or 1
				local v690 = v_u_58
				local v691 = #v688
				local v692 = v689 + 1
				v690.zeroing = v688[math.min(v691, v692)]
				local v693 = v_u_26.BallisticsFx
				if not v693 then
					local v694 = script.Parent:FindFirstChild("BallisticsFx")
					if v694 then
						local v695 = require
						local v696
						v696, v693 = pcall(v695, v694)
						if v696 and type(v693) == "table" then
							v_u_26.BallisticsFx = v693
						else
							v693 = nil
						end
					else
						v693 = nil
					end
				end
				if v693 then
					v693.play2D("FireMode", 0.35, 1.3)
				end
				v_u_21.Changed:Fire()
			end
		end
		return false
	end, 50)
	v_u_25.bind("ZeroDown", function(p697)
		-- upvalues: (ref) v_u_58, (ref) v_u_24, (ref) v_u_15, (ref) v_u_26, (ref) v_u_21
		if p697 == "Begin" then
			local v698
			if v_u_58.stats == nil then
				v698 = false
			else
				v698 = v_u_58.stats.isGun == true
			end
			if v698 then
				v_u_24.Zero:FireServer(-1)
				local v699 = v_u_58.stats.zeroList
				local v700 = v_u_58
				local v701 = (table.find(v699, v_u_15.zeroFor(v_u_58.stats, v_u_58.zeroing)) or 1) - 1
				v700.zeroing = v699[math.max(1, v701)]
				local v702 = v_u_26.BallisticsFx
				if not v702 then
					local v703 = script.Parent:FindFirstChild("BallisticsFx")
					if v703 then
						local v704 = require
						local v705
						v705, v702 = pcall(v704, v703)
						if v705 and type(v702) == "table" then
							v_u_26.BallisticsFx = v702
						else
							v702 = nil
						end
					else
						v702 = nil
					end
				end
				if v702 then
					v702.play2D("FireMode", 0.35, 1.2)
				end
				v_u_21.Changed:Fire()
			end
		end
		return false
	end, 50)
	v_u_25.bind("HoldBreath", function(p706)
		-- upvalues: (ref) v_u_58
		v_u_58.holdKey = p706 == "Begin"
		return false
	end, 50)
	v_u_25.bind("ThrowableCycle", function(p707)
		-- upvalues: (ref) v_u_36
		if p707 == "Begin" then
			v_u_36("InventoryClient", "cycleThrowable")
		end
		return false
	end, 50)
end
local function v_u_718(p709) -- name: onWeaponState
	-- upvalues: (copy) v_u_58, (copy) v_u_9, (copy) v_u_21
	if type(p709) == "table" then
		if p709.slot == v_u_58.slot then
			local v710 = p709.ammo
			if type(v710) == "number" and (os.clock() - v_u_58.lastShot > 0.35 and (not v_u_58.reloading or v_u_58.reloadKind ~= "Shell")) then
				v_u_58.ammo = p709.ammo
			end
			if p709.reloading == false and v_u_58.reloading then
				v_u_58.reloading = false
				local v711 = v_u_58
				v711.reloadToken = v711.reloadToken + 1
				local v712 = p709.ammo
				if type(v712) == "number" then
					v_u_58.ammo = p709.ammo
				end
			end
			local v713 = p709.fireMode
			if type(v713) == "string" and (v_u_58.stats and v_u_58.stats.isGun) then
				local v714 = v_u_58
				local v715 = v_u_58.stats
				local v716 = p709.fireMode
				if not (v716 and table.find(v715.fireModes, v716)) then
					v716 = v_u_9.pickDefaultMode(v715.fireModes) or v715.fireModes[1]
				end
				v714.fireMode = v716
			end
			local v717 = p709.zeroing
			if type(v717) == "number" then
				v_u_58.zeroing = p709.zeroing
			end
			v_u_21.Changed:Fire()
		end
	else
		return
	end
end
local function v_u_725(p719) -- name: onHitConfirm
	-- upvalues: (copy) v_u_26, (copy) v_u_21
	if type(p719) == "table" then
		local v720 = p719.kill and "Kill" or (p719.knock and "Knock" or (p719.headshot and "Headshot" or "Hit"))
		if p719.blocked then
			local v721 = v_u_26.BallisticsFx
			if not v721 then
				local v722 = script.Parent:FindFirstChild("BallisticsFx")
				if v722 then
					local v723 = require
					local v724
					v724, v721 = pcall(v723, v722)
					if v724 and type(v721) == "table" then
						v_u_26.BallisticsFx = v721
					else
						v721 = nil
					end
				else
					v721 = nil
				end
			end
			if v721 then
				v721.play2D("PanHit", 0.35)
			end
		end
		v_u_21.HitMarker:Fire(v720, p719)
	end
end
local function v_u_729(p726) -- name: onDamageTaken
	-- upvalues: (copy) v_u_36, (copy) v_u_23
	if type(p726) == "table" then
		local v727 = p726.punch
		local v728 = tonumber(v727) or 0
		if v728 > 0 then
			v_u_36("CameraController", "shake", v728 * 2.2)
			v_u_36("CameraController", "addRecoil", v728 * 1.1, (v_u_23:NextNumber() - 0.5) * v728 * 1.2)
		end
	end
end
local function v_u_737(p_u_730) -- name: hookCharacter
	-- upvalues: (copy) v_u_58, (ref) v_u_61, (ref) v_u_62, (ref) v_u_63, (ref) v_u_64, (ref) v_u_65, (ref) v_u_66, (ref) v_u_67, (ref) v_u_60, (copy) v_u_59, (copy) v_u_21, (copy) v_u_554
	local v731 = v_u_58
	local v732 = v_u_58
	local v733 = v_u_58
	v_u_58.slot = nil
	v731.weaponId = nil
	v732.uid = nil
	v733.stats = nil
	v_u_61 = 0
	v_u_62 = 0
	v_u_63 = nil
	v_u_64 = 0
	v_u_65 = nil
	v_u_66 = nil
	v_u_67 = false
	v_u_60 = -10
	v_u_58.reloading = false
	local v734 = v_u_58
	local v735 = v_u_58
	v_u_58.trigger = false
	v734.pendingSemi = false
	v735.burstLeft = 0
	table.clear(v_u_59)
	if p_u_730 then
		p_u_730:GetAttributeChangedSignal("Equipped"):Connect(v_u_554)
		p_u_730:GetAttributeChangedSignal("EquippedSlot"):Connect(v_u_554)
		p_u_730:GetAttributeChangedSignal("Reloading"):Connect(function()
			-- upvalues: (copy) p_u_730, (ref) v_u_58, (ref) v_u_21
			if p_u_730:GetAttribute("Reloading") ~= true and (v_u_58.reloading and os.clock() - v_u_58.reloadStart > 0.3) then
				v_u_58.reloading = false
				local v736 = v_u_58
				v736.reloadToken = v736.reloadToken + 1
				v_u_21.Changed:Fire()
			end
		end)
		task.defer(v_u_554)
	else
		v_u_21.Changed:Fire()
	end
end
function v_u_21.init() -- name: init
	-- upvalues: (ref) v_u_25, (copy) v_u_26, (copy) v_u_24, (copy) v_u_5, (copy) v_u_708
	local v738 = v_u_26.InputController
	if not v738 then
		local v739 = script.Parent:FindFirstChild("InputController")
		if v739 then
			local v740 = require
			local v741
			v741, v738 = pcall(v740, v739)
			if v741 and type(v738) == "table" then
				v_u_26.InputController = v738
			else
				v738 = nil
			end
		else
			v738 = nil
		end
	end
	v_u_25 = v738
	v_u_24.Equip = v_u_5.event("WeaponEquip")
	v_u_24.Fire = v_u_5.event("WeaponFire")
	v_u_24.Hit = v_u_5.event("WeaponHit")
	v_u_24.Reload = v_u_5.event("WeaponReload")
	v_u_24.FireMode = v_u_5.event("WeaponFireMode")
	v_u_24.Zero = v_u_5.event("WeaponZero")
	v_u_24.Aim = v_u_5.event("WeaponAim")
	if v_u_25 then
		v_u_708()
	end
end
function v_u_21.start() -- name: start
	-- upvalues: (copy) v_u_5, (copy) v_u_718, (copy) v_u_725, (copy) v_u_729, (copy) v_u_26, (copy) v_u_554, (copy) v_u_24, (copy) v_u_21, (copy) v_u_22, (copy) v_u_737, (copy) v_u_58, (ref) v_u_61, (ref) v_u_62, (ref) v_u_63, (ref) v_u_64, (ref) v_u_65, (ref) v_u_66, (ref) v_u_67, (ref) v_u_60, (copy) v_u_59, (copy) v_u_2, (copy) v_u_623, (copy) v_u_260
	v_u_5.event("WeaponState").OnClientEvent:Connect(v_u_718)
	v_u_5.event("HitConfirm").OnClientEvent:Connect(v_u_725)
	v_u_5.event("DamageTaken").OnClientEvent:Connect(v_u_729)
	local v742 = v_u_26.InventoryClient
	if not v742 then
		local v743 = script.Parent:FindFirstChild("InventoryClient")
		if v743 then
			local v744 = require
			local v745
			v745, v742 = pcall(v744, v743)
			if v745 and type(v742) == "table" then
				v_u_26.InventoryClient = v742
			else
				v742 = nil
			end
		else
			v742 = nil
		end
	end
	if v742 and v742.Changed then
		v742.Changed:Connect(v_u_554)
	end
	local v746 = v_u_26.CameraController
	if not v746 then
		local v747 = script.Parent:FindFirstChild("CameraController")
		if v747 then
			local v748 = require
			local v749
			v749, v746 = pcall(v748, v747)
			if v749 and type(v746) == "table" then
				v_u_26.CameraController = v746
			else
				v746 = nil
			end
		else
			v746 = nil
		end
	end
	if v746 and v746.ModeChanged then
		v746.ModeChanged:Connect(function(p750)
			-- upvalues: (ref) v_u_24, (ref) v_u_21
			v_u_24.Aim:FireServer({
				["aiming"] = p750 == "Aim" and true or p750 == "ADS",
				["ads"] = p750 == "ADS"
			})
			v_u_21.Changed:Fire()
		end)
	end
	v_u_22.CharacterAdded:Connect(v_u_737)
	v_u_22.CharacterRemoving:Connect(function()
		-- upvalues: (ref) v_u_58, (ref) v_u_61, (ref) v_u_62, (ref) v_u_63, (ref) v_u_64, (ref) v_u_65, (ref) v_u_66, (ref) v_u_67, (ref) v_u_60, (ref) v_u_59, (ref) v_u_21
		local v751 = v_u_58
		local v752 = v_u_58
		local v753 = v_u_58
		v_u_58.slot = nil
		v751.weaponId = nil
		v752.uid = nil
		v753.stats = nil
		v_u_61 = 0
		v_u_62 = 0
		v_u_63 = nil
		v_u_64 = 0
		v_u_65 = nil
		v_u_66 = nil
		v_u_67 = false
		v_u_60 = -10
		v_u_58.reloading = false
		local v754 = v_u_58
		local v755 = v_u_58
		v_u_58.trigger = false
		v754.pendingSemi = false
		v755.burstLeft = 0
		table.clear(v_u_59)
		v_u_21.Changed:Fire()
	end)
	v_u_737(v_u_22.Character)
	v_u_2:BindToRenderStep("CombatWeapon", Enum.RenderPriority.Camera.Value + 3, function(p756)
		-- upvalues: (ref) v_u_623
		local v757 = v_u_623
		local v758, v759 = pcall(v757, p756)
		if not v758 then
			warn("[WeaponController] " .. tostring(v759))
		end
	end)
	v_u_2.Heartbeat:Connect(function(p760)
		-- upvalues: (ref) v_u_260
		local v761 = v_u_260
		local v762, v763 = pcall(v761, p760)
		if not v762 then
			warn("[WeaponController] bullets: " .. tostring(v763))
		end
	end)
end
return v_u_21