-- Decompiled by Executor
-- Path: ReplicatedStorage.Client.Controllers.ViewmodelController

local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("ReplicatedStorage")
local v4 = require(v_u_3.Shared.Util.Spring)
local v_u_5 = require(v_u_3.Shared.Util.Units)
local v_u_6 = require(v_u_3.Shared.Config.WeaponConfig)
local v7 = require(v_u_3.Shared.Config.CameraConfig)
local v_u_8 = require(v_u_3.Shared.Combat.WeaponStats)
local v_u_9 = require(v_u_3.Shared.Combat.WeaponRig)
local v_u_10 = require(v_u_3.Shared.Config.AttachmentConfig)
local v_u_11 = require(v_u_3.Shared.Combat.Ballistics)
local v_u_12 = require(script.Arms)
local v_u_13 = require(script.ScopeOverlay)
local v_u_14 = require(script.Pose)
local v_u_15 = require(script.Reticle)
local v_u_16 = {}
local v_u_17 = v_u_1.LocalPlayer
local v_u_18 = math.rad
local v_u_19 = Random.new()
local v_u_20 = {}
local function v_u_30(p21, p22, ...) -- name: call
	-- upvalues: (copy) v_u_20
	local v23 = v_u_20[p21]
	if not v23 then
		local v24 = script.Parent:FindFirstChild(p21)
		if v24 then
			local v25 = require
			local v26
			v26, v23 = pcall(v25, v24)
			if v26 and type(v23) == "table" then
				v_u_20[p21] = v23
			else
				v23 = nil
			end
		else
			v23 = nil
		end
	end
	if v23 then
		v23 = v23[p22]
	end
	if type(v23) == "function" then
		local v27, v28, v29 = pcall(v23, ...)
		if v27 then
			return v28, v29
		else
			return nil
		end
	else
		return nil
	end
end
local v_u_31 = "TPP"
local v_u_32 = {}
local v_u_33 = nil
local v_u_34 = {}
local v_u_35 = {}
local v_u_36 = nil
local v_u_37 = nil
local v_u_38 = nil
local v_u_39 = 0
local v_u_40 = false
local v_u_41 = false
local v_u_42 = nil
local v_u_43 = {
	["R"] = 0,
	["L"] = 0
}
local v_u_44 = nil
local v_u_45 = 0
local v_u_46 = 0
local v_u_47 = 0
local v_u_48 = 0
local v_u_49 = false
local v_u_50 = nil
local v_u_51 = -10
local v_u_52 = -10
local v_u_53 = -10
local v_u_54 = 0.5
local v_u_55 = -10
local v_u_56 = 0
local v_u_57 = 0
local v_u_58 = CFrame.identity
local v_u_59 = v4.new(Vector3.new(0, 0, 0), 10, 0.62)
local v_u_60 = v4.new(Vector3.new(0, 0, 0), 19, 0.5)
local v_u_61 = v4.new(Vector3.new(0, 0, 0), 19, 0.5)
local v_u_62 = v4.new(0, 9, 0.8)
local v_u_63 = v4.new(0, 13, 0.5)
local v_u_64 = v4.new(0, 9, 0.5)
local v_u_65 = v4.new(0, 16, 1)
local v_u_66 = v4.new(0, 6, 0.85)
local v_u_67 = v4.new(0, 11, 0.42)
local v_u_68 = v4.new(Vector3.new(0, 0, 0), 6.5, 0.6)
local v_u_69 = v4.new(Vector3.new(0, 0, 0), 46, 0.74)
local v_u_70 = v4.new(Vector3.new(0, 0, 0), 46, 0.74)
local v_u_71 = {
	["AR"] = {
		["w"] = 1.25,
		["snap"] = 0.85
	},
	["LMG"] = {
		["w"] = 1.4,
		["snap"] = 0.75
	},
	["DMR"] = {
		["w"] = 1.3,
		["snap"] = 0.85
	},
	["SR"] = {
		["w"] = 1.35,
		["snap"] = 0.75
	},
	["SG"] = {
		["w"] = 1.35,
		["snap"] = 0.85
	},
	["SMG"] = {
		["w"] = 0.85,
		["snap"] = 1.3
	},
	["Pistol"] = {
		["w"] = 1,
		["snap"] = 1.25
	},
	["Special"] = {
		["w"] = 1.2,
		["snap"] = 0.8
	}
}
local v_u_72 = v7.FPPMotion or {
	["BobY"] = 0.045,
	["BobRoll"] = 0.45,
	["BobPitch"] = 0.35,
	["StrafeRoll"] = 1.4,
	["LandPitch"] = 2.2,
	["LandY"] = 0.18,
	["Breath"] = 0.12,
	["ADSScale"] = 0.3
}
local v_u_73 = v7.WeaponSway or {}
local v_u_74 = RaycastParams.new()
v_u_74.FilterType = Enum.RaycastFilterType.Exclude
v_u_74.IgnoreWater = true
pcall(function()
	-- upvalues: (copy) v_u_74
	v_u_74.RespectCanCollide = true
end)
local v75 = CFrame.new(0, -10000, 0)
local function v_u_102(p76, p77) -- name: preciseMul
	local v78, v79, v80, v81, v82, v83, v84, v85, v86, v87, v88, v89 = p76:GetComponents()
	local v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101 = p77:GetComponents()
	return CFrame.new(v78 + (v81 * v90 + v82 * v91 + v83 * v92), v79 + (v84 * v90 + v85 * v91 + v86 * v92), v80 + (v87 * v90 + v88 * v91 + v89 * v92), v81 * v93 + v82 * v96 + v83 * v99, v81 * v94 + v82 * v97 + v83 * v100, v81 * v95 + v82 * v98 + v83 * v101, v84 * v93 + v85 * v96 + v86 * v99, v84 * v94 + v85 * v97 + v86 * v100, v84 * v95 + v85 * v98 + v86 * v101, v87 * v93 + v88 * v96 + v89 * v99, v87 * v94 + v88 * v97 + v89 * v100, v87 * v95 + v88 * v98 + v89 * v101)
end
local v_u_103 = {}
local v_u_104 = {}
local v_u_105 = Color3.fromRGB(218, 228, 255)
local v_u_106 = game:GetService("Lighting")
local function v_u_123(p107, p108, p109, p110) -- name: placeRoot
	-- upvalues: (copy) v_u_103, (copy) v_u_104, (copy) v_u_102
	p107.root.CFrame = p108
	local v111 = p107.optParts
	if v111 then
		local v112 = p107.optRel
		local v113 = p107.optMotor
		if v113 and v113.Transform ~= CFrame.identity then
			v112 = v113.C0 * v113.Transform * v113.C0:Inverse() * v112
		end
		local v114 = 0
		for _, v115 in v111 do
			local v116 = v115.part
			if not v116.Parent then
				continue
			end
			local v117 = v115.joint
			local v118
			if v117 then
				v118 = v112 * v117.C0 * v117.C1:Inverse() or v112
			else
				v118 = v112
			end
			v114 = v114 + 1
			v_u_103[v114] = v116
			local v119 = v_u_104
			local v120
			if p109 and p110 then
				v120 = v_u_102(p109, p110 * v118)
			else
				v120 = v_u_102(p108, v118)
			end
			v119[v114] = v120
		end
		for v121 = #v_u_103, v114 + 1, -1 do
			v_u_103[v121] = nil
			v_u_104[v121] = nil
		end
		if v114 > 0 then
			if v_u_103[1]:IsDescendantOf(workspace) then
				workspace:BulkMoveTo(v_u_103, v_u_104, Enum.BulkMoveMode.FireCFrameChanged)
				return
			end
			for v122 = 1, v114 do
				v_u_103[v122].CFrame = v_u_104[v122]
			end
		end
	end
end
local function v_u_127(p124) -- name: prepVisual
	for _, v125 in p124:GetDescendants() do
		if v125:IsA("BasePart") then
			v125.CastShadow = false
			v125.CanCollide = false
			v125.CanQuery = false
			v125.CanTouch = false
			if v125.Material ~= Enum.Material.Glass then
				continue
			end
			v125.Material = Enum.Material.SmoothPlastic
			local v126 = v125.Reflectance
			v125.Reflectance = math.max(v126, 0.25)
		else
			if not (v125:IsA("Sound") or (v125:IsA("Script") or v125:IsA("LocalScript"))) then
				continue
			end
			v125:Destroy()
		end
	end
end
local function v_u_133(p128) -- name: hardWelds
	for _, v129 in p128:GetDescendants() do
		if not v129:IsA("WeldConstraint") then
			continue
		end
		local v130 = v129.Part0
		local v131 = v129.Part1
		if v130 and v131 then
			local v132 = Instance.new("Weld")
			v132.Name = v129.Name
			v132.Part0 = v130
			v132.Part1 = v131
			v132.C0 = v130.CFrame:ToObjectSpace(v131.CFrame)
			v132.C1 = CFrame.identity
			v132.Parent = v129.Parent
		end
		v129:Destroy()
	end
end
local function v_u_152(p134, p135) -- name: layoutBDC
	-- upvalues: (copy) v_u_11, (copy) v_u_5
	local v136 = p134.bdc
	if v136 then
		v136.zero = p135
		local v137 = p134.stats
		local v138 = (-1 / 0)
		for _, v139 in v136.ticks do
			v139.fits = false
			local v140 = v139.weld
			local v141 = v_u_11.dropAngle
			local v142 = v137.v0 or 0
			local v143 = v137.drag or 0
			local v144 = v_u_5.m(v139.m)
			local v145 = v_u_5.m
			local v146, v147 = pcall(v141, v142, v143, v144, v145(p135))
			if not v140 or (not v146 or (type(v147) ~= "number" or (v147 ~= v147 or v147 <= 0))) then
				continue
			end
			local v148 = v136.eyeP.Z - v140.C0.Z
			local v149 = (v136.dLens + v148) * math.tan(v147)
			local v150 = v149 / p134.eyeR
			local v151
			if v150 > 0.08 then
				v151 = v150 < 0.92
			else
				v151 = false
			end
			if v151 and v139.label then
				if v150 >= 0.12 then
					v151 = v150 - v138 >= 0.075
				else
					v151 = false
				end
				if not v151 then
					v150 = v138
				end
			else
				v150 = v138
			end
			if v151 then
				v140.C0 = CFrame.new(v140.C0.X, v136.eyeP.Y - v149, v140.C0.Z) * v140.C0.Rotation
				v139.fits = true
				v138 = v150
			else
				v138 = v150
			end
		end
		p134.adsShowK = nil
	end
end
local function v_u_235(p153) -- name: opticGeometry
	-- upvalues: (copy) v_u_9, (copy) v_u_5, (copy) v_u_14, (copy) v_u_3, (copy) v_u_10, (copy) v_u_152
	local v154 = p153.stats
	local v155 = p153.info
	local v156 = p153.root
	local v157
	if v154.isGun == true then
		v157 = v154.optic ~= nil
	else
		v157 = false
	end
	p153.optic = v157
	if p153.optic then
		p153.opticId = v154.optic
		local v158 = v155.opticModel
		if v158 then
			v158 = v_u_9.rootOf(v155.opticModel)
		end
		p153.optRoot = nil
		p153.optRel = nil
		p153.optParts = nil
		p153.optMotor = nil
		if v158 and v158 ~= v156 then
			local v159 = {}
			local v160 = nil
			local v161 = p153.cfg
			if v161 then
				v161 = p153.cfg.OpticHost
			end
			local v162
			if type(v161) == "string" then
				v162 = v156:FindFirstChild(v161)
				if v162 and (v162:IsA("Motor6D") and v162.Part0 == v156) then
					if not v162.Part1 then
						v162 = v160
					end
				else
					v162 = v160
				end
			else
				v162 = v160
			end
			for _, v163 in p153.model:GetDescendants() do
				if not v163:IsA("JointInstance") then
					continue
				end
				if v163.Part0 == v156 and v163.Part1 == v158 or v163.Part0 == v158 and v163.Part1 == v156 then
					local v164 = v163.C0 * v163.C1:Inverse()
					if v163.Part0 == v158 then
						v164 = v164:Inverse()
					end
					p153.optRoot = v158
					p153.optRel = v164
				elseif v162 and (v163.Part0 == v162.Part1 and v163.Part1 == v158) then
					p153.optRoot = v158
					p153.optMotor = v162
					p153.optRel = v162.C0 * v162.C1:Inverse() * (v163.C0 * v163.C1:Inverse())
				else
					if v163.Part0 ~= v158 or not v163.Part1 then
						continue
					end
					v159[v163.Part1] = v163
				end
			end
			if p153.optRoot then
				v158.Anchored = true
				local v165 = {
					{
						["part"] = v158
					}
				}
				for v166, v167 in v159 do
					if not (v166:IsA("BasePart") and v166:IsDescendantOf(v155.opticModel)) then
						continue
					end
					v166.Anchored = true
					table.insert(v165, {
						["part"] = v166,
						["joint"] = v167
					})
				end
				p153.optParts = v165
			end
		end
		local v168 = v158 or (v155.builtInScope and v156 and v156 or nil)
		local v169
		if v168 then
			v169 = v168:FindFirstChild("Eyepiece")
		else
			v169 = v168
		end
		if v168 then
			v168 = v168:FindFirstChild("EyepieceEdge")
		end
		p153.eyeRel = nil
		if v169 and (v168 and (v169:IsA("Attachment") and v168:IsA("Attachment"))) then
			p153.eyeAtt = v169
			p153.edgeAtt = v168
			p153.eyeR = (v168.WorldPosition - v169.WorldPosition).Magnitude
			p153.eyeRel = v156.CFrame:PointToObjectSpace(v169.WorldPosition)
			p153.relief = -p153.aimRel:PointToObjectSpace(p153.eyeRel).Z
		elseif v155.builtInOptic then
			p153.eyeR = nil
		else
			p153.eyeR = (p153.scope and 0.0105 or 0.012) * v_u_5.WeaponStudsPerMeter * v_u_14.SCALE
			p153.relief = p153.scope and 0.3 or 0.05
		end
		if not p153.eyeRel then
			p153.eyeRel = (p153.aimRel * CFrame.new(0, 0, -(p153.relief or 0.3))).Position
		end
		local v170 = v155.opticModel
		if not v170 then
			if v155.builtInScope then
				v170 = p153.model or nil
			else
				v170 = nil
			end
		end
		p153.windowAspect = v170 and (v170:GetAttribute("WindowAspect") or 1) or 1
		local v171
		if v170 then
			v171 = v170:GetAttribute("WindowCorner") or nil
		else
			v171 = nil
		end
		p153.windowCorner = v171
		p153.adsSwap = {}
		p153.adsHide = {}
		p153.adsOn = nil
		p153.adsIron = {}
		if v155.opticModel then
			local v172 = {}
			local v173
			if p153.scope then
				v173 = nil
			else
				v173 = p153.model:GetAttribute("OpticADSHide") or nil
			end
			if type(v173) ~= "string" and not p153.scope then
				local v174 = v_u_3:FindFirstChild("Assets")
				if v174 then
					v174 = v174:FindFirstChild("Weapons")
				end
				v173 = v174 and v155.id
				if v173 then
					v173 = v174:FindFirstChild(v155.id)
				end
				if v173 then
					v173 = v173:GetAttribute("OpticADSHide")
				end
			end
			if type(v173) == "string" then
				for v175 in v173:gmatch("[^,%s]+") do
					v172[v175] = true
				end
			end
			for _, v176 in p153.model:GetDescendants() do
				if not v176:IsA("BasePart") or v176.Name ~= "IronFront" and (v176.Name ~= "IronRear" and not v172[v176.Name]) or (v176:IsDescendantOf(v155.opticModel) or v176:GetAttribute("SkinPiece")) then
					continue
				end
				local v177 = p153.adsIron
				table.insert(v177, v176)
			end
		end
		local v178 = {
			["Body"] = true,
			["Receiver"] = true,
			["Upper"] = true,
			["Lower"] = true,
			["Chassis"] = true,
			["Furniture"] = true,
			["Stock"] = true,
			["Handguard"] = true,
			["Grip"] = true,
			["Grips"] = true,
			["Frame"] = true,
			["Wood"] = true,
			["Shell"] = true,
			["Main"] = true,
			["MagazineBase"] = true
		}
		p153.adsCut = nil
		if p153.scope and (p153.eyeAtt and (p153.eyeR and v155.aimPoint)) then
			local v179 = {}
			for _, v180 in p153.adsIron do
				v179[v180] = true
			end
			local v181 = {}
			for v182 in v155.motorsC0 or {} do
				if not v182.Part1 then
					continue
				end
				v181[v182.Part1] = true
			end
			local v183 = v_u_10.eyeDist(p153.opticId, p153.eyeR, v_u_10.widestHfov(p153.opticId))
			local v184 = p153.aimRel
			local v185 = (v184 * CFrame.new(0, 0, v183 - (p153.relief or 0))).Position
			local v186 = v184.LookVector
			local v187 = p153.eyeR / math.max(v183, 0.001) * 1.04
			local v188 = v183 + 0.002
			local v189 = v188
			local v190 = {}
			for _, v191 in p153.model:GetDescendants() do
				if not v191:IsA("BasePart") or (v191 == v156 or (v191.Transparency >= 1 or (v179[v191] or v155.opticModel and v191:IsDescendantOf(v155.opticModel)))) or v155.builtInScope and (v191.Name == "Scope" or v191:GetAttribute("ADSOf") ~= nil) then
					continue
				end
				local v192 = v156.CFrame:ToObjectSpace(v191.CFrame)
				local v193 = v191.Size / 2
				local v194 = 0
				local v195 = false
				local v196 = true
				for v197 = -2, 2 do
					for v198 = -2, 2 do
						for v199 = -2, 2 do
							local v200 = v197 * v193.X / 2
							local v201 = v198 * v193.Y / 2
							local v202 = v199 * v193.Z / 2
							local v203 = v192 * Vector3.new(v200, v201, v202) - v185
							local v204 = v203:Dot(v186)
							v194 = math.max(v194, v204)
							if v204 <= v188 then
								v196 = false
							end
							if v204 <= 0.04 or (v203 - v186 * v204).Magnitude > v187 * v204 then
								continue
							end
							v195 = true
						end
					end
				end
				if not v195 then
					break
				end
				if v196 and not v178[v191.Name] or (v181[v191] or not (v191:IsA("PartOperation") or v191:IsA("Part"))) then
					local v205 = p153.adsIron
					table.insert(v205, v191)
				else
					table.insert(v190, v191)
					v189 = math.max(v189, v194)
				end
			end
			if #v190 > 0 then
				p153.adsCut = {
					["parts"] = nil,
					["eye"] = nil,
					["axis"] = nil,
					["tanA"] = nil,
					["near"] = 0.04,
					["plane"] = nil,
					["far"] = nil,
					["parts"] = v190,
					["eye"] = v185,
					["axis"] = v186,
					["tanA"] = v187,
					["plane"] = v188,
					["far"] = v189 + 0.05
				}
			end
		end
		if v170 then
			local v206 = {}
			for _, v207 in v170:GetDescendants() do
				if not v207:IsA("BasePart") or v206[v207.Name] then
					continue
				end
				v206[v207.Name] = v207
			end
			p153.adsClear = {}
			p153.adsClearOn = false
			p153.adsTint = {}
			p153.adsTintK = nil
			for _, v208 in v170:GetDescendants() do
				if not v208:IsA("SurfaceAppearance") or (not v208.Parent or v208.Parent.Name == "Lens") then
					continue
				end
				local v209 = v208:GetAttribute("HipTint")
				if typeof(v209) ~= "Color3" then
					v209 = v208.Color
					v208:SetAttribute("HipTint", v209)
				end
				local v210 = p153.adsTint
				table.insert(v210, { v208, v209 })
			end
			for _, v211 in v170:GetDescendants() do
				if not v211:IsA("BasePart") then
					continue
				end
				local v212 = v211:GetAttribute("ADSOf")
				if type(v212) == "string" and (v206[v212] and (p153.scope and (v212 == "Body" and v170:GetAttribute("MeshReticle") ~= true))) then
					v211.Transparency = 1
					local v213 = p153.adsIron
					local v214 = v206[v212]
					table.insert(v213, v214)
				elseif type(v212) == "string" and v206[v212] then
					v211.Transparency = 1
					local v215 = p153.adsSwap
					local v216 = {
						["ads"] = nil,
						["base"] = nil,
						["opaque"] = true,
						["ads"] = v211,
						["base"] = v206[v212]
					}
					table.insert(v215, v216)
				else
					if v211:GetAttribute("ADSHide") ~= true and (v211.Name ~= "Lens" or v211.Transparency >= 1) then
						continue
					end
					local v217 = p153.adsHide
					table.insert(v217, v211)
				end
			end
			local v218 = {}
			for _, v219 in p153.adsHide do
				v218[v219] = true
			end
			for _, v220 in p153.adsSwap do
				v218[v220.base] = true
			end
			for _, v221 in p153.adsIron do
				if not v221:IsDescendantOf(v170) then
					continue
				end
				v218[v221] = true
			end
			for v222 in v218 do
				if not v222:IsA("BasePart") or v222.Transparency >= 0.011 then
					continue
				end
				local v223 = p153.adsClear
				table.insert(v223, v222)
			end
		end
		p153.meshReticle = nil
		p153.adsShow = nil
		p153.adsShowK = nil
		p153.bdc = nil
		if v170 and (p153.scope or p153.reflex) and (v170:GetAttribute("MeshReticle") == true and (p153.eyeAtt and p153.eyeR)) then
			p153.meshReticle = true
			local v224 = {}
			local v225 = {}
			for _, v226 in v170:GetDescendants() do
				if not v226:IsA("BasePart") or v226.Name ~= "ReticleGlass" and (v226:GetAttribute("ReticlePiece") ~= true and v226:GetAttribute("BDC") == nil) then
					continue
				end
				local v227 = v226:GetAttribute("BDC")
				local v228 = type(v227) == "number" and ({
					["part"] = nil,
					["m"] = nil,
					["label"] = nil,
					["fits"] = false,
					["part"] = v226,
					["m"] = v227,
					["label"] = v226:GetAttribute("BDCLabel") == true
				} or nil) or nil
				for _, v229 in v226:GetChildren() do
					if v229:IsA("Decal") then
						v229.Transparency = 1
						table.insert(v224, {
							["inst"] = v229,
							["tick"] = v228
						})
					else
						if not v229:IsA("SurfaceGui") then
							continue
						end
						v229.Enabled = false
						table.insert(v224, {
							["inst"] = v229,
							["tick"] = v228
						})
					end
				end
				if not v228 then
					break
				end
				table.insert(v225, v228)
			end
			p153.adsShow = v224
			if #v225 > 0 then
				table.sort(v225, function(p230, p231)
					return p230.m < p231.m
				end)
				local v232 = {}
				for _, v233 in v170:GetDescendants() do
					if not (v233:IsA("Weld") and v233.Part1) then
						continue
					end
					v232[v233.Part1] = v233
				end
				for _, v234 in v225 do
					v234.weld = v232[v234.part]
				end
				p153.bdc = {
					["ticks"] = v225,
					["eyeP"] = p153.eyeAtt.Position,
					["dLens"] = v_u_10.eyeDist(p153.opticId, p153.eyeR, v_u_10.widestHfov(p153.opticId))
				}
				v_u_152(p153, 100)
			end
		end
	end
end
local v_u_236 = game:GetService("GeometryService")
local function v_u_265(p237) -- name: weaponTwins
	-- upvalues: (copy) v_u_236
	local v238 = p237.adsCut
	if not v238 or p237.twinsDone then
		return
	end
	p237.twinsDone = true
	local v239 = p237.root
	local v240 = Instance.new("Folder")
	v240.Name = "_VMCut"
	v240.Parent = workspace.CurrentCamera
	local v241 = v238.near
	local v242 = v238.plane or v238.near
	local v_u_243 = {}
	for _ = 1, 64 do
		if v238.far <= v241 then
			break
		end
		local v244
		if v241 < v242 then
			local v245 = v241 * 1.15 + 0.01
			v244 = math.min(v242, v245)
		else
			local v246 = v238.far
			local v247 = v241 * 1.06 + 0.01
			v244 = math.min(v246, v247)
		end
		local v248 = v238.tanA * v244 * 1.01 + 0.0015
		local v249 = Instance.new("Part")
		v249.Shape = Enum.PartType.Cylinder
		local v250 = v244 - v241 + 0.004
		local v251 = 2 * v248
		local v252 = 2 * v248
		v249.Size = Vector3.new(v250, v251, v252)
		local v253 = v238.eye + v238.axis * ((v241 + v244) / 2)
		v249.CFrame = CFrame.lookAlong(v253, v238.axis) * CFrame.Angles(0, 1.5707963267948966, 0)
		v249.Anchored = true
		v249.CanCollide = false
		v249.CanQuery = false
		v249.CanTouch = false
		v249.CastShadow = false
		v249.Transparency = 1
		v249.Parent = v240
		table.insert(v_u_243, v249)
		v241 = v244
	end
	for _, v254 in v238.parts do
		if not (v254.Parent and v239.Parent) then
			break
		end
		local v255 = v239.CFrame:ToObjectSpace(v254.CFrame)
		local v_u_256 = v254:Clone()
		for _, v257 in v_u_256:GetChildren() do
			v257:Destroy()
		end
		v_u_256.CFrame = v255
		v_u_256.Anchored = true
		v_u_256.CanCollide = false
		v_u_256.CanQuery = false
		v_u_256.CanTouch = false
		v_u_256.CastShadow = false
		v_u_256.Transparency = 1
		v_u_256.Parent = v240
		local function v258()
			-- upvalues: (ref) v_u_236, (copy) v_u_256, (copy) v_u_243
			return v_u_236:SubtractAsync(v_u_256, v_u_243, {
				["CollisionFidelity"] = nil,
				["RenderFidelity"] = nil,
				["SplitApart"] = false,
				["CollisionFidelity"] = Enum.CollisionFidelity.Box,
				["RenderFidelity"] = Enum.RenderFidelity.Automatic
			})
		end
		local v259, v260 = pcall(v258)
		v_u_256:Destroy()
		local v_u_261
		if v259 and type(v260) == "table" then
			v_u_261 = v260[1] or nil
		else
			v_u_261 = nil
		end
		if v_u_261 and (v_u_261:IsA("BasePart") and (v254.Parent and v239.Parent)) then
			local v262 = v_u_261.CFrame
			v_u_261.Name = v254.Name .. "ADS"
			v_u_261.Material = v254.Material
			v_u_261.Color = v254.Color
			pcall(function()
				-- upvalues: (copy) v_u_261
				v_u_261.UsePartColor = true
			end)
			v_u_261.Anchored = false
			v_u_261.CanCollide = false
			v_u_261.CanQuery = false
			v_u_261.CanTouch = false
			v_u_261.CastShadow = false
			v_u_261.Massless = true
			v_u_261.Transparency = p237.adsOn and 0.011 or 1
			v_u_261.CFrame = v239.CFrame * v262
			local v263 = Instance.new("Weld")
			v263.Part0 = v239
			v263.Part1 = v_u_261
			v263.C0 = v262
			v263.Parent = v_u_261
			v_u_261.Parent = v254.Parent
			local v264 = p237.adsSwap
			table.insert(v264, {
				["ads"] = v_u_261,
				["base"] = v254
			})
			if not p237.adsOn then
				break
			end
			v254.LocalTransparencyModifier = 1
		else
			if not v_u_261 then
				break
			end
			v_u_261:Destroy()
		end
	end
	v240:Destroy()
end
local function v_u_287(p266, p267) -- name: setAdsLook
	-- upvalues: (copy) v_u_106, (copy) v_u_105
	if p266.adsSwap then
		local v268 = p267 >= 0.3
		if p266.adsClear and v268 ~= p266.adsClearOn then
			p266.adsClearOn = v268
			for _, v269 in p266.adsClear do
				if v269.Transparency >= 0.5 then
					continue
				end
				v269.Transparency = v268 and 0.011 or 0
			end
		end
		if p266.adsTint then
			local v270
			if p266.adsClearOn then
				local v271 = v_u_106:GetSunDirection()
				local v272 = -v271:Dot(workspace.CurrentCamera.CFrame.LookVector) * 1.8
				local v273 = math.clamp(v272, 0, 1)
				local v274 = v271.Y * 4
				local v275 = v273 * math.clamp(v274, 0, 1) * 20 + 0.5
				v270 = math.floor(v275) / 20
			else
				v270 = -1
			end
			if v270 ~= p266.adsTintK then
				p266.adsTintK = v270
				for _, v276 in p266.adsTint do
					v276[1].Color = v270 >= 0 and v_u_105:Lerp(v276[2], v270) or v276[2]
				end
			end
		end
		local v277 = (p267 - 0.5) / 0.3
		local v278 = math.clamp(v277, 0, 1)
		if v278 ~= p266.adsHideK then
			p266.adsHideK = v278
			for _, v279 in p266.adsHide do
				v279.LocalTransparencyModifier = v278
			end
		end
		if p266.adsShow and v278 ~= p266.adsShowK then
			p266.adsShowK = v278
			for _, v280 in p266.adsShow do
				local v281
				if v278 > 0 then
					v281 = v280.tick == nil and true or v280.tick.fits
				else
					v281 = false
				end
				local v282 = v280.inst
				if v282:IsA("Decal") then
					v282.Transparency = v281 and (1 - v278 or 1) or 1
				else
					v282.Enabled = v281
					if not v281 then
						continue
					end
					for _, v283 in v282:GetChildren() do
						if not v283:IsA("ImageLabel") then
							continue
						end
						v283.ImageTransparency = 1 - v278
					end
				end
			end
		end
		local v284 = p267 >= 0.8
		if v284 ~= p266.adsOn then
			p266.adsOn = v284
			for _, v285 in p266.adsSwap do
				v285.ads.Transparency = v284 and (v285.opaque and 0 or 0.011) or 1
				v285.base.LocalTransparencyModifier = v284 and 1 or 0
			end
			for _, v286 in p266.adsIron do
				v286.LocalTransparencyModifier = v284 and 1 or 0
			end
		end
	end
end
local function v_u_309(p288, p289, p290, p291, p292, p293, p294, p295, p296, p297, p298) -- name: opticHold
	-- upvalues: (copy) v_u_18
	local v299 = p288.scope and 0.08 or 0.2
	local v300 = p288.scope and 0.3 or 0.6
	local v301 = CFrame.Angles(v_u_18(p293.X * v299), v_u_18(p293.Y * v299 + p295 * v300), (v_u_18(p293.Z * v299 + p296 * v300)))
	local v302 = CFrame.new
	local v303 = p294.X
	local v304 = math.clamp(v303, -0.12, 0.12) * v299 + p297 * v300
	local v305 = p298 * v300
	local v306 = p294.Z
	local v307 = v302(v304, v305, (math.clamp(v306, -0.06, 0.5)))
	local v308 = CFrame.new(p292.Position)
	if p289 >= 1 then
		return v301, v307, v308
	else
		return p290:Lerp(v301, p289), p291:Lerp(v307, p289), CFrame.identity:Lerp(v308, p289)
	end
end
local function v_u_338(p310, p311) -- name: buildWeapon
	-- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_17, (copy) v_u_133, (copy) v_u_14, (copy) v_u_127, (copy) v_u_6, (copy) v_u_235
	local v312 = v_u_8.get
	local v313
	if p311 then
		v313 = p311.attachments
	else
		v313 = p311
	end
	local v314 = v312(p310, v313)
	if not v314 then
		return nil
	end
	local v315 = v_u_9.build
	local v316
	if p311 then
		v316 = p311.attachments
	else
		v316 = p311
	end
	local v317 = {
		["castShadow"] = false,
		["skin"] = nil,
		["player"] = nil
	}
	local v318
	if p311 then
		v318 = p311.skin
	else
		v318 = p311
	end
	v317.skin = v318
	v317.player = v_u_17
	local v319, v_u_320, v321 = pcall(v315, p310, v316, v317)
	if not (v319 and v_u_320) then
		warn("[ViewmodelController] build " .. tostring(p310) .. ": " .. tostring(v_u_320))
		return nil
	end
	local v322 = v321.root
	v322.Anchored = true
	v_u_133(v_u_320)
	local function v323()
		-- upvalues: (copy) v_u_320, (ref) v_u_14
		v_u_320:ScaleTo(v_u_14.SCALE)
	end
	pcall(v323)
	v_u_127(v_u_320)
	local v324 = {}
	for _, v325 in v_u_320:GetDescendants() do
		if not (v325:GetAttribute("SkinFX") and (v325:IsA("ParticleEmitter") or (v325:IsA("Beam") or (v325:IsA("Trail") or v325:IsA("Light"))))) or v325:GetAttribute("RigOff") then
			continue
		end
		table.insert(v324, v325)
	end
	local v326 = v_u_14.holdKind(v314)
	local v327 = {
		["id"] = p310
	}
	if p311 then
		p311 = p311.uid
	end
	v327.uid = p311
	v327.stats = v314
	v327.kind = v326
	v327.model = v_u_320
	v327.info = v321
	v327.root = v322
	v327.cfg = v_u_6.Weapons[p310]
	local v328 = v321.aimPoint
	local v329
	if v328 then
		if v328:IsA("Attachment") then
			v329 = v322.CFrame:ToObjectSpace(v328.WorldCFrame)
		elseif v328:IsA("BasePart") then
			v329 = v322.CFrame:ToObjectSpace(v328.CFrame)
		else
			v329 = nil
		end
	else
		v329 = nil
	end
	v327.aimRel = v329 or CFrame.new(0, 0.25, 0.25)
	v327.eye = v_u_14.eyeDist(v314, v327.aimRel)
	v327.hip = v_u_14.hip(v326, v327.cfg, p310)
	v327.hands = v_u_14.hands(v326)
	v327.tune = v_u_14.TUNE and v_u_14.TUNE[p310] or nil
	v327.adsRoot = v_u_14.adsRoot(v327.aimRel, v327.eye)
	v327.magInsert = v_u_320:GetAttribute("MagInsert") or "Straight"
	local v330
	if v321.mag then
		local v331 = v321.mag.Size.Y
		local v332 = v321.mag.Size.Z
		v330 = math.max(v331, v332) * 1.25 or 0.8
	else
		v330 = 0.8
	end
	v327.magDrop = v330
	v327.boltAction = v314.boltAction == true
	local v333 = v_u_320:GetAttribute("BoltTravel")
	v327.boltTravel = type(v333) == "number" and (v333 * v_u_14.SCALE or 0.32) or 0.32
	v327.slideTravel = v321.slide and v321.slide.Part1 and (v321.slide.Part1.Size.Z * 0.32 or 0.16) or 0.16
	v327.pumpTravel = 0.36
	local v334 = v321.muzzle
	local v335
	if v334 then
		if v334:IsA("Attachment") then
			v335 = v322.CFrame:ToObjectSpace(v334.WorldCFrame)
		elseif v334:IsA("BasePart") then
			v335 = v322.CFrame:ToObjectSpace(v334.CFrame)
		else
			v335 = nil
		end
	else
		v335 = nil
	end
	v327.muzzleRel = v335
	v327.scope = v314.scopeMask == true
	local v336 = not v327.scope
	if v336 then
		if v314.optic == nil then
			v336 = false
		else
			v336 = not v321.builtInOptic
		end
	end
	v327.reflex = v336
	v327.reticleStyle = v314.reticle
	local v337 = v314.opticCfg
	if v337 then
		v337 = v314.opticCfg.ReticleColor
	end
	v327.reticleColor = v337
	v_u_235(v327)
	v327.dirty = {}
	v327.skinFx = #v324 > 0 and v324 and v324 or nil
	return v327
end
local function v_u_353(p339, p340, p341) -- name: getVm
	-- upvalues: (copy) v_u_9, (copy) v_u_17, (copy) v_u_34, (copy) v_u_338, (copy) v_u_265, (copy) v_u_35, (ref) v_u_33
	if p341 and p341.id ~= p340 then
		p341 = nil
	end
	local v342
	if p341 then
		local v343 = v_u_9.signature(p341)
		local v344 = v_u_17
		local v345 = p341.id
		local v346 = v344:GetAttribute("Skin_" .. tostring(v345)) or ""
		v342 = v343 .. "|" .. tostring(v346)
	else
		v342 = tostring(p339) .. "|" .. p340
	end
	local v347 = v_u_34[v342]
	if v347 and v347.model then
		return v347
	end
	local v348 = v_u_338(p340, p341)
	if not v348 then
		return nil
	end
	if v348.adsCut then
		task.spawn(v_u_265, v348)
	end
	v348.sig = v342
	v_u_34[v342] = v348
	local v349 = v_u_35
	table.insert(v349, v342)
	while #v_u_35 > 4 do
		local v350 = table.remove(v_u_35, 1)
		local v351 = v_u_34[v350]
		if not v351 or v351 == v_u_33 then
			if not v351 then
				continue
			end
			local v352 = v_u_35
			table.insert(v352, v350)
			return v348
		end
		v351.model:Destroy()
		v_u_34[v350] = nil
	end
	return v348
end
local v_u_354 = require(script.Actions)
local v_u_355 = require(game:GetService("ReplicatedStorage").Shared.Config.AudioConfig)
local v_u_356 = require(script.Props)
local v_u_357 = require(script.Consume)
local v_u_358 = require(script.Clips)
local function v_u_362(p359) -- name: motorsByName
	if p359.motorByName then
		return p359.motorByName
	end
	local v360 = {}
	for _, v361 in p359.model:GetDescendants() do
		if not (v361:IsA("Motor6D") and v361.Part1) then
			continue
		end
		v360[v361.Part1.Name] = v361
	end
	p359.motorByName = v360
	return v360
end
local function v_u_372(p363, p364, p365) -- name: clipOut
	-- upvalues: (copy) v_u_358, (copy) v_u_362
	local v366 = v_u_358.sample(p364, p365)
	local v367 = v_u_358.rel(p364, v366)
	local v368 = {
		["gun"] = nil,
		["motors"] = nil,
		["left"] = "grip",
		["leftK"] = 0,
		["right"] = "grip",
		["rightK"] = 0,
		["props"] = nil,
		["hide"] = nil,
		["clipArms"] = nil,
		["gun"] = v367.gunDelta,
		["motors"] = {},
		["props"] = {},
		["hide"] = {},
		["clipArms"] = {
			["r"] = v367.r,
			["l"] = v367.l
		}
	}
	for v369, v370 in v_u_362(p363) do
		local v371 = v366[v369]
		if not v371 then
			continue
		end
		v368.motors[v370] = v371
	end
	return v368
end
local function v_u_378(p373) -- name: idleClips
	-- upvalues: (copy) v_u_358
	if p373.idleClips then
		return p373.idleClips
	end
	local v374 = {}
	for v375, v376 in {
		["hold"] = "Hold",
		["ads"] = "ADS",
		["sprint"] = "Sprint"
	} do
		local v377 = v_u_358.get(p373.id, v376)
		if not v377 then
			continue
		end
		v374[v375] = v_u_358.rel(v377, v_u_358.sample(v377, 0))
	end
	v374.any = (v374.hold ~= nil or v374.ads ~= nil) and true or v374.sprint ~= nil
	p373.idleClips = v374
	return v374
end
local function v_u_393(p379, p380) -- name: markerLists
	if not p379 or #p379.markers == 0 then
		return nil, nil
	end
	local v381 = p379.len
	local v382 = p380 / math.max(v381, 0.001)
	local v383 = {}
	local v384 = {}
	for _, v385 in p379.markers do
		local v386 = v385.t * v382
		if v385.name == "Sound" then
			local v387, v388 = string.match(v385.value or "", "^([^;]+);?([%d%.]*)")
			if not v387 then
				continue
			end
			local v389 = {
				["t"] = v386,
				["key"] = v387,
				["vol"] = tonumber(v388) or 0.7
			}
			table.insert(v384, v389)
		else
			local v390 = {
				["t"] = v386,
				["name"] = v385.name
			}
			for v391, v392 in string.gmatch(v385.value or "", "(%w+)=([%w%.]+)") do
				if v391 == "n" then
					v390.n = tonumber(v392)
				elseif v391 == "gate" or v391 == "up" then
					v390[v391] = v392 == "1"
				else
					v390[v391] = v392
				end
			end
			table.insert(v383, v390)
		end
	end
	return v383, v384
end
local function v_u_399(p394, p395) -- name: shellClips
	-- upvalues: (copy) v_u_358
	local v396 = p395 and v_u_358.get(p394, "ReloadStartEmpty") or v_u_358.get(p394, "ReloadStart")
	local v397 = v_u_358.get(p394, "ReloadShell")
	local v398 = p395 and v_u_358.get(p394, "ReloadEndEmpty") or v_u_358.get(p394, "ReloadEnd")
	return v396 and (v397 and v398) and {
		["s"] = v396,
		["k"] = v397,
		["e"] = v398
	} or nil
end
local function v_u_418(p400, p401) -- name: shellClipAt
	local v402 = p400.plan
	local v403 = p400.shellClips
	local v404 = v402.sh
	local v405 = v404.Start + v404.First
	local v406 = v402.dur - v404.End
	if p401 < v405 then
		local v407 = v403.s
		local v408 = p401 / math.max(v405, 0.05)
		return v407, math.clamp(v408, 0, 1) * v403.s.len
	end
	if p401 >= v406 then
		local v409 = v403.e
		local v410 = p401 - v406
		local v411 = v404.End
		local v412 = v410 / math.max(v411, 0.05)
		return v409, math.clamp(v412, 0, 1) * v403.e.len
	end
	local v413 = p401 - v405
	local v414 = v404.Each
	local v415 = math.max(v414, 0.05)
	local v416 = v403.k
	local v417 = v413 / v415
	return v416, (v413 - math.floor(v417) * v415) / v415 * v403.k.len
end
local function v_u_428(p419) -- name: buildItem
	-- upvalues: (copy) v_u_3, (copy) v_u_127, (copy) v_u_133, (copy) v_u_357
	local v420 = v_u_3:FindFirstChild("Assets")
	if v420 then
		v420 = v420:FindFirstChild("Items")
	end
	if v420 then
		v420 = v420:FindFirstChild(p419)
	end
	if not (v420 and v420:IsA("Model")) then
		return nil
	end
	local v_u_421 = v420:Clone()
	local v422 = v_u_421.PrimaryPart or v_u_421:FindFirstChild("Root")
	if not v422 then
		v_u_421:Destroy()
		return nil
	end
	for _, v423 in v_u_421:GetDescendants() do
		if not v423:IsA("BasePart") then
			continue
		end
		v423.Anchored = v423 == v422
	end
	v_u_127(v_u_421)
	v_u_133(v_u_421)
	local v_u_424 = v_u_357.SCALE[p419] or 0.75
	pcall(function()
		-- upvalues: (copy) v_u_421, (copy) v_u_424
		v_u_421:ScaleTo(v_u_424)
	end)
	local v425 = v_u_421:GetBoundingBox()
	local v426 = {
		["id"] = p419,
		["model"] = v_u_421,
		["root"] = v422,
		["center"] = v422.CFrame:ToObjectSpace(v425)
	}
	local v427 = v_u_357.prepare
	pcall(v427, v426)
	return v426
end
local function v_u_443(p429, p430, p431, p432, p433, p434) -- name: grasp
	-- upvalues: (copy) v_u_12
	local v435 = p429 - p431
	local v436 = v435.Magnitude > 0.001 and v435.Unit or Vector3.new(0, 0, -1)
	local v437 = p430 - v436 * p430:Dot(v436)
	if v437.Magnitude < 0.001 then
		v437 = p430
	end
	local v438 = v437.Unit
	local v439
	if p433 and p434 then
		local v440 = v436:Dot(p433)
		local v441 = p434 / math.max(v440, 0.3)
		v439 = math.clamp(v441, 0.05, 0.19)
	else
		v439 = 0.19
	end
	local v442 = (1 - v_u_12.HAND_C) * v_u_12.HAND_LEN
	if p432 < 0 then
		p432 = p432 * (v_u_12.HALF / 0.12)
	end
	return v_u_12.hand(p429 + v438 * (v_u_12.HALF + p432) + v436 * (v439 - v442), -v438, v436)
end
local v_u_444 = nil
local v_u_445 = nil
v_u_16.ARM_LEN = 2.1
local function v_u_470(p446, p447, p448) -- name: defaultGripL
	-- upvalues: (copy) v_u_14, (ref) v_u_444, (copy) v_u_443, (ref) v_u_445
	local v449 = p446.info
	local v450 = v449.gripAtt or v449.gripL
	if not v450 then
		return nil
	end
	local v451 = p446.root
	local v452 = v451.CFrame.Rotation
	local v453 = v450.WorldPosition
	if p447 == "pump" and (p448 and p448.pumpOffset) then
		local v454 = p448.pumpOffset
		v453 = v453 + v452 * Vector3.new(0, 0, v454)
	end
	local v455 = p446.hands or v_u_14.hands(p446.kind)
	local v456 = v_u_14.grasp(p446.kind)
	local v457 = v_u_444 or v453 + v452 * Vector3.new(-0.6, -1.3, 0.9)
	if v449.gripAtt then
		local v458 = v449.attachments
		if v458 then
			v458 = v449.attachments.Grip
		end
		if v458 then
			v458 = v458:GetAttribute("AttachmentId")
		end
		local v459 = type(v458) == "string" and v_u_14.GRASP_GRIP[v458] or v_u_14.GRASP_GRIP.VerticalGrip
		local v460 = v453 + v452 * v459.p
		local v461 = v_u_443
		local v462 = v452 * v459.side
		if v_u_445 then
			v457 = v460 - v_u_445 * 2.1 or v457
		end
		return v461(v460, v462, v457, v459.gap)
	end
	local v463 = p446.tune
	if v463 then
		local v464 = v463.left
		if typeof(v464) == "Vector3" then
			v453 = v453 + v452 * (v463.left * (v_u_14.SCALE / (v_u_14.REF_SCALE or v_u_14.SCALE)))
		end
	end
	if not (v456 and v456.lSide) then
		return CFrame.new(v453) * v452 * v455.l
	end
	local v465 = v453 + v452 * v456.lP
	if not v463 then
		v467 = v456.lSide
		v468 = v_u_443
		v469 = v452 * v467
		if v_u_445 then
			v457 = v465 - v_u_445 * 2.1 or v457
		end
		return v468(v465, v469, v457, v456.lGap, v451.CFrame.UpVector, v456.lReach)
	end
	local v466 = v463.lSide
	local v467 = typeof(v466) == "Vector3" and v463.lSide
	if v467 then
		v468 = v_u_443
		v469 = v452 * v467
		if v_u_445 then
			v457 = v465 - v_u_445 * 2.1 or v457
		end
		return v468(v465, v469, v457, v456.lGap, v451.CFrame.UpVector, v456.lReach)
	end
	v467 = v456.lSide
	local v468 = v_u_443
	local v469 = v452 * v467
	if v_u_445 then
		v457 = v465 - v_u_445 * 2.1 or v457
	end
	return v468(v465, v469, v457, v456.lGap, v451.CFrame.UpVector, v456.lReach)
end
local function v_u_482(p471, p472, p473) -- name: graspR
	-- upvalues: (copy) v_u_14, (copy) v_u_443
	local v474 = p471.root.CFrame
	local v475 = v_u_14.grasp(p471.kind)
	local v476 = p471.tune
	if not (v475 and v475.rSide) then
		local v477 = v474 * (p471.hands or v_u_14.hands(p471.kind)).r
		if v476 then
			local v478 = v476.right
			if typeof(v478) == "Vector3" then
				v477 = v477 * CFrame.new(v476.right)
			end
		end
		return v477
	end
	local v479 = v475.rP
	if v476 then
		local v480 = v476.right
		if typeof(v480) == "Vector3" then
			v479 = v479 + v476.right * (v_u_14.SCALE / (v_u_14.REF_SCALE or v_u_14.SCALE))
		end
	end
	local v481 = v474 * v479
	if p473 then
		p472 = v481 - p473 * 2.1
	end
	return v_u_443(v481, v474:VectorToWorldSpace(v475.rSide), p472, v475.rGap, v474.UpVector, v475.rReach)
end
local function v_u_493(p483, p484, p485) -- name: armElbows
	-- upvalues: (copy) v_u_14, (ref) v_u_445, (ref) v_u_444, (copy) v_u_482, (copy) v_u_470
	local v486 = p483.hands or v_u_14.hands(p483.kind)
	local v487 = v486.elbowR:Lerp(v486.adsElbowR or v486.elbowR, p485)
	local v488 = v486.elbowL:Lerp(v486.adsElbowL or v486.elbowL, p485)
	local v489
	if v486.dirR then
		v489 = p484:VectorToWorldSpace(v486.dirR:Lerp(v486.adsDirR or v486.dirR, p485).Unit) or nil
	else
		v489 = nil
	end
	local v490
	if v486.dirL then
		v490 = p484:VectorToWorldSpace(v486.dirL:Lerp(v486.adsDirL or v486.dirL, p485).Unit) or nil
	else
		v490 = nil
	end
	v_u_445 = v490
	v_u_444 = p484 * v488
	local v491 = v_u_482(p483, p484 * v487, v489)
	if v489 then
		v487 = p484:PointToObjectSpace(v491.Position - v489 * 2.1)
	end
	if v_u_445 then
		local v492 = v_u_470(p483, nil, nil)
		if v492 then
			v488 = p484:PointToObjectSpace(v492.Position - v_u_445 * 2.1)
		end
	end
	return v487, v488, v491
end
local function v_u_512(p494, p495, p496, p497) -- name: leftTarget
	-- upvalues: (copy) v_u_470, (copy) v_u_354, (copy) v_u_14, (copy) v_u_12
	local v498 = p494.info
	local v499 = p494.root
	if p495 == nil then
		return nil
	elseif typeof(p495) == "CFrame" then
		local v500 = v499.CFrame * p495
		local v501 = p497 and (p497.leftK or 1) or 1
		local v502 = v501 < 0.999 and v_u_470(p494, nil, p497)
		if v502 then
			return v502:Lerp(v500, v501)
		else
			return v500
		end
	elseif p495 == "pin" then
		local v503 = v499.CFrame * (p494.pinAt or CFrame.new(-0.12, 0.1, -0.15))
		local v504 = os.clock() - (p494.thT0 or os.clock())
		local v505 = v_u_354.io(v504 / 0.12) * (1 - v_u_354.io((v504 - 0.27) / 0.08))
		if v505 < 0.999 then
			return (p496 * v_u_14.LEFT_DOWN):Lerp(v503, v505)
		else
			return v503
		end
	else
		if p495 == "down" then
			return p496 * v_u_14.LEFT_DOWN
		end
		local v506 = v499.CFrame
		if p495 == "mag" and v498.mag then
			local v507 = v498.mag
			return v_u_12.hand((v507.CFrame * CFrame.new(-(v507.Size.X * 0.5 + 0.1), -v507.Size.Y * 0.15, 0)).Position, v507.CFrame.RightVector, v506.LookVector)
		end
		if p495 == "charge" then
			local v508 = not (v498.chargingHandle and v498.chargingHandle.Part1) and v498.bolt
			if v508 then
				v508 = v498.bolt.Part1
			end
			if v508 then
				return v_u_12.hand(v508.Position + v506.UpVector * 0.11, -v506.UpVector, v506.LookVector)
			end
		end
		local v509 = p495 == "port" and (v498.eject or v498.root:FindFirstChild("MountMag"))
		if not v509 then
			return v_u_470(p494, p495, p497)
		end
		local v510 = v509.WorldPosition
		local v511 = v506:PointToObjectSpace(v510).Y < 0.1 and v506.UpVector or -v506.UpVector
		return v_u_12.hand(v510 - v511 * 0.11, v511, v506.LookVector)
	end
end
local function v_u_525(p513, p514) -- name: rightTarget
	-- upvalues: (copy) v_u_14, (copy) v_u_12
	local v515 = p513.info
	if p514 ~= "bolt" or not p513.actR then
		if p514 == "bolt" then
			local v516 = not (v515.boltHandle and v515.boltHandle.Part1) and v515.bolt
			if v516 then
				v516 = v515.bolt.Part1
			end
			local v517 = p513.root.CFrame
			if v516 then
				return v_u_12.hand(v516.Position + v517:VectorToWorldSpace(Vector3.new(0.07, 0.05, 0.01)), v517:VectorToWorldSpace(Vector3.new(-0.8, -0.6, 0)), v517.LookVector)
			end
		elseif p514 == "lever" then
			local v518 = v515.lever
			if v518 then
				v518 = v515.lever.Part1
			end
			if v518 then
				return v518.CFrame
			end
		end
		return p513.root.CFrame
	end
	local v519 = p513.root.CFrame * p513.actR
	local v520 = p513.actRK or 1
	if v520 >= 0.999 then
		return v519
	end
	local v521
	if p513.graspR then
		v521 = p513.root.CFrame * p513.graspR
	else
		local v522 = p513.hands or v_u_14.hands(p513.kind)
		v521 = p513.root.CFrame * v522.r
		local v523 = p513.tune
		if v523 then
			local v524 = v523.right
			if typeof(v524) == "Vector3" then
				v521 = v521 * CFrame.new(v523.right)
			end
		end
	end
	return v521:Lerp(v519, v520)
end
local function v_u_530(p526) -- name: resetMotors
	-- upvalues: (copy) v_u_356
	for v527 in p526.dirty do
		if not v527.Parent then
			continue
		end
		v527.Transform = CFrame.identity
	end
	table.clear(p526.dirty)
	local v528 = v_u_356.clear
	pcall(v528, p526)
	local v529 = v_u_356.hide
	pcall(v529, p526, nil)
end
local function v_u_549(p531, p532) -- name: throwableMotors
	-- upvalues: (copy) v_u_30, (copy) v_u_354
	if p531.pinMotor == nil then
		local v533 = p531.info.root
		local v534 = v533:FindFirstChild("Pin")
		local v535 = v533:FindFirstChild("Lever")
		if not (v534 and (v534:IsA("Motor6D") and v534)) then
			v534 = false
		end
		p531.pinMotor = v534
		if not (v535 and (v535:IsA("Motor6D") and v535)) then
			v535 = false
		end
		p531.leverMotor = v535
	end
	local v536 = v_u_30("ThrowableController", "getState")
	local v537 = os.clock()
	local v538 = type(v536) == "table" and (v536.phase or "Idle") or "Idle"
	if v538 ~= p531.thPhase then
		p531.thPhase = v538
		p531.thT0 = v537
	end
	local v539 = v537 - (p531.thT0 or v537)
	local v540 = 0
	local v541
	if v538 == "Ready" then
		v541 = v_u_354.io((v539 - 0.08) / 0.2)
	else
		v541 = v538 == "Throw" and 1 or v540
	end
	local v542 = p531.pinMotor
	if v542 then
		local v543 = CFrame.new(v541 * -0.26, v541 * 0.05, v541 * 0.02) * CFrame.Angles(0, 0, v541 * -0.5235987755982988)
		p532[v542] = v543
		local v544 = v_u_354.mv(v542, v543, (v542.C0 * v542.C1:Inverse()).Position)
		p531.pinAt = v_u_354.fist(v544 + Vector3.new(-0.15, -0.02, 0.03), Vector3.new(1, 0.2, 0))
		if v542.Part1 then
			v542.Part1.LocalTransparencyModifier = (v538 == "Idle" or v539 <= 0.36) and 0 or 1
		end
	end
	local v545 = p531.leverMotor
	if v545 then
		local v546
		if type(v536) == "table" and v536.cooking then
			local v547 = (v537 - (v536.cookStart or v537)) / 0.14
			v546 = math.clamp(v547, 0, 1)
		else
			v546 = 0
		end
		local v548 = v538 == "Throw" and 1 or v546
		p532[v545] = CFrame.new(v548 * 0.2, v548 * 0.05, 0) * CFrame.Angles(0, 0, v548 * 1.3962634015954636)
		if v545.Part1 then
			v545.Part1.LocalTransparencyModifier = v548 >= 1 and 1 or 0
		end
	end
end
local function v_u_556(p550, p551) -- name: applyMotors
	-- upvalues: (copy) v_u_549
	if p550.stats and p550.stats.isThrowable then
		local v552 = v_u_549
		pcall(v552, p550, p551)
	end
	for v553 in p550.dirty do
		if p551[v553] then
			continue
		end
		v553.Transform = CFrame.identity
		p550.dirty[v553] = nil
	end
	for v554, v555 in p551 do
		v554.Transform = v555
		p550.dirty[v554] = true
	end
end
local function v_u_574(p557, p558, p559) -- name: actionEvent
	-- upvalues: (copy) v_u_356, (copy) v_u_354, (copy) v_u_14, (copy) v_u_19, (copy) v_u_17
	local v560 = p557.info
	local v561 = p557.root.CFrame
	if p558.name == "MagDrop" then
		v_u_356.dropMag(p557)
		return
	elseif p558.name == "ClipFlick" then
		v_u_356.flickClip(p557)
		return
	elseif p558.name == "Eject" then
		local v562 = v560.eject
		local v563
		if v562 then
			v563 = v562.WorldCFrame or v561
		else
			v563 = v561
		end
		local v564
		if p558.gate then
			local v565 = v_u_354.PROF[p557.id]
			if v565 and v565.port then
				v563 = v561 * CFrame.new(v565.port * v_u_14.SCALE)
			end
			v564 = v561.LookVector * -3 + v561.UpVector * -1 + v561.RightVector * 1.5
		elseif p558.up then
			v564 = v561.UpVector * v_u_19:NextNumber(7, 9) + v561.LookVector * -2 + v561.RightVector * 1.5
		else
			v564 = v561.RightVector * v_u_19:NextNumber(6, 8) + v561.UpVector * v_u_19:NextNumber(3, 5) + v561.LookVector * -1
		end
		local v566 = v_u_356.eject
		local v567 = v_u_17.Character
		if v567 then
			v567 = v567:FindFirstChild("HumanoidRootPart")
		end
		v566(v563, v564 + (v567 and v567.AssemblyLinearVelocity or Vector3.new(0, 0, 0)), p558.kind or "762", v562)
	elseif p558.name == "EjectN" then
		if p559 then
			p559 = p559.breech
		end
		local v568 = p559 and v561 * CFrame.new(p559)
		if not v568 then
			if v560.eject then
				v568 = v560.eject.WorldCFrame or v561
			else
				v568 = v561
			end
		end
		for v569 = 1, p558.n or 1 do
			local v570 = v561.UpVector * v_u_19:NextNumber(6, 8) + v561.LookVector * -v_u_19:NextNumber(4, 6) + v561.RightVector * (v569 == 1 and 0.8 or -0.8)
			local v571 = v_u_356.eject
			local v572 = v568 * CFrame.new((v569 - 1.5) * 0.04, 0, 0)
			local v573 = v_u_17.Character
			if v573 then
				v573 = v573:FindFirstChild("HumanoidRootPart")
			end
			v571(v572, v570 + (v573 and v573.AssemblyLinearVelocity or Vector3.new(0, 0, 0)), p558.kind or "12g", v560.eject)
		end
	end
end
local function v_u_586(p575, p576, p577, p578) -- name: fireEvents
	-- upvalues: (copy) v_u_574
	if p575.type == "Reload" then
		local v579 = p575.plan.events
		while (p575.evI or 1) <= #v579 and v579[p575.evI or 1].t <= p577 do
			local v580 = v579[p575.evI or 1]
			p575.evI = (p575.evI or 1) + 1
			local v581 = v_u_574
			local v582, v583 = pcall(v581, p576, v580, p578)
			if v582 then
				continue
			end
			warn("[ViewmodelController] " .. tostring(v583))
		end
	elseif p575.eject and (p578 and (p578.ejectU and (not p575.ejected and p578.ejectU * p575.dur <= p577))) then
		p575.ejected = true
		local v584 = v_u_574
		local v585 = {
			["name"] = "Eject",
			["kind"] = nil,
			["up"] = nil,
			["kind"] = p575.kind,
			["up"] = p575.type == "Lever"
		}
		pcall(v584, p576, v585, p578)
	end
end
local function v_u_601(p587, p588) -- name: fadeOut
	if not p587 then
		return nil
	end
	local v589 = {
		["motors"] = nil,
		["props"] = nil,
		["hide"] = nil,
		["magHidden"] = false,
		["motors"] = {},
		["props"] = {},
		["hide"] = {}
	}
	local v590
	if p587.gun then
		v590 = p587.gun:Lerp(CFrame.identity, p588) or nil
	else
		v590 = nil
	end
	v589.gun = v590
	for v591, v592 in p587.motors do
		v589.motors[v591] = v592:Lerp(CFrame.identity, p588)
	end
	local v593 = p587.left
	if typeof(v593) == "CFrame" then
		local v594 = p587.left
		local v595 = (p587.leftK or 1) * (1 - p588)
		v589.left = v594
		v589.leftK = v595
	elseif p587.left == "pump" then
		local v596 = (p587.pumpOffset or 0) * (1 - p588)
		v589.left = "pump"
		v589.pumpOffset = v596
	end
	if p587.right == "bolt" and p587.rightAt then
		local v597 = p587.rightAt
		local v598 = (p587.rightK or 1) * (1 - p588)
		v589.right = "bolt"
		v589.rightAt = v597
		v589.rightK = v598
	end
	if p587.clipArms then
		local v599 = p587.clipArms
		local v600 = (p587.clipW or 1) * (1 - p588)
		v589.clipArms = v599
		v589.clipW = v600
	end
	return v589
end
local function v_u_628(p602, p603) -- name: animState
	-- upvalues: (ref) v_u_50, (copy) v_u_30, (copy) v_u_601, (copy) v_u_354, (copy) v_u_418, (copy) v_u_372, (copy) v_u_586, (copy) v_u_356
	local v604 = v_u_50
	local v605 = nil
	if v604 and v604.vm == p602 then
		local v606 = p603 - v604.t0
		if v604.type == "Reload" and (not v604.stopT and (v606 > 0.3 and (v606 < v604.dur - 0.12 and v_u_30("WeaponController", "isReloading") == false))) then
			v604.stopT = p603
		end
		if v604.dur + 0.05 < v606 or v604.stopT and p603 - v604.stopT > 0.22 then
			v_u_50 = nil
		elseif v604.stopT then
			v605 = v_u_601(v604.last, v_u_354.io((p603 - v604.stopT) / 0.22))
		else
			local v607
			if v604.type == "Reload" then
				v607 = v_u_354.reload(v604.plan, p602, v606)
			else
				local v608 = v_u_354.cycle
				local v609 = v604.type
				local v610 = v604.dur
				local v611 = v606 / math.max(v610, 0.05)
				v607 = v608(v609, p602, math.clamp(v611, 0, 1), v604.dur)
			end
			local v612 = nil
			local v613 = 0
			if v604.clip then
				v612 = v604.clip
				local v614 = v604.dur
				local v615 = v606 / math.max(v614, 0.05)
				v613 = math.clamp(v615, 0, 1) * v604.clip.len
			elseif v604.shellClips then
				v612, v613 = v_u_418(v604, v606)
			end
			if v612 and v607 then
				v605 = v_u_372(p602, v612, v613)
				if v612.full then
					v605.props = nil
					v605.hide = nil
					v605.magHidden = false
				else
					local v616 = v607.props
					local v617 = v607.hide
					local v618 = v607.magHidden
					v605.props = v616
					v605.hide = v617
					v605.magHidden = v618
				end
				v605.ejectU = v604.clipEjectU or v607.ejectU
				local v619 = v604.dur
				local v620 = v606 / 0.12
				local v621 = (v619 - v606) / 0.12
				local v622 = math.min(v620, v621)
				v605.clipW = math.clamp(v622, 0, 1)
			else
				v605 = v607
			end
			v604.last = v605
			v_u_586(v604, p602, v606, v605)
		end
	end
	if not v605 and (p602.stats and p602.stats.isGun) then
		v605 = v_u_354.idle(p602, v_u_30("WeaponController", "getAmmo") or 1)
	end
	local v623 = v_u_356.set
	local v624
	if v605 then
		v624 = v605.props or nil
	else
		v624 = nil
	end
	v623(p602, v624)
	local v625 = v_u_356.hide
	local v626
	if v605 then
		v626 = v605.hide or nil
	else
		v626 = nil
	end
	v625(p602, v626)
	local v627
	if v605 then
		v627 = v605.rightAt or nil
	else
		v627 = nil
	end
	p602.actR = v627
	p602.actRK = v605 and (v605.rightK or 0) or 0
	return v605
end
local function v_u_644(p629) -- name: adsHfov
	-- upvalues: (copy) v_u_10, (ref) v_u_32, (ref) v_u_39, (ref) v_u_31, (copy) v_u_18
	local v630 = p629.stats
	local v631 = v630.hfov or v_u_10.BASE_HFOV
	if v630.variable then
		local v632 = v_u_32
		if type(v632) == "table" then
			local v633 = v_u_32.fov
			if type(v633) == "number" then
				v631 = v_u_32.fov
			end
		end
		if v_u_39 >= 0.999 and v_u_31 == "ADS" then
			local v634 = workspace.CurrentCamera
			local v635 = v634.ViewportSize
			local v636 = v635.X
			local v637 = v635.Y
			local v638 = v636 / math.max(v637, 1)
			local v639 = v_u_10.REF_ASPECT
			local v640 = math.min(v638, v639)
			local v641 = v_u_18(v634.FieldOfView) / 2
			local v642 = math.tan(v641) * v640
			local v643 = math.atan(v642) * 2
			v631 = math.deg(v643)
		end
	end
	return v631
end
local function v647(p645) -- name: adsEye
	-- upvalues: (copy) v_u_10, (copy) v_u_644
	if not (p645.optic and p645.eyeR) then
		return p645.eye
	end
	if p645.kind == "Pistol" then
		return p645.eye
	end
	local v646 = v_u_10.eyeDist(p645.opticId, p645.eyeR, (v_u_644(p645)))
	return math.max(v646, 0.16) - (p645.relief or 0)
end
local v_u_648 = nil
local function v_u_657(p649) -- name: screenSize
	-- upvalues: (ref) v_u_648, (copy) v_u_1
	if not (v_u_648 and v_u_648.Parent) then
		local v650 = v_u_1.LocalPlayer
		if v650 then
			v650 = v_u_1.LocalPlayer:FindFirstChildOfClass("PlayerGui")
		end
		if v650 then
			local v651 = v650:FindFirstChild("ScreenProbe")
			if not (v651 and v651:IsA("ScreenGui")) then
				local v_u_652 = Instance.new("ScreenGui")
				v_u_652.Name = "ScreenProbe"
				v_u_652.ResetOnSpawn = false
				v_u_652.IgnoreGuiInset = true
				local function v653()
					-- upvalues: (ref) v_u_652
					v_u_652.ScreenInsets = Enum.ScreenInsets.None
				end
				pcall(v653)
				v_u_652.Parent = v650
				v651 = v_u_652
			end
			v_u_648 = v651
		end
	end
	local v654
	if v_u_648 then
		v654 = v_u_648.AbsoluteSize
	else
		v654 = Vector2.zero
	end
	local v655 = p649.ViewportSize
	if v654.X >= 10 and v654.Y >= 10 then
		local v656 = v654.Y - v655.Y
		if math.abs(v656) <= 2 then
			return v654
		end
	end
	return v655
end
local function v_u_672(p658, p659, p660) -- name: lensView
	-- upvalues: (copy) v_u_657, (copy) v_u_18
	if not (p658.info.aimPoint and p658.eyeRel) then
		return nil
	end
	local v661 = p658.viewRel or p659.CFrame:ToObjectSpace(p658.root.CFrame)
	local v662 = p658.eyeRel
	local v663 = p658.optMotor
	if v663 and v663.Transform ~= CFrame.identity then
		v662 = v663.C0 * v663.Transform * v663.C0:Inverse() * v662
	end
	local v664 = v661 * v662
	if v664.Z > -0.01 then
		return nil
	end
	local v665 = v_u_657(p659)
	local v666 = v665.Y / 2
	local v667 = v_u_18(p659.FieldOfView) / 2
	local v668 = v666 / math.tan(v667)
	local v669 = v665.X / 2
	local v670 = v665.Y / 2
	local v671 = Vector2.new(v669 + v668 * v664.X / -v664.Z, v670 - v668 * v664.Y / -v664.Z)
	return {
		["center"] = v671,
		["radius"] = v668 * (p658.eyeR or 0.035) / -v664.Z,
		["aim"] = v671,
		["alpha"] = p660,
		["aspect"] = p658.windowAspect or 1,
		["corner"] = p658.windowCorner,
		["style"] = p658.reticleStyle,
		["color"] = p658.reticleColor
	}
end
local function v_u_695(p673, p674, p675, p676) -- name: armInLens
	-- upvalues: (copy) v_u_657, (copy) v_u_18
	local v677 = v_u_657(p673)
	local v678 = v677.Y / 2
	local v679 = v_u_18(p673.FieldOfView) / 2
	local v680 = v678 / math.tan(v679)
	local v681 = v677.X / 2
	local v682 = v677.Y / 2
	local v683 = p675.X
	local v684 = p675.Y
	local v685 = math.max(v683, v684) * 0.5
	local v686 = p676.radius
	local v687 = p676.aspect
	local v688 = tonumber(v687) or 1
	local v689 = v686 * math.max(1, v688)
	local v690 = p676.center
	local v691 = p673.CFrame
	for v692 = 0, 8 do
		local v693 = (v692 / 8 - 0.5) * p675.Z
		local v694 = v691:PointToObjectSpace(p674:PointToWorldSpace((Vector3.new(0, 0, v693))))
		if v694.Z >= -0.02 or (Vector2.new(v681 + v680 * v694.X / -v694.Z, v682 - v680 * v694.Y / -v694.Z) - v690).Magnitude >= v689 + v680 * v685 / -v694.Z * 0.85 then
			continue
		end
		return true
	end
	return false
end
function v_u_16.onCameraMode(p696, p697) -- name: onCameraMode
	-- upvalues: (ref) v_u_31, (ref) v_u_32
	v_u_31 = p696
	if type(p697) == "table" then
		v_u_32 = p697
	end
end
function v_u_16.setADS(p698, p699) -- name: setADS
	-- upvalues: (ref) v_u_32, (ref) v_u_31
	if type(p699) == "table" then
		v_u_32 = p699
	end
	v_u_31 = p698 and "ADS" or v_u_31
end
function v_u_16.isVisible() -- name: isVisible
	-- upvalues: (ref) v_u_40, (ref) v_u_33
	local v700 = v_u_40
	if v700 then
		v700 = v_u_33 ~= nil
	end
	return v700
end
function v_u_16.isScoped() -- name: isScoped
	-- upvalues: (ref) v_u_41
	return v_u_41
end
function v_u_16.getAdsAlpha() -- name: getAdsAlpha
	-- upvalues: (copy) v_u_14, (ref) v_u_39
	return v_u_14.smooth(v_u_39)
end
function v_u_16.getCamMotion() -- name: getCamMotion
	-- upvalues: (ref) v_u_58
	return v_u_58
end
function v_u_16.getMuzzle() -- name: getMuzzle
	-- upvalues: (ref) v_u_33
	if v_u_33 then
		return v_u_33.info.muzzle
	else
		return nil
	end
end
function v_u_16.getEject() -- name: getEject
	-- upvalues: (ref) v_u_33
	if v_u_33 then
		return v_u_33.info.eject
	else
		return nil
	end
end
function v_u_16.onEquip(p701, p702, p703) -- name: onEquip
	-- upvalues: (ref) v_u_33, (copy) v_u_530, (ref) v_u_50, (copy) v_u_353, (ref) v_u_53, (ref) v_u_54
	if p702 then
		local v704 = v_u_353(p701, p702, p703)
		if v_u_33 and v_u_33 ~= v704 then
			v_u_530(v_u_33)
			local v705 = v_u_33
			if v705 and v705.model then
				v705.model.Parent = nil
			end
		end
		if v704 ~= v_u_33 then
			v_u_53 = os.clock()
			v_u_54 = v704 and v704.stats and (v704.stats.equipTime or 0.5) or 0.5
			v_u_50 = nil
		end
		v_u_33 = v704
		if v_u_33 then
			v_u_33.slot = p701
		end
	else
		if v_u_33 then
			v_u_530(v_u_33)
			local v706 = v_u_33
			if v706 and v706.model then
				v706.model.Parent = nil
			end
		end
		v_u_33 = nil
		v_u_50 = nil
	end
end
function v_u_16.kick(p707, p708, p709) -- name: kick
	-- upvalues: (ref) v_u_33, (copy) v_u_14, (ref) v_u_39, (copy) v_u_6, (copy) v_u_60, (copy) v_u_61, (copy) v_u_71, (copy) v_u_19, (copy) v_u_69, (copy) v_u_70, (ref) v_u_51, (ref) v_u_52
	if v_u_33 and (p707 and p707.recoil) then
		local v710 = p707.recoil
		local v711 = v710.Feel or {}
		local v712 = v_u_14.smooth(v_u_39)
		local v713 = (v710.KickMul or 1) * (v_u_6.RecoilScale and v_u_6.RecoilScale.Visual or 1)
		local v714 = v711.VMSpeed or 19
		local v715 = v711.VMDamp or 0.5
		local v716 = v_u_60
		v_u_60.speed = v714
		v716.damper = v715
		local v717 = v_u_61
		v_u_61.speed = v714
		v717.damper = v715
		local v718 = v_u_71[p707.class or ""] or v_u_71.AR
		local v719 = (p709 or 1) <= 1 and 1.3 or 1
		local v720 = (v711.VMBack or 0.1) * v713 * v719 * v718.w * (1 - 0.35 * v712)
		local v721 = (v711.VMRot or 3) * v713 * v719 * v718.w * (1 - 0.85 * v712)
		local v722 = v710.H or 0.25
		local v723 = (p708 or 0) / math.max(v722, 0.05)
		local v724 = math.clamp(v723, -1.5, 1.5)
		local v725 = -(v724 * 0.55 + (v_u_19:NextNumber() - 0.5) * 0.7) * v721 * 0.4
		local v726 = ((v_u_19:NextNumber() - 0.5) * 0.9 - v724 * 0.3) * v721
		local v727 = v_u_60
		local v728 = (v_u_19:NextNumber() - 0.5) * v720 * 0.3
		local v729 = v720 * 0.22 * (1 - v712)
		local v730 = Vector3.new(v728, v729, v720)
		local v731 = v727.speed
		local v732 = v727.damper
		local v733
		if v732 >= 0.999 then
			v733 = 0.36787944117144233
		else
			local v734 = 1 - v732 * v732
			local v735 = math.sqrt(v734)
			local v736 = -v732 / v735 * math.atan2(v735, v732)
			v733 = math.exp(v736)
		end
		v727:impulse(v730 * (v731 / v733))
		local v737 = v_u_61
		local v738 = Vector3.new(v721, v725, v726)
		local v739 = v737.speed
		local v740 = v737.damper
		local v741
		if v740 >= 0.999 then
			v741 = 0.36787944117144233
		else
			local v742 = 1 - v740 * v740
			local v743 = math.sqrt(v742)
			local v744 = -v740 / v743 * math.atan2(v743, v740)
			v741 = math.exp(v744)
		end
		v737:impulse(v738 * (v739 / v741))
		local v745 = v718.snap
		local v746 = v_u_69
		local v747 = v720 * 0.15 * (1 - v712)
		local v748 = v720 * 0.55 * v745
		local v749 = Vector3.new(0, v747, v748)
		local v750 = v746.speed
		local v751 = v746.damper
		local v752
		if v751 >= 0.999 then
			v752 = 0.36787944117144233
		else
			local v753 = 1 - v751 * v751
			local v754 = math.sqrt(v753)
			local v755 = -v751 / v754 * math.atan2(v754, v751)
			v752 = math.exp(v755)
		end
		v746:impulse(v749 * (v750 / v752))
		local v756 = v_u_70
		local v757 = v721 * 0.45 * v745
		local v758 = v725 * 0.3
		local v759 = v726 * 0.5 * v745
		local v760 = Vector3.new(v757, v758, v759)
		local v761 = v756.speed
		local v762 = v756.damper
		local v763
		if v762 >= 0.999 then
			v763 = 0.36787944117144233
		else
			local v764 = 1 - v762 * v762
			local v765 = math.sqrt(v764)
			local v766 = -v762 / v765 * math.atan2(v765, v762)
			v763 = math.exp(v766)
		end
		v756:impulse(v760 * (v761 / v763))
		if v_u_33.info.slide then
			v_u_51 = os.clock()
		elseif v_u_33.info.bolt and not v_u_33.boltAction then
			v_u_52 = os.clock()
		end
	else
		return
	end
end
function v_u_16.playBolt(p767) -- name: playBolt
	-- upvalues: (ref) v_u_33, (ref) v_u_50, (ref) v_u_40, (copy) v_u_354, (copy) v_u_358
	if not v_u_33 then
		return false
	end
	local v768 = v_u_33.info
	v_u_50 = {
		["vm"] = v_u_33,
		["type"] = v768.lever and "Lever" or (v768.pump and "Pump" or "Bolt"),
		["t0"] = os.clock(),
		["dur"] = math.max(p767 or 0.8, 0.2),
		["eject"] = v_u_40,
		["kind"] = v_u_354.SHELL_OF[v_u_33.stats and v_u_33.stats.ammo or ""] or "762"
	}
	local v769 = v_u_358.get(v_u_33.id, "Cycle")
	if v769 then
		v_u_50.clip = v769
		for _, v770 in v769.markers do
			if v770.name ~= "Eject" then
				continue
			end
			local v771 = v_u_50
			local v772 = v770.t
			local v773 = v769.len
			v771.clipEjectU = v772 / math.max(v773, 0.001)
		end
	end
	return v_u_40
end
function v_u_16.playPump(p774) -- name: playPump
	-- upvalues: (ref) v_u_33, (ref) v_u_50, (ref) v_u_40, (copy) v_u_358
	if not (v_u_33 and v_u_33.info.pump) then
		return false
	end
	v_u_50 = {
		["vm"] = nil,
		["type"] = "Pump",
		["t0"] = nil,
		["dur"] = nil,
		["eject"] = nil,
		["kind"] = "12g",
		["vm"] = v_u_33,
		["t0"] = os.clock(),
		["dur"] = math.max(p774 or 0.45, 0.2),
		["eject"] = v_u_40
	}
	local v775 = v_u_358.get(v_u_33.id, "Cycle")
	if v775 then
		v_u_50.clip = v775
		for _, v776 in v775.markers do
			if v776.name ~= "Eject" then
				continue
			end
			local v777 = v_u_50
			local v778 = v776.t
			local v779 = v775.len
			v777.clipEjectU = v778 / math.max(v779, 0.001)
		end
	end
	return v_u_40
end
function v_u_16.playReload(p780, p781, p782, p783) -- name: playReload
	-- upvalues: (ref) v_u_33, (copy) v_u_30, (copy) v_u_354, (ref) v_u_50, (copy) v_u_399, (copy) v_u_358, (copy) v_u_393
	if v_u_33 then
		local v784 = v_u_30("WeaponController", "getAmmo") or 0
		local v785 = v_u_354.plan
		local v786 = p782 or v_u_33.stats
		local v787, v788 = pcall(v785, p780, p781, v786, p783, v784)
		if v787 and v788 then
			v_u_50 = {
				["vm"] = nil,
				["type"] = "Reload",
				["plan"] = nil,
				["t0"] = nil,
				["dur"] = nil,
				["evI"] = 1,
				["vm"] = v_u_33,
				["plan"] = v788,
				["t0"] = os.clock(),
				["dur"] = v788.dur
			}
			if v788.type == "Shell" then
				v_u_50.shellClips = v_u_399(v_u_33.id, (v788.ammo or 0) <= 0)
			else
				local v789 = v_u_358.get(v_u_33.id, v788.empty and "ReloadEmpty" or "Reload")
				if v789 then
					v_u_50.clip = v789
					local v790 = v_u_393(v789, v788.dur)
					if v790 then
						v788.events = v790
					end
				end
			end
		else
			warn("[ViewmodelController] reload: " .. tostring(v788))
			return
		end
	else
		return
	end
end
function v_u_16.reloadSounds(p791, p792, p793, p794, p795) -- name: reloadSounds
	-- upvalues: (copy) v_u_354, (copy) v_u_358, (copy) v_u_393, (copy) v_u_355
	if not p793 then
		return nil
	end
	local v796 = v_u_354.plan
	local v797, v798 = pcall(v796, p791, p792, p793, p794, p795 or 0)
	if not (v797 and v798) then
		return nil
	end
	if v798.type ~= "Shell" then
		local v799, v800 = v_u_393(v_u_358.get(p793.id, v798.empty and "ReloadEmpty" or "Reload"), v798.dur)
		if v799 and (v800 and #v800 > 0) then
			local v801 = v_u_355.reloadKit
			local v802
			if type(v801) == "function" then
				v802 = v_u_355.reloadKit(p793.id) or nil
			else
				v802 = nil
			end
			if not v802 then
				return v800
			end
			local v803 = {
				["MagRelease"] = "MagRelease",
				["MagOut"] = "MagOut",
				["MagIn"] = "MagIn",
				["ChargingHandle"] = "ChargeBack",
				["ChargingHandleForward"] = "ChargeForward",
				["BoltCatch"] = "BoltCatch",
				["ShellInsert"] = "ShellIn"
			}
			local v804 = {}
			local v805 = false
			local v806 = nil
			for _, v807 in v800 do
				local v808 = v803[v807.key] or v807.key
				local v809 = v802[v808]
				v805 = v808 == "MagRelease" and true or v805
				if v808 == "MagOut" then
					v806 = v807.t
				end
				local v810 = {
					["t"] = v807.t
				}
				local v811
				if v809 then
					v811 = "RC:" .. v809
				else
					v811 = v807.key
				end
				v810.key = v811
				v810.vol = v807.vol
				table.insert(v804, v810)
			end
			if not v805 and (v806 and v802.MagRelease) then
				local v812 = {
					["t"] = nil,
					["key"] = nil,
					["vol"] = 0.65
				}
				local v813 = v806 - 0.2
				v812.t = math.max(0, v813)
				v812.key = "RC:" .. v802.MagRelease
				table.insert(v804, v812)
			end
			table.sort(v804, function(p814, p815)
				return p814.t < p815.t
			end)
			return v804
		end
	end
	return v_u_354.sounds(v798)
end
function v_u_16.stopReload() -- name: stopReload
	-- upvalues: (ref) v_u_50
	if v_u_50 and (v_u_50.type == "Reload" and not v_u_50.stopT) then
		v_u_50.stopT = os.clock()
	end
end
local function v_u_820(p816, p817) -- name: charOK
	if not p816 then
		return false
	end
	local v818 = p816:FindFirstChildOfClass("Humanoid")
	if not v818 or v818.Health <= 0 then
		return false
	end
	local v819
	if p816:GetAttribute("Knocked") == true or (p816:GetAttribute("Deploy") ~= nil or p816:GetAttribute("InVehicle") == true and p817 ~= true) or p816:GetAttribute("Swimming") == true then
		v819 = false
	else
		v819 = p816:GetAttribute("Eliminated") ~= true
	end
	return v819
end
local function v_u_826(p821) -- name: syncEquipped
	-- upvalues: (ref) v_u_33, (copy) v_u_16, (copy) v_u_30
	local v822 = p821:GetAttribute("Equipped")
	local v823 = p821:GetAttribute("EquippedSlot")
	if type(v822) == "string" then
		if v_u_33 and v_u_33.id == v822 then
			return
		else
			local v824
			if v823 and v823 ~= "Throwable" then
				local v825 = v_u_30("InventoryClient", "get")
				if v825 and v825.weapons then
					v824 = v825.weapons[v823] or nil
				else
					v824 = nil
				end
			else
				v824 = nil
			end
			if not v824 or v824.id == v822 then
				v_u_16.onEquip(v823, v822, v824)
			end
		end
	else
		if v_u_33 then
			v_u_16.onEquip(nil, nil, nil)
		end
		return
	end
end
local function v_u_838(p827, p828) -- name: wallCheck
	-- upvalues: (copy) v_u_17, (copy) v_u_30, (copy) v_u_74
	local v829
	if p827.muzzleRel then
		local v830 = -(p827.hip * p827.muzzleRel).Position.Z
		v829 = math.max(v830, 0.5) or 1.2
	else
		v829 = 1.2
	end
	local v831 = v_u_17.Character
	local v832 = { workspace.CurrentCamera }
	if v831 then
		table.insert(v832, v831)
	end
	for _, v833 in {
		"Live",
		"FX",
		"Loot",
		"Projectiles"
	} do
		local v834 = workspace:FindFirstChild(v833)
		if not v834 then
			continue
		end
		table.insert(v832, v834)
	end
	local v835
	if v831 and v831:GetAttribute("InVehicle") == true then
		v835 = v_u_30("VehicleController", "getVehicle") or nil
	else
		v835 = nil
	end
	if typeof(v835) == "Instance" then
		table.insert(v832, v835)
	end
	v_u_74.FilterDescendantsInstances = v832
	local v836 = workspace:Raycast(p828.Position, p828.LookVector * (v829 + 0.25), v_u_74)
	if not v836 then
		return 0
	end
	local v837 = (v829 + 0.25 - v836.Distance) / v829
	return math.clamp(v837, 0, 1)
end
local v_u_839 = nil
local v_u_840 = -10
local v_u_841 = ""
local v_u_842 = 0
local v_u_843 = nil
local v_u_844 = 0
local v_u_845 = nil
local v_u_846 = 0
local function v_u_855(p847, p848, p849) -- name: syncAccept
	-- upvalues: (ref) v_u_840, (ref) v_u_841, (ref) v_u_844, (ref) v_u_842, (copy) v_u_73, (ref) v_u_845, (ref) v_u_846, (ref) v_u_45
	local v850 = p847.t
	local v851 = p847.foot
	v_u_840 = v850
	v_u_841 = v851
	v_u_844 = 0
	v_u_842 = p849
	if p848 - p847.t < 0.9 then
		local v852 = 0.0477464829275686 + (p847.foot == "R" and 0.5 or 0)
		local v853 = p848 - p847.t
		local v854 = v_u_73.StepSyncLag
		v_u_846 = ((v852 + (v853 - (type(v854) == "number" and v854 and v854 or 0)) * (v_u_845 or p849 / ((p849 * 0.17 + 0.45) * 2)) - v_u_45) % 1 + 0.5) % 1 - 0.5
	end
end
local function v_u_885(p856, p857, p858, p859) -- name: stepSyncSteps
	-- upvalues: (ref) v_u_845, (ref) v_u_840, (ref) v_u_45, (copy) v_u_30, (ref) v_u_839, (ref) v_u_33, (ref) v_u_843, (ref) v_u_842, (copy) v_u_855, (ref) v_u_841, (ref) v_u_844, (ref) v_u_846
	local v860 = not p859
	if v860 then
		v860 = p858 > 0.15
	end
	local v861
	if v_u_845 and p856 - v_u_840 < 0.9 then
		v861 = v_u_845
	else
		v861 = p858 / ((p858 * 0.17 + 0.45) * 2)
	end
	if v860 then
		v_u_45 = (v_u_45 + p857 * v861) % 1000
	end
	local v862 = v_u_30("FootstepController", "getLocalStep")
	local v863, v864, v865, v866, v867, v868, v869
	if type(v862) ~= "table" then
		if v860 then
			v863 = p857 * v861
			v864 = v_u_846
			v865 = p857 * -9
			v866 = v864 * (1 - math.exp(v865))
			v867 = -0.6 * v863
			v868 = 1.2 * v863
			v869 = math.clamp(v866, v867, v868)
			v_u_846 = v_u_846 - v869
			v_u_45 = (v_u_45 + v869) % 1000
		end
		return
	end
	local v870 = v862.n
	if type(v870) ~= "number" then
		if v860 then
			v863 = p857 * v861
			v864 = v_u_846
			v865 = p857 * -9
			v866 = v864 * (1 - math.exp(v865))
			v867 = -0.6 * v863
			v868 = 1.2 * v863
			v869 = math.clamp(v866, v867, v868)
			v_u_846 = v_u_846 - v869
			v_u_45 = (v_u_45 + v869) % 1000
		end
		return
	end
	local v871 = v862.t
	if type(v871) ~= "number" or v862.n == v_u_839 then
		if v860 then
			v863 = p857 * v861
			v864 = v_u_846
			v865 = p857 * -9
			v866 = v864 * (1 - math.exp(v865))
			v867 = -0.6 * v863
			v868 = 1.2 * v863
			v869 = math.clamp(v866, v867, v868)
			v_u_846 = v_u_846 - v869
			v_u_45 = (v_u_45 + v869) % 1000
		end
		return
	end
	v_u_839 = v862.n
	local v872 = v862.t - v_u_840
	local v873 = v862.mode
	local v874 = tostring(v873)
	local v875 = "|"
	local v876 = v_u_33
	if v876 then
		v876 = v_u_33.id
	end
	local v877 = v874 .. v875 .. tostring(v876)
	if v877 == v_u_843 and v872 < 0.9 then
		local v878, v879, v880, v881, v882, v883
		if v_u_842 > 0 then
			local v884 = p858 - v_u_842
			if math.abs(v884) > v_u_842 * 0.15 then
				v_u_843 = v877
				v_u_845 = nil
				v_u_855(v862, p856, p858)
				if v860 then
					v863 = p857 * v861
					v864 = v_u_846
					v865 = p857 * -9
					v866 = v864 * (1 - math.exp(v865))
					v867 = -0.6 * v863
					v868 = 1.2 * v863
					v869 = math.clamp(v866, v867, v868)
					v_u_846 = v_u_846 - v869
					v_u_45 = (v_u_45 + v869) % 1000
				end
				return
			elseif v_u_845 then
				v878 = v_u_845
				v879 = 1 / (v878 * 2)
				v880 = v872 / v879 + 0.5
				v881 = math.floor(v880)
				v882 = v881 % 2 == 1 == (v862.foot ~= v_u_841)
				if v881 >= 1 then
					v883 = v872 - v881 * v879
					if math.abs(v883) <= v879 * 0.25 and v882 then
						v_u_845 = v878 + (1 / (2 * (v872 / v881)) - v878) * 0.5
						v_u_855(v862, p856, p858)
						if v860 then
							v863 = p857 * v861
							v864 = v_u_846
							v865 = p857 * -9
							v866 = v864 * (1 - math.exp(v865))
							v867 = -0.6 * v863
							v868 = 1.2 * v863
							v869 = math.clamp(v866, v867, v868)
							v_u_846 = v_u_846 - v869
							v_u_45 = (v_u_45 + v869) % 1000
						end
						return
					end
					v_u_844 = v_u_844 + 1
					if v_u_844 >= 4 then
						v_u_845 = nil
						v_u_855(v862, p856, p858)
					end
				else
					v_u_844 = v_u_844 + 1
					if v_u_844 >= 4 then
						v_u_845 = nil
						v_u_855(v862, p856, p858)
					end
				end
				if v860 then
					v863 = p857 * v861
					v864 = v_u_846
					v865 = p857 * -9
					v866 = v864 * (1 - math.exp(v865))
					v867 = -0.6 * v863
					v868 = 1.2 * v863
					v869 = math.clamp(v866, v867, v868)
					v_u_846 = v_u_846 - v869
					v_u_45 = (v_u_45 + v869) % 1000
				end
			else
				if v862.foot == v_u_841 then
					v872 = v872 / 2
				end
				if v872 >= 0.18 and v872 <= 0.8 then
					v_u_845 = 1 / (2 * v872)
				end
				v_u_855(v862, p856, p858)
				if v860 then
					v863 = p857 * v861
					v864 = v_u_846
					v865 = p857 * -9
					v866 = v864 * (1 - math.exp(v865))
					v867 = -0.6 * v863
					v868 = 1.2 * v863
					v869 = math.clamp(v866, v867, v868)
					v_u_846 = v_u_846 - v869
					v_u_45 = (v_u_45 + v869) % 1000
				end
			end
		elseif v_u_845 then
			v878 = v_u_845
			v879 = 1 / (v878 * 2)
			v880 = v872 / v879 + 0.5
			v881 = math.floor(v880)
			v882 = v881 % 2 == 1 == (v862.foot ~= v_u_841)
			if v881 >= 1 then
				v883 = v872 - v881 * v879
				if math.abs(v883) <= v879 * 0.25 and v882 then
					v_u_845 = v878 + (1 / (2 * (v872 / v881)) - v878) * 0.5
					v_u_855(v862, p856, p858)
					if v860 then
						v863 = p857 * v861
						v864 = v_u_846
						v865 = p857 * -9
						v866 = v864 * (1 - math.exp(v865))
						v867 = -0.6 * v863
						v868 = 1.2 * v863
						v869 = math.clamp(v866, v867, v868)
						v_u_846 = v_u_846 - v869
						v_u_45 = (v_u_45 + v869) % 1000
					end
					return
				end
				v_u_844 = v_u_844 + 1
				if v_u_844 >= 4 then
					v_u_845 = nil
					v_u_855(v862, p856, p858)
				end
			else
				v_u_844 = v_u_844 + 1
				if v_u_844 >= 4 then
					v_u_845 = nil
					v_u_855(v862, p856, p858)
				end
			end
			if v860 then
				v863 = p857 * v861
				v864 = v_u_846
				v865 = p857 * -9
				v866 = v864 * (1 - math.exp(v865))
				v867 = -0.6 * v863
				v868 = 1.2 * v863
				v869 = math.clamp(v866, v867, v868)
				v_u_846 = v_u_846 - v869
				v_u_45 = (v_u_45 + v869) % 1000
			end
		else
			if v862.foot == v_u_841 then
				v872 = v872 / 2
			end
			if v872 >= 0.18 and v872 <= 0.8 then
				v_u_845 = 1 / (2 * v872)
			end
			v_u_855(v862, p856, p858)
			if v860 then
				v863 = p857 * v861
				v864 = v_u_846
				v865 = p857 * -9
				v866 = v864 * (1 - math.exp(v865))
				v867 = -0.6 * v863
				v868 = 1.2 * v863
				v869 = math.clamp(v866, v867, v868)
				v_u_846 = v_u_846 - v869
				v_u_45 = (v_u_45 + v869) % 1000
			end
		end
	else
		v_u_843 = v877
		v_u_845 = nil
		v_u_855(v862, p856, p858)
		if v860 then
			v863 = p857 * v861
			v864 = v_u_846
			v865 = p857 * -9
			v866 = v864 * (1 - math.exp(v865))
			v867 = -0.6 * v863
			v868 = 1.2 * v863
			v869 = math.clamp(v866, v867, v868)
			v_u_846 = v_u_846 - v869
			v_u_45 = (v_u_45 + v869) % 1000
		end
		return
	end
end
local v886 = require(v_u_3.Shared.Config.AnimConfig)
local v887 = v886.Movement or {}
local v_u_888 = {}
for _, v889 in {
	"Walk",
	"WalkBack",
	"WalkLeft",
	"WalkRight",
	"Run",
	"Run2",
	"CrouchWalk",
	"NormalWalk"
} do
	if not v887[v889] then
		continue
	end
	local v890 = v887[v889]
	v_u_888[tostring(v890)] = v889
end
local v891 = v886.Weapons or {}
for _, v892 in { "Rifle" } do
	local v893 = v891[v892]
	if v893 then
		v893 = v891[v892].Run
	end
	if not v893 then
		continue
	end
	v_u_888[tostring(v893)] = v892 .. ".Run"
end
local v_u_894 = {
	[Enum.AnimationPriority.Core] = 0,
	[Enum.AnimationPriority.Idle] = 1,
	[Enum.AnimationPriority.Movement] = 2,
	[Enum.AnimationPriority.Action] = 3,
	[Enum.AnimationPriority.Action2] = 4,
	[Enum.AnimationPriority.Action3] = 5,
	[Enum.AnimationPriority.Action4] = 6
}
local v_u_895 = {
	["74115505714758>"] = {
		["L"] = 0.525,
		["R"] = 0.028
	},
	["114077035730336>"] = {
		["L"] = 0.032,
		["R"] = 0.531
	},
	["112383651163567>"] = {
		["L"] = 0.997,
		["R"] = 0.497
	},
	["82963075493303>"] = {
		["L"] = 0.518,
		["R"] = 0.025
	},
	["116585692586226>"] = {
		["L"] = 0.06,
		["R"] = 0.57
	},
	["95450643539498>"] = {
		["L"] = 0.055,
		["R"] = 0.5
	},
	["109009594839691>"] = {
		["L"] = 0.001,
		["R"] = 0.497
	},
	["88807825905814>"] = {
		["L"] = 0.991,
		["R"] = 0.505
	},
	["88807825905814<"] = {
		["L"] = 0.778,
		["R"] = 0.203
	}
}
local v_u_896 = setmetatable({}, {
	["__mode"] = "k"
})
local v_u_897 = {}
local v_u_898 = nil
local v_u_899 = 0
local v_u_900 = nil
local v_u_901 = "steps"
local function v_u_912(p902) -- name: legDriver
	-- upvalues: (copy) v_u_896, (copy) v_u_888, (copy) v_u_894
	local v903 = p902:FindFirstChildOfClass("Humanoid")
	if v903 then
		v903 = v903:FindFirstChildOfClass("Animator")
	end
	if not v903 then
		return nil
	end
	local v904 = -1
	local v905 = 0
	local v906 = nil
	for _, v907 in v903:GetPlayingAnimationTracks() do
		local v908 = v_u_896[v907]
		if v908 == nil then
			local v909 = v907.Animation
			if v909 then
				v909 = string.match(v909.AnimationId, "%d+$")
			end
			v908 = v909 and v_u_888[v909] or false
			v_u_896[v907] = v908
		end
		if not v908 then
			continue
		end
		local v910 = v907.WeightCurrent
		local v911 = v_u_894[v907.Priority] or 2
		if v910 < 0.5 or v904 >= v911 and (v911 ~= v904 or v905 >= v910) then
			continue
		end
		v906 = v907
		v905 = v910
		v904 = v911
	end
	return v906
end
local function v_u_921(p913, p914, p915) -- name: legLearn
	local v916 = p913[p914]
	if v916 == nil then
		p913[p914] = p915
		return
	else
		local v917 = ((p915 - v916) % 1 + 0.5) % 1 - 0.5
		local v918 = "x" .. p914
		if math.abs(v917) <= 0.08 then
			p913[p914] = (v916 + v917 * 0.35) % 1
			p913[v918] = nil
		else
			local v919 = p913[v918]
			if v919 then
				local v920 = ((p915 - v919) % 1 + 0.5) % 1 - 0.5
				if math.abs(v920) <= 0.08 then
					p913[p914] = p915
					p913[v918] = nil
					return
				end
			end
			p913[v918] = p915
		end
	end
end
local function v_u_929(p922, p923) -- name: legTarget
	local v924 = p922.L
	local v925 = p922.R
	if v924 == nil and v925 == nil then
		return nil, 1
	else
		if v924 == nil then
			v924 = (v925 - 0.5) % 1
		end
		if v925 == nil then
			v925 = (v924 + 0.5) % 1
		end
		local v926 = (v925 - v924) % 1
		local v927 = (v926 < 0.3 or v926 > 0.7) and 0.5 or v926
		local v928 = (p923 - v924) % 1
		if v928 < v927 then
			return 0.0477464829275686 + 0.5 * v928 / v927, 0.5 / v927
		else
			return 0.5477464829275686 + 0.5 * (v928 - v927) / (1 - v927), 0.5 / (1 - v927)
		end
	end
end
local function v_u_957(p930, p931, p932) -- name: legClock
	-- upvalues: (copy) v_u_912, (ref) v_u_898, (copy) v_u_896, (ref) v_u_899, (copy) v_u_897, (copy) v_u_895, (copy) v_u_30, (ref) v_u_900, (copy) v_u_921, (copy) v_u_929, (copy) v_u_73, (ref) v_u_45, (ref) v_u_46
	if p930 then
		p930 = v_u_912(p930)
	end
	if not p930 then
		v_u_898 = nil
		return false
	end
	local v933 = p930.Length
	local v934 = p930.Speed
	if v933 < 0.1 or math.abs(v934) < 0.001 then
		return false
	end
	local v935 = v934 < 0
	local v936 = p930.TimePosition / v933 % 1
	if v935 then
		v936 = (1 - v936) % 1
	end
	local v937 = math.abs(v934) / v933
	local v938 = v_u_896[p930]
	local v939 = tostring(v938) .. (v935 and "<" or ">")
	if v939 ~= v_u_898 then
		v_u_898 = v939
		v_u_899 = p931
	end
	local v940 = v_u_897[v939]
	if not v940 then
		local v941 = p930.Animation
		if v941 then
			v941 = string.match(p930.Animation.AnimationId, "%d+$")
		end
		if v941 then
			v941 = v_u_895[v941 .. (v935 and "<" or ">")]
		end
		v940 = v941 and {
			["L"] = v941.L,
			["R"] = v941.R
		} or {}
		v_u_897[v939] = v940
	end
	local v942 = v_u_30("FootstepController", "getLocalStep")
	if type(v942) == "table" then
		local v943 = v942.n
		if type(v943) == "number" then
			local v944 = v942.t
			if type(v944) == "number" and v942.n ~= v_u_900 then
				v_u_900 = v942.n
				if p931 - v_u_899 >= 0.3 and (p931 - v942.t < 0.2 and (v942.foot == "L" or v942.foot == "R")) then
					v_u_921(v940, v942.foot, v936)
				end
			end
		end
	end
	local v945 = v_u_929
	local v946 = v_u_73.StepSyncLag
	local v947, v948 = v945(v940, (v936 - (type(v946) == "number" and v946 and v946 or 0) * v937) % 1)
	local v949 = p932 * v937 * v948
	v_u_45 = v_u_45 + v949
	if v947 then
		local v950 = (v947 - v_u_45 + 0.25) % 1 - 0.25
		local v951 = v_u_46
		local v952 = v949 * ((1 - math.clamp(v951, 0, 1)) * 3 + 1)
		local v953 = v_u_45
		local v954 = p932 * -8
		local v955 = v950 * (1 - math.exp(v954))
		local v956 = -0.3 * v949
		v_u_45 = v953 + math.clamp(v955, v956, v952)
	end
	v_u_45 = v_u_45 % 1000
	return true
end
function v_u_16._stepInfo() -- name: _stepInfo
	-- upvalues: (ref) v_u_45, (ref) v_u_901, (ref) v_u_898
	return v_u_45, v_u_901, v_u_898
end
local v_u_958 = 0
local function v_u_1330(p959) -- name: update
	-- upvalues: (ref) v_u_42, (copy) v_u_17, (copy) v_u_20, (ref) v_u_31, (copy) v_u_30, (copy) v_u_820, (copy) v_u_826, (ref) v_u_33, (ref) v_u_32, (ref) v_u_39, (copy) v_u_14, (ref) v_u_40, (ref) v_u_37, (ref) v_u_41, (copy) v_u_13, (copy) v_u_15, (ref) v_u_44, (ref) v_u_58, (ref) v_u_38, (copy) v_u_428, (copy) v_u_59, (copy) v_u_60, (copy) v_u_61, (copy) v_u_69, (copy) v_u_70, (ref) v_u_49, (copy) v_u_63, (ref) v_u_55, (ref) v_u_56, (copy) v_u_67, (copy) v_u_64, (copy) v_u_5, (ref) v_u_46, (copy) v_u_957, (ref) v_u_901, (copy) v_u_885, (ref) v_u_45, (copy) v_u_62, (copy) v_u_66, (copy) v_u_72, (ref) v_u_47, (ref) v_u_958, (copy) v_u_65, (copy) v_u_838, (copy) v_u_18, (copy) v_u_73, (copy) v_u_68, (copy) v_u_358, (copy) v_u_309, (ref) v_u_53, (ref) v_u_54, (ref) v_u_48, (ref) v_u_36, (copy) v_u_12, (ref) v_u_57, (copy) v_u_10, (copy) v_u_644, (copy) v_u_378, (copy) v_u_628, (copy) v_u_102, (ref) v_u_51, (ref) v_u_52, (copy) v_u_556, (copy) v_u_123, (copy) v_u_287, (copy) v_u_672, (copy) v_u_152, (copy) v_u_493, (copy) v_u_525, (copy) v_u_354, (copy) v_u_512, (copy) v_u_470, (copy) v_u_357, (copy) v_u_16, (copy) v_u_695, (copy) v_u_43
	local v960 = math.min(p959, 0.1)
	v_u_42 = nil
	local v961 = workspace.CurrentCamera
	local v962 = v961.CFrame
	local v963 = v_u_17.Character
	if not (v963 and (v963.Parent and v963:FindFirstChild("HumanoidRootPart"))) then
		v963 = nil
	end
	local v964 = v_u_20.CameraController
	if not v964 then
		local v965 = script.Parent:FindFirstChild("CameraController")
		if v965 then
			local v966 = require
			local v967
			v967, v964 = pcall(v966, v965)
			if v967 and type(v964) == "table" then
				v_u_20.CameraController = v964
			else
				v964 = nil
			end
		else
			v964 = nil
		end
	end
	if v964 and v964.getMode then
		local v968 = v964.getMode
		local v969, v970 = pcall(v968)
		if v969 and type(v970) == "string" then
			v_u_31 = v970
		end
	end
	local v971
	if v_u_31 == "Vehicle" and v963 ~= nil then
		v971 = v_u_30("VehicleController", "isWindowFP") == true
	else
		v971 = false
	end
	if v971 and v_u_30("CameraController", "isADS") == true then
		v_u_31 = "ADS"
	end
	local v972 = v_u_31
	local v973
	if v972 == "ADS" or v972 == "FPP" then
		v973 = true
	elseif v972 == "Free" then
		v973 = v_u_30("CameraController", "isFPP") == true
	else
		v973 = false
	end
	local v974
	if v973 or v971 then
		v974 = v_u_820(v963, v971)
	else
		v974 = v971
	end
	if v963 and v974 then
		v_u_826(v963)
	end
	local v975 = v_u_33
	local v976 = v_u_32 and v_u_32.time or (v975 and v975.stats and (v975.stats.adsTime or 0.25) or 0.25)
	local v977 = v_u_39
	local v978 = v_u_31 == "ADS" and (v975 and (v975.stats and v975.stats.isGun)) and 1 or 0
	if v976 > 0 then
		local v979 = v960 / v976
		if v977 < v978 then
			local v980 = v977 + v979
			v978 = math.min(v978, v980)
		else
			local v981 = v977 - v979
			v978 = math.max(v978, v981)
		end
	end
	v_u_39 = v978
	local v982 = v_u_14.smooth(v_u_39)
	if v975 and v975.skinFx then
		local v_u_983 = v982 < 0.12
		if v975.skinFxOn ~= v_u_983 then
			v975.skinFxOn = v_u_983
			for _, v_u_984 in v975.skinFx do
				pcall(function()
					-- upvalues: (copy) v_u_984, (copy) v_u_983
					v_u_984.Enabled = v_u_983
				end)
				if v_u_983 or not v_u_984:IsA("ParticleEmitter") then
					continue
				end
				pcall(function()
					-- upvalues: (copy) v_u_984
					v_u_984:Clear()
				end)
			end
		end
	end
	local v985 = v971 or v_u_30("CameraController", "isFPP") == true
	local v986
	if v963 then
		v986 = v963:FindFirstChild("Head")
	else
		v986 = v963
	end
	local v987 = v986 == nil and true or (v962.Position - v986.Position).Magnitude < 3.2
	local v988 = v_u_30("CameraController", "getEyeAlpha")
	if v974 then
		if v987 then
			if not v985 then
				if v_u_31 == "ADS" and v982 <= 0.55 then
					if type(v988) == "number" then
						v985 = v988 > 0.75
					else
						v985 = false
					end
				else
					v985 = true
				end
			end
		else
			v985 = v987
		end
	else
		v985 = v974
	end
	if not (v985 and v963) then
		if v_u_40 then
			v_u_40 = false
			if v_u_37 then
				v_u_37.Parent = nil
			end
		end
		if v_u_41 then
			v_u_41 = false
			v_u_13.hide()
		end
		v_u_15.hide()
		v_u_44 = v962
		v_u_58 = CFrame.identity
		return
	end
	local v989 = v963:GetAttribute("UsingItem")
	if type(v989) == "string" then
		if not v_u_38 or v_u_38.id ~= v989 then
			if v_u_38 then
				v_u_38.model:Destroy()
			end
			v_u_38 = v_u_428(v989)
		end
	elseif v_u_38 then
		v_u_38.model:Destroy()
		v_u_38 = nil
	end
	local v990
	if v_u_37 then
		v990 = v_u_37
	else
		v990 = Instance.new("Model")
		v990.Name = "Viewmodel"
		v_u_37 = v990
	end
	if v_u_40 then
		if v990.Parent ~= v961 then
			v990.Parent = v961
		end
	else
		v_u_40 = true
		v990.Parent = v961
	end
	local v991 = os.clock()
	if v_u_44 then
		local v992, v993 = v_u_44:ToObjectSpace(v962):ToEulerAnglesYXZ()
		if math.abs(v992) < 0.5 and math.abs(v993) < 0.5 then
			local v994 = 2.6 * (1 - 0.82 * v982)
			local v995 = v_u_59
			local v996 = -math.deg(v992)
			local v997 = -math.deg(v993)
			local v998 = -math.deg(v993) * 0.9
			v995:impulse(Vector3.new(v996, v997, v998) * v994)
		end
	end
	v_u_44 = v962
	v_u_59:update(v960)
	v_u_60:update(v960)
	v_u_61:update(v960)
	v_u_69:update(v960)
	v_u_70:update(v960)
	local v999 = v963:FindFirstChild("HumanoidRootPart")
	local v1000 = v963:FindFirstChildOfClass("Humanoid")
	local v1001 = v963:GetAttribute("InVehicle") == true
	local v1002 = v999 and not v1001 and (v999.AssemblyLinearVelocity or Vector3.new(0, 0, 0)) or Vector3.new(0, 0, 0)
	local v1003 = v1002.X
	local v1004 = v1002.Z
	local v1005 = Vector3.new(v1003, 0, v1004)
	local v1006 = v1005.Magnitude
	local v1007 = v1000 ~= nil and not v1001
	if v1007 then
		v1007 = v1000.FloorMaterial == Enum.Material.Air
	end
	if v_u_49 and not v1007 then
		local v1008 = -v1002.Y
		local v1009 = math.clamp(v1008, 0, 150)
		local v1010 = v_u_63
		local v1011 = v1009 * 0.1
		v1010:impulse((math.clamp(v1011, 0, 5)))
		v_u_55 = v991
		local v1012 = v1009 / 60 + 0.35
		v_u_56 = math.clamp(v1012, 0.35, 1.6)
		local v1013 = v_u_67
		local v1014 = (v1009 - 6) / 40
		local v1015 = math.clamp(v1014, 0.15, 1.3)
		local v1016 = v1013.speed
		local v1017 = v1013.damper
		local v1018
		if v1017 >= 0.999 then
			v1018 = 0.36787944117144233
		else
			local v1019 = 1 - v1017 * v1017
			local v1020 = math.sqrt(v1019)
			local v1021 = -v1017 / v1020 * math.atan2(v1020, v1017)
			v1018 = math.exp(v1021)
		end
		v1013:impulse(v1015 * (v1016 / v1018))
	elseif not v_u_49 and (v1007 and v1002.Y > 4) then
		v_u_64:impulse(-40)
	end
	v_u_49 = v1007
	v_u_63:update(v960)
	v_u_64:update(v960)
	v_u_67:update(v960)
	local v1022 = v_u_5.toMeters(v1006)
	local v1023
	if v1007 then
		v1023 = 0
	else
		local v1024 = v1022 / 4.7
		v1023 = math.clamp(v1024, 0, 1.35) or 0
	end
	local v1025 = v_u_46
	local v1026 = v1023 - v_u_46
	local v1027 = v960 * 7
	v_u_46 = v1025 + v1026 * math.min(1, v1027)
	if v_u_957(v963, v991, v960) then
		v_u_901 = "track"
	else
		v_u_901 = "steps"
		v_u_885(v991, v960, v1022, v1007)
	end
	local v1028 = v_u_45 * 2 * 3.141592653589793
	local v1029 = math.sin(v1028)
	math.cos(v1028)
	local v1030 = 2 * v1028
	local v1031 = math.cos(v1030)
	local v1032 = v1000 and not v1001 and (v1000.MoveDirection or Vector3.new(0, 0, 0)) or Vector3.new(0, 0, 0)
	local v1033 = v962.RightVector:Dot(v1032)
	v_u_62.target = math.abs(v1033) > 0.3 and not v1007 and (math.sign(v1033) * -5 or 0) or 0
	v_u_62:update(v960)
	local v1034 = v_u_66
	local v1035 = -math.clamp(v1033, -1, 1) * (v_u_72.StrafeRoll or 1.4)
	local v1036 = v1022 / 3
	v1034.target = v1035 * math.clamp(v1036, 0, 1)
	v_u_66:update(v960)
	local v1037 = v_u_30("WeaponController", "wantsFire") == true
	local v1038
	if v963:GetAttribute("Sprinting") == true and v_u_31 ~= "ADS" then
		v1038 = not v1037
	else
		v1038 = false
	end
	local v1039 = v_u_47
	local v1040 = v1038 and 1 or 0
	local v1041 = v1038 and 0.22 or 0.12
	if v1041 > 0 then
		local v1042 = v960 / v1041
		if v1039 < v1040 then
			local v1043 = v1039 + v1042
			v1040 = math.min(v1040, v1043)
		else
			local v1044 = v1039 - v1042
			v1040 = math.max(v1040, v1044)
		end
	end
	v_u_47 = v1040
	local v1045 = v_u_14.smooth(v_u_47)
	v_u_958 = v_u_958 + v960
	if v975 and v_u_958 > 0.1 then
		v_u_958 = 0
		v_u_65.target = v975.stats and v975.stats.isGun and (v_u_838(v975, v962) or 0) or 0
	end
	v_u_65:update(v960)
	local v1046 = 1 - (1 - (v_u_72.ADSScale or 0.3)) * v982
	local v1047 = v_u_46
	local v1048 = math.min(v1047, 1.3) * v1046 * (v1007 and 0 or 1)
	local v1049 = v991 * 1.5707963267948966
	local v1050 = v_u_46
	local v1051 = (1 - math.min(v1050, 1)) * (1 - v982)
	local v1052 = -(v_u_72.BobY or 0.045) * (1 - v1031) * 0.5 * v1048 - v_u_67.position * (v_u_72.LandY or 0.18)
	local v1053 = -(v_u_72.BobPitch or 0.35) * (1 - v1031) * 0.5 * v1048 - v_u_67.position * (v_u_72.LandPitch or 2.2) + (v_u_72.Breath or 0.12) * math.sin(v1049) * v1051
	local v1054 = (v_u_72.BobRoll or 0.45) * v1029 * v1048 + v_u_66.position * v1046
	v_u_58 = CFrame.new(0, v1052, 0) * CFrame.Angles(v_u_18(v1053), 0, (v_u_18(v1054)))
	v961.CFrame = v962 * v_u_58
	local v1055 = v_u_59.position
	local v1056 = v_u_61.position + v_u_70.position
	local v1057 = v_u_60.position + v_u_69.position
	local v1058 = 1 - 0.85 * v982
	local v1059 = v_u_46
	local v1060 = math.min(v1059, 1.3) * v1058 * (1 - v1045)
	local v1061 = v_u_46
	local v1062 = math.min(v1061, 1.3) * v1045 * (1 - v982)
	local v1063 = v1028 - 0.55
	local v1064 = math.sin(v1063)
	local v1065 = math.cos(v1063)
	local v1066 = v1028 - 0.3
	local v1067 = math.sin(v1066)
	local v1068 = (1 - math.abs(v1067)) ^ 3
	local v1069 = v_u_73.Variation
	local v1070 = 1 + (type(v1069) == "number" and v1069 and v1069 or 0.16) * math.noise(v_u_45 * 0.9, 3.1)
	local v1071 = v_u_46
	local v1072 = math.min(v1071, 1.3) * v1058
	local v1073 = v_u_73.Drift
	local v1074 = v1072 * (type(v1073) == "number" and v1073 and v1073 or 1)
	local v1075 = math.noise(v991 * 0.7, 11.3) * v1074
	local v1076 = math.noise(v991 * 0.62, 27.9) * v1074
	local v1077 = math.noise(v991 * 0.55, 43.7) * v1074
	local v1078 = v962:VectorToObjectSpace(v1005)
	v_u_68.target = v1078
	v_u_68:update(v960)
	local v1079 = (v1078 - v_u_68.position) * v1058
	local v1080 = v1079.X
	local v1081 = math.clamp(v1080, -25, 25)
	local v1082 = v1079.Z
	local v1083 = math.clamp(v1082, -25, 25)
	local v1084 = Vector3.new(v1081, 0, v1083)
	local v1085 = v_u_73.InertiaPos
	local v1086 = type(v1085) == "number" and v1085 and v1085 or 0.0028
	local v1087 = v_u_73.InertiaRot
	local v1088 = type(v1087) == "number" and v1087 and v1087 or 0.12
	local v1089 = v_u_73.WalkSide
	local v1090 = (type(v1089) == "number" and v1089 and v1089 or 0.05) * v1064 * v1060
	local v1091 = v_u_73.RunSide
	local v1092 = (v1090 + (type(v1091) == "number" and v1091 and v1091 or 0.055) * v1065 * v1062) * v1070 - v1084.X * v1086 + 0.006 * v1075
	local v1093 = v_u_73.WalkDown
	local v1094 = -(type(v1093) == "number" and v1093 and v1093 or 0.022) * (1 - v1031) * v1060
	local v1095 = v_u_73.WalkStep
	local v1096 = v1094 - (type(v1095) == "number" and v1095 and v1095 or 0.016) * v1068 * v1060
	local v1097 = v_u_73.RunDown
	local v1098 = v1096 - (type(v1097) == "number" and v1097 and v1097 or 0.02) * v1031 * v1062
	local v1099 = v_u_73.RunStep
	local v1100 = (v1098 - (type(v1099) == "number" and v1099 and v1099 or 0.016) * v1068 * v1062) * v1070
	local v1101 = v_u_73.BreathY
	local v1102 = v1100 + (type(v1101) == "number" and v1101 and v1101 or 0.006) * math.sin(v1049) * v1051 + 0.005 * v1076
	local v1103 = v_u_73.WalkPush
	local v1104 = (type(v1103) == "number" and v1103 and v1103 or 0.008) * v1068 * v1060
	local v1105 = v_u_73.RunPush
	local v1106 = v1104 + (type(v1105) == "number" and v1105 and v1105 or 0.012) * v1068 * v1062 - v1084.Z * v1086 * 0.86
	local v1107 = v_u_73.WalkYaw
	local v1108 = -(type(v1107) == "number" and v1107 and v1107 or 1.8) * v1064 * v1060
	local v1109 = v_u_73.RunYaw
	local v1110 = (v1108 - (type(v1109) == "number" and v1109 and v1109 or 2.4) * v1065 * v1062) * v1070 + 0.7 * v1075 + v1084.X * v1088
	local v1111 = v_u_73.WalkRoll
	local v1112 = -(type(v1111) == "number" and v1111 and v1111 or 2.6) * v1064 * v1060
	local v1113 = v_u_73.RunRoll
	local v1114 = (v1112 - (type(v1113) == "number" and v1113 and v1113 or 3.2) * v1064 * v1062) * v1070 + 0.8 * v1077 - v1084.X * v1088 * 1.5
	local v1115 = v_u_73.BreathPitch
	local v1116 = (type(v1115) == "number" and v1115 and v1115 or 0.9) * math.sin(v1049) * v1051 + (1 - v1031) * 0.2 * v1060
	local v1117 = v_u_73.WalkPitch
	local v1118 = v1116 - (type(v1117) == "number" and v1117 and v1117 or 0.9) * v1068 * v1060
	local v1119 = v_u_73.RunPitch
	local v1120 = v1118 - (type(v1119) == "number" and v1119 and v1119 or 1.1) * v1068 * v1062 + 0.6 * v1076 + v1084.Z * v1088 * 0.83
	local v1121 = v991 - v_u_55
	local v1122
	if v1121 < 0.8 then
		local v1123 = v_u_73.Land
		local v1124 = -(type(v1123) == "number" and v1123 and v1123 or 0.22) * v_u_56
		local v1125 = v1121 * -12
		local v1126 = v1124 * math.exp(v1125)
		local v1127 = v1121 * 20
		v1122 = v1126 * math.sin(v1127) * (1 - 0.7 * v982)
	else
		v1122 = 0
	end
	local v1128 = v_u_73.MouseLag
	local v1129 = type(v1128) == "number" and v1128 and v1128 or 0.006
	local v1130 = -v1055.Y * v1129
	local v1131 = v1055.X * v1129
	local v1132 = Vector3.new(v1130, v1131, 0) * (1 - 0.85 * v982)
	local v1133 = CFrame.new
	local v1134 = v1102 + v1122 - v_u_63.position * 0.05
	local v1135 = Vector3.new(v1092, v1134, v1106) + v1132
	local v1136 = v1057.X
	local v1137 = math.clamp(v1136, -0.12, 0.12)
	local v1138 = v1057.Y
	local v1139 = math.clamp(v1138, -0.12, 0.12)
	local v1140 = v1057.Z
	local v1141 = math.clamp(v1140, -0.06, 0.5)
	local v1142 = v1133(v1135 + Vector3.new(v1137, v1139, v1141))
	local v1143
	if v975 then
		v1143 = v_u_358.camOffset(v975.id) or nil
	else
		v1143 = nil
	end
	if v1143 and v982 < 1 then
		v1142 = CFrame.identity:Lerp(v1143:Inverse(), 1 - v982) * v1142
	end
	local v1144 = v_u_62.position * (1 - 0.7 * v982)
	if math.abs(v1144) > 0.01 then
		v1142 = v1142 * CFrame.new(Vector3.new(0, -0.63, -0.25)) * CFrame.Angles(0, 0, (v_u_18(v1144))) * CFrame.new(Vector3.new(-0, 0.63, 0.25))
	end
	local v1145 = 1 - 0.8 * v982
	local v1146 = CFrame.Angles
	local v1147 = v1055.X * v1145 + v1056.X + v1120 + (v_u_64.position - v_u_63.position * 1.2) * v1058
	local v1148 = v_u_18((math.clamp(v1147, -18, 18)))
	local v1149 = v1055.Y * v1145 + v1056.Y + v1110
	local v1150 = v_u_18((math.clamp(v1149, -18, 18)))
	local v1151 = v1055.Z * v1145 + v1056.Z + v1114
	local v1152 = v1146(v1148, v1150, (v_u_18((math.clamp(v1151, -20, 20)))))
	local v1153
	if v975 and (v975.optic and (v975.scope or v975.reflex)) and (v975.stats and v975.stats.isGun) then
		local v1154 = (v982 - 0.6) / 0.3
		v1153 = math.clamp(v1154, 0, 1)
	else
		v1153 = 0
	end
	local v1155 = CFrame.identity
	local v1156
	if v1153 > 0 then
		v1152, v1142, v1155 = v_u_309(v975, v1153, v1152, v1142, v_u_58, v1056, v1057, v1110, v1114, v1092, v1122 - v_u_63.position * 0.05)
		v1156 = v962 * v1155
	else
		v1156 = v962
	end
	local v1157 = v_u_54
	local v1158 = (v991 - v_u_53) / math.max(v1157, 0.05)
	local v1159 = math.clamp(v1158, 0, 1)
	local v1160 = v_u_48
	local v1161 = v_u_38 == nil and 0 or 1
	local v1162 = v960 / 0.25
	local v1163
	if v1160 < v1161 then
		local v1164 = v1160 + v1162
		v1163 = math.min(v1161, v1164)
	else
		local v1165 = v1160 - v1162
		v1163 = math.max(v1161, v1165)
	end
	v_u_48 = v1163
	local v1166 = (1 - v1159) ^ 2.2
	local v1167 = v_u_14.smooth
	local v1168 = v_u_48
	local v1169 = math.max(v1166, v1167(v1168))
	local v1170
	if v_u_36 then
		v1170 = v_u_36
	else
		local v1171 = v_u_12.new
		local v1172
		if v_u_37 then
			v1172 = v_u_37
		else
			v1172 = Instance.new("Model")
			v1172.Name = "Viewmodel"
			v_u_37 = v1172
		end
		local v1173, v1174 = pcall(v1171, v1172)
		if v1173 and v1174 then
			v_u_36 = v1174
			v_u_57 = 0
		elseif not v1173 then
			warn("[ViewmodelController] m\195\162inile: " .. tostring(v1174))
		end
		v1170 = v_u_36
	end
	local v1175 = nil
	local v1176 = nil
	local v1177 = {}
	local v1178 = nil
	local v1179, v1180, v1181, v1182, v1183, v1184, v1185, v1186, v1187, v1188, v1189, v1190, v1191, v1192, v1193, v1194, v1195, v1196, v1197, v1198, v1199, v1200, v1201, v1202, v1203, v1204, v1205, v1206, v1207, v1208, v1209, v1210, v1211, v1212, v1213, v1214, v1215, v1216, v1217, v1218
	if v975 then
		local v1219 = v975.stats
		local v1220 = nil
		local v1221
		if v1219.isGun then
			if v975.optic then
				local v1222 = v_u_14.adsRoot
				local v1223 = v975.aimRel
				local v1224
				if v975.optic and v975.eyeR then
					if v975.kind == "Pistol" then
						v1224 = v975.eye
					else
						local v1225 = v_u_10.eyeDist(v975.opticId, v975.eyeR, (v_u_644(v975)))
						v1224 = math.max(v1225, 0.16) - (v975.relief or 0)
					end
				else
					v1224 = v975.eye
				end
				v975.adsRoot = v1222(v1223, v1224)
			end
			local v1226 = v982 * 3.141592653589793
			local v1227 = math.sin(v1226)
			local v1228 = CFrame.new((v1143 and 0 or 0.1) * (1 - v982), 0, 0)
			local v1229 = v_u_378(v975)
			v1221 = (v1228 * (v1229.hold and v1229.hold.gun or v975.hip)):Lerp(v975.adsRoot, v982) * CFrame.new(0, v1227 * -0.0175, v1227 * 0.01) * CFrame.Angles(v_u_18(v1227 * -0.75), 0, (v_u_18(v1227 * -2.5)))
			v1220 = v_u_628(v975, v991)
		elseif v1219.isMelee then
			local v1230 = v_u_30("MeleeController", "getState")
			v1221 = v975.hip
			if type(v1230) == "table" and v1230.kind == "Swing" then
				local v1231 = v1230.t0
				if type(v1231) == "number" then
					local v1232 = v991 - v1230.t0
					local v1233 = v1230.dur or 0.6
					local v1234 = v1232 / math.max(v1233, 0.1)
					if v1234 >= 0 and v1234 <= 1 then
						v1221 = v_u_14.swing(v1234, v1230.variant or 1)
					end
				end
			end
		else
			local v1235 = v_u_30("ThrowableController", "getState")
			local v1236 = 0
			local v1237, v1238
			if type(v1235) == "table" then
				v1237 = v1235.phase or "Idle"
				v1238 = v1235.underhand == true
				if v1237 == "Throw" then
					local v1239 = v1235.t0
					if type(v1239) == "number" then
						local v1240 = (v991 - v1235.t0) / 0.45
						v1236 = math.clamp(v1240, 0, 1)
					end
				end
			else
				v1237 = "Idle"
				v1238 = false
			end
			v1221 = v_u_14.throwable(v1237, v1238, v1236)
			local v1241
			if type(v1235) == "table" then
				v1241 = v1235.hidden == true
			else
				v1241 = false
			end
			v975.hiddenThrown = v1241
		end
		if v_u_47 > 0 then
			local v1242 = CFrame.identity
			local v1243 = v_u_378(v975)
			local v1244
			if v1243.sprint then
				local v1245 = v_u_378(v975)
				v1244 = (v1245.hold and v1245.hold.gun or v975.hip):Inverse() * v1243.sprint.gun
			else
				v1244 = v_u_14.sprint(v975.kind)
			end
			v1221 = v1221 * v1242:Lerp(v1244, v1045 * (1 - v982))
		end
		if v_u_65.position > 0.01 then
			local v1246 = v_u_65.position
			local v1247 = math.clamp(v1246, 0, 1)
			v1221 = v1221 * CFrame.new(0, -0.25 * v1247, v1247 * 0.55) * CFrame.Angles(-0.6108652381980153 * v1247, 0.4363323129985824 * v1247, 0.17453292519943295 * v1247)
		end
		if v1220 and v1220.gun then
			v1221 = v1221 * (v1153 > 0 and CFrame.identity:Lerp(v1220.gun, 1 - v1153 * 0.9) or v1220.gun)
		end
		if v1169 > 0.001 then
			v1221 = v1221:Lerp(v_u_14.LOWERED, v1169)
		end
		local v1248 = v_u_54
		local v1249 = (v991 - v_u_53) / math.max(v1248, 0.05)
		if v1249 > 0.55 and v1249 < 1.3 then
			local v1250 = (v1249 - 0.55) / 0.75
			local v1251 = math.clamp(v1250, 0, 1) * 3.141592653589793
			local v1252 = math.sin(v1251) * (1 - v982)
			v1221 = v1221 * CFrame.new(0, -0.018 * v1252, 0.015 * v1252) * CFrame.Angles(v_u_18(-1.8 * v1252), v_u_18(0.9 * v1252), (v_u_18(1.8 * v1252)))
		end
		v975.viewRel = v_u_58:Inverse() * v1155 * v1142 * v1221 * v1152
		local v1253 = v_u_102(v961.CFrame, v975.viewRel)
		v1178 = v1219.isGun and (v_u_378(v975).any or v1220 and v1220.clipArms) and {
			["vm"] = v975,
			["root"] = v1253,
			["out"] = v1220,
			["a"] = v982,
			["sp"] = v1045 * (1 - v982)
		} or v1178
		local v1254 = v1220 and (v1220.motors or {}) or {}
		local v1255 = v975.info
		if v1255.slide and not v1254[v1255.slide] then
			local v1256 = (v991 - v_u_51) / 0.09
			local v1257 = math.clamp(v1256, 0, 1)
			local v1258
			if (v_u_30("WeaponController", "getAmmo") or 1) <= 0 then
				v1258 = v1219.isGun
			else
				v1258 = false
			end
			if v1258 and v991 - v_u_53 > 0.1 then
				v1254[v1255.slide] = CFrame.new(0, 0, v975.slideTravel)
			elseif v1257 < 1 then
				local v1259 = v1255.slide
				local v1260 = CFrame.new
				local v1261 = v975.slideTravel
				local v1262 = v1257 * 3.141592653589793
				v1254[v1259] = v1260(0, 0, v1261 * math.sin(v1262))
			end
		end
		if v1255.bolt and not (v975.boltAction or v1254[v1255.bolt]) then
			local v1263 = (v991 - v_u_52) / 0.07
			local v1264 = math.clamp(v1263, 0, 1)
			if v1264 < 1 then
				local v1265 = v1255.bolt
				local v1266 = CFrame.new
				local v1267 = v975.boltTravel
				local v1268 = v1264 * 3.141592653589793
				v1254[v1265] = v1266(0, 0, v1267 * math.sin(v1268))
			end
		end
		v_u_556(v975, v1254)
		v_u_123(v975, v1253, v961.CFrame, v975.viewRel)
		if v1255.mag then
			v1255.mag.LocalTransparencyModifier = v1220 and v1220.magHidden and 1 or 0
		end
		if v975.optic then
			v_u_287(v975, (not v1219.isGun or (v1169 >= 0.5 or not v982)) and 0 or v982)
		end
		local v1269 = v975.model
		local v1270
		if v975.hiddenThrown or not v990 then
			v1270 = nil
		else
			v1270 = v990
		end
		v1269.Parent = v1270
		local v1271 = v1219.isGun and v975.optic
		if v1271 then
			if v982 > 0.6 then
				v1271 = v975.scope or v975.reflex
			else
				v1271 = false
			end
		end
		local v1272
		if v1271 then
			local v1273 = v_u_672
			local v1274 = (v982 - 0.6) / 0.35
			v1272 = v1273(v975, v961, (math.clamp(v1274, 0, 1))) or nil
		else
			v1272 = nil
		end
		if v975.scope and v1272 then
			v_u_41 = true
			if v975.meshReticle then
				if v_u_13.isShown() then
					v_u_13.hide()
				end
				if v975.bdc then
					local v1275 = v_u_30("WeaponController", "getZeroing") or 100
					if v1275 ~= v975.bdc.zero then
						v_u_152(v975, v1275)
					end
				end
			else
				v_u_13.show(v1219, v_u_30("WeaponController", "getZeroing") or 100)
				v_u_13.update(v960, v1272)
			end
		elseif v_u_41 then
			v_u_41 = false
			v_u_13.hide()
		end
		if v975.reflex and (v1272 and not v975.meshReticle) then
			v_u_15.update(v1272)
		else
			v_u_15.hide()
		end
		if v975.scope and (v1272 and v1220) and (v1220.right ~= nil and v1220.right ~= "grip" or v1220.left ~= nil and v1220.left ~= "grip") then
			v_u_42 = v1272
		end
		local v1276 = v1220 and (v1220.left or "grip") or "grip"
		local v1277 = v1220 and (v1220.right or "grip") or "grip"
		if v1219.isMelee then
			v1276 = nil
		end
		if v1219.isThrowable then
			local v1278 = v_u_30("ThrowableController", "getState")
			v1276 = type(v1278) == "table" and v1278.pinPull and "pin" or nil
		end
		local v1279 = v975.hands or v_u_14.hands(v975.kind)
		local v1280 = v1156 * v1142
		local v1281, v1282, v1283 = v_u_493(v975, v1280, v982)
		v975.graspR = v975.root.CFrame:ToObjectSpace(v1283)
		v1175 = v_u_525(v975, v1277)
		if v1175 then
			if v1277 == "grip" then
				v1175 = v1283
			end
		end
		if v1276 == "pin" then
			local _ = v975.info
			v1176 = v975.root.CFrame * (v975.pinAt or CFrame.new(-0.12, 0.1, -0.15))
			local v1284 = os.clock() - (v975.thT0 or os.clock())
			local v1285 = v_u_354.io(v1284 / 0.12) * (1 - v_u_354.io((v1284 - 0.27) / 0.08))
			if v1285 < 0.999 then
				v1176 = (v962 * v_u_14.LEFT_DOWN):Lerp(v1176, v1285)
			end
		elseif v1276 then
			v1176 = v_u_512(v975, v1276, v962, v1220)
		end
		local v1286, v1287, v1288, v1289, v1290, v1291, v1292, v1293, v1294, v1295
		if v1277 == "bolt" then
			local v1296 = v975.actRK or 1
			v1286 = math.clamp(v1296, 0, 1)
			if v1286 then
				if v1279.actElbowR and v1286 > 0 then
					v1281 = v1281:Lerp(v1279.actElbowR, v1286)
				end
				if v1277 == "grip" or not v1283 then
					v1283 = nil
				end
				if v1175 and v1283 then
					v1287 = v1280:PointToObjectSpace(v1175.Position) - v1280:PointToObjectSpace(v1283.Position)
					v1288 = v1287.X * 0.8
					v1289 = v1287.Y * 0.6
					v1290 = v1287.Z * 0.4
					v1281 = v1281 + Vector3.new(v1288, v1289, v1290)
				end
				v1177.elbowR = v1280 * v1281
				if v1276 == "grip" then
					v1291 = nil
				else
					v1291 = v_u_470(v975, nil, nil) or nil
				end
				if v1176 and v1291 then
					v1292 = v1280:PointToObjectSpace(v1176.Position) - v1280:PointToObjectSpace(v1291.Position)
					v1293 = v1292.X * 0.8
					v1294 = v1292.Y * 0.6
					v1295 = v1292.Z * 0.4
					v1282 = v1282 + Vector3.new(v1293, v1294, v1295)
				end
				v1177.elbowL = v1280 * v1282
				if v_u_38 then
					v1179 = v_u_30("HealController", "getState")
					v1180 = 0
					v1181 = 0
					if type(v1179) == "table" then
						v1182 = v1179.startedAt
						if type(v1182) == "number" then
							v1183 = workspace:GetServerTimeNow()
							v1181 = v1183 - v1179.startedAt
							v1184 = (v1179.endsAt or v1183) - v1179.startedAt
							v1185 = v1181 / math.max(v1184, 0.05)
							v1180 = math.clamp(v1185, 0, 1)
						end
					end
					v1186 = v_u_357.apply
					v1187 = v_u_38
					v1188 = v962 * v1142
					v1189, v1190 = pcall(v1186, v1187, v1180, v1181, v1188)
					if v1189 and v1190 then
						v1176 = v1190.left
						v1175 = v1190.right
						v1191 = v1190.elbowL
						v1192 = v1190.elbowR
						v1177.elbowL = v1191
						v1177.elbowR = v1192
					else
						v1176 = v962 * v1142 * v_u_14.ITEM_LEFT
						v_u_38.root.CFrame = v1176 * v_u_38.center:Inverse()
						v1175 = v962 * v1142 * v_u_14.ITEM_RIGHT
					end
					v_u_38.model.Parent = v990
				end
				if v1170 then
					v1193 = v1175 ~= nil and true or v1176 ~= nil
					v1170:setVisible(v1193)
					if v1193 then
						v_u_57 = v_u_57 - v960
						if v_u_57 <= 0 then
							v_u_57 = 2.5
							v1194 = v1170.setSkin
							pcall(v1194, v1170, v963)
						end
						v1195, v1196 = v1170:solve(v962, v1175, v1176, v1177)
						if v1178 and not v_u_38 then
							v1197 = v_u_16._armOverride
							v1198, v1199, v1200 = pcall(v1197, v1178, v1170, v1195, v1196)
							if not v1198 then
								v1200 = v1196
								v1199 = v1195
							end
						else
							v1200 = v1196
							v1199 = v1195
						end
						v1201 = v_u_42 and (v1199 and v_u_695(v961, v1199, v1170.R.Size, v_u_42)) and 1 or 0
						v1202 = v_u_42 and (v1200 and v_u_695(v961, v1200, v1170.L.Size, v_u_42)) and 1 or 0
						v1203 = v_u_43
						v1204 = v_u_43.R
						v1205 = v960 / 0.06
						if v1204 < v1201 then
							v1206 = v1204 + v1205
							v1207 = math.min(v1201, v1206)
						else
							v1208 = v1204 - v1205
							v1207 = math.max(v1201, v1208)
						end
						v1203.R = v1207
						v1209 = v_u_43
						v1210 = v_u_43.L
						v1211 = v960 / 0.06
						if v1210 < v1202 then
							v1212 = v1210 + v1211
							v1213 = math.min(v1202, v1212)
						else
							v1214 = v1210 - v1211
							v1213 = math.max(v1202, v1214)
						end
						v1209.L = v1213
						v1215 = v1170.setFade
						v1216 = v_u_43.R
						pcall(v1215, v1170, "R", v1216)
						v1217 = v1170.setFade
						v1218 = v_u_43.L
						pcall(v1217, v1170, "L", v1218)
						v1170:place(v1199, v1200)
						v1170:placeHelpers(v962 * CFrame.new(0, -1.4 * v1170.s, 0.2 * v1170.s), v_u_58)
					end
				end
			else
				v1286 = v1277 == "grip" and 0 or 1
				if v1279.actElbowR and v1286 > 0 then
					v1281 = v1281:Lerp(v1279.actElbowR, v1286)
				end
				if v1277 == "grip" or not v1283 then
					v1283 = nil
				end
				if v1175 and v1283 then
					v1287 = v1280:PointToObjectSpace(v1175.Position) - v1280:PointToObjectSpace(v1283.Position)
					v1288 = v1287.X * 0.8
					v1289 = v1287.Y * 0.6
					v1290 = v1287.Z * 0.4
					v1281 = v1281 + Vector3.new(v1288, v1289, v1290)
				end
				v1177.elbowR = v1280 * v1281
				if v1276 == "grip" then
					v1291 = nil
				else
					v1291 = v_u_470(v975, nil, nil) or nil
				end
				if v1176 and v1291 then
					v1292 = v1280:PointToObjectSpace(v1176.Position) - v1280:PointToObjectSpace(v1291.Position)
					v1293 = v1292.X * 0.8
					v1294 = v1292.Y * 0.6
					v1295 = v1292.Z * 0.4
					v1282 = v1282 + Vector3.new(v1293, v1294, v1295)
				end
				v1177.elbowL = v1280 * v1282
				if v_u_38 then
					v1179 = v_u_30("HealController", "getState")
					v1180 = 0
					v1181 = 0
					if type(v1179) == "table" then
						v1182 = v1179.startedAt
						if type(v1182) == "number" then
							v1183 = workspace:GetServerTimeNow()
							v1181 = v1183 - v1179.startedAt
							v1184 = (v1179.endsAt or v1183) - v1179.startedAt
							v1185 = v1181 / math.max(v1184, 0.05)
							v1180 = math.clamp(v1185, 0, 1)
						end
					end
					v1186 = v_u_357.apply
					v1187 = v_u_38
					v1188 = v962 * v1142
					v1189, v1190 = pcall(v1186, v1187, v1180, v1181, v1188)
					if v1189 and v1190 then
						v1176 = v1190.left
						v1175 = v1190.right
						v1191 = v1190.elbowL
						v1192 = v1190.elbowR
						v1177.elbowL = v1191
						v1177.elbowR = v1192
					else
						v1176 = v962 * v1142 * v_u_14.ITEM_LEFT
						v_u_38.root.CFrame = v1176 * v_u_38.center:Inverse()
						v1175 = v962 * v1142 * v_u_14.ITEM_RIGHT
					end
					v_u_38.model.Parent = v990
				end
				if v1170 then
					v1193 = v1175 ~= nil and true or v1176 ~= nil
					v1170:setVisible(v1193)
					if v1193 then
						v_u_57 = v_u_57 - v960
						if v_u_57 <= 0 then
							v_u_57 = 2.5
							v1194 = v1170.setSkin
							pcall(v1194, v1170, v963)
						end
						v1195, v1196 = v1170:solve(v962, v1175, v1176, v1177)
						if v1178 and not v_u_38 then
							v1197 = v_u_16._armOverride
							v1198, v1199, v1200 = pcall(v1197, v1178, v1170, v1195, v1196)
							if not v1198 then
								v1200 = v1196
								v1199 = v1195
							end
						else
							v1200 = v1196
							v1199 = v1195
						end
						v1201 = v_u_42 and (v1199 and v_u_695(v961, v1199, v1170.R.Size, v_u_42)) and 1 or 0
						v1202 = v_u_42 and (v1200 and v_u_695(v961, v1200, v1170.L.Size, v_u_42)) and 1 or 0
						v1203 = v_u_43
						v1204 = v_u_43.R
						v1205 = v960 / 0.06
						if v1204 < v1201 then
							v1206 = v1204 + v1205
							v1207 = math.min(v1201, v1206)
						else
							v1208 = v1204 - v1205
							v1207 = math.max(v1201, v1208)
						end
						v1203.R = v1207
						v1209 = v_u_43
						v1210 = v_u_43.L
						v1211 = v960 / 0.06
						if v1210 < v1202 then
							v1212 = v1210 + v1211
							v1213 = math.min(v1202, v1212)
						else
							v1214 = v1210 - v1211
							v1213 = math.max(v1202, v1214)
						end
						v1209.L = v1213
						v1215 = v1170.setFade
						v1216 = v_u_43.R
						pcall(v1215, v1170, "R", v1216)
						v1217 = v1170.setFade
						v1218 = v_u_43.L
						pcall(v1217, v1170, "L", v1218)
						v1170:place(v1199, v1200)
						v1170:placeHelpers(v962 * CFrame.new(0, -1.4 * v1170.s, 0.2 * v1170.s), v_u_58)
					end
				end
			end
		else
			v1286 = v1277 == "grip" and 0 or 1
			if v1279.actElbowR and v1286 > 0 then
				v1281 = v1281:Lerp(v1279.actElbowR, v1286)
			end
			if v1277 == "grip" or not v1283 then
				v1283 = nil
			end
			if v1175 and v1283 then
				v1287 = v1280:PointToObjectSpace(v1175.Position) - v1280:PointToObjectSpace(v1283.Position)
				v1288 = v1287.X * 0.8
				v1289 = v1287.Y * 0.6
				v1290 = v1287.Z * 0.4
				v1281 = v1281 + Vector3.new(v1288, v1289, v1290)
			end
			v1177.elbowR = v1280 * v1281
			if v1276 == "grip" then
				v1291 = nil
			else
				v1291 = v_u_470(v975, nil, nil) or nil
			end
			if v1176 and v1291 then
				v1292 = v1280:PointToObjectSpace(v1176.Position) - v1280:PointToObjectSpace(v1291.Position)
				v1293 = v1292.X * 0.8
				v1294 = v1292.Y * 0.6
				v1295 = v1292.Z * 0.4
				v1282 = v1282 + Vector3.new(v1293, v1294, v1295)
			end
			v1177.elbowL = v1280 * v1282
			if v_u_38 then
				v1179 = v_u_30("HealController", "getState")
				v1180 = 0
				v1181 = 0
				if type(v1179) == "table" then
					v1182 = v1179.startedAt
					if type(v1182) == "number" then
						v1183 = workspace:GetServerTimeNow()
						v1181 = v1183 - v1179.startedAt
						v1184 = (v1179.endsAt or v1183) - v1179.startedAt
						v1185 = v1181 / math.max(v1184, 0.05)
						v1180 = math.clamp(v1185, 0, 1)
					end
				end
				v1186 = v_u_357.apply
				v1187 = v_u_38
				v1188 = v962 * v1142
				v1189, v1190 = pcall(v1186, v1187, v1180, v1181, v1188)
				if v1189 and v1190 then
					v1176 = v1190.left
					v1175 = v1190.right
					v1191 = v1190.elbowL
					v1192 = v1190.elbowR
					v1177.elbowL = v1191
					v1177.elbowR = v1192
				else
					v1176 = v962 * v1142 * v_u_14.ITEM_LEFT
					v_u_38.root.CFrame = v1176 * v_u_38.center:Inverse()
					v1175 = v962 * v1142 * v_u_14.ITEM_RIGHT
				end
				v_u_38.model.Parent = v990
			end
			if v1170 then
				v1193 = v1175 ~= nil and true or v1176 ~= nil
				v1170:setVisible(v1193)
				if v1193 then
					v_u_57 = v_u_57 - v960
					if v_u_57 <= 0 then
						v_u_57 = 2.5
						v1194 = v1170.setSkin
						pcall(v1194, v1170, v963)
					end
					v1195, v1196 = v1170:solve(v962, v1175, v1176, v1177)
					if v1178 and not v_u_38 then
						v1197 = v_u_16._armOverride
						v1198, v1199, v1200 = pcall(v1197, v1178, v1170, v1195, v1196)
						if not v1198 then
							v1200 = v1196
							v1199 = v1195
						end
					else
						v1200 = v1196
						v1199 = v1195
					end
					v1201 = v_u_42 and (v1199 and v_u_695(v961, v1199, v1170.R.Size, v_u_42)) and 1 or 0
					v1202 = v_u_42 and (v1200 and v_u_695(v961, v1200, v1170.L.Size, v_u_42)) and 1 or 0
					v1203 = v_u_43
					v1204 = v_u_43.R
					v1205 = v960 / 0.06
					if v1204 < v1201 then
						v1206 = v1204 + v1205
						v1207 = math.min(v1201, v1206)
					else
						v1208 = v1204 - v1205
						v1207 = math.max(v1201, v1208)
					end
					v1203.R = v1207
					v1209 = v_u_43
					v1210 = v_u_43.L
					v1211 = v960 / 0.06
					if v1210 < v1202 then
						v1212 = v1210 + v1211
						v1213 = math.min(v1202, v1212)
					else
						v1214 = v1210 - v1211
						v1213 = math.max(v1202, v1214)
					end
					v1209.L = v1213
					v1215 = v1170.setFade
					v1216 = v_u_43.R
					pcall(v1215, v1170, "R", v1216)
					v1217 = v1170.setFade
					v1218 = v_u_43.L
					pcall(v1217, v1170, "L", v1218)
					v1170:place(v1199, v1200)
					v1170:placeHelpers(v962 * CFrame.new(0, -1.4 * v1170.s, 0.2 * v1170.s), v_u_58)
				end
			end
			return
		end
	else
		v_u_15.hide()
		if v_u_41 then
			v_u_41 = false
			v_u_13.hide()
		end
		local v1297 = v_u_30("MeleeController", "getState")
		if type(v1297) == "table" and v1297.kind == "Punch" then
			local v1298 = v1297.t0
			if type(v1298) == "number" then
				local v1299 = v991 - v1297.t0
				local v1300 = v1297.dur or 0.45
				local v1301 = v1299 / math.max(v1300, 0.1)
				if v1301 >= 0 and v1301 <= 1 then
					v1177.rightReach = true
					v1175 = v962 * v1142 * v_u_14.punch(v1301)
					if v1297.left then
						v1176 = v962 * v1142 * (CFrame.new(-1, 0, 0) * v_u_14.punch(v1301))
						v1175 = nil
					end
				end
			end
		end
		if not v1175 and (not v1176 and (not v_u_38 and v1045 > 0.02)) then
			local v1302 = v_u_46
			local v1303 = v1045 * math.clamp(v1302, 0, 1)
			local v1304 = math.sin(v1028)
			local v1305 = (v1304 + 1) / 2
			local v1306 = v1305 * v1305 * (3 - v1305 * 2)
			local v1307 = (Vector3.new(0.66, -1.6, -0.4)):Lerp(Vector3.new(0.42, -0.68, -1.02), v1306)
			local v1308 = -(1 - v1303) * 1.3
			local v1309 = v1307 + Vector3.new(0, v1308, 0)
			local v1310 = v_u_12.hand
			local v1311 = 0.4 * v1306 + 0.35
			local v1312 = v1310(v1309, Vector3.new(-1, 0.15, 0), (Vector3.new(-0.15, v1311, -1)))
			local v1313 = -1.5 + 0.4 * v1306
			local v1314 = 1.1 - v1306 * 0.5
			local v1315 = v1309 + Vector3.new(0.3, v1313, v1314)
			local v1316 = (1 - v1304) / 2
			local v1317 = v1316 * v1316 * (3 - v1316 * 2)
			local v1318 = (Vector3.new(-0.66, -1.6, -0.4)):Lerp(Vector3.new(-0.42, -0.68, -1.02), v1317)
			local v1319 = -(1 - v1303) * 1.3
			local v1320 = v1318 + Vector3.new(0, v1319, 0)
			local v1321 = v_u_12.hand
			local v1322 = 0.4 * v1317 + 0.35
			local v1323 = v1321(v1320, Vector3.new(1, 0.15, 0), (Vector3.new(0.15, v1322, -1)))
			local v1324 = -1.5 + 0.4 * v1317
			local v1325 = 1.1 - v1317 * 0.5
			local v1326 = v1320 + Vector3.new(-0.3, v1324, v1325)
			local v1327 = v962 * v1142
			v1175 = v1327 * v1312
			v1176 = v1327 * v1323
			local v1328 = v1327 * v1315
			local v1329 = v1327 * v1326
			v1177.elbowR = v1328
			v1177.elbowL = v1329
		end
		if v_u_38 then
			v1179 = v_u_30("HealController", "getState")
			v1180 = 0
			v1181 = 0
			if type(v1179) == "table" then
				v1182 = v1179.startedAt
				if type(v1182) == "number" then
					v1183 = workspace:GetServerTimeNow()
					v1181 = v1183 - v1179.startedAt
					v1184 = (v1179.endsAt or v1183) - v1179.startedAt
					v1185 = v1181 / math.max(v1184, 0.05)
					v1180 = math.clamp(v1185, 0, 1)
				end
			end
			v1186 = v_u_357.apply
			v1187 = v_u_38
			v1188 = v962 * v1142
			v1189, v1190 = pcall(v1186, v1187, v1180, v1181, v1188)
			if v1189 and v1190 then
				v1176 = v1190.left
				v1175 = v1190.right
				v1191 = v1190.elbowL
				v1192 = v1190.elbowR
				v1177.elbowL = v1191
				v1177.elbowR = v1192
			else
				v1176 = v962 * v1142 * v_u_14.ITEM_LEFT
				v_u_38.root.CFrame = v1176 * v_u_38.center:Inverse()
				v1175 = v962 * v1142 * v_u_14.ITEM_RIGHT
			end
			v_u_38.model.Parent = v990
		end
		if v1170 then
			v1193 = v1175 ~= nil and true or v1176 ~= nil
			v1170:setVisible(v1193)
			if v1193 then
				v_u_57 = v_u_57 - v960
				if v_u_57 <= 0 then
					v_u_57 = 2.5
					v1194 = v1170.setSkin
					pcall(v1194, v1170, v963)
				end
				v1195, v1196 = v1170:solve(v962, v1175, v1176, v1177)
				if v1178 and not v_u_38 then
					v1197 = v_u_16._armOverride
					v1198, v1199, v1200 = pcall(v1197, v1178, v1170, v1195, v1196)
					if not v1198 then
						v1200 = v1196
						v1199 = v1195
					end
				else
					v1200 = v1196
					v1199 = v1195
				end
				v1201 = v_u_42 and (v1199 and v_u_695(v961, v1199, v1170.R.Size, v_u_42)) and 1 or 0
				v1202 = v_u_42 and (v1200 and v_u_695(v961, v1200, v1170.L.Size, v_u_42)) and 1 or 0
				v1203 = v_u_43
				v1204 = v_u_43.R
				v1205 = v960 / 0.06
				if v1204 < v1201 then
					v1206 = v1204 + v1205
					v1207 = math.min(v1201, v1206)
				else
					v1208 = v1204 - v1205
					v1207 = math.max(v1201, v1208)
				end
				v1203.R = v1207
				v1209 = v_u_43
				v1210 = v_u_43.L
				v1211 = v960 / 0.06
				if v1210 < v1202 then
					v1212 = v1210 + v1211
					v1213 = math.min(v1202, v1212)
				else
					v1214 = v1210 - v1211
					v1213 = math.max(v1202, v1214)
				end
				v1209.L = v1213
				v1215 = v1170.setFade
				v1216 = v_u_43.R
				pcall(v1215, v1170, "R", v1216)
				v1217 = v1170.setFade
				v1218 = v_u_43.L
				pcall(v1217, v1170, "L", v1218)
				v1170:place(v1199, v1200)
				v1170:placeHelpers(v962 * CFrame.new(0, -1.4 * v1170.s, 0.2 * v1170.s), v_u_58)
			end
		end
		return
	end
end
function v_u_16.init() -- name: init end
function v_u_16.start() -- name: start
	-- upvalues: (copy) v_u_17, (copy) v_u_16, (copy) v_u_34, (copy) v_u_35, (ref) v_u_39, (ref) v_u_57, (copy) v_u_2, (copy) v_u_1330
	v_u_17.CharacterAdded:Connect(function()
		-- upvalues: (ref) v_u_16, (ref) v_u_34, (ref) v_u_35, (ref) v_u_39, (ref) v_u_57
		v_u_16.onEquip(nil, nil, nil)
		for v1331, v1332 in v_u_34 do
			v1332.model:Destroy()
			v_u_34[v1331] = nil
		end
		table.clear(v_u_35)
		v_u_39 = 0
		v_u_57 = 0
	end)
	local v_u_1333 = 0
	v_u_2:BindToRenderStep("CombatViewmodel", Enum.RenderPriority.Camera.Value + 2, function(p1334)
		-- upvalues: (ref) v_u_1330, (ref) v_u_1333
		local v1335 = v_u_1330
		local v1336, v1337 = pcall(v1335, p1334)
		if not v1336 then
			v_u_1333 = v_u_1333 + 1
			if v_u_1333 <= 5 or v_u_1333 % 600 == 0 then
				warn("[ViewmodelController] " .. tostring(v1337))
			end
		end
	end)
end
v_u_16._buildWeapon = v_u_338
v_u_16._lensView = v_u_672
v_u_16._adsEye = v647
v_u_16._FAR = v75
function v_u_16._previewADS(p1338, p1339, p1340) -- name: _previewADS
	-- upvalues: (ref) v_u_32, (copy) v_u_265, (copy) v_u_14, (copy) v_u_10, (copy) v_u_644, (copy) v_u_123, (copy) v_u_287, (copy) v_u_672
	if type(p1340) == "table" then
		v_u_32 = p1340
	end
	if p1338.adsCut then
		v_u_265(p1338)
	end
	if p1338.optic then
		local v1341 = v_u_14.adsRoot
		local v1342 = p1338.aimRel
		local v1343
		if p1338.optic and p1338.eyeR then
			if p1338.kind == "Pistol" then
				v1343 = p1338.eye
			else
				local v1344 = v_u_10.eyeDist(p1338.opticId, p1338.eyeR, (v_u_644(p1338)))
				v1343 = math.max(v1344, 0.16) - (p1338.relief or 0)
			end
		else
			v1343 = p1338.eye
		end
		p1338.adsRoot = v1341(v1342, v1343)
	end
	v_u_123(p1338, p1339.CFrame * p1338.adsRoot)
	p1338.viewRel = p1338.adsRoot
	if p1338.optic then
		v_u_287(p1338, 1)
	end
	return v_u_672(p1338, p1339, 1)
end
function v_u_16._previewPose(p1345, p1346, p1347, p1348) -- name: _previewPose
	-- upvalues: (copy) v_u_14, (copy) v_u_10, (copy) v_u_644, (copy) v_u_123, (copy) v_u_287, (copy) v_u_493, (copy) v_u_470
	local v1349 = p1348 or {}
	local v1350 = v_u_14.smooth(v1349.a or 0)
	local v1351 = p1345.hip
	if p1345.stats and p1345.stats.isGun then
		if p1345.optic then
			local v1352 = v_u_14.adsRoot
			local v1353 = p1345.aimRel
			local v1354
			if p1345.optic and p1345.eyeR then
				if p1345.kind == "Pistol" then
					v1354 = p1345.eye
				else
					local v1355 = v_u_10.eyeDist(p1345.opticId, p1345.eyeR, (v_u_644(p1345)))
					v1354 = math.max(v1355, 0.16) - (p1345.relief or 0)
				end
			else
				v1354 = p1345.eye
			end
			p1345.adsRoot = v1352(v1353, v1354)
		end
		v1351 = p1345.hip:Lerp(p1345.adsRoot, v1350)
	end
	local v1356 = v_u_14.smooth(v1349.sprint or 0)
	if v1356 > 0 then
		v1351 = v1351 * CFrame.identity:Lerp(v_u_14.sprint(p1345.kind), v1356 * (1 - v1350))
	end
	v_u_123(p1345, p1347 * v1351)
	if p1345.optic then
		v_u_287(p1345, v1350)
	end
	if p1346 then
		local v1357, v1358, v1359 = v_u_493(p1345, p1347, v1350)
		if p1345.stats then
			local _ = p1345.stats.isMelee
		end
		local _ = p1345.info
		local _ = p1345.root.CFrame
		local v1360 = v_u_470(p1345, "grip", nil)
		p1346:setVisible(true)
		p1346:update(p1347, v1359, v1360, {
			["elbowR"] = p1347 * v1357,
			["elbowL"] = p1347 * v1358
		})
	end
	return p1345.root.CFrame
end
function v_u_16._armOverride(p1361, p1362, p1363, p1364) -- name: _armOverride
	-- upvalues: (copy) v_u_378, (copy) v_u_356
	local v1365 = p1361.vm
	local v1366 = p1361.root
	local v1367 = p1361.out
	local v1368 = v1366:Inverse()
	local v1369
	if p1363 then
		v1369 = v1368 * p1363 or nil
	else
		v1369 = nil
	end
	local v1370 = p1364 and v1368 * p1364 or nil
	local v_u_1371 = v_u_378(v1365)
	if v_u_1371.any then
		local v_u_1372 = p1361.a
		local v_u_1373 = p1361.sp
		local function v1376(p1374, p1375) -- name: idle
			-- upvalues: (copy) v_u_1371, (copy) v_u_1372, (copy) v_u_1373
			if v_u_1371.hold then
				p1374 = p1374:Lerp(v_u_1371.hold[p1375], (1 - v_u_1372) * (1 - v_u_1373))
			end
			if v_u_1371.ads then
				p1374 = p1374:Lerp(v_u_1371.ads[p1375], v_u_1372)
			end
			if v_u_1371.sprint then
				p1374 = p1374:Lerp(v_u_1371.sprint[p1375], v_u_1373)
			end
			return p1374
		end
		local v1377 = v1367 and v1367.right ~= "grip" and (v1367.rightK or 1) or 0
		local v1378 = 1 - math.clamp(v1377, 0, 1)
		local v1379
		if v1367 then
			local v1380 = v1367.left
			v1379 = typeof(v1380) == "CFrame" and (v1367.leftK or 1) or 0
		else
			v1379 = 0
		end
		local v1381 = 1 - math.clamp(v1379, 0, 1)
		local v1382 = v1367 and (v1367.left == "pump" or (v1367.left == "mag" or (v1367.left == "charge" or (v1367.left == "port" or v1367.left == "down")))) and 0 or v1381
		local v1383 = v1365.info.gripAtt and 0 or v1382
		if v1369 and v1378 > 0 then
			v1369 = v1369:Lerp(v1376(v1369, "r"), v1378)
		end
		if v1370 and v1383 > 0 then
			v1370 = v1370:Lerp(v1376(v1370, "l"), v1383)
		end
	end
	local v1384
	if v1367 then
		v1384 = v1367.clipArms
	else
		v1384 = v1367
	end
	local v1385, v1386
	if v1384 then
		local v1387 = v1367.clipW or 1
		v1385 = (v1369 or v1384.r):Lerp(v1384.r, v1387)
		v1386 = (v1370 or v1384.l):Lerp(v1384.l, v1387)
		local v1388 = v1367.props
		if v1388 and (next(v1388) and (v1369 or v1370)) then
			local v1389 = p1362.handR:Inverse()
			local v1390 = p1362.handL:Inverse()
			local v1391
			if v1369 then
				v1391 = (v1369 * v1389).Position
			else
				v1391 = v1369
			end
			local v1392
			if v1370 then
				v1392 = (v1370 * v1390).Position
			else
				v1392 = v1370
			end
			local v1393
			if v1369 then
				v1393 = v1385 * v1369:Inverse() or nil
			else
				v1393 = nil
			end
			local v1394
			if v1370 then
				v1394 = v1386 * v1370:Inverse() or nil
			else
				v1394 = nil
			end
			local v1395 = {}
			for v1396, v1398 in v1388 do
				local v1398
				if typeof(v1398) == "CFrame" then
					local v1399 = v1398.Position
					local v1400 = v1391 and ((v1399 - v1391).Magnitude or (1 / 0)) or (1 / 0)
					local v1401 = v1392 and ((v1399 - v1392).Magnitude or (1 / 0)) or (1 / 0)
					local v1402
					if math.min(v1400, v1401) > 0.45 then
						v1402 = nil
					else
						v1402 = v1400 <= v1401 and v1393 and v1393 or v1394
					end
					if v1402 then
						v1398 = v1402 * v1398 or v1398
					end
					v1395[v1396] = v1398
				elseif type(v1398) == "table" and v1398.cf then
					local v1403 = v1398.cf.Position
					local v1404 = v1391 and ((v1403 - v1391).Magnitude or (1 / 0)) or (1 / 0)
					local v1405 = v1392 and ((v1403 - v1392).Magnitude or (1 / 0)) or (1 / 0)
					local v1406
					if math.min(v1404, v1405) > 0.45 then
						v1406 = nil
					else
						v1406 = v1404 <= v1405 and v1393 and v1393 or v1394
					end
					if v1406 then
						v1398 = {
							["cf"] = v1406 * v1398.cf,
							["size"] = v1398.size
						} or v1398
					end
					v1395[v1396] = v1398
				elseif type(v1398) == "table" and v1398.a then
					local v1407 = (v1398.a + v1398.b) / 2
					local v1408 = v1391 and ((v1407 - v1391).Magnitude or (1 / 0)) or (1 / 0)
					local v1409 = v1392 and ((v1407 - v1392).Magnitude or (1 / 0)) or (1 / 0)
					local v1410
					if math.min(v1408, v1409) > 0.45 then
						v1410 = nil
					else
						v1410 = v1408 <= v1409 and v1393 and v1393 or v1394
					end
					if v1410 then
						v1398 = {
							["a"] = v1410 * v1398.a,
							["b"] = v1410 * v1398.b
						} or v1398
					end
					v1395[v1396] = v1398
				else
					v1395[v1396] = v1398
				end
			end
			v_u_356.set(v1365, v1395)
		end
	else
		v1386 = v1370
		v1385 = v1369
	end
	local v1411
	if v1385 then
		v1411 = v1366 * v1385 or nil
	else
		v1411 = nil
	end
	return v1411, v1386 and v1366 * v1386 or nil
end
function v_u_16._bake(p1412, p1413, p1414, p1415) -- name: _bake
	-- upvalues: (copy) v_u_14, (copy) v_u_10, (copy) v_u_644, (copy) v_u_362, (copy) v_u_123, (copy) v_u_493, (copy) v_u_525, (copy) v_u_512, (copy) v_u_470
	local v1416 = p1415 or {}
	local v1417 = v1416.a or 0
	local v1418 = v1416.sprint or 0
	local v1419 = v1416.out
	if p1412.optic then
		local v1420 = v_u_14.adsRoot
		local v1421 = p1412.aimRel
		local v1422
		if p1412.optic and p1412.eyeR then
			if p1412.kind == "Pistol" then
				v1422 = p1412.eye
			else
				local v1423 = v_u_10.eyeDist(p1412.opticId, p1412.eyeR, (v_u_644(p1412)))
				v1422 = math.max(v1423, 0.16) - (p1412.relief or 0)
			end
		else
			v1422 = p1412.eye
		end
		p1412.adsRoot = v1420(v1421, v1422)
	end
	local v1424 = p1412.hip:Lerp(p1412.adsRoot, v1417)
	if v1418 > 0 then
		v1424 = v1424 * CFrame.identity:Lerp(v_u_14.sprint(p1412.kind), v1418 * (1 - v1417))
	end
	if v1419 and v1419.gun then
		v1424 = v1424 * v1419.gun
	end
	local v1425 = p1414 * v1424
	local v1426 = v1419 and (v1419.motors or {}) or {}
	for _, v1427 in v_u_362(p1412) do
		v1427.Transform = v1426[v1427] or CFrame.identity
	end
	v_u_123(p1412, v1425)
	local v1428
	if v1419 then
		v1428 = v1419.rightAt or nil
	else
		v1428 = nil
	end
	p1412.actR = v1428
	p1412.actRK = v1419 and (v1419.rightK or 0) or 0
	local v1429 = v1419 and (v1419.left or "grip") or "grip"
	local v1430 = v1419 and (v1419.right or "grip") or "grip"
	local v1431 = p1412.hands or v_u_14.hands(p1412.kind)
	local v1432, v1433, v1434 = v_u_493(p1412, p1414, v1417)
	p1412.graspR = p1412.root.CFrame:ToObjectSpace(v1434)
	local v1435 = v_u_525(p1412, v1430)
	if v1435 then
		if v1430 == "grip" then
			v1435 = v1434
		end
	end
	local v1436 = v_u_512(p1412, v1429, p1414, v1419)
	local v1437, v1438, v1439, v1440, v1441, v1442, v1443, v1444, v1445
	if v1430 ~= "bolt" then
		v1447 = v1430 == "grip" and 0 or 1
		if v1431.actElbowR and v1447 > 0 then
			v1432 = v1432:Lerp(v1431.actElbowR, v1447)
		end
		v1448 = {}
		if v1430 == "grip" or not v1434 then
			v1434 = nil
		end
		if v1435 and v1434 then
			v1437 = p1414:PointToObjectSpace(v1435.Position) - p1414:PointToObjectSpace(v1434.Position)
			v1438 = v1437.X * 0.8
			v1439 = v1437.Y * 0.6
			v1440 = v1437.Z * 0.4
			v1432 = v1432 + Vector3.new(v1438, v1439, v1440)
		end
		v1448.elbowR = p1414 * v1432
		if v1429 == "grip" then
			v1441 = nil
		else
			v1441 = v_u_470(p1412, nil, nil) or nil
		end
		if v1436 and v1441 then
			v1442 = p1414:PointToObjectSpace(v1436.Position) - p1414:PointToObjectSpace(v1441.Position)
			v1443 = v1442.X * 0.8
			v1444 = v1442.Y * 0.6
			v1445 = v1442.Z * 0.4
			v1433 = v1433 + Vector3.new(v1443, v1444, v1445)
		end
		v1448.elbowL = p1414 * v1433
		v1449, v1450 = p1413:solve(p1414, v1435, v1436, v1448)
		return {
			["root"] = v1425,
			["r"] = v1449,
			["l"] = v1450,
			["motors"] = v1426
		}
	end
	local v1446 = p1412.actRK or 1
	local v1447 = math.clamp(v1446, 0, 1)
	if v1447 then
		if v1431.actElbowR and v1447 > 0 then
			v1432 = v1432:Lerp(v1431.actElbowR, v1447)
		end
		v1448 = {}
		if v1430 == "grip" or not v1434 then
			v1434 = nil
		end
		if v1435 and v1434 then
			v1437 = p1414:PointToObjectSpace(v1435.Position) - p1414:PointToObjectSpace(v1434.Position)
			v1438 = v1437.X * 0.8
			v1439 = v1437.Y * 0.6
			v1440 = v1437.Z * 0.4
			v1432 = v1432 + Vector3.new(v1438, v1439, v1440)
		end
		v1448.elbowR = p1414 * v1432
		if v1429 == "grip" then
			v1441 = nil
		else
			v1441 = v_u_470(p1412, nil, nil) or nil
		end
		if v1436 and v1441 then
			v1442 = p1414:PointToObjectSpace(v1436.Position) - p1414:PointToObjectSpace(v1441.Position)
			v1443 = v1442.X * 0.8
			v1444 = v1442.Y * 0.6
			v1445 = v1442.Z * 0.4
			v1433 = v1433 + Vector3.new(v1443, v1444, v1445)
		end
		v1448.elbowL = p1414 * v1433
		v1449, v1450 = p1413:solve(p1414, v1435, v1436, v1448)
		return {
			["root"] = v1425,
			["r"] = v1449,
			["l"] = v1450,
			["motors"] = v1426
		}
	end
	v1447 = v1430 == "grip" and 0 or 1
	if v1431.actElbowR and v1447 > 0 then
		v1432 = v1432:Lerp(v1431.actElbowR, v1447)
	end
	local v1448 = {}
	if v1430 == "grip" or not v1434 then
		v1434 = nil
	end
	if v1435 and v1434 then
		v1437 = p1414:PointToObjectSpace(v1435.Position) - p1414:PointToObjectSpace(v1434.Position)
		v1438 = v1437.X * 0.8
		v1439 = v1437.Y * 0.6
		v1440 = v1437.Z * 0.4
		v1432 = v1432 + Vector3.new(v1438, v1439, v1440)
	end
	v1448.elbowR = p1414 * v1432
	if v1429 == "grip" then
		v1441 = nil
	else
		v1441 = v_u_470(p1412, nil, nil) or nil
	end
	if v1436 and v1441 then
		v1442 = p1414:PointToObjectSpace(v1436.Position) - p1414:PointToObjectSpace(v1441.Position)
		v1443 = v1442.X * 0.8
		v1444 = v1442.Y * 0.6
		v1445 = v1442.Z * 0.4
		v1433 = v1433 + Vector3.new(v1443, v1444, v1445)
	end
	v1448.elbowL = p1414 * v1433
	local v1449, v1450 = p1413:solve(p1414, v1435, v1436, v1448)
	return {
		["root"] = v1425,
		["r"] = v1449,
		["l"] = v1450,
		["motors"] = v1426
	}
end
v_u_16._b2 = {
	["leftTarget"] = v_u_512,
	["rightTarget"] = v_u_525,
	["buildItem"] = v_u_428,
	["Actions"] = v_u_354,
	["Props"] = v_u_356,
	["Consume"] = v_u_357
}
return v_u_16