-- Decompiled by Executor
-- Path: ReplicatedStorage.Client.Controllers.ViewmodelController.ScopeOverlay

local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Shared.Combat.Ballistics)
local v_u_4 = require(v2.Shared.Util.Units)
local v_u_5 = require(v2.Shared.Config.AttachmentConfig)
local v_u_6 = {}
local v_u_7 = nil
local v_u_8 = nil
local v_u_9 = nil
local v_u_10 = nil
local v_u_11 = nil
local v_u_12 = {}
local v_u_13 = nil
local v_u_14 = {}
local v_u_15 = nil
local v_u_16 = nil
local v_u_17 = 0
local v_u_18 = 0
local v_u_19 = false
local v_u_20 = nil
local v_u_21 = 0
local v_u_22 = 0
local v_u_23 = 0
local v_u_24 = 0
local v_u_25 = nil
local v_u_26 = {}
local v_u_27 = ""
local function v_u_45(p28, p29, p30, p31) -- name: ring
	-- upvalues: (ref) v_u_8
	local v32 = {
		["Name"] = nil,
		["BackgroundTransparency"] = 1,
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["ZIndex"] = nil,
		["Name"] = p28,
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Position"] = UDim2.fromScale(0.5, 0.5),
		["Size"] = UDim2.new(1, -4, 1, -4),
		["ZIndex"] = p29
	}
	local v33 = v_u_8
	local v34 = Instance.new("Frame")
	for v35, v36 in v32 do
		v34[v35] = v36
	end
	if v33 then
		v34.Parent = v33
	end
	local v37 = {
		["CornerRadius"] = UDim.new(0.5, 0)
	}
	local v38 = Instance.new("UICorner")
	for v39, v40 in v37 do
		v38[v39] = v40
	end
	if v34 then
		v38.Parent = v34
	end
	local v41 = {
		["Color"] = nil,
		["Transparency"] = nil,
		["Thickness"] = 2,
		["ApplyStrokeMode"] = nil,
		["Color"] = p30,
		["Transparency"] = p31,
		["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
	}
	local v42 = Instance.new("UIStroke")
	for v43, v44 in v41 do
		v42[v43] = v44
	end
	if v34 then
		v42.Parent = v34
	end
	return v34, v42
end
local function v_u_120() -- name: build
	-- upvalues: (copy) v_u_6, (copy) v_u_1, (ref) v_u_7, (ref) v_u_8, (ref) v_u_9, (ref) v_u_15, (ref) v_u_16, (ref) v_u_12, (ref) v_u_10, (ref) v_u_11, (copy) v_u_45, (ref) v_u_13, (ref) v_u_14, (copy) v_u_5, (ref) v_u_26, (ref) v_u_25
	local v46 = v_u_6._parent or v_u_1.LocalPlayer:WaitForChild("PlayerGui")
	local v47 = Instance.new("ScreenGui")
	for v48, v49 in {
		["Name"] = "CombatScope",
		["ResetOnSpawn"] = false,
		["IgnoreGuiInset"] = true,
		["DisplayOrder"] = 2,
		["Enabled"] = false
	} do
		v47[v48] = v49
	end
	if v46 then
		v47.Parent = v46
	end
	v_u_7 = v47
	v_u_7.ScreenInsets = Enum.ScreenInsets.None
	local v50 = {
		["Name"] = "Lens",
		["BackgroundTransparency"] = 1,
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["GroupTransparency"] = 0,
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Position"] = UDim2.fromScale(0.5, 0.5),
		["Size"] = UDim2.fromOffset(10, 10)
	}
	local v51 = v_u_7
	local v52 = Instance.new("CanvasGroup")
	for v53, v54 in v50 do
		v52[v53] = v54
	end
	if v51 then
		v52.Parent = v51
	end
	v_u_8 = v52
	local v55 = {
		["CornerRadius"] = UDim.new(0.5, 0)
	}
	local v56 = v_u_8
	local v57 = Instance.new("UICorner")
	for v58, v59 in v55 do
		v57[v58] = v59
	end
	if v56 then
		v57.Parent = v56
	end
	local v60 = {
		["Name"] = "Glass",
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["Size"] = nil,
		["ZIndex"] = 1,
		["Size"] = UDim2.fromScale(1, 1)
	}
	local v61 = v_u_8
	local v62 = Instance.new("Frame")
	for v63, v64 in v60 do
		v62[v63] = v64
	end
	if v61 then
		v62.Parent = v61
	end
	v_u_9 = v62
	local v65 = {
		["Name"] = "Reticle",
		["BackgroundTransparency"] = 1,
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["ZIndex"] = 2,
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Position"] = UDim2.fromScale(0.5, 0.5),
		["Size"] = UDim2.fromOffset(0, 0)
	}
	local v66 = v_u_8
	local v67 = Instance.new("Frame")
	for v68, v69 in v65 do
		v67[v68] = v69
	end
	if v66 then
		v67.Parent = v66
	end
	v_u_15 = v67
	local v70 = v_u_15
	local v71 = Instance.new("UIScale")
	for v72, v73 in {
		["Scale"] = 1
	} do
		v71[v72] = v73
	end
	if v70 then
		v71.Parent = v70
	end
	v_u_16 = v71
	v_u_12 = {}
	local v74, v75 = v_u_45("Rim", 5, Color3.fromRGB(9, 10, 11), 0)
	v_u_10 = v74
	v_u_11 = v75
	local v76 = {
		["Name"] = "Bezel",
		["BackgroundTransparency"] = 1,
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["ZIndex"] = 0,
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Position"] = UDim2.fromScale(0.5, 0.5),
		["Size"] = UDim2.fromOffset(10, 10)
	}
	local v77 = v_u_7
	local v78 = Instance.new("CanvasGroup")
	for v79, v80 in v76 do
		v78[v79] = v80
	end
	if v77 then
		v78.Parent = v77
	end
	v_u_13 = v78
	v_u_14 = {}
	for _, v81 in {
		{
			"Ring",
			Color3.fromRGB(12, 13, 14),
			0,
			0.12,
			1
		},
		{
			"Outer",
			Color3.fromRGB(58, 60, 64),
			0.45,
			0.008,
			1.12
		},
		{
			"Shine",
			Color3.fromRGB(170, 175, 182),
			0.3,
			0.011,
			1
		}
	} do
		local v82 = {
			["Name"] = nil,
			["BackgroundTransparency"] = 1,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Name"] = v81[1],
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Position"] = UDim2.fromScale(0.5, 0.5),
			["Size"] = UDim2.fromOffset(10, 10)
		}
		local v83 = v_u_13
		local v84 = Instance.new("Frame")
		for v85, v86 in v82 do
			v84[v85] = v86
		end
		if v83 then
			v84.Parent = v83
		end
		local v87 = {
			["CornerRadius"] = UDim.new(0.5, 0)
		}
		local v88 = Instance.new("UICorner")
		for v89, v90 in v87 do
			v88[v89] = v90
		end
		if v84 then
			v88.Parent = v84
		end
		local v91 = {
			["Color"] = nil,
			["Transparency"] = nil,
			["Thickness"] = 2,
			["ApplyStrokeMode"] = nil,
			["Color"] = v81[2],
			["Transparency"] = v81[3],
			["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
		}
		local v92 = Instance.new("UIStroke")
		for v93, v94 in v91 do
			v92[v93] = v94
		end
		if v84 then
			v92.Parent = v84
		end
		local v95 = v_u_14
		local v96 = {
			["f"] = v84,
			["s"] = v92,
			["k"] = v81[4],
			["w"] = v81[5]
		}
		table.insert(v95, v96)
	end
	local v97 = v_u_5.ScopeBlur
	v_u_26 = {}
	if v97 and (v97.Enabled ~= false and (v97.Frost or 0) > 0) then
		local v98 = {
			["Name"] = "Frost",
			["BackgroundTransparency"] = 1,
			["AnchorPoint"] = nil,
			["Size"] = nil,
			["ZIndex"] = -1,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Size"] = UDim2.fromOffset(0, 0)
		}
		local v99 = v_u_7
		local v100 = Instance.new("Frame")
		for v101, v102 in v98 do
			v100[v101] = v102
		end
		if v99 then
			v100.Parent = v99
		end
		v_u_25 = v100
		for v103 = 1, 24 do
			local v104 = (v103 - 0.5) / 24
			local v105 = (v97.Frost or 0.3) * (v104 * v104 * (3 - v104 * 2))
			local v106 = {
				["Name"] = nil,
				["BackgroundTransparency"] = 1,
				["AnchorPoint"] = nil,
				["Position"] = nil,
				["Size"] = nil,
				["ZIndex"] = -1,
				["Name"] = "F" .. v103,
				["AnchorPoint"] = Vector2.new(0.5, 0.5),
				["Position"] = UDim2.fromOffset(0, 0),
				["Size"] = UDim2.fromOffset(10, 10)
			}
			local v107 = v_u_25
			local v108 = Instance.new("Frame")
			for v109, v110 in v106 do
				v108[v109] = v110
			end
			if v107 then
				v108.Parent = v107
			end
			local v111 = {
				["CornerRadius"] = UDim.new(0.5, 0)
			}
			local v112 = Instance.new("UICorner")
			for v113, v114 in v111 do
				v112[v113] = v114
			end
			if v108 then
				v112.Parent = v108
			end
			local v115 = {
				["Color"] = nil,
				["Transparency"] = 1,
				["Thickness"] = 1,
				["ApplyStrokeMode"] = nil,
				["Color"] = Color3.fromRGB(148, 154, 160),
				["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
			}
			local v116 = Instance.new("UIStroke")
			for v117, v118 in v115 do
				v116[v117] = v118
			end
			if v108 then
				v116.Parent = v108
			end
			local v119 = v_u_26
			table.insert(v119, {
				["f"] = v108,
				["s"] = v116,
				["o"] = v105
			})
		end
	end
end
local function v_u_140(p121, p122) -- name: layoutFrost
	-- upvalues: (ref) v_u_25, (ref) v_u_26, (ref) v_u_27, (copy) v_u_5
	if v_u_25 and #v_u_26 ~= 0 then
		local v123 = workspace.CurrentCamera.ViewportSize
		local v124 = string.format("%d|%d|%d|%.2f", p121, v123.X, v123.Y, p122)
		if v124 ~= v_u_27 then
			v_u_27 = v124
			local v125 = p121 * ((v_u_5.ScopeBlur or {}).FrostStart or 1.55)
			local v126 = math.max(8, v125)
			local v127 = v126 + 16
			local v128 = v123.X * v123.X + v123.Y * v123.Y
			local v129 = math.sqrt(v128) * 0.5 + 0.15 * v123.Y
			local v130 = math.max(v127, v129)
			local v131 = #v_u_26
			local v132 = (v130 / v126) ^ (1 / v131)
			for _, v133 in v_u_26 do
				local v134 = v126 * v132
				local v135 = v126 + 0.5
				local v136 = math.floor(v135)
				v133.f.Size = UDim2.fromOffset(v136 * 2, v136 * 2)
				local v137 = v133.s
				local v138 = v134 + 0.5
				local v139 = math.floor(v138) - v136
				v137.Thickness = math.max(1, v139)
				v133.s.Transparency = 1 - v133.o * (1 - p122)
				v126 = v134
			end
		end
	else
		return
	end
end
local function v_u_152(p141, p142, p143, p144, p145, p146) -- name: line
	-- upvalues: (ref) v_u_15
	local v147 = {
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["ZIndex"] = nil,
		["BackgroundColor3"] = p145,
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Position"] = UDim2.fromOffset(p141, p142),
		["Size"] = UDim2.fromOffset(math.max(1, p143), (math.max(1, p144))),
		["ZIndex"] = p146 or 2
	}
	local v148 = v_u_15
	local v149 = Instance.new("Frame")
	for v150, v151 in v147 do
		v149[v150] = v151
	end
	if v148 then
		v149.Parent = v148
	end
	return v149
end
local function v_u_163(p153, p154, p155, p156, p157) -- name: dot
	-- upvalues: (copy) v_u_152
	local v158 = v_u_152(p153, p154, p155, p155, p156, p157)
	local v159 = {
		["CornerRadius"] = UDim.new(0.5, 0)
	}
	local v160 = Instance.new("UICorner")
	for v161, v162 in v159 do
		v160[v161] = v162
	end
	if v158 then
		v160.Parent = v158
	end
	return v158
end
local function v_u_180(p164, p165, p166) -- name: circle
	-- upvalues: (ref) v_u_15
	local v167 = {
		["BackgroundTransparency"] = 1,
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["ZIndex"] = 2,
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Position"] = UDim2.fromOffset(0, 0),
		["Size"] = UDim2.fromOffset(p164, p164)
	}
	local v168 = v_u_15
	local v169 = Instance.new("Frame")
	for v170, v171 in v167 do
		v169[v170] = v171
	end
	if v168 then
		v169.Parent = v168
	end
	local v172 = {
		["CornerRadius"] = UDim.new(0.5, 0)
	}
	local v173 = Instance.new("UICorner")
	for v174, v175 in v172 do
		v173[v174] = v175
	end
	if v169 then
		v173.Parent = v169
	end
	local v176 = {
		["Color"] = p166,
		["Thickness"] = p165,
		["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
	}
	local v177 = Instance.new("UIStroke")
	for v178, v179 in v176 do
		v177[v178] = v179
	end
	if v169 then
		v177.Parent = v169
	end
	return v169
end
local function v_u_286(p_u_181) -- name: rebuild
	-- upvalues: (ref) v_u_15, (ref) v_u_16, (ref) v_u_17, (ref) v_u_20, (copy) v_u_3, (copy) v_u_4, (copy) v_u_152, (copy) v_u_163, (copy) v_u_180
	for _, v182 in v_u_15:GetChildren() do
		if v182 == v_u_16 then
			continue
		end
		v182:Destroy()
	end
	v_u_17 = p_u_181
	if v_u_20 then
		local v_u_183 = v_u_20.stats
		local v_u_184 = v_u_183.opticCfg or {}
		local v185 = v_u_183.reticle or "Duplex"
		local v186 = v_u_184.ReticleColor or Color3.fromRGB(255, 50, 40)
		local v187 = Color3.fromRGB(8, 8, 8)
		local v_u_188 = p_u_181 / 100
		local v189 = v_u_188 * 0.35 + 0.5
		local v190 = math.floor(v189)
		local v_u_191 = math.max(1, v190)
		local function v221(p192, p193, p194) -- name: rangeMarks
			-- upvalues: (copy) v_u_184, (copy) v_u_183, (ref) v_u_20, (copy) v_u_188, (ref) v_u_3, (ref) v_u_4, (copy) p_u_181, (ref) v_u_152, (copy) v_u_191, (ref) v_u_15
			local v195 = v_u_184.Ranging
			if v195 and v_u_183.v0 then
				local v196 = v_u_20.zeroing or 100
				local v197 = v_u_188 * 2.4
				local v198 = math.floor(v197)
				local v199 = math.max(9, v198)
				local v200 = (-1 / 0)
				for v201, v202 in v195 do
					local v203 = v_u_3.dropAngle(v_u_183.v0, v_u_183.drag or 0, v_u_4.m(v202), v_u_4.m(v196))
					local v204 = workspace.CurrentCamera
					local v205 = v204.FieldOfView
					local v206 = math.rad(v205)
					local v207 = math.tan(v203)
					local v208 = v206 / 2
					local v209 = v207 / math.tan(v208) * (v204.ViewportSize.Y / 2)
					local v210 = v_u_188 * 3
					if math.max(2, v210) >= v209 or v209 >= p_u_181 * 0.47 then
						continue
					end
					local v211 = p192 * (1 - (v201 - 1) * 0.1)
					v_u_152(0, v209, v211, v_u_191, p193)
					if not p194 or v209 - v200 < v199 * 1.15 then
						continue
					end
					local v212 = {
						["BackgroundTransparency"] = 1,
						["Text"] = nil,
						["TextColor3"] = nil,
						["Font"] = nil,
						["TextSize"] = nil,
						["AnchorPoint"] = nil,
						["Position"] = nil,
						["Size"] = nil,
						["TextXAlignment"] = nil,
						["ZIndex"] = 2
					}
					local v213 = v202 / 100
					local v214 = math.floor(v213)
					v212.Text = tostring(v214)
					v212.TextColor3 = p193
					v212.Font = Enum.Font.GothamMedium
					local v215 = v_u_188 * 2.4
					local v216 = math.floor(v215)
					v212.TextSize = math.max(9, v216)
					v212.AnchorPoint = Vector2.new(0, 0.5)
					v212.Position = UDim2.fromOffset(v211 / 2 + v_u_188 * 1.2, v209)
					v212.Size = UDim2.fromOffset(20, 14)
					v212.TextXAlignment = Enum.TextXAlignment.Left
					local v217 = v_u_15
					local v218 = Instance.new("TextLabel")
					for v219, v220 in v212 do
						v218[v219] = v220
					end
					if v217 then
						v218.Parent = v217
						v200 = v209
					else
						v200 = v209
					end
				end
			end
		end
		if v185 == "Dot" then
			local v222 = v_u_163
			local v223 = v_u_188 * 1.6
			local v224 = v222(0, 0, math.max(4, v223), v186, 3)
			local v225 = Instance.new("UIStroke")
			for v226, v227 in {
				["Color"] = nil,
				["Thickness"] = 1,
				["Transparency"] = 0.55,
				["Color"] = v186
			} do
				v225[v226] = v227
			end
			if v224 then
				v225.Parent = v224
			end
			local v228 = v_u_180
			local v229 = v_u_188 * 26
			local v230 = v_u_188 * 0.45
			v228(v229, math.max(1, v230), v186)
			return
		elseif v185 == "Chevron" then
			local v231 = v_u_188 * 8
			local v232 = v_u_152
			local v233 = -v231 * 0.35
			local v234 = v231 * 0.36
			local v235 = v_u_188 * 0.9
			v232(v233, v234, v231, math.max(2, v235), v186, 3).Rotation = -45
			local v236 = v_u_152
			local v237 = v231 * 0.35
			local v238 = v231 * 0.36
			local v239 = v_u_188 * 0.9
			v236(v237, v238, v231, math.max(2, v239), v186, 3).Rotation = 45
			v_u_152(0, v_u_188 * 6 + p_u_181 * 0.15, v_u_191, p_u_181 * 0.3, v187)
			v221(v_u_188 * 6, v187, true)
			return
		elseif v185 == "ACOG" then
			local v240 = v_u_188 * 6.5
			local v241 = v_u_152
			local v242 = -v240 * 0.35
			local v243 = v240 * 0.36
			local v244 = v_u_188 * 0.8
			v241(v242, v243, v240, math.max(2, v244), v186, 3).Rotation = -45
			local v245 = v_u_152
			local v246 = v240 * 0.35
			local v247 = v240 * 0.36
			local v248 = v_u_188 * 0.8
			v245(v246, v247, v240, math.max(2, v248), v186, 3).Rotation = 45
			v_u_152(0, v_u_188 * 5.5 + p_u_181 * 0.22, v_u_191, p_u_181 * 0.44, v187)
			v_u_152(-(p_u_181 * 0.5 + v_u_188 * 12) / 2, 0, p_u_181 * 0.5 - v_u_188 * 12, v_u_191, v187)
			v_u_152((p_u_181 * 0.5 + v_u_188 * 12) / 2, 0, p_u_181 * 0.5 - v_u_188 * 12, v_u_191, v187)
			v221(v_u_188 * 9, v187, true)
			return
		elseif v185 == "MilDot" then
			v_u_152(0, 0, p_u_181, v_u_191, v187)
			v_u_152(0, 0, v_u_191, p_u_181, v187)
			local v249 = workspace.CurrentCamera
			local v250 = v249.FieldOfView
			local v251 = math.rad(v250) / 2
			local v252 = 0.0010000003333334668 / math.tan(v251) * (v249.ViewportSize.Y / 2)
			local v253 = v252 < v_u_188 * 4 and 2 or 1
			for v254 = v253, 10, v253 do
				local v255 = v252 * v254
				if v255 >= p_u_181 * 0.44 then
					continue
				end
				for _, v256 in { -1, 1 } do
					local v257 = v_u_163
					local v258 = v255 * v256
					local v259 = v_u_188 * 1
					v257(v258, 0, math.max(3, v259), v187)
					local v260 = v_u_163
					local v261 = v255 * v256
					local v262 = v_u_188 * 1
					v260(0, v261, math.max(3, v262), v187)
				end
			end
			local v263 = p_u_181 * 0.3
			for _, v264 in { -1, 1 } do
				local v265 = v_u_152
				local v266 = v264 * (p_u_181 / 2 - v263 / 2)
				local v267 = v_u_188 * 1.6
				v265(v266, 0, v263, math.max(3, v267), v187)
				local v268 = v_u_152
				local v269 = v264 * (p_u_181 / 2 - v263 / 2)
				local v270 = v_u_188 * 1.6
				v268(0, v269, math.max(3, v270), v263, v187)
			end
			return
		elseif v185 == "Cross" then
			v_u_152(0, 0, p_u_181, v_u_191, v187)
			v_u_152(0, 0, v_u_191, p_u_181, v187)
		else
			local v271 = p_u_181 * 0.18
			v_u_152(0, 0, v271 * 2, v_u_191, v187)
			v_u_152(0, 0, v_u_191, v271 * 2, v187)
			local v272 = p_u_181 / 2 - v271
			for _, v273 in { -1, 1 } do
				local v274 = v_u_152
				local v275 = v273 * (v271 + v272 / 2)
				local v276 = v_u_188 * 1.8
				v274(v275, 0, v272, math.max(3, v276), v187)
				local v277 = v_u_152
				local v278 = v273 * (v271 + v272 / 2)
				local v279 = v_u_188 * 1.8
				v277(0, v278, math.max(3, v279), v272, v187)
			end
			local v280 = v_u_163
			local v281 = v_u_188 * 0.9
			local v282 = v280(0, 0, math.max(3, v281), v186, 3)
			local v283 = Instance.new("UIStroke")
			for v284, v285 in {
				["Color"] = nil,
				["Thickness"] = 1,
				["Transparency"] = 0.55,
				["Color"] = v186
			} do
				v283[v284] = v285
			end
			if v282 then
				v283.Parent = v282
			end
			v221(v_u_188 * 4.5, v187, false)
		end
	else
		return
	end
end
function v_u_6.show(p287, p288) -- name: show
	-- upvalues: (ref) v_u_7, (copy) v_u_120, (ref) v_u_20, (ref) v_u_22, (ref) v_u_17, (ref) v_u_19, (ref) v_u_24, (ref) v_u_27
	if not v_u_7 then
		v_u_120()
	end
	local v289 = p287.optic
	local v290 = tostring(v289)
	local v291 = p287.reticle
	local v292 = tostring(v291)
	local v293 = tostring(p288)
	local v294 = p287.v0
	local v295 = v290 .. "|" .. v292 .. "|" .. v293 .. "|" .. tostring(v294)
	if not v_u_20 or v_u_20.key ~= v295 then
		v_u_20 = {
			["key"] = v295,
			["stats"] = p287,
			["zeroing"] = p288
		}
		v_u_22 = 0
		v_u_17 = 0
	end
	if not v_u_19 then
		v_u_19 = true
		v_u_22 = 0
		v_u_17 = 0
		v_u_24 = 0
		v_u_27 = ""
	end
	v_u_7.Enabled = true
end
function v_u_6.hide() -- name: hide
	-- upvalues: (ref) v_u_19, (ref) v_u_7
	if v_u_19 then
		v_u_19 = false
		if v_u_7 then
			v_u_7.Enabled = false
		end
	end
end
function v_u_6.isShown() -- name: isShown
	-- upvalues: (ref) v_u_19
	return v_u_19
end
function v_u_6.update(_, p296) -- name: update
	-- upvalues: (ref) v_u_19, (ref) v_u_7, (ref) v_u_24, (ref) v_u_8, (ref) v_u_11, (ref) v_u_10, (ref) v_u_13, (ref) v_u_14, (ref) v_u_12, (ref) v_u_25, (copy) v_u_140, (ref) v_u_15, (ref) v_u_22, (ref) v_u_18, (ref) v_u_21, (ref) v_u_17, (ref) v_u_23, (copy) v_u_286, (ref) v_u_16
	if not (v_u_19 and v_u_7) then
		return
	end
	if type(p296) ~= "table" or (not p296.center or (not p296.radius or p296.radius < 4)) then
		v_u_7.Enabled = false
		return
	end
	v_u_7.Enabled = true
	if v_u_24 == 0 then
		v_u_24 = p296.radius
	else
		local v297 = p296.radius - v_u_24
		if math.abs(v297) >= 0.75 then
			v_u_24 = p296.radius
		end
	end
	local v298 = v_u_24 + 0.5
	local v299 = math.floor(v298)
	local v300 = v299 * 2
	local v301 = p296.aspect or 1
	local v302 = v299 * v301 + 0.5
	local v303 = math.floor(v302) * 2
	local v304 = p296.alpha or 1
	local v305 = 1 - math.clamp(v304, 0, 1)
	local v306 = p296.center.X + 0.5
	local v307 = math.floor(v306)
	local v308 = p296.center.Y + 0.5
	local v309 = math.floor(v308)
	local v310 = UDim2.fromOffset(v307, v309)
	v_u_8.Position = v310
	v_u_8.Size = UDim2.fromOffset(v303, v300)
	v_u_8.GroupTransparency = v305
	local v311 = v299 * 0.02 + 0.5
	local v312 = math.floor(v311)
	local v313 = math.max(2, v312)
	v_u_11.Thickness = v313
	v_u_10.Size = UDim2.new(1, v313 * -2, 1, v313 * -2)
	local v314 = v299 * 1.3 + 0.5
	local v315 = math.floor(v314) * 2
	v_u_13.Position = v310
	local v316 = v_u_13
	local v317 = UDim2.fromOffset
	local v318 = v299 * 1.3 * v301 + 0.5
	v316.Size = v317(math.floor(v318) * 2, v315)
	v_u_13.GroupTransparency = v305
	for _, v319 in v_u_14 do
		local v320 = v299 * v319.k + 0.5
		local v321 = math.floor(v320)
		local v322 = math.max(1, v321)
		v319.s.Thickness = v322
		local v323 = v319.f
		local v324 = UDim2.fromOffset
		local v325 = v299 * v319.w * v301 + 0.5
		local v326 = math.floor(v325) * 2
		local v327 = v299 * v319.w + 0.5
		v323.Size = v324(v326, math.floor(v327) * 2)
	end
	for _, v328 in v_u_12 do
		local v329 = v299 * v328.k + 0.5
		local v330 = math.floor(v329)
		local v331 = math.max(2, v330)
		v328.s.Thickness = v331
		v328.f.Size = UDim2.new(1, (v313 + v331) * -2, 1, (v313 + v331) * -2)
	end
	if v_u_25 then
		v_u_25.Position = v310
		v_u_140(v299, v305)
	end
	local v332 = p296.aim or p296.center
	local v333 = v332.X - p296.center.X
	local v334 = v332.Y - p296.center.Y
	if v333 * v333 + v334 * v334 < 1 then
		v333 = 0
		v334 = 0
	end
	local v335 = v_u_15
	local v336 = UDim2.fromOffset
	local v337 = v303 / 2
	local v338 = v333 + 0.5
	local v339 = v337 + math.floor(v338)
	local v340 = v300 / 2
	local v341 = v334 + 0.5
	v335.Position = v336(v339, v340 + math.floor(v341))
	local v342 = workspace.CurrentCamera
	local v343 = os.clock()
	if v300 ~= v_u_22 then
		v_u_22 = v300
		v_u_18 = v343
	end
	local v344 = v342.FieldOfView - v_u_21
	local v345 = math.abs(v344) > 0.05
	if v_u_17 == 0 or v345 and v343 - v_u_23 > 0.08 or v300 ~= v_u_17 and v343 - v_u_18 > 0.12 then
		v_u_21 = v342.FieldOfView
		v_u_23 = v343
		v_u_286(v300)
	end
	local v346 = v_u_17
	v_u_16.Scale = v300 / math.max(v346, 1)
end
return v_u_6