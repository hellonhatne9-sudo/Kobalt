-- Decompiled by Executor
-- Path: ReplicatedStorage.Client.Controllers.ViewmodelController.Props

local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("ReplicatedStorage")
local v4 = require(v_u_3.Shared.Util.Units)
local v_u_5 = {}
local v_u_6 = require(script.Parent.Pose).SCALE * v4.WeaponStudsPerMeter
local v_u_7 = CFrame.new(0, -10000, 0)
local v_u_8 = Random.new()
local v_u_9 = Color3.fromRGB(196, 158, 78)
local v_u_10 = Color3.fromRGB(176, 104, 62)
local v_u_11 = Color3.fromRGB(62, 64, 68)
local v_u_12 = Color3.fromRGB(150, 32, 30)
local function v_u_21(p13, p14, p15, p16, p17) -- name: part
	local v18 = Instance.new("Part")
	v18.Name = p13
	if p17 then
		v18.Shape = p17
	end
	v18.Size = p14
	v18.Color = p15
	v18.Material = p16 or Enum.Material.SmoothPlastic
	v18.Anchored = false
	v18.CanCollide = false
	v18.CanQuery = false
	v18.CanTouch = false
	v18.CastShadow = false
	v18.Massless = true
	v18.Transparency = 0
	local v19 = Enum.SurfaceType.Smooth
	local v20 = Enum.SurfaceType.Smooth
	v18.TopSurface = v19
	v18.BottomSurface = v20
	return v18
end
local function v_u_33(p22, p23) -- name: model
	local v24 = Instance.new("Model")
	v24.Name = p22
	local v25 = Color3.new()
	local v26 = Instance.new("Part")
	v26.Name = "PropRoot"
	v26.Size = Vector3.new(0.02, 0.02, 0.02)
	v26.Color = v25
	v26.Material = Enum.Material.SmoothPlastic
	v26.Anchored = false
	v26.CanCollide = false
	v26.CanQuery = false
	v26.CanTouch = false
	v26.CastShadow = false
	v26.Massless = true
	v26.Transparency = 0
	local v27 = Enum.SurfaceType.Smooth
	local v28 = Enum.SurfaceType.Smooth
	v26.TopSurface = v27
	v26.BottomSurface = v28
	v26.Transparency = 1
	v26.Parent = v24
	v24.PrimaryPart = v26
	for _, v29 in p23 do
		local v30 = v29[1]
		local v31 = v29[2]
		v30.CFrame = v31
		local v32 = Instance.new("Weld")
		v32.Part0 = v26
		v32.Part1 = v30
		v32.C0 = v31
		v32.Parent = v30
		v30.Parent = v24
	end
	return v24
end
local v_u_34 = Enum.PartType.Cylinder
local v_u_35 = CFrame.Angles(0, 1.5707963267948966, 0)
local function v_u_52(p36, p37, p38) -- name: roundPieces
	-- upvalues: (copy) v_u_21, (copy) v_u_6, (copy) v_u_9, (copy) v_u_34, (copy) v_u_35, (copy) v_u_10
	local v39 = p37 or 0
	local v40 = p38 or 0
	local v41 = {}
	local v42 = {}
	local v43 = v_u_21
	local v44 = 0.057 * v_u_6
	local v45 = 0.0118 * v_u_6
	local v46 = 0.0118 * v_u_6
	__set_list(v42, 1, {v43("Case", Vector3.new(v44, v45, v46), v_u_9, Enum.Material.Metal, v_u_34), CFrame.new(v39, v40, p36 + 0.012 * v_u_6) * v_u_35})
	local v47 = {}
	local v48 = v_u_21
	local v49 = 0.024 * v_u_6
	local v50 = 0.0079 * v_u_6
	local v51 = 0.0079 * v_u_6
	__set_list(v47, 1, {v48("Bullet", Vector3.new(v49, v50, v51), v_u_10, Enum.Material.Metal, v_u_34), CFrame.new(v39, v40, p36 - 0.028 * v_u_6) * v_u_35})
	__set_list(v41, 1, {v42, v47})
	return v41
end
local function v_u_66(p53, p54) -- name: shellPieces
	-- upvalues: (copy) v_u_21, (copy) v_u_6, (copy) v_u_12, (copy) v_u_34, (copy) v_u_35, (copy) v_u_9
	local v55 = {}
	local v56 = {}
	local v57 = v_u_21
	local v58 = 0.058 * v_u_6
	local v59 = 0.0202 * v_u_6
	local v60 = 0.0202 * v_u_6
	__set_list(v56, 1, {v57("Hull", Vector3.new(v58, v59, v60), v_u_12, Enum.Material.SmoothPlastic, v_u_34), CFrame.new(p53, p54, -0.006 * v_u_6) * v_u_35})
	local v61 = {}
	local v62 = v_u_21
	local v63 = 0.014 * v_u_6
	local v64 = 0.0214 * v_u_6
	local v65 = 0.0214 * v_u_6
	__set_list(v61, 1, {v62("Head", Vector3.new(v63, v64, v65), v_u_9, Enum.Material.Metal, v_u_34), CFrame.new(p53, p54, 0.029 * v_u_6) * v_u_35})
	__set_list(v55, 1, {v56, v61})
	return v55
end
local function v_u_70(...) -- name: concat
	local v67 = {}
	for _, v68 in { ... } do
		for _, v69 in v68 do
			table.insert(v67, v69)
		end
	end
	return v67
end
local v_u_197 = {
	["Round"] = function() -- name: Round
		-- upvalues: (copy) v_u_33, (copy) v_u_52
		return v_u_33("Round", (v_u_52(0)))
	end,
	["Shell1"] = function() -- name: Shell1
		-- upvalues: (copy) v_u_33, (copy) v_u_66
		return v_u_33("Shell1", (v_u_66(0, 0)))
	end,
	["Shells2H"] = function() -- name: Shells2H
		-- upvalues: (copy) v_u_33, (copy) v_u_70, (copy) v_u_66, (copy) v_u_6
		return v_u_33("Shells2H", v_u_70(v_u_66(-0.0108 * v_u_6, 0), (v_u_66(0.0108 * v_u_6, 0))))
	end,
	["Shells2V"] = function() -- name: Shells2V
		-- upvalues: (copy) v_u_33, (copy) v_u_70, (copy) v_u_66, (copy) v_u_6
		return v_u_33("Shells2V", v_u_70(v_u_66(0, -0.0108 * v_u_6), (v_u_66(0, 0.0108 * v_u_6))))
	end,
	["Flare"] = function() -- name: Flare
		-- upvalues: (copy) v_u_33, (copy) v_u_21, (copy) v_u_6, (copy) v_u_34, (copy) v_u_35, (copy) v_u_9
		local v71 = v_u_33
		local v72 = {}
		local v73 = {}
		local v74 = v_u_21
		local v75 = 0.1 * v_u_6
		local v76 = 0.026 * v_u_6
		local v77 = 0.026 * v_u_6
		__set_list(v73, 1, {v74("Hull", Vector3.new(v75, v76, v77), Color3.fromRGB(214, 84, 36), Enum.Material.SmoothPlastic, v_u_34), CFrame.new(0, 0, -0.008 * v_u_6) * v_u_35})
		local v78 = {}
		local v79 = v_u_21
		local v80 = 0.014 * v_u_6
		local v81 = 0.029 * v_u_6
		local v82 = 0.029 * v_u_6
		__set_list(v78, 1, {v79("Head", Vector3.new(v80, v81, v82), v_u_9, Enum.Material.Metal, v_u_34), CFrame.new(0, 0, 0.049 * v_u_6) * v_u_35})
		__set_list(v72, 1, {v73, v78})
		return v71("Flare", v72)
	end,
	["ClipStrip"] = function() -- name: ClipStrip
		-- upvalues: (copy) v_u_33, (copy) v_u_6, (copy) v_u_11
		local v83 = v_u_33
		local v84 = {}
		local v85 = {}
		local v86 = 0.012 * v_u_6
		local v87 = 0.068 * v_u_6
		local v88 = 0.004 * v_u_6
		local v89 = Vector3.new(v86, v87, v88)
		local v90 = v_u_11
		local v91 = Enum.Material.Metal
		local v92 = Instance.new("Part")
		v92.Name = "Strip"
		v92.Size = v89
		v92.Color = v90
		v92.Material = v91 or Enum.Material.SmoothPlastic
		v92.Anchored = false
		v92.CanCollide = false
		v92.CanQuery = false
		v92.CanTouch = false
		v92.CastShadow = false
		v92.Massless = true
		v92.Transparency = 0
		local v93 = Enum.SurfaceType.Smooth
		local v94 = Enum.SurfaceType.Smooth
		v92.TopSurface = v93
		v92.BottomSurface = v94
		__set_list(v85, 1, {v92, CFrame.new(0, 0.034 * v_u_6, 0.004 * v_u_6)})
		local v95 = {}
		local v96 = 0.002 * v_u_6
		local v97 = 0.068 * v_u_6
		local v98 = 0.008 * v_u_6
		local v99 = Vector3.new(v96, v97, v98)
		local v100 = v_u_11
		local v101 = Enum.Material.Metal
		local v102 = Instance.new("Part")
		v102.Name = "LipL"
		v102.Size = v99
		v102.Color = v100
		v102.Material = v101 or Enum.Material.SmoothPlastic
		v102.Anchored = false
		v102.CanCollide = false
		v102.CanQuery = false
		v102.CanTouch = false
		v102.CastShadow = false
		v102.Massless = true
		v102.Transparency = 0
		local v103 = Enum.SurfaceType.Smooth
		local v104 = Enum.SurfaceType.Smooth
		v102.TopSurface = v103
		v102.BottomSurface = v104
		__set_list(v95, 1, {v102, CFrame.new(-0.006 * v_u_6, 0.034 * v_u_6, 0)})
		local v105 = {}
		local v106 = 0.002 * v_u_6
		local v107 = 0.068 * v_u_6
		local v108 = 0.008 * v_u_6
		local v109 = Vector3.new(v106, v107, v108)
		local v110 = v_u_11
		local v111 = Enum.Material.Metal
		local v112 = Instance.new("Part")
		v112.Name = "LipR"
		v112.Size = v109
		v112.Color = v110
		v112.Material = v111 or Enum.Material.SmoothPlastic
		v112.Anchored = false
		v112.CanCollide = false
		v112.CanQuery = false
		v112.CanTouch = false
		v112.CastShadow = false
		v112.Massless = true
		v112.Transparency = 0
		local v113 = Enum.SurfaceType.Smooth
		local v114 = Enum.SurfaceType.Smooth
		v112.TopSurface = v113
		v112.BottomSurface = v114
		__set_list(v105, 1, {v112, CFrame.new(0.006 * v_u_6, 0.034 * v_u_6, 0)})
		__set_list(v84, 1, {v85, v95, v105})
		return v83("ClipStrip", v84)
	end,
	["ClipRounds"] = function() -- name: ClipRounds
		-- upvalues: (copy) v_u_6, (copy) v_u_52, (copy) v_u_33
		local v115 = {}
		for v116 = 0, 4 do
			local v117 = v116 % 2 == 0 and -0.0015 * v_u_6 or 0.0015 * v_u_6
			for _, v118 in v_u_52(-0.041 * v_u_6, v117, (v116 * 0.0125 + 0.007) * v_u_6) do
				table.insert(v115, v118)
			end
		end
		return v_u_33("ClipRounds", v115)
	end,
	["Rod"] = function() -- name: Rod
		-- upvalues: (copy) v_u_33, (copy) v_u_21, (copy) v_u_6, (copy) v_u_34
		local v119 = v_u_33
		local v120 = {}
		local v121 = {}
		local v122 = v_u_21
		local v123 = 0.004 * v_u_6
		local v124 = 0.004 * v_u_6
		__set_list(v121, 1, {v122("Rod", Vector3.new(1, v123, v124), Color3.fromRGB(150, 148, 140), Enum.Material.Fabric, v_u_34), CFrame.identity})
		__set_list(v120, 1, {v121})
		return v119("Rod", v120)
	end,
	["Pad"] = function() -- name: Pad
		-- upvalues: (copy) v_u_33, (copy) v_u_6
		local v125 = v_u_33
		local v126 = {}
		local v127 = {}
		local v128 = 0.09 * v_u_6
		local v129 = 0.006 * v_u_6
		local v130 = 0.07 * v_u_6
		local v131 = Vector3.new(v128, v129, v130)
		local v132 = Color3.fromRGB(246, 246, 244)
		local v133 = Enum.Material.Fabric
		local v134 = Instance.new("Part")
		v134.Name = "Pad"
		v134.Size = v131
		v134.Color = v132
		v134.Material = v133 or Enum.Material.SmoothPlastic
		v134.Anchored = false
		v134.CanCollide = false
		v134.CanQuery = false
		v134.CanTouch = false
		v134.CastShadow = false
		v134.Massless = true
		v134.Transparency = 0
		local v135 = Enum.SurfaceType.Smooth
		local v136 = Enum.SurfaceType.Smooth
		v134.TopSurface = v135
		v134.BottomSurface = v136
		__set_list(v127, 1, {v134, CFrame.identity})
		local v137 = {}
		local v138 = 0.094 * v_u_6
		local v139 = 0.004 * v_u_6
		local v140 = 0.074 * v_u_6
		local v141 = Vector3.new(v138, v139, v140)
		local v142 = Color3.fromRGB(220, 226, 236)
		local v143 = Enum.Material.SmoothPlastic
		local v144 = Instance.new("Part")
		v144.Name = "Edge"
		v144.Size = v141
		v144.Color = v142
		v144.Material = v143 or Enum.Material.SmoothPlastic
		v144.Anchored = false
		v144.CanCollide = false
		v144.CanQuery = false
		v144.CanTouch = false
		v144.CastShadow = false
		v144.Massless = true
		v144.Transparency = 0
		local v145 = Enum.SurfaceType.Smooth
		local v146 = Enum.SurfaceType.Smooth
		v144.TopSurface = v145
		v144.BottomSurface = v146
		__set_list(v137, 1, {v144, CFrame.new(0, -0.002 * v_u_6, 0)})
		__set_list(v126, 1, {v127, v137})
		return v125("Pad", v126)
	end,
	["Pill"] = function() -- name: Pill
		-- upvalues: (copy) v_u_33, (copy) v_u_21, (copy) v_u_6, (copy) v_u_34
		local v147 = v_u_33
		local v148 = {}
		local v149 = {}
		local v150 = v_u_21
		local v151 = 0.014 * v_u_6
		local v152 = 0.0065 * v_u_6
		local v153 = 0.0065 * v_u_6
		__set_list(v149, 1, {v150("Rod", Vector3.new(v151, v152, v153), Color3.fromRGB(250, 250, 250), Enum.Material.SmoothPlastic, Enum.PartType.Ball), CFrame.identity})
		local v154 = {}
		local v155 = v_u_21
		local v156 = 0.012 * v_u_6
		local v157 = 0.0065 * v_u_6
		local v158 = 0.0065 * v_u_6
		__set_list(v154, 1, {v155("Body", Vector3.new(v156, v157, v158), Color3.fromRGB(250, 250, 250), Enum.Material.SmoothPlastic, v_u_34), CFrame.identity})
		__set_list(v148, 1, {v149, v154})
		return v147("Pill", v148)
	end,
	["Syringe"] = function() -- name: Syringe
		-- upvalues: (copy) v_u_33, (copy) v_u_21, (copy) v_u_6, (copy) v_u_34
		local v159 = v_u_33
		local v160 = {}
		local v161 = {}
		local v162 = v_u_21
		local v163 = 0.07 * v_u_6
		local v164 = 0.016 * v_u_6
		local v165 = 0.016 * v_u_6
		__set_list(v161, 1, {v162("Barrel", Vector3.new(v163, v164, v165), Color3.fromRGB(230, 240, 245), Enum.Material.SmoothPlastic, v_u_34), CFrame.identity})
		local v166 = {}
		local v167 = v_u_21
		local v168 = 0.05 * v_u_6
		local v169 = 0.013 * v_u_6
		local v170 = 0.013 * v_u_6
		__set_list(v166, 1, {v167("Liquid", Vector3.new(v168, v169, v170), Color3.fromRGB(240, 170, 40), Enum.Material.SmoothPlastic, v_u_34), CFrame.new(0.008 * v_u_6, 0, 0)})
		local v171 = {}
		local v172 = v_u_21
		local v173 = 0.04 * v_u_6
		local v174 = 0.006 * v_u_6
		local v175 = 0.006 * v_u_6
		__set_list(v171, 1, {v172("Plunger", Vector3.new(v173, v174, v175), Color3.fromRGB(240, 240, 240), Enum.Material.SmoothPlastic, v_u_34), CFrame.new(-0.05 * v_u_6, 0, 0)})
		local v176 = {}
		local v177 = v_u_21
		local v178 = 0.003 * v_u_6
		local v179 = 0.02 * v_u_6
		local v180 = 0.02 * v_u_6
		__set_list(v176, 1, {v177("Thumb", Vector3.new(v178, v179, v180), Color3.fromRGB(240, 240, 240), Enum.Material.SmoothPlastic, v_u_34), CFrame.new(-0.07 * v_u_6, 0, 0)})
		local v181 = {}
		local v182 = v_u_21
		local v183 = 0.028 * v_u_6
		local v184 = 0.0015 * v_u_6
		local v185 = 0.0015 * v_u_6
		__set_list(v181, 1, {v182("Needle", Vector3.new(v183, v184, v185), Color3.fromRGB(200, 200, 205), Enum.Material.Metal, v_u_34), CFrame.new(0.049 * v_u_6, 0, 0)})
		__set_list(v160, 1, {v161, v166, v171, v176, v181})
		return v159("Syringe", v160)
	end,
	["Strip"] = function() -- name: Strip
		-- upvalues: (copy) v_u_33, (copy) v_u_6
		local v186 = v_u_33
		local v187 = {}
		local v188 = {}
		local v189 = 0.0015 * v_u_6
		local v190 = 0.06 * v_u_6
		local v191 = Vector3.new(1, v189, v190)
		local v192 = Color3.fromRGB(226, 210, 176)
		local v193 = Enum.Material.Fabric
		local v194 = Instance.new("Part")
		v194.Name = "Rod"
		v194.Size = v191
		v194.Color = v192
		v194.Material = v193 or Enum.Material.SmoothPlastic
		v194.Anchored = false
		v194.CanCollide = false
		v194.CanQuery = false
		v194.CanTouch = false
		v194.CastShadow = false
		v194.Massless = true
		v194.Transparency = 0
		local v195 = Enum.SurfaceType.Smooth
		local v196 = Enum.SurfaceType.Smooth
		v194.TopSurface = v195
		v194.BottomSurface = v196
		__set_list(v188, 1, {v194, CFrame.identity})
		__set_list(v187, 1, {v188})
		return v186("Strip", v187)
	end,
	["Wrap"] = function() -- name: Wrap
		-- upvalues: (copy) v_u_33, (copy) v_u_21, (copy) v_u_34
		return v_u_33("Wrap", {
			{ v_u_21("Rod", Vector3.new(0.1, 0.3, 0.3), Color3.fromRGB(232, 218, 186), Enum.Material.Fabric, v_u_34), CFrame.identity }
		})
	end
}
function v_u_5.make(p198) -- name: make
	-- upvalues: (copy) v_u_197
	local v199 = v_u_197[p198]
	if v199 then
		return v199()
	else
		return nil
	end
end
local function v_u_209(p200, p201) -- name: propOf
	-- upvalues: (copy) v_u_5, (copy) v_u_7
	p200.props = p200.props or {}
	local v202 = p200.props[p201]
	if v202 then
		return v202
	end
	local v203 = (p201 == "StringL" or p201 == "StringR") and "Rod" or string.gsub(p201, "%d+$", "")
	local v204 = v_u_5.make(v203)
	if not v204 then
		return nil
	end
	local v205 = p200.root
	local v206 = v204.PrimaryPart
	local v207 = Instance.new("Weld")
	v207.Name = "PropWeld"
	v207.Part0 = v205
	v207.Part1 = v206
	v207.C0 = v_u_7
	v207.Parent = v206
	v204.Parent = p200.model
	local v208 = {
		["model"] = nil,
		["weld"] = nil,
		["rod"] = nil,
		["shown"] = false,
		["model"] = v204,
		["weld"] = v207,
		["rod"] = v204:FindFirstChild("Rod")
	}
	p200.props[p201] = v208
	return v208
end
local function v_u_213(p210, p211) -- name: setShown
	-- upvalues: (copy) v_u_7
	if p210.shown ~= p211 then
		p210.shown = p211
		for _, v212 in p210.model:GetDescendants() do
			if not v212:IsA("BasePart") or v212.Name == "PropRoot" then
				continue
			end
			v212.LocalTransparencyModifier = p211 and 0 or 1
		end
		if not p211 then
			p210.weld.C0 = v_u_7
		end
	end
end
function v_u_5.set(p214, p215) -- name: set
	-- upvalues: (copy) v_u_209, (copy) v_u_35, (copy) v_u_213
	local v216 = p215 or {}
	for v217, v218 in v216 do
		local v219 = v_u_209(p214, v217)
		if not v219 then
			continue
		end
		if type(v218) == "table" and v218.cf then
			v219.weld.C0 = v218.cf
			if v219.rod then
				local v220 = v218.size
				if typeof(v220) == "Vector3" then
					v219.rod.Size = v218.size
				end
			end
		elseif type(v218) == "table" then
			local v221 = v218.a
			local v222 = v218.b
			local v223 = (v222 - v221).Magnitude
			local v224 = math.max(v223, 0.01)
			v219.weld.C0 = CFrame.lookAt((v221 + v222) / 2, v222) * v_u_35
			if v219.rod then
				local v225 = v219.rod
				local v226 = v219.rod.Size.Y
				local v227 = v219.rod.Size.Z
				v225.Size = Vector3.new(v224, v226, v227)
				local v228 = v219.rod:FindFirstChildOfClass("Weld")
				if v228 then
					v228.C0 = CFrame.identity
				end
			end
		else
			v219.weld.C0 = v218
		end
		v_u_213(v219, true)
	end
	for v229, v230 in p214.props or {} do
		if v216[v229] ~= nil then
			continue
		end
		v_u_213(v230, false)
	end
end
function v_u_5.clear(p231) -- name: clear
	-- upvalues: (copy) v_u_213
	for _, v232 in p231.props or {} do
		v_u_213(v232, false)
	end
end
function v_u_5.hide(p233, p234) -- name: hide
	p233.hiddenParts = p233.hiddenParts or {}
	local v235 = {}
	for v236 in p234 or {} do
		local v237 = p233.info and p233.info.root
		if v237 then
			v237 = p233.info.root:FindFirstChild(v236)
		end
		local v238 = v237 and (v237:IsA("Motor6D") and v237.Part1) or nil
		if not v238 then
			for _, v239 in p233.model:GetDescendants() do
				if v239.Name ~= v236 or not v239:IsA("BasePart") then
					continue
				end
				v238 = v239
			end
		end
		if not (v238 and v238:IsA("BasePart")) then
			continue
		end
		v235[v238] = true
	end
	for v240 in p233.hiddenParts do
		if v235[v240] then
			continue
		end
		v240.LocalTransparencyModifier = 0
		p233.hiddenParts[v240] = nil
	end
	for v241 in v235 do
		if p233.hiddenParts[v241] then
			continue
		end
		p233.hiddenParts[v241] = true
		v241.LocalTransparencyModifier = 1
	end
end
local v_u_242 = {}
local v_u_243 = nil
local v_u_244 = nil
local v_u_245 = RaycastParams.new()
v_u_245.FilterType = Enum.RaycastFilterType.Exclude
v_u_245.IgnoreWater = false
local v_u_246 = v4.Gravity or 27.25
local function v_u_278(p247) -- name: step
	-- upvalues: (copy) v_u_242, (ref) v_u_244, (copy) v_u_1, (copy) v_u_245, (copy) v_u_246
	if #v_u_242 == 0 then
		if v_u_244 then
			v_u_244:Disconnect()
			v_u_244 = nil
		end
	else
		local v248 = math.min(p247, 0.05)
		local v249 = { workspace.CurrentCamera }
		local v250 = v_u_1.LocalPlayer.Character
		if v250 then
			table.insert(v249, v250)
		end
		for _, v251 in { "Live", "FX", "Projectiles" } do
			local v252 = workspace:FindFirstChild(v251)
			if not v252 then
				continue
			end
			table.insert(v249, v252)
		end
		v_u_245.FilterDescendantsInstances = v249
		local v253 = {}
		local v254 = {}
		for v255 = #v_u_242, 1, -1 do
			local v256 = v_u_242[v255]
			v256.t = v256.t + v248
			if v256.t > v256.life or not v256.obj.Parent then
				v256.obj:Destroy()
				table.remove(v_u_242, v255)
			else
				if not v256.rest then
					local v257 = v256.vel
					local v258 = v_u_246 * v248
					local v259 = v257 - Vector3.new(0, v258, 0)
					local v260 = v256.pos + v259 * v248
					local v261 = workspace:Raycast(v256.pos, v260 - v256.pos, v_u_245)
					if v261 then
						local v262 = v261.Normal
						local v263 = v259:Dot(v262)
						v259 = (v259 - v262 * v263) * 0.55 - v262 * v263 * 0.28
						v260 = v261.Position + v262 * v256.half
						v256.spin = v256.spin * 0.45
						v256.bounces = v256.bounces + 1
						if v259.Magnitude < 2.2 or v256.bounces >= 3 then
							v256.rest = true
							local v264 = v256.size
							local v265 = v264.X <= v264.Y and v264.X <= v264.Z and Vector3.new(1, 0, 0) or (v264.Y <= v264.Z and Vector3.new(0, 1, 0) or Vector3.new(0, 0, 1))
							local v266 = v256.rot * v265
							if v266:Dot(v262) < 0 then
								v266 = -v266
							end
							local v267 = v266:Cross(v262)
							if v267.Magnitude > 0.0001 then
								local v268 = CFrame.fromAxisAngle
								local v269 = v267.Unit
								local v270 = v266:Dot(v262)
								local v271 = math.clamp(v270, -1, 1)
								v256.rot = v268(v269, (math.acos(v271))) * v256.rot
							end
							v260 = v261.Position + v262 * v256.half
						end
					end
					v256.vel = v259
					v256.pos = v260
					if not v256.rest then
						v256.rot = CFrame.fromAxisAngle(v256.spinAxis, v256.spin * v248) * v256.rot
					end
				end
				local v272 = v256.life - v256.t
				local v273 = math.clamp(v272, 0, 1)
				if v273 < 1 then
					for _, v274 in v256.parts do
						v274.Transparency = 1 - v273 * (1 - v274:GetAttribute("BaseT"))
					end
				end
				local v275 = CFrame.new(v256.pos) * v256.rot
				for _, v276 in v256.parts do
					table.insert(v253, v276)
					local v277 = v275 * v256.offs[v276]
					table.insert(v254, v277)
				end
			end
		end
		if #v253 > 0 then
			workspace:BulkMoveTo(v253, v254, Enum.BulkMoveMode.FireCFrameChanged)
		end
	end
end
function v_u_5.debris(p_u_279, p_u_280, p281, p282, p283) -- name: debris
	-- upvalues: (ref) v_u_243, (copy) v_u_8, (copy) v_u_242, (ref) v_u_244, (copy) v_u_2, (copy) v_u_278
	local v284 = p_u_279:Clone()
	local v_u_285 = {}
	local v_u_286 = {}
	p_u_280 = p_u_280
	local v287 = Vector3.new(0.2, 0.2, 0.2)
	if v284:IsA("Model") then
		local v288, v289, v290 = pcall(function()
			-- upvalues: (copy) p_u_279
			return p_u_279:GetBoundingBox()
		end)
		if v288 then
			v287 = v290
			p_u_280 = v289
		end
	elseif v284:IsA("BasePart") then
		v287 = v284.Size
	end
	local v291 = {}
	if p_u_279:IsA("BasePart") then
		table.insert(v291, p_u_279)
	end
	for _, v292 in p_u_279:GetDescendants() do
		if not v292:IsA("BasePart") then
			continue
		end
		table.insert(v291, v292)
	end
	local function v298(p293, p294) -- name: prep
		-- upvalues: (copy) v_u_286, (ref) p_u_280, (copy) v_u_285
		for _, v295 in p293:GetChildren() do
			if not (v295:IsA("JointInstance") or (v295:IsA("WeldConstraint") or (v295:IsA("Attachment") or v295:IsA("Constraint")))) then
				continue
			end
			v295:Destroy()
		end
		p293.Anchored = true
		p293.CanCollide = false
		p293.CanQuery = false
		p293.CanTouch = false
		p293.CastShadow = true
		p293.LocalTransparencyModifier = 0
		local v296 = (p294.Name == "PropRoot" or p294.Transparency >= 1) and 1 or p294.Transparency
		p293.Transparency = v296
		p293:SetAttribute("BaseT", v296)
		v_u_286[p293] = p_u_280:ToObjectSpace(p294.CFrame)
		local v297 = v_u_285
		table.insert(v297, p293)
	end
	if v284:IsA("BasePart") then
		v298(v284, v291[1])
	end
	local v299 = {}
	for _, v300 in v284:GetDescendants() do
		if not v300:IsA("BasePart") then
			continue
		end
		table.insert(v299, v300)
	end
	for v301, v302 in v299 do
		local v303 = v291[v301 + (v284:IsA("BasePart") and 1 or 0)]
		if not v303 then
			continue
		end
		v298(v302, v303)
	end
	local v304
	if v_u_243 and v_u_243.Parent then
		v304 = v_u_243
	else
		v304 = Instance.new("Folder")
		v304.Name = "_VMDebris"
		v304.Parent = workspace.CurrentCamera
		v_u_243 = v304
	end
	v284.Parent = v304
	local v305 = v_u_8:NextUnitVector()
	local v306 = v_u_242
	local v307 = {
		["obj"] = nil,
		["parts"] = nil,
		["offs"] = nil,
		["pos"] = nil,
		["rot"] = nil,
		["vel"] = nil,
		["spin"] = nil,
		["spinAxis"] = nil,
		["t"] = 0,
		["life"] = nil,
		["rest"] = false,
		["bounces"] = 0,
		["half"] = nil,
		["size"] = nil,
		["obj"] = v284,
		["parts"] = v_u_285,
		["offs"] = v_u_286,
		["pos"] = p_u_280.Position,
		["rot"] = p_u_280.Rotation,
		["vel"] = p281,
		["spin"] = p282 or v_u_8:NextNumber(4, 12),
		["spinAxis"] = v305,
		["life"] = p283 or 6
	}
	local v308 = v287.X
	local v309 = v287.Y
	local v310 = v287.Z
	v307.half = math.min(v308, v309, v310) * 0.5
	v307.size = v287
	table.insert(v306, v307)
	while #v_u_242 > 14 do
		table.remove(v_u_242, 1).obj:Destroy()
	end
	if not v_u_244 then
		v_u_244 = v_u_2.Heartbeat:Connect(v_u_278)
	end
	return v284
end
function v_u_5.dropMag(p311) -- name: dropMag
	-- upvalues: (copy) v_u_8, (copy) v_u_1, (copy) v_u_5
	local v312 = p311.info
	if v312 then
		v312 = p311.info.mag
	end
	if v312 and v312.Parent then
		local v313 = v312.CFrame
		local v314 = -v313.UpVector * v_u_8:NextNumber(3, 5) + Vector3.new(0, -1.5, 0) - p311.root.CFrame.RightVector * 0.6
		local v315 = v_u_1.LocalPlayer.Character
		if v315 then
			v315 = v315:FindFirstChild("HumanoidRootPart")
		end
		local v316 = v314 + (v315 and v315.AssemblyLinearVelocity or Vector3.new(0, 0, 0))
		v_u_5.debris(v312, v313, v316, v_u_8:NextNumber(2, 5), 6)
	end
end
function v_u_5.flickClip(p317) -- name: flickClip
	-- upvalues: (copy) v_u_8, (copy) v_u_1, (copy) v_u_5
	local v318 = p317.props
	if v318 then
		v318 = p317.props.ClipStrip
	end
	if v318 and v318.shown then
		local v319 = p317.root.CFrame
		local v320 = v319.RightVector * v_u_8:NextNumber(7, 9) + v319.UpVector * v_u_8:NextNumber(5, 7) + v319.LookVector * -1
		local v321 = v_u_1.LocalPlayer.Character
		if v321 then
			v321 = v321:FindFirstChild("HumanoidRootPart")
		end
		local v322 = v320 + (v321 and v321.AssemblyLinearVelocity or Vector3.new(0, 0, 0))
		v_u_5.debris(v318.model, v318.model:GetPivot(), v322, v_u_8:NextNumber(14, 22), 5)
	end
end
local function v_u_328(p323) -- name: lazy
	-- upvalues: (copy) v_u_3
	local v324 = v_u_3:FindFirstChild("Client")
	if v324 then
		v324 = v324:FindFirstChild("Controllers")
	end
	if v324 then
		v324 = v324:FindFirstChild(p323)
	end
	if v324 then
		local v325 = require
		local v326, v327 = pcall(v325, v324)
		if v326 and type(v327) == "table" then
			return v327
		else
			return nil
		end
	else
		return nil
	end
end
function v_u_5.eject(p329, p330, p331, p332) -- name: eject
	-- upvalues: (copy) v_u_328
	local v333 = v_u_328("ShellFx")
	if v333 then
		local v334 = v333.eject
		if type(v334) == "function" then
			local v335 = v333.eject
			if pcall(v335, p329, p330, p331, true) then
				return
			end
		end
	end
	local v336 = v_u_328("BallisticsFx")
	if v336 then
		local v337 = v336.ejectShell
		if type(v337) == "function" and p332 then
			local v338 = v336.ejectShell
			local v339 = p331 == "12g" and "SG" or "AR"
			pcall(v338, p332, v339)
		end
	end
end
function v_u_5.reset() -- name: reset
	-- upvalues: (copy) v_u_242, (ref) v_u_243
	for _, v340 in v_u_242 do
		v340.obj:Destroy()
	end
	table.clear(v_u_242)
	if v_u_243 then
		v_u_243:Destroy()
		v_u_243 = nil
	end
end
return v_u_5