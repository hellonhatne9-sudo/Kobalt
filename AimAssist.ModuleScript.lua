-- Decompiled by Executor
-- Path: ReplicatedStorage.Client.Controllers.CameraController.AimAssist

local v1 = game:GetService("Players")
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = require(v_u_2.Shared.Util.Units)
local v_u_5 = require(v_u_2.Shared.Util.Participant)
local v6 = {}
local v_u_7 = {
	["RangeM"] = 120,
	["RangeADSM"] = 220,
	["BubbleM"] = 2.6,
	["MinDeg"] = 3.5,
	["MaxDeg"] = 20,
	["SlowHip"] = 0.4,
	["SlowADS"] = 0.35,
	["FollowHip"] = 0.65,
	["FollowADS"] = 0.8,
	["FollowCapDeg"] = 4,
	["ScanPeriod"] = 0.2
}
v6.Config = v_u_7
local _ = v1.LocalPlayer
local v_u_8 = {}
local v_u_9 = 0
local v_u_10 = nil
local v_u_11 = 0
local v_u_12 = 0
local v_u_13 = -10
local v_u_14 = 0
local v_u_15 = RaycastParams.new()
v_u_15.FilterType = Enum.RaycastFilterType.Exclude
function v6.isTouchDevice() -- name: isTouchDevice
	-- upvalues: (copy) v_u_3
	local v16 = v_u_3:GetLastInputType()
	if v16 == Enum.UserInputType.Keyboard or (v16 == Enum.UserInputType.MouseMovement or (v16 == Enum.UserInputType.MouseButton1 or (v16 == Enum.UserInputType.MouseButton2 or v16 == Enum.UserInputType.MouseWheel))) then
		return false
	end
	local v17 = v_u_3.TouchEnabled and not v_u_3.KeyboardEnabled
	if v17 then
		v17 = not v_u_3.MouseEnabled
	end
	return v17
end
local function v_u_22(p18) -- name: scan
	-- upvalues: (copy) v_u_8, (copy) v_u_5
	table.clear(v_u_8)
	local v19 = workspace:FindFirstChild("Live")
	if v19 then
		for _, v20 in v19:GetChildren() do
			if not v20:IsA("Model") or (v20 == p18 or (not v20:FindFirstChildOfClass("Humanoid") or (not v_u_5.isStanding(v20) or v_u_5.sameTeam(p18, v20)))) then
				continue
			end
			local v21 = v_u_8
			table.insert(v21, v20)
		end
	end
end
function v6.step(_, p23, p_u_24) -- name: step
	-- upvalues: (ref) v_u_10, (ref) v_u_13, (ref) v_u_9, (copy) v_u_7, (copy) v_u_22, (copy) v_u_8, (copy) v_u_4, (copy) v_u_15, (ref) v_u_14, (copy) v_u_2, (ref) v_u_11, (ref) v_u_12
	local v25 = p_u_24.me
	local v26 = p_u_24.camCF
	if not (p_u_24.enabled and (v25 and v26)) then
		v_u_10 = nil
		return p23
	end
	local v27 = os.clock()
	if p23.Magnitude > 0.0001 then
		v_u_13 = v27
	end
	if v_u_9 <= v27 then
		v_u_9 = v27 + v_u_7.ScanPeriod
		v_u_22(v25)
	end
	if #v_u_8 == 0 then
		v_u_10 = nil
		return p23
	end
	local v28 = p_u_24.mode == "ADS"
	local v29 = v_u_4.m
	local v30
	if v28 then
		v30 = v_u_7.RangeADSM
	else
		v30 = v_u_7.RangeM
	end
	local v31 = v29(v30)
	local v32 = v26.Position
	local v33 = v26.LookVector
	local v_u_34 = (1 / 0)
	local v_u_35 = nil
	local v36 = nil
	local v_u_37 = 0
	local v38 = Vector3.new(0, 0, 0)
	for _, v39 in v_u_8 do
		local v40 = not v39.Parent or v39:FindFirstChild("Torso") or (v39:FindFirstChild("UpperTorso") or v39:FindFirstChild("HumanoidRootPart"))
		if not v40 then
			continue
		end
		local v41 = v40.Position - v32
		local v42 = v41.Magnitude
		if v42 <= 1 or v42 > v31 then
			continue
		end
		local v43 = v41 / v42
		local v44 = v33:Dot(v43)
		local v45 = math.clamp(v44, -1, 1)
		local v46 = math.acos(v45)
		local v47 = math.deg(v46)
		local v48 = v_u_4.m(v_u_7.BubbleM) / v42
		local v49 = math.atan(v48)
		local v50 = math.deg(v49)
		local v51 = v_u_7.MinDeg
		local v52 = v_u_7.MaxDeg
		local v53 = math.clamp(v50, v51, v52)
		local v54 = v47 / v53
		if v54 >= 1 or v54 >= v_u_34 then
			continue
		end
		v38 = v43
		v_u_37 = v53
		v36 = v40
		v_u_35 = v39
		v_u_34 = v54
	end
	if not (v_u_35 and v36) then
		v_u_10 = nil
		return p23
	end
	v_u_15.FilterDescendantsInstances = { v25 }
	local v55 = workspace:Raycast(v32, v36.Position - v32, v_u_15)
	if v55 and not v55.Instance:IsDescendantOf(v_u_35) then
		v_u_10 = nil
		return p23
	end
	if v_u_35 ~= v_u_10 and v_u_14 < 6 then
		v_u_14 = v_u_14 + 1
		local function v64()
			-- upvalues: (ref) v_u_2, (ref) v_u_35, (ref) v_u_34, (ref) v_u_37, (copy) p_u_24
			local v56 = v_u_2.Shared.Net:FindFirstChild("Remotes")
			if v56 then
				v56 = v56:FindFirstChild("MobileDiag")
			end
			if v56 then
				local v57 = string.format
				local v58 = v_u_35.Name
				local v59 = v_u_35
				local v60 = tostring(v59:GetAttribute("IsBot"))
				local v61 = v_u_34
				local v62 = v_u_37
				local v63 = p_u_24.mode
				v56:FireServer(v57("aa target=%s bot=%s k=%.2f bubble=%.1f mode=%s", v58, v60, v61, v62, (tostring(v63))))
			end
		end
		pcall(v64)
	end
	local v65 = 1 - v_u_34
	local v66
	if v28 then
		v66 = v_u_7.SlowADS
	else
		v66 = v_u_7.SlowHip
	end
	local v67 = p23 * (1 - (1 - v66) * v65)
	local v68 = -v38.X
	local v69 = -v38.Z
	local v70 = math.atan2(v68, v69)
	local v71 = math.deg(v70)
	local v72 = v38.Y
	local v73 = math.clamp(v72, -1, 1)
	local v74 = math.asin(v73)
	local v75 = math.deg(v74)
	local v76 = v28 or v27 - v_u_13 < 0.35
	if v_u_10 == v_u_35 and v76 then
		local v77
		if v28 then
			v77 = v_u_7.FollowADS
		else
			v77 = v_u_7.FollowHip
		end
		local v78 = v65 * 1.5
		local v79 = v77 * math.clamp(v78, 0, 1)
		local v80 = v_u_7.FollowCapDeg
		local v81 = ((v71 - v_u_11 + 180) % 360 - 180) * v79
		local v82 = -v80
		local v83 = math.clamp(v81, v82, v80)
		local v84 = (v75 - v_u_12) * v79
		local v85 = -v80
		local v86 = math.clamp(v84, v85, v80)
		v67 = Vector2.new(v67.X - v83, v67.Y - v86)
	end
	v_u_10 = v_u_35
	v_u_11 = v71
	v_u_12 = v75
	return v67
end
function v6.reset() -- name: reset
	-- upvalues: (ref) v_u_10, (copy) v_u_8, (ref) v_u_9
	v_u_10 = nil
	table.clear(v_u_8)
	v_u_9 = 0
end
return v6