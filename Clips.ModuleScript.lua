-- Decompiled by Executor
-- Path: ReplicatedStorage.Client.Controllers.ViewmodelController.Clips

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = {}
local v_u_4 = {}
local v_u_5 = CFrame.identity
local v_u_6 = {
	[Enum.PoseEasingStyle.Linear] = "Linear",
	[Enum.PoseEasingStyle.Constant] = "Constant",
	[Enum.PoseEasingStyle.Cubic] = "Cubic",
	[Enum.PoseEasingStyle.Elastic] = "Elastic",
	[Enum.PoseEasingStyle.Bounce] = "Bounce"
}
pcall(function()
	-- upvalues: (copy) v_u_6
	v_u_6[Enum.PoseEasingStyle.CubicV2] = "CubicV2"
end)
local function v_u_12(p7, p8, p9) -- name: ease
	-- upvalues: (copy) v_u_2
	if p8 == nil or p8 == "Linear" then
		return p7
	end
	if p8 == "Constant" then
		return 0
	end
	local v10 = Enum.EasingDirection.InOut
	if p9 == Enum.PoseEasingDirection.In then
		v10 = Enum.EasingDirection.In
	elseif p9 == Enum.PoseEasingDirection.Out then
		v10 = Enum.EasingDirection.Out
	end
	local v11 = Enum.EasingStyle.Cubic
	if p8 == "Elastic" then
		v11 = Enum.EasingStyle.Elastic
	elseif p8 == "Bounce" then
		v11 = Enum.EasingStyle.Bounce
	end
	if p8 ~= "CubicV2" then
		if v10 == Enum.EasingDirection.In then
			v10 = Enum.EasingDirection.Out
		elseif v10 == Enum.EasingDirection.Out then
			v10 = Enum.EasingDirection.In
		end
	end
	return v_u_2:GetValue(p7, v11, v10)
end
local function v_u_34(p13) -- name: compileKS
	-- upvalues: (copy) v_u_6
	local v14 = p13:GetKeyframes()
	table.sort(v14, function(p15, p16)
		return p15.Time < p16.Time
	end)
	local v17 = 0
	local v18 = {}
	local v19 = {}
	for _, v20 in v14 do
		local v21 = v20.Time
		v17 = math.max(v17, v21)
		for _, v22 in v20:GetDescendants() do
			if v22:IsA("Pose") and (v22.Weight > 0 and v22.Parent ~= v20) then
				local v23 = v19[v22.Name]
				if not v23 then
					v23 = {
						["t"] = {},
						["cf"] = {},
						["es"] = {},
						["ed"] = {}
					}
					v19[v22.Name] = v23
				end
				local v24 = v23.t
				table.insert(v24, v21)
				local v25 = v23.cf
				local v26 = v22.CFrame
				table.insert(v25, v26)
				local v27 = v23.es
				local v28 = v_u_6[v22.EasingStyle] or "Linear"
				table.insert(v27, v28)
				local v29 = v23.ed
				local v30 = v22.EasingDirection
				table.insert(v29, v30)
			else
				if not v22:IsA("KeyframeMarker") then
					continue
				end
				local v31 = {
					["t"] = v21,
					["name"] = v22.Name,
					["value"] = v22.Value
				}
				table.insert(v18, v31)
			end
		end
	end
	table.sort(v18, function(p32, p33)
		return p32.t < p33.t
	end)
	return {
		["tracks"] = v19,
		["markers"] = v18,
		["len"] = v17
	}
end
local function v_u_55(p35) -- name: compileCurve
	local v36 = {}
	local v37 = 0
	local v38 = {}
	for _, v_u_39 in p35:GetDescendants() do
		if v_u_39:IsA("Folder") then
			local v40 = v_u_39:FindFirstChild("Position")
			local v41 = v_u_39:FindFirstChild("Rotation")
			if not (v40 and v40:IsA("Vector3Curve") or v41 and v41:IsA("RotationCurve")) then
				continue
			end
			v36[v_u_39.Name] = {
				["curve"] = true,
				["pos"] = nil,
				["rot"] = nil,
				["pos"] = v40,
				["rot"] = v41
			}
			for _, v42 in { v40, v41 } do
				if not v42 then
					continue
				end
				for _, v_u_43 in v42:IsA("Vector3Curve") and ({ v42:X(), v42:Y(), v42:Z() } or { v42 }) or { v42 } do
					local v44, v45 = pcall(function()
						-- upvalues: (copy) v_u_43
						return v_u_43:GetKeys()
					end)
					if not (v44 and v45) then
						continue
					end
					for _, v46 in v45 do
						local v47 = v46.Time
						v37 = math.max(v37, v47)
					end
				end
			end
		else
			if not v_u_39:IsA("MarkerCurve") then
				continue
			end
			local v48, v49 = pcall(function()
				-- upvalues: (copy) v_u_39
				return v_u_39:GetMarkers()
			end)
			if not (v48 and v49) then
				continue
			end
			for _, v50 in v49 do
				local v51 = {
					["t"] = v50.Time,
					["name"] = v_u_39.Name,
					["value"] = v50.Value
				}
				table.insert(v38, v51)
				local v52 = v50.Time
				v37 = math.max(v37, v52)
			end
		end
	end
	table.sort(v38, function(p53, p54)
		return p53.t < p54.t
	end)
	return {
		["tracks"] = v36,
		["markers"] = v38,
		["len"] = v37
	}
end
local function v_u_59(p56) -- name: clickMarkers
	for _, v57 in p56 do
		if v57.name ~= "Click" then
			continue
		end
		local v58 = v57.value
		if type(v58) ~= "string" or v57.value == "" then
			continue
		end
		v57.name = "Sound"
		v57.value = "RC?" .. v57.value
	end
end
local function v_u_66(p_u_60, p61) -- name: compile
	-- upvalues: (copy) v_u_34, (copy) v_u_55, (copy) v_u_59, (copy) v_u_5
	local function v62()
		-- upvalues: (copy) p_u_60, (ref) v_u_34, (ref) v_u_55
		if p_u_60:IsA("KeyframeSequence") then
			return v_u_34(p_u_60)
		else
			return v_u_55(p_u_60)
		end
	end
	local v63, v64 = pcall(v62)
	if not (v63 and v64) then
		warn("[ViewmodelController.Clips] " .. p_u_60:GetFullName() .. ": " .. tostring(v64))
		return nil
	end
	v_u_59(v64.markers)
	v64.name = p_u_60.Name
	local v65 = v64.len
	v64.len = math.max(v65, 0.016666666666666666)
	v64.c0 = {
		["Weapon"] = p61:GetAttribute("C0_Weapon") or v_u_5,
		["RightArm"] = p61:GetAttribute("C0_RightArm") or v_u_5,
		["LeftArm"] = p61:GetAttribute("C0_LeftArm") or v_u_5
	}
	v64.c1 = {
		["RightArm"] = (p61:GetAttribute("C1_RightArm") or v_u_5):Inverse(),
		["LeftArm"] = (p61:GetAttribute("C1_LeftArm") or v_u_5):Inverse()
	}
	v64.armsOnWeapon = p61:GetAttribute("ArmsOn") == "Weapon"
	v64.full = p_u_60:GetAttribute("FullClip") == true
	return v64
end
function v_u_3.folder() -- name: folder
	-- upvalues: (copy) v_u_1
	local v67 = v_u_1:FindFirstChild("Assets")
	if v67 then
		v67 = v67:FindFirstChild("ViewmodelAnims")
	end
	return v67
end
function v_u_3.get(p68, p69) -- name: get
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_66
	if not p68 then
		return nil
	end
	local v70 = p68 .. "/" .. p69
	local v71 = v_u_4[v70]
	if v71 ~= nil then
		return v71 or nil
	end
	local v72 = v_u_3.folder()
	if v72 then
		v72 = v72:FindFirstChild(p68)
	end
	local v73
	if v72 then
		v73 = v72:FindFirstChild(p69)
	else
		v73 = v72
	end
	if v73 and (v73:IsA("KeyframeSequence") or v73.ClassName == "CurveAnimation") then
		v71 = v_u_66(v73, v72)
	end
	v_u_4[v70] = v71 or false
	return v71
end
function v_u_3.camOffset(p74) -- name: camOffset
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	if not p74 then
		return nil
	end
	local v75 = p74 .. "/@cam"
	local v76 = v_u_4[v75]
	if v76 ~= nil then
		return v76 or nil
	end
	local v77 = v_u_3.folder()
	if v77 then
		v77 = v77:FindFirstChild(p74)
	end
	if v77 then
		v77 = v77:GetAttribute("CamOffset")
	end
	if typeof(v77) ~= "CFrame" then
		v77 = false
	end
	v_u_4[v75] = v77
	return v77 or nil
end
function v_u_3.has(p78) -- name: has
	-- upvalues: (copy) v_u_3
	local v79
	if p78 then
		v79 = v_u_3.folder()
	else
		v79 = p78
	end
	local v80
	if v79 == nil then
		v80 = false
	else
		v80 = v79:FindFirstChild(p78) ~= nil
	end
	return v80
end
function v_u_3.clear() -- name: clear
	-- upvalues: (copy) v_u_4
	table.clear(v_u_4)
end
local function v_u_99(p_u_81, p_u_82) -- name: sampleTrack
	-- upvalues: (copy) v_u_5, (copy) v_u_12
	if p_u_81.curve then
		local v83 = Vector3.new(0, 0, 0)
		if p_u_81.pos then
			local v84, v85 = pcall(function()
				-- upvalues: (copy) p_u_81, (copy) p_u_82
				return p_u_81.pos:GetValueAtTime(p_u_82)
			end)
			if v84 and type(v85) == "table" then
				local v86 = v85[1] or 0
				local v87 = v85[2] or 0
				local v88 = v85[3] or 0
				v83 = Vector3.new(v86, v87, v88)
			end
		end
		local v89 = v_u_5
		if p_u_81.rot then
			local v90, v91 = pcall(function()
				-- upvalues: (copy) p_u_81, (copy) p_u_82
				return p_u_81.rot:GetValueAtTime(p_u_82)
			end)
			if v90 and typeof(v91) == "CFrame" then
				v89 = v91.Rotation
			end
		end
		return CFrame.new(v83) * v89
	end
	local v92 = p_u_81.t
	local v93 = #v92
	if v93 == 0 then
		return v_u_5
	end
	if p_u_82 <= v92[1] or v93 == 1 then
		return p_u_81.cf[1]
	end
	if v92[v93] <= p_u_82 then
		return p_u_81.cf[v93]
	end
	local v94 = 1
	while v93 - v94 > 1 do
		local v95 = (v94 + v93) // 2
		if v92[v95] <= p_u_82 then
			v94 = v95
			v95 = v93
		end
		v93 = v95
	end
	local v96 = p_u_82 - v92[v94]
	local v97 = v92[v93] - v92[v94]
	local v98 = v96 / math.max(v97, 1e-6)
	return p_u_81.cf[v94]:Lerp(p_u_81.cf[v93], v_u_12(v98, p_u_81.es[v94], p_u_81.ed[v94]))
end
function v_u_3.sample(p100, p101) -- name: sample
	-- upvalues: (copy) v_u_99
	local v102 = {}
	for v103, v104 in p100.tracks do
		v102[v103] = v_u_99(v104, p101)
	end
	return v102
end
function v_u_3.rel(p105, p106) -- name: rel
	-- upvalues: (copy) v_u_5
	local v107 = p105.c0.Weapon * (p106.RootPart or v_u_5)
	local v108 = p105.armsOnWeapon and v_u_5 or v107:Inverse()
	return {
		["gunDelta"] = p106.RootPart or v_u_5,
		["gun"] = v107,
		["r"] = v108 * (p105.c0.RightArm * (p106.Rightarm or v_u_5) * p105.c1.RightArm),
		["l"] = v108 * (p105.c0.LeftArm * (p106.Leftarm or v_u_5) * p105.c1.LeftArm)
	}
end
return v_u_3