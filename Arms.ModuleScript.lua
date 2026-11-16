-- Decompiled by Executor
-- Path: ReplicatedStorage.Client.Controllers.ViewmodelController.Arms

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = {}
v_u_2.__index = v_u_2
v_u_2.SCALE = 0.45
v_u_2.THICK = 0.963
v_u_2.SLEEVE = 0.906
v_u_2.HAND_LEN = 0.62
v_u_2.HAND_C = 0.6
v_u_2.HALF = 0.12
v_u_2.ELBOW_R = Vector3.new(1.15, -1.95, -0.2)
v_u_2.ELBOW_L = Vector3.new(-0.75, -1.95, -0.55)
v_u_2.REL_R = CFrame.new(0.75221, -0.95869, 1.97914, -0.97762, 0.01276, -0.21, -0.06276, 0.93502, 0.349, 0.20081, 0.35437, -0.91329)
v_u_2.REL_L = CFrame.new(-1.00746, -0.87893, -0.0813, -0.47392, -0.79547, 0.37766, -0.72905, 0.59499, 0.33836, -0.49386, -0.11498, -0.86191)
v_u_2.REF_GRIP = CFrame.new(0.42, -0.62, -0.8)
local v_u_3 = CFrame.new(0, -10000, 0)
local v_u_4 = {
	["HumanoidRootPart"] = true,
	["Torso"] = true,
	["Handcontrol"] = true,
	["RightHand"] = true,
	["LeftHand"] = true,
	["FakeCamera"] = true
}
local function v_u_13(p5, p6) -- name: rotBetween
	local v7 = p5.Unit
	local v8 = p6.Unit
	local v9 = v7:Dot(v8)
	local v10 = math.clamp(v9, -1, 1)
	if v10 > 0.999999 then
		return CFrame.identity
	end
	local v11 = v7:Cross(v8)
	if v11.Magnitude < 1e-6 then
		local v12 = v7.X
		v11 = math.abs(v12) < 0.9 and v7:Cross(Vector3.new(1, 0, 0)) or v7:Cross(Vector3.new(0, 1, 0))
	end
	return CFrame.fromAxisAngle(v11.Unit, (math.acos(v10)))
end
v_u_2.rotBetween = v_u_13
function v_u_2.new(p14) -- name: new
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_4, (copy) v_u_3
	local v15 = v_u_1:FindFirstChild("Assets")
	if v15 then
		v15 = v15:FindFirstChild("Characters")
	end
	if v15 then
		v15 = v15:FindFirstChild("FPHands") or v15:FindFirstChild("Defeault")
	end
	if not (v15 and v15:IsA("Model")) then
		return nil
	end
	local v_u_16 = v15:Clone()
	v_u_16.Name = "FPHands"
	local v_u_17 = v_u_16:GetAttribute("RigScale") or v_u_2.SCALE
	local v18 = v_u_16:FindFirstChild("AnimSaves")
	if v18 then
		v18:Destroy()
	end
	for _, v19 in v_u_16:GetDescendants() do
		if not (v19:IsA("Script") or (v19:IsA("LocalScript") or (v19:IsA("Sound") or (v19:IsA("JointInstance") or (v19:IsA("WeldConstraint") or v19:IsA("RigidConstraint")))))) then
			continue
		end
		v19:Destroy()
	end
	pcall(function()
		-- upvalues: (copy) v_u_16, (copy) v_u_17
		v_u_16:ScaleTo(v_u_17)
	end)
	local v20 = v_u_16:FindFirstChild("Rightarm")
	local v21 = v_u_16:FindFirstChild("Leftarm")
	if not (v20 and v21) then
		v_u_16:Destroy()
		return nil
	end
	local v22 = v_u_2
	local v23 = setmetatable({
		["model"] = nil,
		["R"] = nil,
		["L"] = nil,
		["s"] = nil,
		["visible"] = false,
		["parent"] = nil,
		["list"] = nil,
		["cfs"] = nil,
		["attached"] = nil,
		["sleeves"] = nil,
		["sleeveTex"] = nil,
		["model"] = v_u_16,
		["R"] = v20,
		["L"] = v21,
		["s"] = v_u_17,
		["parent"] = p14,
		["list"] = {},
		["cfs"] = {},
		["attached"] = {},
		["sleeves"] = {},
		["sleeveTex"] = {}
	}, v22)
	local v24 = v_u_16:FindFirstChild("RightHand")
	local v25 = v_u_16:FindFirstChild("LeftHand")
	v23.hR = v24 and v20.CFrame:PointToObjectSpace(v24.Position) or Vector3.new(0.25, 0, 2.5) * v_u_17
	v23.hL = v25 and v21.CFrame:PointToObjectSpace(v25.Position) or Vector3.new(-0.25, 0, 2.5) * v_u_17
	local v26 = -v20.Size.Z / 2
	v23.shR = Vector3.new(0, 0, v26)
	local v27 = -v21.Size.Z / 2
	v23.shL = Vector3.new(0, 0, v27)
	local v28 = v_u_2.REL_R
	v23.relR = CFrame.new(v28.Position * v_u_17) * v28.Rotation
	local v29 = v_u_2.REL_L
	v23.relL = CFrame.new(v29.Position * v_u_17) * v29.Rotation
	v23.fake = v_u_16:FindFirstChild("FakeCamera")
	v23.root = v_u_16:FindFirstChild("HumanoidRootPart")
	v23.fakeRest = v23.root and v23.fake and v23.root.CFrame:ToObjectSpace(v23.fake.CFrame) or CFrame.new(0, 1.5 * v_u_17, 0)
	local v30 = v23.list
	table.insert(v30, v20)
	local v31 = v23.list
	table.insert(v31, v21)
	for _, v32 in v_u_16:GetDescendants() do
		if not v32:IsA("BasePart") then
			continue
		end
		v32.Anchored = true
		v32.CanCollide = false
		v32.CanQuery = false
		v32.CanTouch = false
		v32.CastShadow = false
		v32.Massless = true
		if v32.Transparency > 0 and v32.Transparency < 0.05 then
			v32.Transparency = 0
		end
		if v_u_4[v32.Name] then
			v32.Transparency = 1
		else
			if v32 == v20 or v32 == v21 then
				continue
			end
			local v33 = (v32.Position - v20.Position).Magnitude <= (v32.Position - v21.Position).Magnitude and v20 and v20 or v21
			local v34 = v23.attached
			local v35 = {
				["part"] = v32,
				["arm"] = v33,
				["off"] = v33.CFrame:ToObjectSpace(v32.CFrame)
			}
			table.insert(v34, v35)
			local v36 = v23.list
			table.insert(v36, v32)
			if not v32.Parent or v32.Parent.Name ~= "Skin" then
				continue
			end
			local v37 = v23.sleeves
			table.insert(v37, v32)
			if not v32:IsA("MeshPart") then
				continue
			end
			v23.sleeveTex[v32] = v32.TextureID
		end
	end
	local v38 = v_u_16:GetAttribute("ArmThick") or v_u_2.THICK
	local v39 = v_u_16:GetAttribute("SleeveThick") or v_u_2.SLEEVE
	if type(v39) ~= "number" or v39 <= 0.05 then
		v39 = v38
	end
	if type(v38) == "number" and v38 > 0.05 then
		local v40 = v38 - 1
		if math.abs(v40) > 0.001 then
			for _, v41 in { v20, v21 } do
				local v42 = v41.Size.X * v38
				local v43 = v41.Size.Y * v38
				local v44 = v41.Size.Z
				v41.Size = Vector3.new(v42, v43, v44)
			end
			for _, v45 in v23.attached do
				local v46 = v45.part
				local v47 = v46.Size.X * v39
				local v48 = v46.Size.Y * v39
				local v49 = v46.Size.Z
				v46.Size = Vector3.new(v47, v48, v49)
				local v50 = v45.off
				v45.off = CFrame.new(v50.X * v38, v50.Y * v38, v50.Z) * v50.Rotation
			end
			local v51 = v23.hR.X * v38
			local v52 = v23.hR.Y * v38
			local v53 = v23.hR.Z
			v23.hR = Vector3.new(v51, v52, v53)
			local v54 = v23.hL.X * v38
			local v55 = v23.hL.Y * v38
			local v56 = v23.hL.Z
			v23.hL = Vector3.new(v54, v55, v56)
		end
	end
	v23.k = v38
	v23.half = v20.Size.X / 2
	v_u_2.HALF = v23.half
	local v57 = v20.Size.Z / 2 - (1 - v_u_2.HAND_C) * v_u_2.HAND_LEN
	v23.handR = CFrame.fromMatrix(Vector3.new(0, 0, v57), Vector3.new(0, 1, 0), Vector3.new(1, 0, 0), Vector3.new(0, 0, -1)):Inverse()
	v23.handL = CFrame.fromMatrix(Vector3.new(0, 0, v57), Vector3.new(0, -1, 0), Vector3.new(-1, 0, 0), Vector3.new(0, 0, -1)):Inverse()
	local v58 = v20.Size.Z / 2 - v_u_2.HAND_LEN
	for _, v59 in v23.attached do
		local v60 = v59.off
		if not v59.part.Parent or v59.part.Parent.Name ~= "Skin" then
			continue
		end
		local v61 = v60.LookVector.Z
		if math.abs(v61) <= 0.99 then
			continue
		end
		v59.off = CFrame.new(v60.X, v60.Y, v58 - v59.part.Size.Z / 2) * v60.Rotation
	end
	for _ in v23.list do
		local v62 = v23.cfs
		local v63 = v_u_3
		table.insert(v62, v63)
	end
	v23.baseLen = v20.Size.Z
	local v64 = v23.baseLen
	local v65 = v23.baseLen
	v23.lenR = v64
	v23.lenL = v65
	for _, v66 in v23.attached do
		local v67 = v66.off
		local v68 = v66.part.Size
		v66.off0 = v67
		v66.size0 = v68
	end
	v23.baseN = #v23.attached
	v23.kitParts = {}
	return v23
end
local v_u_69 = CFrame.fromMatrix(Vector3.new(0, 0, 0), Vector3.new(-1, 0, 0), Vector3.new(0, 0, -1), Vector3.new(0, -1, 0))
function v_u_2.setKit(p70, p71) -- name: setKit
	-- upvalues: (copy) v_u_1, (copy) v_u_69, (copy) v_u_3
	if type(p71) ~= "string" or (p71 == "" or not p71) then
		p71 = nil
	end
	if p70.kitName == p71 then
		return p70.kitArms == true
	end
	p70.kitName = p71
	for _, v72 in p70.kitParts do
		v72:Destroy()
	end
	p70.kitParts = {}
	for v73 = #p70.attached, p70.baseN + 1, -1 do
		table.remove(p70.attached, v73)
	end
	for v74 = #p70.list, p70.baseN + 3, -1 do
		table.remove(p70.list, v74)
	end
	for v75 = #p70.cfs, #p70.list + 1, -1 do
		table.remove(p70.cfs, v75)
	end
	p70.kitArms = false
	if not p71 then
		return false
	end
	local function v76()
		-- upvalues: (ref) v_u_1
		return require(v_u_1.Shared.Util.OutfitKit)
	end
	local v77, v78 = pcall(v76)
	if not v77 then
		return false
	end
	for v79, v80 in {
		["Right Arm"] = p70.R,
		["Left Arm"] = p70.L
	} do
		local v81 = v80.Size.X
		local v82 = v80.Size.Z / 2
		local v83 = Vector3.new(v81, v81, v82)
		for _, v84 in v78.pieces(p71, v79) do
			local v85 = v84.part:Clone()
			local v86 = v84.rel
			local v87 = v_u_69 * v86.Rotation
			local v88 = v_u_69 * v86.Position
			local v89 = v88.X * v83.X
			local v90 = v88.Y * v83.Y
			local v91 = v88.Z * v83.Z
			local v92 = Vector3.new(v89, v90, v91)
			local v93 = v85.Size
			local v94 = v93.X
			local v95 = v87:VectorToWorldSpace(Vector3.new(1, 0, 0))
			local v96 = v95.X * v83.X
			local v97 = v95.Y * v83.Y
			local v98 = v95.Z * v83.Z
			local v99 = v94 * Vector3.new(v96, v97, v98).Magnitude
			local v100 = v93.Y
			local v101 = v87:VectorToWorldSpace(Vector3.new(0, 1, 0))
			local v102 = v101.X * v83.X
			local v103 = v101.Y * v83.Y
			local v104 = v101.Z * v83.Z
			local v105 = v100 * Vector3.new(v102, v103, v104).Magnitude
			local v106 = v93.Z
			local v107 = v87:VectorToWorldSpace(Vector3.new(0, 0, 1))
			local v108 = v107.X * v83.X
			local v109 = v107.Y * v83.Y
			local v110 = v107.Z * v83.Z
			local v111 = v106 * Vector3.new(v108, v109, v110).Magnitude
			v85.Size = Vector3.new(v99, v105, v111)
			v85.Anchored = true
			v85.CanCollide = false
			v85.CanQuery = false
			v85.CanTouch = false
			v85.CastShadow = false
			v85.Massless = true
			for _, v112 in v85:GetDescendants() do
				if not (v112:IsA("JointInstance") or v112:IsA("WeldConstraint")) then
					continue
				end
				v112:Destroy()
			end
			v85.Parent = p70.model
			local v113 = p70.kitParts
			table.insert(v113, v85)
			local v114 = CFrame.new(v92) * v87
			local v115 = p70.attached
			local v116 = {
				["part"] = nil,
				["arm"] = nil,
				["off"] = nil,
				["kit"] = true,
				["off0"] = nil,
				["size0"] = nil,
				["part"] = v85,
				["arm"] = v80,
				["off"] = v114,
				["off0"] = v114,
				["size0"] = v85.Size
			}
			table.insert(v115, v116)
			p70.lenDirty = true
			local v117 = p70.list
			table.insert(v117, v85)
			local v118 = p70.cfs
			local v119 = v_u_3
			table.insert(v118, v119)
			p70.kitArms = true
		end
	end
	return p70.kitArms
end
function v_u_2.setLength(p120, p121, p122) -- name: setLength
	-- upvalues: (copy) v_u_2
	local v123 = p120.baseLen
	if v123 then
		local v124 = v_u_2.HAND_LEN
		local v125 = v124 + 0.1
		local v126 = math.max(p121 or v123, v125)
		local v127 = v124 + 0.1
		local v128 = math.max(p122 or v123, v127)
		if not p120.lenDirty then
			local v129 = v126 - p120.lenR
			if math.abs(v129) < 0.001 then
				local v130 = v128 - p120.lenL
				if math.abs(v130) < 0.001 then
					return
				end
			end
		end
		p120.lenDirty = false
		p120.lenR = v126
		p120.lenL = v128
		local v131 = p120.R
		local v132 = p120.R.Size.X
		local v133 = p120.R.Size.Y
		v131.Size = Vector3.new(v132, v133, v126)
		local v134 = p120.L
		local v135 = p120.L.Size.X
		local v136 = p120.L.Size.Y
		v134.Size = Vector3.new(v135, v136, v128)
		local v137 = CFrame.fromMatrix
		local v138 = v126 / 2 - (1 - v_u_2.HAND_C) * v124
		p120.handR = v137(Vector3.new(0, 0, v138), Vector3.new(0, 1, 0), Vector3.new(1, 0, 0), Vector3.new(0, 0, -1)):Inverse()
		local v139 = CFrame.fromMatrix
		local v140 = v128 / 2 - (1 - v_u_2.HAND_C) * v124
		p120.handL = v139(Vector3.new(0, 0, v140), Vector3.new(0, -1, 0), Vector3.new(-1, 0, 0), Vector3.new(0, 0, -1)):Inverse()
		for _, v141 in p120.attached do
			local v142 = v141.off0
			local v143 = v141.size0
			if not (v142 and v143) then
				continue
			end
			local v144
			if v141.arm == p120.R then
				v144 = v126
			else
				v144 = v128
			end
			local v145 = v123 / 2 - v124
			local v146 = v144 / 2 - v124
			local v147 = v145 - v142.Z
			if v147 <= 0 then
				v141.off = CFrame.new(v142.X, v142.Y, v142.Z + (v144 - v123) / 2) * v142.Rotation
				v141.part.Size = v143
			else
				local v148 = v144 - v124
				local v149 = v123 - v124
				local v150 = v148 / math.max(v149, 0.001)
				v141.off = CFrame.new(v142.X, v142.Y, v146 - v147 * v150) * v142.Rotation
				local v151 = v141.part
				local v152 = v143.X
				local v153 = v150 - 1
				local v154 = v142.Rotation:VectorToWorldSpace(Vector3.new(1, 0, 0)).Z
				local v155 = v152 * (1 + v153 * math.abs(v154))
				local v156 = v143.Y
				local v157 = v150 - 1
				local v158 = v142.Rotation:VectorToWorldSpace(Vector3.new(0, 1, 0)).Z
				local v159 = v156 * (1 + v157 * math.abs(v158))
				local v160 = v143.Z
				local v161 = v150 - 1
				local v162 = v142.Rotation:VectorToWorldSpace(Vector3.new(0, 0, 1)).Z
				local v163 = v160 * (1 + v161 * math.abs(v162))
				v151.Size = Vector3.new(v155, v159, v163)
			end
		end
	end
end
function v_u_2.setVisible(p164, p165) -- name: setVisible
	if p165 ~= p164.visible then
		p164.visible = p165
		p164.model.Parent = p165 and p164.parent or nil
	end
end
function v_u_2.setFade(p166, p167, p168) -- name: setFade
	local v169 = math.clamp(p168, 0, 1)
	p166.fade = p166.fade or {}
	if v169 ~= (p166.fade[p167] or 0) or v169 ~= 0 then
		p166.fade[p167] = v169
		local v170 = p167 == "L" and p166.L or p166.R
		v170.LocalTransparencyModifier = v169
		for _, v171 in p166.attached do
			if v171.arm ~= v170 or not v171.part.Parent then
				continue
			end
			v171.part.LocalTransparencyModifier = v169
		end
	end
end
function v_u_2.getFakeCamera(p172) -- name: getFakeCamera
	return p172.fake
end
function v_u_2.setSkin(p_u_173, p_u_174) -- name: setSkin
	-- upvalues: (copy) v_u_1
	if not p_u_174 then
		return
	end
	local v175 = p_u_174:GetAttribute("Kit")
	if p_u_174:GetAttribute("Ghillie") == true then
		local v176 = v_u_1:FindFirstChild("Assets")
		if v176 then
			v176 = v176:FindFirstChild("Outfits")
		end
		v175 = v176 and v176:FindFirstChild("Ghillie") and "Ghillie" or v175
	end
	local v177 = p_u_173:setKit(v175)
	local function v181(p178) -- name: colorOf
		-- upvalues: (copy) p_u_174
		for _, v179 in p178 do
			local v180 = p_u_174:FindFirstChild(v179)
			if not (v180 and v180:IsA("BasePart")) then
				continue
			end
			return v180.Color
		end
		return nil
	end
	local v182 = p_u_174:FindFirstChildOfClass("BodyColors")
	local v183 = v182 and v182.HeadColor3 or v181({ "Head" })
	local v184 = v181({ "Right Arm", "RightUpperArm" })
	if not v184 then
		if v182 then
			v184 = v182.RightArmColor3
		else
			v184 = v182
		end
	end
	local v185 = v181({ "Left Arm", "LeftUpperArm" })
	if v185 then
		v182 = v185
	elseif v182 then
		v182 = v182.LeftArmColor3
	end
	if v183 then
		p_u_173.R.Color = v183
		p_u_173.L.Color = v183
	end
	local v186 = p_u_174:FindFirstChildOfClass("Shirt")
	local v187
	if v186 == nil then
		if v184 and v183 then
			local v188 = v184.R - v183.R
			local v189 = math.abs(v188)
			local v190 = v184.G - v183.G
			local v191 = v189 + math.abs(v190)
			local v192 = v184.B - v183.B
			v187 = v191 + math.abs(v192) < 0.06
		else
			v187 = false
		end
		if not v187 then
			v187 = v177 == true
		end
	else
		v187 = v177 == true
	end
	for _, v_u_193 in p_u_173.sleeves do
		v_u_193.Transparency = v187 and 1 or 0
		local v194 = (v_u_193.Position - p_u_173.R.Position).Magnitude <= (v_u_193.Position - p_u_173.L.Position).Magnitude and v184 and v184 or v182
		if v187 or not v194 then
			::l40::
			if not (v_u_193:IsA("MeshPart") and p_u_173.sleeveTex[v_u_193]) then
				continue
			end
			pcall(function()
				-- upvalues: (copy) v_u_193, (copy) p_u_173
				v_u_193.TextureID = p_u_173.sleeveTex[v_u_193]
			end)
		else
			local v195
			if v194 and v183 then
				local v196 = v194.R - v183.R
				local v197 = math.abs(v196)
				local v198 = v194.G - v183.G
				local v199 = v197 + math.abs(v198)
				local v200 = v194.B - v183.B
				v195 = v199 + math.abs(v200) < 0.06
			else
				v195 = false
			end
			if v195 or v186 ~= nil then
				goto l40
			end
			pcall(function()
				-- upvalues: (copy) v_u_193
				v_u_193.TextureID = ""
			end)
			v_u_193.Color = v194
			v_u_193.Material = Enum.Material.Fabric
		end
	end
end
function v_u_2.reach(p201, p202, p203, p204) -- name: reach
	-- upvalues: (copy) v_u_13
	local v205 = p201 * p202
	local v206 = p201 * p203 - v205
	local v207 = p204 - v205
	if v206.Magnitude < 0.0001 or v207.Magnitude < 0.0001 then
		return p201
	end
	local v208 = v_u_13(v206, v207)
	return CFrame.new(v205) * v208 * CFrame.new(-v205) * p201 + v207.Unit * (v207.Magnitude - v206.Magnitude)
end
local function v_u_218(p209, p210) -- name: handFrame
	local v211 = p209.Position
	local v212 = p210 and v211 - p210 or p209.LookVector
	if v212.Magnitude < 0.001 then
		v212 = p209.LookVector
	end
	local v213 = v212.Unit
	local v214 = p209.UpVector
	local v215 = v214 - v213 * v214:Dot(v213)
	if v215.Magnitude < 0.001 then
		local v216 = p209.RightVector
		v215 = v216 - v213 * v216:Dot(v213)
	end
	local v217 = v215.Unit
	return CFrame.fromMatrix(v211, v213:Cross(v217), v217, -v213)
end
v_u_2.handFrame = v_u_218
function v_u_2.hand(p219, p220, p221) -- name: hand
	local v222 = p220.Magnitude > 0.0001 and p220.Unit or Vector3.new(0, 1, 0)
	local v223 = p221 or Vector3.new(0, 0, -1)
	local v224 = v223 - v222 * v223:Dot(v222)
	if v224.Magnitude < 0.001 then
		local v225 = v222.Z
		v224 = math.abs(v225) < 0.9 and v222:Cross(Vector3.new(0, 0, 1)) or v222:Cross(Vector3.new(1, 0, 0))
	end
	local v226 = v224.Unit
	return CFrame.fromMatrix(p219, v226:Cross(v222), v222, -v226)
end
function v_u_2.solve(p227, p228, p229, p230, p231) -- name: solve
	-- upvalues: (copy) v_u_2, (copy) v_u_218
	local v232 = p231 or {}
	local v233 = nil
	local v234
	if p229 then
		v234 = v_u_218(p229, v232.exactR or v232.elbowR or (p228 * v_u_2.ELBOW_R or nil)) * p227.handR
	else
		v234 = nil
	end
	if p230 then
		v233 = v_u_218(p230, v232.exactL or v232.elbowL or (p228 * v_u_2.ELBOW_L or nil)) * p227.handL
	end
	return v234, v233
end
function v_u_2.place(p235, p236, p237) -- name: place
	-- upvalues: (copy) v_u_3
	if p235.visible then
		local v238 = p236 or v_u_3
		local v239 = p237 or v_u_3
		p235.cfs[1] = v238
		p235.cfs[2] = v239
		for v240, v241 in p235.attached do
			local v242 = v241.arm == p235.R and v238 and v238 or v239
			p235.cfs[v240 + 2] = v242 == v_u_3 and v_u_3 or v242 * v241.off
		end
		workspace:BulkMoveTo(p235.list, p235.cfs, Enum.BulkMoveMode.FireCFrameChanged)
	end
end
function v_u_2.update(p243, p244, p245, p246, p247) -- name: update
	if p243.visible then
		p243:place(p243:solve(p244, p245, p246, p247))
	end
end
function v_u_2.placeHelpers(p248, p249, p250) -- name: placeHelpers
	if p248.visible then
		if p248.root then
			p248.root.CFrame = p249
		end
		if p248.fake then
			p248.fake.CFrame = p249 * p248.fakeRest * (p250 or CFrame.identity)
		end
	end
end
function v_u_2.destroy(p251) -- name: destroy
	p251.model:Destroy()
end
return v_u_2