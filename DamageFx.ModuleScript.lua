-- Decompiled by Executor
-- Path: ReplicatedStorage.Client.Controllers.DamageFx

local v1 = game:GetService("Players")
local v_u_2 = game:GetService("Lighting")
local v_u_3 = game:GetService("RunService")
local v4 = game:GetService("ReplicatedStorage")
local v_u_5 = game:GetService("SoundService")
local v_u_6 = require(v4.Shared.Net)
local v7 = require(v4.Shared.Config.AudioConfig)
local v8 = {}
local v_u_9 = v1.LocalPlayer
local v_u_10 = Random.new()
local v_u_11 = Color3.fromRGB(28, 150, 48)
local v_u_12 = Color3.fromRGB(12, 78, 24)
local v_u_13 = Color3.fromRGB(70, 235, 90)
local v_u_14 = Color3.fromRGB(30, 140, 50)
local v_u_15 = v7.Body or {}
local v_u_16 = {
	{ 0, 1 },
	{ 1, 1 },
	{ 2, 1 },
	{ 3, 1 },
	{ 0, 2 },
	{ 1, 2 },
	{ 2, 2 }
}
local v_u_17 = {
	["Zone"] = true,
	["Drown"] = true,
	["Fall"] = true
}
local v_u_18 = {
	["Zone"] = 0.15,
	["Drown"] = 0.15
}
local v_u_19 = {
	{
		["ang"] = 0,
		["size"] = nil,
		["pos"] = nil,
		["rot"] = 90,
		["size"] = UDim2.fromScale(1, 0.26),
		["pos"] = UDim2.fromScale(0, 0)
	},
	{
		["ang"] = 90,
		["size"] = nil,
		["pos"] = nil,
		["rot"] = 180,
		["size"] = UDim2.fromScale(0.2, 1),
		["pos"] = UDim2.fromScale(0.8, 0)
	},
	{
		["ang"] = 180,
		["size"] = nil,
		["pos"] = nil,
		["rot"] = 270,
		["size"] = UDim2.fromScale(1, 0.26),
		["pos"] = UDim2.fromScale(0, 0.74)
	},
	{
		["ang"] = 270,
		["size"] = nil,
		["pos"] = nil,
		["rot"] = 0,
		["size"] = UDim2.fromScale(0.2, 1),
		["pos"] = UDim2.fromScale(0, 0)
	}
}
local v_u_20 = nil
local v_u_21 = {}
local v_u_22 = {}
local v_u_23 = {}
local v_u_24 = 0
local v_u_25 = nil
local v_u_26 = nil
local v_u_27 = {
	["low"] = 0,
	["wave"] = nil,
	["beat"] = 0,
	["shown"] = false,
	["wave"] = {
		0,
		0,
		0,
		0
	}
}
local v_u_28 = {}
local v_u_29 = 0
local v_u_30 = -10
local function v_u_37(p31, p32, p33, p34) -- name: edge
	local v35 = Instance.new("Frame")
	v35.BorderSizePixel = 0
	v35.BackgroundColor3 = p33
	v35.BackgroundTransparency = 1
	v35.Size = p32.size
	v35.Position = p32.pos
	v35.Parent = p31
	local v36 = Instance.new("UIGradient")
	v36.Rotation = p32.rot
	v36.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(p34, 0.72), NumberSequenceKeypoint.new(1, 1) })
	v36.Parent = v35
	return v35
end
local function v_u_48() -- name: build
	-- upvalues: (ref) v_u_20, (copy) v_u_9, (copy) v_u_21, (copy) v_u_22, (copy) v_u_19, (copy) v_u_37, (copy) v_u_12, (copy) v_u_11, (copy) v_u_23
	if v_u_20 and v_u_20.Parent then
		return
	else
		local v38 = v_u_9:FindFirstChildOfClass("PlayerGui")
		if v38 then
			local v39 = Instance.new("ScreenGui")
			v39.Name = "CombatDamageFx"
			v39.IgnoreGuiInset = true
			v39.ScreenInsets = Enum.ScreenInsets.None
			v39.ResetOnSpawn = false
			v39.DisplayOrder = 1
			v39.Enabled = false
			local v40 = Instance.new("Frame")
			v40.Name = "LowHealth"
			v40.BackgroundTransparency = 1
			v40.Size = UDim2.fromScale(1, 1)
			v40.Parent = v39
			local v41 = Instance.new("Frame")
			v41.Name = "Hit"
			v41.BackgroundTransparency = 1
			v41.Size = UDim2.fromScale(1, 1)
			v41.Parent = v39
			table.clear(v_u_21)
			table.clear(v_u_22)
			for v42, v43 in v_u_19 do
				v_u_21[v42] = v_u_37(v40, v43, v_u_12, 0.5)
				v_u_22[v42] = v_u_37(v41, v43, v_u_11, 0.45)
			end
			local v44 = Instance.new("Frame")
			v44.Name = "Splats"
			v44.BackgroundTransparency = 1
			v44.Size = UDim2.fromScale(1, 1)
			v44.Parent = v39
			table.clear(v_u_23)
			for v45 = 1, 8 do
				local v46 = Instance.new("Frame")
				v46.BackgroundTransparency = 1
				v46.AnchorPoint = Vector2.new(0.5, 0.5)
				v46.SizeConstraint = Enum.SizeConstraint.RelativeYY
				v46.ClipsDescendants = true
				v46.Visible = false
				v46.Parent = v44
				local v47 = Instance.new("ImageLabel")
				v47.BackgroundTransparency = 1
				v47.Image = "rbxassetid://138991804886925"
				v47.Size = UDim2.fromScale(4, 4)
				v47.ImageTransparency = 1
				v47.Parent = v46
				v_u_23[v45] = {
					["fr"] = nil,
					["img"] = nil,
					["born"] = 0,
					["life"] = 1,
					["alpha"] = 0,
					["active"] = false,
					["fr"] = v46,
					["img"] = v47
				}
			end
			v39.Parent = v38
			v_u_20 = v39
		end
	end
end
local function v_u_52() -- name: clear
	-- upvalues: (copy) v_u_27, (copy) v_u_23, (copy) v_u_21, (copy) v_u_22, (ref) v_u_25, (ref) v_u_26, (ref) v_u_20
	v_u_27.low = 0
	v_u_27.wave[1] = 0
	v_u_27.wave[2] = 0
	v_u_27.wave[3] = 0
	v_u_27.wave[4] = 0
	for _, v49 in v_u_23 do
		v49.active = false
		v49.fr.Visible = false
	end
	for _, v50 in v_u_21 do
		v50.BackgroundTransparency = 1
	end
	for _, v51 in v_u_22 do
		v51.BackgroundTransparency = 1
	end
	if v_u_25 then
		v_u_25.Saturation = 0
		v_u_25.TintColor = Color3.new(1, 1, 1)
		v_u_25.Enabled = false
	end
	if v_u_26 and v_u_26.IsPlaying then
		v_u_26:Stop()
	end
	if v_u_20 then
		v_u_20.Enabled = false
	end
	v_u_27.shown = false
end
local function v_u_62(p53, p54) -- name: spawnSplat
	-- upvalues: (copy) v_u_23, (ref) v_u_24, (copy) v_u_10, (copy) v_u_16, (copy) v_u_14, (copy) v_u_13
	if #v_u_23 ~= 0 then
		v_u_24 = v_u_24 % #v_u_23 + 1
		local v55 = v_u_23[v_u_24]
		local v56 = p53 or v_u_10:NextNumber() * 360
		local v57 = math.rad(v56) + (v_u_10:NextNumber() - 0.5) * 0.9
		local v58 = v55.fr
		local v59 = v55.img
		v58.Position = UDim2.fromScale(0.5 + math.sin(v57) * (0.4 + v_u_10:NextNumber() * 0.07), 0.5 - math.cos(v57) * (0.37 + v_u_10:NextNumber() * 0.08))
		local v60 = p54 * 0.18 + 0.2 + v_u_10:NextNumber() * 0.06
		v58.Size = UDim2.fromScale(v60, v60)
		local v61 = v_u_16[v_u_10:NextInteger(1, #v_u_16)]
		v59.Position = UDim2.fromScale(-v61[1], -v61[2])
		v59.ImageColor3 = v_u_14:Lerp(v_u_13, 0.45 + v_u_10:NextNumber() * 0.55)
		v59.ImageTransparency = 1
		v58.Visible = true
		v55.born = os.clock()
		v55.life = p54 * 0.7 + 0.8
		v55.alpha = p54 * 0.35 + 0.5
		v55.active = true
	end
end
local v_u_63 = {
	["Zone"] = true,
	["Drown"] = true
}
local function v_u_75(p64) -- name: playHurt
	-- upvalues: (copy) v_u_28, (copy) v_u_63, (ref) v_u_30, (copy) v_u_15, (copy) v_u_9, (copy) v_u_10, (ref) v_u_29
	local v_u_65 = #v_u_28
	if v_u_65 == 0 then
		return
	else
		local v66 = os.clock()
		local v_u_67 = v_u_63[p64] == true
		local v68 = v66 - v_u_30
		local v69
		if v_u_67 then
			v69 = v_u_15.HurtZoneGap or 2.5
		else
			v69 = v_u_15.HurtGap or 0.3
		end
		if v68 >= v69 then
			v_u_30 = v66
			task.defer(function()
				-- upvalues: (ref) v_u_9, (ref) v_u_10, (copy) v_u_65, (ref) v_u_29, (ref) v_u_28, (copy) v_u_67, (ref) v_u_15
				local v70 = v_u_9.Character
				local v71
				if v70 then
					v71 = v70:FindFirstChildOfClass("Humanoid")
				else
					v71 = v70
				end
				if v71 and (v71.Health > 0 and v70:GetAttribute("Eliminated") ~= true) then
					local v72 = v_u_10:NextInteger(1, v_u_65)
					if v_u_65 > 1 and v72 == v_u_29 then
						v72 = v72 % v_u_65 + 1
					end
					v_u_29 = v72
					local v73 = v_u_28[v72]
					local v74
					if v_u_67 then
						v74 = v_u_15.HurtZoneVolume or 0.35
					else
						v74 = v_u_15.HurtVolume or 0.7
					end
					v73.Volume = v74
					v73.PlaybackSpeed = 0.97 + v_u_10:NextNumber() * 0.06
					v73.TimePosition = 0
					v73:Play()
				end
			end)
		end
	end
end
local function v_u_102(p76) -- name: onDamage
	-- upvalues: (copy) v_u_9, (copy) v_u_48, (copy) v_u_75, (copy) v_u_18, (copy) v_u_19, (copy) v_u_27, (copy) v_u_17, (copy) v_u_62
	if type(p76) == "table" then
		local v77 = p76.amount
		local v78 = tonumber(v77) or 0
		if v78 > 0 and (v_u_9.Character and v_u_9:GetAttribute("Spectating") == nil) then
			v_u_48()
			local v79 = p76.source
			local v80 = type(v79) == "string" and (p76.source or "") or ""
			v_u_75(v80)
			local v81 = v78 / 40
			local v82 = math.clamp(v81, 0.2, 1)
			local v83 = nil
			local v84 = workspace.CurrentCamera
			local v85 = p76.from
			if typeof(v85) == "Vector3" and v84 then
				local v86 = v84.CFrame:PointToObjectSpace(p76.from)
				local v87 = Vector2.new(v86.X, -v86.Z)
				if v87.Magnitude > 0.5 then
					local v88 = v87.X
					local v89 = v87.Y
					local v90 = math.atan2(v88, v89)
					v83 = math.deg(v90)
				end
			end
			local v91 = v80 == "Fall" and 180 or v83
			local v92 = v_u_18[v80]
			for v93, v94 in v_u_19 do
				local v95
				if v91 then
					local v96 = (v91 - v94.ang + 180) % 360 - 180
					local v97 = 1 - math.abs(v96) / 100
					v95 = math.clamp(v97, 0, 1)
				else
					v95 = 0.6
				end
				local v98 = v92 or v82 * 0.45 + 0.35
				local v99 = v_u_27.wave
				local v100 = v_u_27.wave[v93]
				local v101 = v95 * v98
				v99[v93] = math.max(v100, v101)
			end
			if not v_u_17[v80] then
				for _ = 1, v82 > 0.6 and 4 or (v82 > 0.3 and 3 or 2) do
					v_u_62(v91, v82)
				end
			end
		end
	else
		return
	end
end
local function v_u_150(p103) -- name: step
	-- upvalues: (copy) v_u_9, (copy) v_u_27, (copy) v_u_52, (copy) v_u_23, (copy) v_u_48, (ref) v_u_20, (copy) v_u_21, (copy) v_u_22, (ref) v_u_25, (ref) v_u_26, (copy) v_u_15
	local v104 = v_u_9.Character
	local v105
	if v104 then
		v105 = v104:FindFirstChildOfClass("Humanoid")
	else
		v105 = v104
	end
	if not v104 or (not v105 or ((v105.Health <= 0 or v104:GetAttribute("Eliminated") == true) and true or v_u_9:GetAttribute("Spectating") ~= nil)) then
		if v_u_27.shown then
			v_u_52()
		end
	else
		local v106 = v104:GetAttribute("Knocked") == true
		local v107 = v105.Health
		local v108 = v105.MaxHealth
		local v109 = v107 / math.max(v108, 1) * 100
		local v110
		if v109 < 30 then
			local v111 = (30 - v109) / 30
			v110 = math.clamp(v111, 0, 1) * 0.7 + 0.3 or 0
		else
			v110 = 0
		end
		local v112 = v_u_27
		local v113 = v112.low
		local v114 = v110 - v_u_27.low
		local v115 = p103 * (v_u_27.low < v110 and 4 or 1.5)
		v112.low = v113 + v114 * math.min(1, v115)
		if v_u_27.low < 0.005 then
			v_u_27.low = 0
		end
		local v116 = 0
		for v117 = 1, 4 do
			local v118 = v_u_27.wave
			local v119 = v_u_27.wave[v117] - p103 * 1.4
			v118[v117] = math.max(0, v119)
			v116 = v116 + v_u_27.wave[v117]
		end
		local v120 = os.clock()
		local v121 = false
		for _, v122 in v_u_23 do
			if not v122.active then
				continue
			end
			local v123 = (v120 - v122.born) / v122.life
			if v123 >= 1 then
				v122.active = false
				v122.fr.Visible = false
			else
				local v124 = v122.alpha
				local v125 = v123 * 8
				local v126 = v124 * math.min(1, v125) * (1 - v123) ^ 1.4
				v122.img.ImageTransparency = 1 - v126
				local v127 = v122.fr
				v127.Position = v127.Position + UDim2.fromScale(0, p103 * 0.006)
				v121 = true
			end
		end
		local v128 = v106 and 0 or v_u_27.low
		local v129 = v128 > 0.005 and true or (v116 > 0.005 and true or v121)
		if v129 and not v_u_27.shown then
			v_u_48()
		end
		if v_u_20 then
			v_u_20.Enabled = v129
		end
		v_u_27.shown = v129
		local v130 = v_u_27
		v130.beat = v130.beat + p103 * (1.6 + 0.6 * v_u_27.low)
		local v131 = v_u_27.beat % 1
		local v132 = v131 - 0.1
		local v133 = 1 - math.abs(v132) * 8
		local v134 = math.max(0, v133)
		local v135 = v131 - 0.32
		local v136 = 1 - math.abs(v135) * 8
		local v137 = (v134 + math.max(0, v136) * 0.6) * 0.22 + 0.78
		for _, v138 in v_u_21 do
			local v139 = v128 * 0.62 * v137
			v138.BackgroundTransparency = 1 - math.clamp(v139, 0, 0.9)
		end
		for v140, v141 in v_u_22 do
			local v142 = v_u_27.wave[v140]
			v141.BackgroundTransparency = 1 - math.clamp(v142, 0, 0.85)
		end
		if v_u_25 then
			if v128 > 0.005 then
				v_u_25.Enabled = true
				v_u_25.Saturation = -0.38 * v128
				v_u_25.TintColor = Color3.new(1 - 0.07 * v128, 1, 1 - 0.07 * v128)
			elseif v_u_25.Enabled then
				v_u_25.Saturation = 0
				v_u_25.TintColor = Color3.new(1, 1, 1)
				v_u_25.Enabled = false
			end
		end
		if v_u_26 then
			if v_u_27.low > 0.02 then
				local v143 = v_u_15.HeartbeatVolume or { 0.18, 0.65 }
				local v144 = v_u_15.HeartbeatSpeed or { 1, 1.3 }
				local v145 = (v_u_27.low - 0.3) / 0.7
				local v146 = math.clamp(v145, 0, 1)
				local v147 = v_u_26
				local v148 = v143[1] + (v143[2] - v143[1]) * v146
				local v149 = v_u_27.low / 0.3
				v147.Volume = v148 * math.min(1, v149)
				v_u_26.PlaybackSpeed = v144[1] + (v144[2] - v144[1]) * v146
				if not v_u_26.IsPlaying then
					v_u_26:Play()
					return
				end
			elseif v_u_26.IsPlaying then
				v_u_26:Stop()
			end
		end
	end
end
function v8.onMatchReset(_) -- name: onMatchReset
	-- upvalues: (copy) v_u_52
	v_u_52()
end
function v8.init() -- name: init
	-- upvalues: (copy) v_u_2, (ref) v_u_25, (copy) v_u_15, (copy) v_u_5, (ref) v_u_26, (copy) v_u_28
	local v151 = Instance.new("ColorCorrectionEffect")
	v151.Name = "CombatLowHP"
	v151.Enabled = false
	v151.Parent = v_u_2
	v_u_25 = v151
	local v152 = v_u_15.Heartbeat
	if type(v152) == "number" and v152 > 0 then
		local v153 = Instance.new("Sound")
		v153.Name = "CombatHeartbeat"
		v153.SoundId = "rbxassetid://" .. tostring(v152)
		v153.Looped = true
		v153.Volume = 0
		v153.Parent = v_u_5
		v_u_26 = v153
	end
	local v154 = v_u_15.Hurt
	for v155, v156 in type(v154) == "table" and v_u_15.Hurt or {} do
		if type(v156) ~= "number" or v156 <= 0 then
			continue
		end
		local v157 = Instance.new("Sound")
		v157.Name = "CombatHurt" .. v155
		v157.SoundId = "rbxassetid://" .. tostring(v156)
		v157.Volume = 0.7
		v157.Parent = v_u_5
		local v158 = v_u_28
		table.insert(v158, v157)
	end
end
function v8.start() -- name: start
	-- upvalues: (ref) v_u_26, (copy) v_u_28, (copy) v_u_6, (copy) v_u_102, (copy) v_u_9, (copy) v_u_52, (copy) v_u_3, (copy) v_u_150
	local v159 = script.Parent:FindFirstChild("AudioController")
	if v159 and v_u_26 then
		local v160 = require
		local v161, v162 = pcall(v160, v159)
		local v163
		if v161 and type(v162) == "table" then
			local v164 = v162.getGroup
			if type(v164) == "function" then
				v163 = v162.getGroup("Effects") or nil
			else
				v163 = nil
			end
		else
			v163 = nil
		end
		if v163 then
			v_u_26.SoundGroup = v163
		end
	end
	if v159 and #v_u_28 > 0 then
		local v165 = require
		local v166, v167 = pcall(v165, v159)
		local v168
		if v166 and type(v167) == "table" then
			local v169 = v167.getGroup
			v168 = type(v169) == "function" and v167.getGroup("Effects") or nil
		else
			v168 = nil
		end
		if v168 then
			for _, v170 in v_u_28 do
				v170.SoundGroup = v168
			end
		end
	end
	v_u_6.event("DamageTaken").OnClientEvent:Connect(function(p171)
		-- upvalues: (ref) v_u_102
		local v172 = v_u_102
		local v173, v174 = pcall(v172, p171)
		if not v173 then
			warn("[DamageFx] " .. tostring(v174))
		end
	end)
	v_u_9.CharacterRemoving:Connect(v_u_52)
	v_u_9:GetAttributeChangedSignal("Spectating"):Connect(function()
		-- upvalues: (ref) v_u_9, (ref) v_u_52
		if v_u_9:GetAttribute("Spectating") ~= nil then
			v_u_52()
		end
	end)
	local v_u_175 = false
	v_u_3.Heartbeat:Connect(function(p176)
		-- upvalues: (ref) v_u_150, (ref) v_u_175
		local v177 = v_u_150
		local v178, v179 = pcall(v177, p176)
		if not (v178 or v_u_175) then
			v_u_175 = true
			warn("[DamageFx] " .. tostring(v179))
		end
	end)
end
return v8