-- Decompiled by Executor
-- Path: ReplicatedStorage.Client.Controllers.AnimGuardController

local v1 = game:GetService("Players")
local v_u_2 = game:GetService("RunService")
local v3 = game:GetService("ReplicatedStorage")
local v4 = require(v3.Shared.Config.AnimConfig)
local v_u_5 = v1.LocalPlayer
local v_u_6 = v4.Movement
local v_u_7 = {}
local v8 = v_u_6.FreeFall
v_u_7["rbxassetid://" .. tostring(v8)] = true
local v9 = v_u_6.FreeFallEnter
v_u_7["rbxassetid://" .. tostring(v9)] = true
local v10 = v_u_6.FreeFallDive
v_u_7["rbxassetid://" .. tostring(v10)] = true
local v_u_11 = {}
local v12 = {}
for _, v13 in v4.Healing do
	v_u_11["rbxassetid://" .. tostring(v13)] = true
end
local v_u_14 = {}
local v_u_15 = {}
local v_u_16 = {}
local v_u_17 = {}
local function v_u_31(p18) -- name: onDied
	-- upvalues: (copy) v_u_14, (copy) v_u_15, (copy) v_u_6, (copy) v_u_17
	local v19 = v_u_14[p18]
	if v19 and not v19.pending then
		return
	else
		local v20 = p18:FindFirstChildOfClass("Humanoid")
		if v20 then
			v20 = v20:FindFirstChildOfClass("Animator")
		end
		local v21 = p18:FindFirstChild("HumanoidRootPart")
		local v22 = workspace.CurrentCamera
		if v20 and (v21 and (not v22 or (v21.Position - v22.CFrame.Position).Magnitude <= 2000)) then
			local v23
			if p18:GetAttribute("Knocked") == true then
				v23 = true
			elseif v_u_15[p18] == nil then
				v23 = false
			else
				v23 = os.clock() - v_u_15[p18] < 1.5
			end
			local v24 = (v19 ~= nil or p18:GetAttribute("Stance") == "Prone") and true or p18:GetAttribute("Swimming") == true
			for _, v25 in v20:GetPlayingAnimationTracks() do
				v25:Stop(0.15)
			end
			local v26 = v20.LoadAnimation
			local v27
			if v23 then
				v27 = v_u_6.DeathFromKnocked
			else
				v27 = v_u_6.Death
			end
			local v28 = v_u_17[v27]
			if not v28 then
				v28 = Instance.new("Animation")
				v28.AnimationId = "rbxassetid://" .. tostring(v27)
				v_u_17[v27] = v28
			end
			local v29, v30 = pcall(v26, v20, v28)
			if v29 and v30 then
				v30.Priority = Enum.AnimationPriority.Action4
				v30.Looped = false
				v30:Play(v24 and 0.25 or 0.12)
				v_u_14[p18] = {
					["track"] = nil,
					["an"] = nil,
					["frozen"] = false,
					["toEnd"] = nil,
					["track"] = v30,
					["an"] = v20,
					["toEnd"] = v24
				}
			else
				v_u_14[p18] = {
					["skip"] = true
				}
			end
		else
			v_u_14[p18] = {
				["pending"] = true
			}
			return
		end
	end
end
local function v_u_47(p_u_32) -- name: track
	-- upvalues: (copy) v_u_16, (copy) v_u_15, (copy) v_u_31
	if p_u_32:IsA("Model") and not v_u_16[p_u_32] then
		local v_u_33 = {}
		v_u_16[p_u_32] = v_u_33
		local v34 = p_u_32:GetAttributeChangedSignal("Knocked")
		local function v35()
			-- upvalues: (ref) v_u_15, (copy) p_u_32
			v_u_15[p_u_32] = os.clock()
		end
		table.insert(v_u_33, v34:Connect(v35))
		task.spawn(function()
			-- upvalues: (copy) p_u_32, (ref) v_u_16, (ref) v_u_31, (copy) v_u_33
			local v36 = p_u_32:WaitForChild("Humanoid", 10)
			if v36 and v_u_16[p_u_32] then
				if v36.Health <= 0 then
					v_u_31(p_u_32)
				else
					local v37 = v_u_33
					local v38 = v36.Died
					local function v39()
						-- upvalues: (ref) v_u_31, (ref) p_u_32
						v_u_31(p_u_32)
					end
					table.insert(v37, v38:Connect(v39))
					local v40 = v_u_33
					local v41 = v36.HealthChanged
					local function v43(p42)
						-- upvalues: (ref) v_u_31, (ref) p_u_32
						if p42 <= 0 then
							v_u_31(p_u_32)
						end
					end
					table.insert(v40, v41:Connect(v43))
					local v44 = v_u_33
					local v45 = p_u_32:GetAttributeChangedSignal("Eliminated")
					local function v46()
						-- upvalues: (ref) p_u_32, (ref) v_u_31
						if p_u_32:GetAttribute("Eliminated") == true then
							v_u_31(p_u_32)
						end
					end
					table.insert(v44, v45:Connect(v46))
				end
			else
				return
			end
		end)
	end
end
local function v_u_51(p48) -- name: untrack
	-- upvalues: (copy) v_u_16, (copy) v_u_14, (copy) v_u_15
	local v49 = v_u_16[p48]
	if v49 then
		for _, v50 in v49 do
			v50:Disconnect()
		end
		v_u_16[p48] = nil
	end
	v_u_14[p48] = nil
	v_u_15[p48] = nil
end
local function v_u_57() -- name: freezeStep
	-- upvalues: (copy) v_u_14
	for _, v52 in v_u_14 do
		local v53 = v52.track
		if not v53 or v52.frozen then
			continue
		end
		local v54 = v53.Length
		if v54 <= 0 then
			continue
		end
		if v52.toEnd then
			if not v53.IsPlaying then
				v53:Play(0.25)
			end
			local v55 = v54 - 0.03
			v53.TimePosition = math.max(0, v55)
			v53:AdjustSpeed(0)
			v52.frozen = true
		elseif v53.IsPlaying and v53.TimePosition >= v54 - 0.06 then
			v53:AdjustSpeed(0)
			v52.frozen = true
		else
			if v53.IsPlaying then
				continue
			end
			v53:Play(0)
			local v56 = v54 - 0.03
			v53.TimePosition = math.max(0, v56)
			v53:AdjustSpeed(0)
			v52.frozen = true
		end
	end
end
local function v_u_74() -- name: guardStep
	-- upvalues: (copy) v_u_5, (copy) v_u_14, (copy) v_u_31, (copy) v_u_7, (copy) v_u_11
	local v58 = workspace.CurrentCamera
	local v59 = workspace:FindFirstChild("Live")
	if v58 and v59 then
		local v60 = v58.CFrame.Position
		local v61 = v_u_5.Character
		for _, v62 in v59:GetChildren() do
			local v63 = v62:FindFirstChild("HumanoidRootPart")
			local v64 = v62:FindFirstChildOfClass("Humanoid")
			local v65
			if v64 then
				v65 = v64:FindFirstChildOfClass("Animator")
			else
				v65 = v64
			end
			local v66 = v63 and ((v63.Position - v60).Magnitude or (1 / 0)) or (1 / 0)
			local v67 = v_u_14[v62]
			if v67 and (v67.pending and (v65 and v66 < 2000)) then
				v_u_31(v62)
			end
			if not v63 or (not v65 or v66 >= 250) then
				continue
			end
			local v68 = v_u_14[v62]
			if v68 and v68.track then
				for _, v69 in v65:GetPlayingAnimationTracks() do
					if v69 == v68.track then
						continue
					end
					v69:Stop(0.1)
				end
			else
				if v64.Health <= 0 then
					continue
				end
				local v70 = v62:GetAttribute("Deploy")
				local v71
				if v62:GetAttribute("UsingItem") == nil then
					v71 = false
				else
					v71 = v62:GetAttribute("Knocked") ~= true
				end
				for _, v72 in v65:GetPlayingAnimationTracks() do
					local v73 = v72.Animation
					if v73 then
						v73 = v72.Animation.AnimationId
					end
					if not v73 then
						continue
					end
					if v_u_7[v73] and v70 ~= "FreeFall" then
						v72:Stop(0.2)
					else
						if not v_u_11[v73] or (v62 == v61 or v71) then
							continue
						end
						v72:Stop(0.2)
					end
				end
			end
		end
	end
end
function v12.start() -- name: start
	-- upvalues: (copy) v_u_47, (copy) v_u_51, (copy) v_u_2, (copy) v_u_14, (copy) v_u_57, (copy) v_u_74
	local v75 = workspace:WaitForChild("Live", 30)
	if v75 then
		for _, v76 in v75:GetChildren() do
			v_u_47(v76)
		end
		v75.ChildAdded:Connect(v_u_47)
		v75.ChildRemoved:Connect(v_u_51)
		v_u_2.Heartbeat:Connect(function()
			-- upvalues: (ref) v_u_14, (ref) v_u_57
			if next(v_u_14) then
				local v77 = v_u_57
				local v78, v79 = pcall(v77)
				if not v78 then
					warn("[AnimGuardController] " .. tostring(v79))
				end
			end
		end)
		task.spawn(function()
			-- upvalues: (ref) v_u_74
			while true do
				task.wait(0.125)
				local v80 = v_u_74
				pcall(v80)
			end
		end)
	end
end
return v12