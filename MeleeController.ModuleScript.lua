-- Decompiled by Executor
-- Path: ReplicatedStorage.Client.Controllers.MeleeController

local v1 = game:GetService("Players")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("ReplicatedStorage")
local v_u_4 = require(v_u_3.Shared.Net)
local v5 = require(v_u_3.Shared.Util.Signal)
local v_u_6 = require(v_u_3.Shared.Util.Participant)
local v_u_7 = require(v_u_3.Shared.Config.WeaponConfig)
local v_u_8 = require(v_u_3.Shared.Config.DamageConfig)
local v_u_9 = require(v_u_3.Shared.Config.AnimConfig)
local v_u_10 = {
	["Performed"] = v5.new()
}
local v_u_11 = v1.LocalPlayer
local v_u_12 = {}
local v_u_13 = nil
local v_u_14 = {
	["kind"] = nil,
	["t0"] = -10,
	["dur"] = 0.5,
	["variant"] = 1,
	["left"] = false
}
local v_u_15 = 0
local v_u_16 = 0
local v_u_17 = false
local v_u_18 = false
local v_u_19 = {}
local function v_u_29(p20, p21, ...) -- name: call
	-- upvalues: (copy) v_u_19
	local v22 = v_u_19[p20]
	if not v22 then
		local v23 = script.Parent:FindFirstChild(p20)
		if v23 then
			local v24 = require
			local v25
			v25, v22 = pcall(v24, v23)
			if v25 and type(v22) == "table" then
				v_u_19[p20] = v22
			else
				v22 = nil
			end
		else
			v22 = nil
		end
	end
	if v22 then
		v22 = v22[p21]
	end
	if type(v22) == "function" then
		local v26, v27, v28 = pcall(v22, ...)
		if v26 then
			return v27, v28
		else
			return nil
		end
	else
		return nil
	end
end
local function v_u_31() -- name: canAct
	-- upvalues: (copy) v_u_11, (copy) v_u_6, (ref) v_u_13
	local v30 = v_u_11.Character
	if not (v30 and (v30.Parent and v30:FindFirstChild("HumanoidRootPart"))) then
		v30 = nil
	end
	if v30 and v_u_6.isStanding(v30) then
		if v30:GetAttribute("Deploy") == nil and (v30:GetAttribute("InVehicle") ~= true and v30:GetAttribute("Swimming") ~= true) then
			return (v_u_13 and v_u_13.getContext() or "Game") == "Game"
		else
			return false
		end
	else
		return false
	end
end
local function v_u_36(p_u_32, p_u_33) -- name: playAnim
	-- upvalues: (copy) v_u_11, (copy) v_u_3
	if p_u_32 then
		local v_u_34 = v_u_11.Character
		if not (v_u_34 and (v_u_34.Parent and v_u_34:FindFirstChild("HumanoidRootPart"))) then
			v_u_34 = nil
		end
		local v_u_35 = v_u_3.Shared.Util:FindFirstChild("CharAnim")
		if v_u_34 and v_u_35 then
			pcall(function()
				-- upvalues: (copy) v_u_35, (copy) v_u_34, (copy) p_u_32, (copy) p_u_33
				require(v_u_35).get(v_u_34):play(p_u_32, {
					["priority"] = nil,
					["fade"] = 0.05,
					["speed"] = nil,
					["priority"] = Enum.AnimationPriority.Action2,
					["speed"] = p_u_33 or 1
				})
			end)
		end
	else
		return
	end
end
local function v_u_64(p37, p38, p39, p40, p41) -- name: perform
	-- upvalues: (ref) v_u_15, (copy) v_u_12, (copy) v_u_29, (ref) v_u_14, (ref) v_u_16, (ref) v_u_17, (copy) v_u_36, (copy) v_u_19, (copy) v_u_11, (copy) v_u_10
	local v42 = os.clock()
	if v42 < v_u_15 then
		return false
	end
	v_u_15 = v42 + p39
	local v43 = v_u_12.Action
	local v44 = {
		["kind"] = p37
	}
	local _, v45 = v_u_29("CameraController", "getAimRay")
	if typeof(v45) ~= "Vector3" then
		v45 = workspace.CurrentCamera.CFrame.LookVector
	end
	v44.dir = v45
	v43:FireServer(v44)
	v_u_14 = {
		["kind"] = p37,
		["t0"] = v42,
		["dur"] = p38,
		["variant"] = v_u_16,
		["left"] = v_u_17
	}
	v_u_36(p40, p41)
	local v46 = v_u_19.BallisticsFx
	if not v46 then
		local v47 = script.Parent:FindFirstChild("BallisticsFx")
		if v47 then
			local v48 = require
			local v49
			v49, v46 = pcall(v48, v47)
			if v49 and type(v46) == "table" then
				v_u_19.BallisticsFx = v46
			else
				v46 = nil
			end
		else
			v46 = nil
		end
	end
	if v46 and (v46.meleeSound and v46.play2D) then
		local v50 = v_u_11.Character
		if not (v50 and (v50.Parent and v50:FindFirstChild("HumanoidRootPart"))) then
			v50 = nil
		end
		local v51 = v46.meleeSound
		local v52
		if p37 == "Swing" and v50 then
			v52 = v50:GetAttribute("Equipped")
		else
			v52 = p37
		end
		local v53 = v51(v52, "swing")
		local v54 = v46.play2D
		local v55 = v53.id
		local v56 = v53.vol * 0.85
		local v57 = v53.speed
		pcall(v54, v55, v56, v57)
	else
		local v58 = p37 == "Swing" and 0.45 or 0.22
		local v59 = v_u_19.BallisticsFx
		if not v59 then
			local v60 = script.Parent:FindFirstChild("BallisticsFx")
			if v60 then
				local v61 = require
				local v62
				v62, v59 = pcall(v61, v60)
				if v62 and type(v59) == "table" then
					v_u_19.BallisticsFx = v59
				else
					v59 = nil
				end
			else
				v59 = nil
			end
		end
		if v59 and v59.play2D then
			local v63 = v59.play2D
			pcall(v63, "MeleeSwing", v58 or 0.5)
		end
	end
	v_u_10.Performed:Fire(p37)
	return true
end
function v_u_10.getState() -- name: getState
	-- upvalues: (ref) v_u_14
	return v_u_14
end
function v_u_10.swing() -- name: swing
	-- upvalues: (copy) v_u_11, (copy) v_u_31, (copy) v_u_7, (ref) v_u_15, (ref) v_u_16, (copy) v_u_9, (copy) v_u_64
	local v65 = v_u_11.Character
	if not (v65 and (v65.Parent and v65:FindFirstChild("HumanoidRootPart"))) then
		v65 = nil
	end
	if not v65 or (not v_u_31() or v65:GetAttribute("EquippedSlot") ~= "Melee") then
		return false
	end
	local v66 = v65:GetAttribute("Equipped")
	local v67 = type(v66) == "string" and v_u_7.Weapons[v66] or nil
	if not v67 or v67.Class ~= "Melee" then
		return false
	end
	if os.clock() < v_u_15 then
		return false
	end
	v_u_16 = v_u_16 % 3 + 1
	local v68 = v_u_9.Weapons.Melee
	if v68 then
		v68 = v68["Slash" .. (v_u_16 - 1) % 5 + 1]
	end
	local v69 = v_u_64
	local v70 = (v67.SwingTime or 0.25) * 2.6
	return v69("Swing", math.max(v70, 0.45), v67.Cooldown or 0.75, v68, 1.3)
end
function v_u_10.punch() -- name: punch
	-- upvalues: (copy) v_u_11, (copy) v_u_31, (ref) v_u_15, (ref) v_u_17, (copy) v_u_8, (copy) v_u_9, (copy) v_u_64
	local v71 = v_u_11.Character
	if not (v71 and (v71.Parent and v71:FindFirstChild("HumanoidRootPart"))) then
		v71 = nil
	end
	if not v71 or (not v_u_31() or v71:GetAttribute("Equipped") ~= nil) then
		return false
	end
	if os.clock() < v_u_15 then
		return false
	end
	v_u_17 = not v_u_17
	local v72 = v_u_8.Melee.Punch
	local v73 = v_u_17 and v_u_9.Combat.PunchMirror or v_u_9.Combat.Punch
	local v74 = v_u_64
	local v75 = (v72.SwingTime or 0.15) * 3
	return v74("Punch", math.max(v75, 0.4), v72.Cooldown or 0.45, v73, 1.2)
end
function v_u_10.kick() -- name: kick
	-- upvalues: (copy) v_u_11, (copy) v_u_31, (ref) v_u_15, (copy) v_u_8, (copy) v_u_64, (copy) v_u_9
	local v76 = v_u_11.Character
	if not (v76 and (v76.Parent and v76:FindFirstChild("HumanoidRootPart"))) then
		v76 = nil
	end
	if not v76 or (not v_u_31() or v76:GetAttribute("Equipped") ~= nil) then
		return false
	end
	if os.clock() < v_u_15 then
		return false
	end
	local v77 = v_u_8.Melee.Kick
	local v78 = v_u_64
	local v79 = (v77.SwingTime or 0.25) * 3
	return v78("Kick", math.max(v79, 0.6), v77.Cooldown or 1, v_u_9.Combat.Kick, 1.1)
end
local function v_u_83() -- name: bindInputs
	-- upvalues: (ref) v_u_13, (ref) v_u_18, (copy) v_u_11, (copy) v_u_10, (copy) v_u_31
	v_u_13.bind("Fire", function(p80)
		-- upvalues: (ref) v_u_18, (ref) v_u_11, (ref) v_u_10, (ref) v_u_31
		if p80 == "Begin" then
			local v81 = v_u_11.Character
			if not (v81 and (v81.Parent and v81:FindFirstChild("HumanoidRootPart"))) then
				v81 = nil
			end
			if v81 then
				if v81:GetAttribute("EquippedSlot") == "Melee" then
					v_u_18 = true
					v_u_10.swing()
					return true
				else
					if v81:GetAttribute("Equipped") ~= nil or not v_u_31() then
						return false
					end
					v_u_10.punch()
					return true
				end
			else
				return false
			end
		else
			v_u_18 = false
			return false
		end
	end, 40)
	v_u_13.bind("Kick", function(p82)
		-- upvalues: (ref) v_u_10
		if p82 == "Begin" then
			return v_u_10.kick()
		else
			return false
		end
	end, 40)
end
function v_u_10.init() -- name: init
	-- upvalues: (ref) v_u_13, (copy) v_u_19, (copy) v_u_12, (copy) v_u_4, (copy) v_u_83
	local v84 = v_u_19.InputController
	if not v84 then
		local v85 = script.Parent:FindFirstChild("InputController")
		if v85 then
			local v86 = require
			local v87
			v87, v84 = pcall(v86, v85)
			if v87 and type(v84) == "table" then
				v_u_19.InputController = v84
			else
				v84 = nil
			end
		else
			v84 = nil
		end
	end
	v_u_13 = v84
	v_u_12.Action = v_u_4.event("MeleeAction")
	if v_u_13 then
		v_u_83()
	end
end
function v_u_10.start() -- name: start
	-- upvalues: (copy) v_u_11, (ref) v_u_14, (ref) v_u_15, (ref) v_u_18, (copy) v_u_2, (ref) v_u_13, (copy) v_u_10
	v_u_11.CharacterAdded:Connect(function()
		-- upvalues: (ref) v_u_14, (ref) v_u_15, (ref) v_u_18
		v_u_14 = {
			["kind"] = nil,
			["t0"] = -10,
			["dur"] = 0.5,
			["variant"] = 1,
			["left"] = false
		}
		v_u_15 = 0
		v_u_18 = false
	end)
	v_u_2.Heartbeat:Connect(function()
		-- upvalues: (ref) v_u_18, (ref) v_u_15, (ref) v_u_11, (ref) v_u_13, (ref) v_u_10
		if v_u_18 and v_u_15 <= os.clock() then
			local v88 = v_u_11.Character
			if not (v88 and (v88.Parent and v88:FindFirstChild("HumanoidRootPart"))) then
				v88 = nil
			end
			if v88 and (v88:GetAttribute("EquippedSlot") == "Melee" and (v_u_13 and v_u_13.isDown("Fire"))) then
				v_u_10.swing()
				return
			end
			v_u_18 = false
		end
	end)
end
return v_u_10