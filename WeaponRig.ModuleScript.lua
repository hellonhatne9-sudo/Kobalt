-- Decompiled by Executor
-- Path: ReplicatedStorage.Shared.Combat.WeaponRig

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v_u_1.Shared.Config.WeaponConfig)
local v_u_3 = require(v_u_1.Shared.Config.AttachmentConfig)
local v_u_4 = {
	["MountFor"] = {
		["Muzzle"] = "MountMuzzle",
		["Grip"] = "MountUnder",
		["Optic"] = "MountOptic",
		["Stock"] = "MountStock",
		["Mag"] = "MountMag"
	},
	["ExtMagScale"] = 1.3,
	["MuzzleDeviceNames"] = {
		"MuzzleDevice",
		"FlashHider",
		"MuzzleBrake",
		"Compensator"
	},
	["TubeStocks"] = {
		["TacticalStock"] = true,
		["HeavyStock"] = true
	}
}
local v5, v_u_6 = pcall(function()
	-- upvalues: (copy) v_u_1
	return require(v_u_1:WaitForChild("Shared"):WaitForChild("Util"):WaitForChild("AssetLookup", 5))
end)
if not v5 or type(v_u_6) ~= "table" then
	v_u_6 = nil
end
local v_u_7 = {}
function v_u_4.simpleFallback(p8) -- name: simpleFallback
	-- upvalues: (copy) v_u_7, (copy) v_u_2
	if v_u_7[p8] then
		return v_u_7[p8]
	end
	local v9 = v_u_2.get(p8)
	local v10 = Instance.new("Model")
	v10.Name = p8
	local v11 = Instance.new("Part")
	v11.Name = "RootPart"
	v11.Size = Vector3.new(0.1, 0.1, 0.1)
	v11.Transparency = 1
	v11.CFrame = CFrame.identity
	v11.Parent = v10
	v10.PrimaryPart = v11
	local v12 = Instance.new("Part")
	v12.Name = "Body"
	if v9 and v9.Class == "Throwable" then
		v12.Shape = Enum.PartType.Ball
		v12.Size = Vector3.new(0.55, 0.55, 0.55)
		v12.Color = Color3.fromRGB(70, 78, 52)
		v12.CFrame = CFrame.identity
	else
		v12.Size = Vector3.new(0.18, 0.3, 2.6)
		v12.Color = Color3.fromRGB(45, 45, 48)
		v12.Material = Enum.Material.Metal
		v12.CFrame = CFrame.new(0, 0.1, -1.1)
	end
	v12.Parent = v10
	local v13 = Instance.new("WeldConstraint")
	v13.Part0 = v11
	v13.Part1 = v12
	v13.Parent = v11
	local v14 = Instance.new("Attachment")
	v14.Name = "Muzzle"
	v14.Position = Vector3.new(0, 0.1, -2.4)
	v14.Parent = v11
	local v15 = Instance.new("Attachment")
	v15.Name = "AimPoint"
	v15.Position = Vector3.new(0, 0.35, 0.6)
	v15.Parent = v11
	local v16 = Instance.new("Attachment")
	v16.Name = "GripL"
	v16.Position = Vector3.new(0, 0, -1.2)
	v16.Parent = v11
	local v17 = Instance.new("Attachment")
	v17.Name = "Back"
	v17.Position = Vector3.new(0, 0, -0.8)
	v17.Parent = v11
	local v18 = Instance.new("Attachment")
	v18.Name = "Eject"
	v18.Position = Vector3.new(0.1, 0.2, -0.4)
	v18.Parent = v11
	v10:SetAttribute("WeaponId", p8)
	v10:SetAttribute("AnimSet", v9 and v9.AnimSet or "Rifle")
	v_u_7[p8] = v10
	return v10
end
function v_u_4.template(p19, p20) -- name: template
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_6, (copy) v_u_4
	local v21 = v_u_1:FindFirstChild("Assets")
	local v22 = v_u_2.get(p19)
	if v21 and (type(p20) == "string" and p20 ~= "") then
		local v23
		if v_u_6 then
			v23 = v_u_6.find("WeaponSkins", p20)
		else
			local v24 = v_u_1:FindFirstChild("Assets")
			if v24 then
				v24 = v24:FindFirstChild("WeaponSkins")
			end
			v23 = v24 and v24:FindFirstChild(p20) or nil
		end
		if v23 and (v23:IsA("Model") and v23:GetAttribute("WeaponId") == p19) then
			return v23, false
		end
	end
	if v21 then
		local v25 = v21:FindFirstChild("Weapons")
		local v26
		if v25 then
			v26 = v25:FindFirstChild(p19)
		else
			v26 = v25
		end
		if v26 and v26:IsA("Model") then
			return v26, false
		end
		if v22 and v22.Class == "Throwable" then
			local v27 = v21:FindFirstChild("Items")
			if v27 then
				v27 = v27:FindFirstChild(p19)
			end
			if v27 and v27:IsA("Model") then
				return v27, false
			end
		end
		if not v22 or v22.Class ~= "Melee" and v22.Class ~= "Throwable" then
			if v25 then
				v25 = v25:FindFirstChild("_Fallback")
			end
			if v25 and v25:IsA("Model") then
				return v25, true
			end
		end
	end
	return v_u_4.simpleFallback(p19), true
end
function v_u_4.rootOf(p28) -- name: rootOf
	return p28:FindFirstChild("RootPart") or (p28.PrimaryPart or p28:FindFirstChild("Root"))
end
function v_u_4.skinFolder(p29, p30) -- name: skinFolder
	-- upvalues: (copy) v_u_6, (copy) v_u_1
	if type(p30) == "string" and p30 ~= "" then
		local v31
		if v_u_6 then
			v31 = v_u_6.find("WeaponSkins", p30)
		else
			local v32 = v_u_1:FindFirstChild("Assets")
			if v32 then
				v32 = v32:FindFirstChild("WeaponSkins")
			end
			v31 = v32 and v32:FindFirstChild(p30) or nil
		end
		if v31 and (v31:IsA("Folder") and v31:GetAttribute("WeaponId") == p29) then
			return v31
		else
			return nil
		end
	else
		return nil
	end
end
local v_u_33 = {}
local function v_u_38(p34) -- name: keepSet
	-- upvalues: (copy) v_u_33
	local v35 = p34:GetAttribute("KeepParts")
	if type(v35) ~= "string" or v35 == "" then
		return {}
	end
	local v36 = v_u_33[v35]
	if not v36 then
		v36 = {}
		for v37 in string.gmatch(v35, "[^,]+") do
			v36[v37] = true
		end
		v_u_33[v35] = v36
	end
	return v36
end
function v_u_4.applySkin(p39, p40) -- name: applySkin
	-- upvalues: (copy) v_u_38
	local v41 = p40:FindFirstChild("Default")
	local v42 = v_u_38(p40)
	for _, v43 in p39:GetDescendants() do
		if not v43:IsA("MeshPart") or v42[v43.Name] then
			continue
		end
		local v44 = p40:FindFirstChild(v43.Name)
		if v44 then
			if not v44:IsA("SurfaceAppearance") then
				v44 = v41
			end
		else
			v44 = v41
		end
		if not (v44 and v44:IsA("SurfaceAppearance")) then
			continue
		end
		local v45 = v43:FindFirstChildOfClass("SurfaceAppearance")
		if v45 then
			v45:Destroy()
		end
		local v46 = v44:Clone()
		v46.Name = "SurfaceAppearance"
		v46.Parent = v43
	end
	local v47 = p40:FindFirstChild("FX")
	if v47 then
		for _, v48 in v47:GetChildren() do
			local v49 = p39:FindFirstChild(v48:GetAttribute("Part") or "RootPart", true)
			if not (v49 and v49:IsA("BasePart")) then
				continue
			end
			local v50 = v48:Clone()
			v50:SetAttribute("SkinFX", true)
			v50.Parent = v49
		end
	end
	p39:SetAttribute("SkinId", p40.Name)
end
local function v_u_54(p51, p52) -- name: transformModel
	for _, v53 in p51:GetDescendants() do
		if not v53:IsA("BasePart") then
			continue
		end
		v53.CFrame = p52 * v53.CFrame
	end
end
local function v_u_59(p55, p56) -- name: prepParts
	for _, v57 in p55:GetDescendants() do
		if v57:IsA("BasePart") then
			v57.Anchored = false
			v57.CanCollide = false
			v57.CanQuery = false
			v57.CanTouch = false
			v57.Massless = true
			local v58
			if p56 then
				v58 = v57.Transparency < 1
			else
				v58 = p56
			end
			v57.CastShadow = v58
		else
			if not (v57:IsA("Script") or (v57:IsA("LocalScript") or v57:IsA("ModuleScript"))) then
				continue
			end
			v57:Destroy()
		end
	end
end
local function v_u_68(p60) -- name: ensureRoot
	local v61 = p60:FindFirstChild("RootPart")
	if v61 then
		p60.PrimaryPart = v61
		return v61
	end
	local v62 = p60:FindFirstChild("RootPart") or (p60.PrimaryPart or p60:FindFirstChild("Root"))
	local v63 = p60:GetBoundingBox()
	local v64 = Instance.new("Part")
	v64.Name = "RootPart"
	v64.Size = Vector3.new(0.1, 0.1, 0.1)
	v64.Transparency = 1
	if v62 then
		v63 = v62.CFrame - v62.Position + v63.Position or v63
	end
	v64.CFrame = v63
	v64.Parent = p60
	for _, v65 in p60:GetDescendants() do
		if not v65:IsA("BasePart") or (v65 == v64 or v65 == v62) then
			continue
		end
		local v66 = Instance.new("WeldConstraint")
		v66.Part0 = v64
		v66.Part1 = v65
		v66.Parent = v64
	end
	if v62 then
		local v67 = Instance.new("WeldConstraint")
		v67.Part0 = v64
		v67.Part1 = v62
		v67.Parent = v64
	end
	p60.PrimaryPart = v64
	return v64
end
local function v_u_71(p69) -- name: hideBeams
	for _, v70 in p69:GetDescendants() do
		if not (v70:IsA("Beam") or (v70:IsA("ParticleEmitter") or v70:IsA("Trail"))) then
			continue
		end
		v70.Enabled = false
		v70:SetAttribute("RigOff", true)
	end
end
local function v_u_75(p72) -- name: hidePart
	-- upvalues: (copy) v_u_71
	if p72 and p72:IsA("BasePart") then
		p72.Transparency = 1
		p72.CastShadow = false
		p72:SetAttribute("RigHidden", true)
		v_u_71(p72)
		local v73 = p72.Parent
		if v73 then
			for _, v74 in v73:GetChildren() do
				if v74 == p72 or (not v74:IsA("BasePart") or v74:GetAttribute("SkinHost") ~= p72.Name) then
					continue
				end
				v74.Transparency = 1
				v74.CastShadow = false
				v74:SetAttribute("RigHidden", true)
				v_u_71(v74)
			end
		end
	end
end
v_u_4.hidePart = v_u_75
function v_u_4.extendMag(p76) -- name: extendMag
	-- upvalues: (copy) v_u_4
	local v77 = p76.mag
	if not v77 or v77:GetAttribute("Extended") then
		return
	end
	local v78 = v77.Size
	local v79 = v78.Y >= v78.Z
	local v80 = v79 and v78.Y or v78.Z
	local v81 = v80 * (v_u_4.ExtMagScale - 1) * 0.5
	local v82 = p76.root
	if v82 then
		v82 = p76.root:FindFirstChild("MountMag")
	end
	local v83 = v82 and v77.CFrame:PointToObjectSpace(v82.WorldPosition) or Vector3.new(0, v80, 0)
	local v84 = (v79 and v83.Y or v83.Z) > 0 and -1 or 1
	local v85, v86, v87, v88, v89
	if v79 then
		local v90 = v84 * v81
		v85 = Vector3.new(0, v90, 0)
		if v85 then
			if not v79 then
				v86 = v78.X
				v87 = v78.Y
				v88 = v80 * v_u_4.ExtMagScale
				v94 = Vector3.new(v86, v87, v88)
				v77.Size = v94
				if p76.magMotor then
					p76.magMotor.C1 = CFrame.new(-v85) * p76.magMotor.C1
					if p76.motorsC0 then
						p76.motorsC0[p76.magMotor] = p76.magMotor.C0
					end
				else
					v77.CFrame = v77.CFrame * CFrame.new(v85)
				end
				v77:SetAttribute("Extended", true)
				return
			end
		else
			v89 = v84 * v81
			v85 = Vector3.new(0, 0, v89)
			if not v79 then
				v86 = v78.X
				v87 = v78.Y
				v88 = v80 * v_u_4.ExtMagScale
				v94 = Vector3.new(v86, v87, v88)
				v77.Size = v94
				if p76.magMotor then
					p76.magMotor.C1 = CFrame.new(-v85) * p76.magMotor.C1
					if p76.motorsC0 then
						p76.motorsC0[p76.magMotor] = p76.magMotor.C0
					end
				else
					v77.CFrame = v77.CFrame * CFrame.new(v85)
				end
				v77:SetAttribute("Extended", true)
				return
			end
		end
	else
		v89 = v84 * v81
		v85 = Vector3.new(0, 0, v89)
		if not v79 then
			v86 = v78.X
			v87 = v78.Y
			v88 = v80 * v_u_4.ExtMagScale
			v94 = Vector3.new(v86, v87, v88)
			v77.Size = v94
			if p76.magMotor then
				p76.magMotor.C1 = CFrame.new(-v85) * p76.magMotor.C1
				if p76.motorsC0 then
					p76.motorsC0[p76.magMotor] = p76.magMotor.C0
				end
			else
				v77.CFrame = v77.CFrame * CFrame.new(v85)
			end
			v77:SetAttribute("Extended", true)
			return
		end
	end
	local v91 = v78.X
	local v92 = v80 * v_u_4.ExtMagScale
	local v93 = v78.Z
	local v94 = Vector3.new(v91, v92, v93)
	if v94 then
		v77.Size = v94
		if p76.magMotor then
			p76.magMotor.C1 = CFrame.new(-v85) * p76.magMotor.C1
			if p76.motorsC0 then
				p76.motorsC0[p76.magMotor] = p76.magMotor.C0
			end
		else
			v77.CFrame = v77.CFrame * CFrame.new(v85)
		end
		v77:SetAttribute("Extended", true)
	else
		v86 = v78.X
		v87 = v78.Y
		v88 = v80 * v_u_4.ExtMagScale
		v94 = Vector3.new(v86, v87, v88)
		v77.Size = v94
		if p76.magMotor then
			p76.magMotor.C1 = CFrame.new(-v85) * p76.magMotor.C1
			if p76.motorsC0 then
				p76.motorsC0[p76.magMotor] = p76.magMotor.C0
			end
		else
			v77.CFrame = v77.CFrame * CFrame.new(v85)
		end
		v77:SetAttribute("Extended", true)
	end
end
local function v_u_99(p95, p96) -- name: findMotor
	for _, v97 in p96 do
		local v98 = p95:FindFirstChild(v97)
		if not (v98 and v98:IsA("Motor6D")) then
			continue
		end
		return v98
	end
	return nil
end
function v_u_4.build(p100, p101, p102) -- name: build
	-- upvalues: (copy) v_u_1, (copy) v_u_4, (copy) v_u_68, (copy) v_u_59, (copy) v_u_99, (copy) v_u_2, (copy) v_u_3, (copy) v_u_54, (copy) v_u_75
	local v103 = p102 or {}
	local v104 = v103.skin
	local v105
	if v104 == nil then
		local v106 = v103.player
		if typeof(v106) == "Instance" and v103.player:IsA("Player") then
			v105 = v103.player:GetAttribute("Skin_" .. p100)
			if type(v105) == "string" then
				if v105 == "" then
					v105 = v104
				end
			else
				v105 = v104
			end
		else
			v105 = v104
		end
	else
		v105 = v104
	end
	if v105 == nil then
		local v107 = require
		local v108 = v_u_1.Shared.Config.GameConfig
		local v109, v110 = pcall(v107, v108)
		if v109 and v110.isStudio() then
			local v111 = v110.Studio.TestWeaponSkins
			if type(v111) == "table" then
				v105 = v110.Studio.TestWeaponSkins[p100]
			end
		end
	end
	local v112 = v_u_4.skinFolder(p100, v105)
	local v113, v114 = v_u_4.template(p100, v105)
	local v_u_115 = v113:Clone()
	v_u_115.Name = p100
	if v112 and not v114 then
		v_u_4.applySkin(v_u_115, v112)
	end
	local v116 = v_u_68(v_u_115)
	v_u_59(v_u_115, v103.castShadow ~= false)
	v116.Transparency = 1
	local v_u_117 = {
		["root"] = v116,
		["attachments"] = {},
		["fallback"] = v114,
		["id"] = p100,
		["motorsC0"] = {},
		["muzzle"] = v116:FindFirstChild("Muzzle"),
		["aimPoint"] = v116:FindFirstChild("AimPoint"),
		["reticlePoint"] = v116:FindFirstChild("ReticlePoint"),
		["eject"] = v116:FindFirstChild("Eject"),
		["gripL"] = v116:FindFirstChild("GripL"),
		["back"] = v116:FindFirstChild("Back"),
		["magMotor"] = v_u_99(v116, { "MagazineBase", "Mag" })
	}
	v_u_117.mag = v_u_117.magMotor and v_u_117.magMotor.Part1 or v_u_115:FindFirstChild("MagazineBase", true)
	v_u_117.bolt = v_u_99(v116, { "Bolt" })
	v_u_117.boltHandle = v_u_99(v116, { "BoltHandle" })
	v_u_117.slide = v_u_99(v116, { "Slide" })
	v_u_117.pump = v_u_99(v116, { "Pump" })
	v_u_117.chargingHandle = v_u_99(v116, { "ChargingHandle" })
	v_u_117.lever = v_u_99(v116, { "Lever" })
	v_u_117.barrels = v_u_99(v116, { "Barrels", "Barrel" })
	v_u_117.hammer = v_u_99(v116, { "Hammer" })
	v_u_117.cylinder = v_u_99(v116, { "Cylinder" })
	v_u_117.feedCover = v_u_99(v116, { "FeedCover" })
	v_u_117.stockMotor = v_u_99(v116, { "Stock" })
	v_u_117.builtInScope = v_u_115:GetAttribute("BuiltInScope") == true
	v_u_117.builtInOptic = v_u_115:GetAttribute("BuiltInOptic")
	if v_u_117.builtInOptic then
		local v118 = v_u_115:FindFirstChild("Reticle", true)
		if v118 and v118:IsA("BasePart") then
			v_u_117.reticlePart = v118
		end
	end
	for _, v119 in v116:GetChildren() do
		if not v119:IsA("Motor6D") then
			continue
		end
		v_u_117.motorsC0[v119] = v119.C0
	end
	local v120
	if v_u_117.feedCover then
		v120 = v_u_117.feedCover.Part1 or nil
	else
		v120 = nil
	end
	local v121
	if v_u_117.barrels then
		v121 = v_u_117.barrels.Part1 or nil
	else
		v121 = nil
	end
	local v122 = v_u_2.get(p100)
	local v123
	if v122 then
		local v124 = v122.OpticHost
		if type(v124) == "string" then
			v123 = v_u_99(v116, { v122.OpticHost }) or nil
		else
			v123 = nil
		end
	else
		v123 = nil
	end
	local v125 = v123 and v123.Part1 or nil
	local v126 = v_u_1:FindFirstChild("Assets")
	if v126 then
		v126 = v126:FindFirstChild("Attachments")
	end
	if not p101 then
		if v103.anchored then
			v116.Anchored = true
		end
		return v_u_115, v_u_117
	end
	for v127, v128 in p101 do
		if type(v128) ~= "string" or v127 == "Mag" then
			continue
		end
		local v129 = v_u_4.MountFor[v127] or ""
		local v130 = v116:FindFirstChild(v127 == "Stock" and (v_u_4.TubeStocks[v128] and v116:FindFirstChild("MountStockTube")) and "MountStockTube" or v129)
		local v131
		if v_u_3.modelFor then
			v131 = v_u_3.modelFor(v128, v_u_2.get(p100)) or v128
		else
			v131 = v128
		end
		local v132
		if v126 then
			v132 = v126:FindFirstChild(v131) or v126:FindFirstChild(v128)
		else
			v132 = v126
		end
		if not (v130 and (v130:IsA("Attachment") and (v132 and v132:IsA("Model")))) then
			continue
		end
		local v133 = v132:Clone()
		local v134 = v133:FindFirstChild("RootPart") or (v133.PrimaryPart or v133:FindFirstChild("Root"))
		if v134 then
			local v135 = v134:FindFirstChild("Mount")
			v_u_54(v133, v116.CFrame * v130.CFrame * (v135 and v135.CFrame:Inverse() or CFrame.identity) * v134.CFrame:Inverse())
			v_u_59(v133, v103.castShadow ~= false)
			v134.Transparency = 1
			local v136 = Instance.new("WeldConstraint")
			local v137, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148, v149, v150, v151
			if v127 == "Optic" then
				if v125 then
					v137 = v125
					v136.Part0 = v137
					v136.Part1 = v134
					v136.Parent = v134
					v133.Name = "Att_" .. v127
					v133:SetAttribute("AttachmentId", v128)
					v133.Parent = v_u_115
					v_u_117.attachments[v127] = v133
					if v127 == "Optic" then
						v_u_117.opticModel = v133
						v_u_117.opticId = v128
						v138 = v134:FindFirstChild("AimPoint")
						if v138 then
							v_u_117.aimPoint = v138
						end
						v_u_117.reticlePoint = v134:FindFirstChild("ReticlePoint")
						v_u_117.lens = v133:FindFirstChild("Lens", true)
						v139 = v_u_3.get(v128)
						if v139 == nil then
							v140 = false
						else
							v140 = v139.Canted == true
						end
						v_u_117.canted = v140
					elseif v127 == "Grip" then
						v_u_117.gripAtt = v134:FindFirstChild("Grip")
					else
						if v127 ~= "Muzzle" then
							continue
						end
						v141 = v134:FindFirstChild("Muzzle")
						v142 = Instance.new("Attachment")
						v142.Name = "MuzzleTip"
						if v141 and v141:IsA("Attachment") then
							v142.CFrame = v116.CFrame:ToObjectSpace(v141.WorldCFrame)
						else
							v143, v144 = v133:GetBoundingBox()
							v145 = v116.CFrame:PointToObjectSpace((v143 * CFrame.new(0, 0, -v144.Z / 2)).Position)
							v146 = v_u_117.muzzle and (v_u_117.muzzle.Position or Vector3.new(0, 0, 0)) or Vector3.new(0, 0, 0)
							v147 = v146.X
							v148 = v146.Y
							v149 = v145.Z
							v150 = v146.Z
							v151 = math.min(v149, v150)
							v142.Position = Vector3.new(v147, v148, v151)
						end
						v142.Parent = v116
						v_u_117.muzzle = v142
					end
				elseif v120 then
					v137 = v120
					v136.Part0 = v137
					v136.Part1 = v134
					v136.Parent = v134
					v133.Name = "Att_" .. v127
					v133:SetAttribute("AttachmentId", v128)
					v133.Parent = v_u_115
					v_u_117.attachments[v127] = v133
					if v127 == "Optic" then
						v_u_117.opticModel = v133
						v_u_117.opticId = v128
						v138 = v134:FindFirstChild("AimPoint")
						if v138 then
							v_u_117.aimPoint = v138
						end
						v_u_117.reticlePoint = v134:FindFirstChild("ReticlePoint")
						v_u_117.lens = v133:FindFirstChild("Lens", true)
						v139 = v_u_3.get(v128)
						if v139 == nil then
							v140 = false
						else
							v140 = v139.Canted == true
						end
						v_u_117.canted = v140
					elseif v127 == "Grip" then
						v_u_117.gripAtt = v134:FindFirstChild("Grip")
					else
						if v127 ~= "Muzzle" then
							continue
						end
						v141 = v134:FindFirstChild("Muzzle")
						v142 = Instance.new("Attachment")
						v142.Name = "MuzzleTip"
						if v141 and v141:IsA("Attachment") then
							v142.CFrame = v116.CFrame:ToObjectSpace(v141.WorldCFrame)
						else
							v143, v144 = v133:GetBoundingBox()
							v145 = v116.CFrame:PointToObjectSpace((v143 * CFrame.new(0, 0, -v144.Z / 2)).Position)
							v146 = v_u_117.muzzle and (v_u_117.muzzle.Position or Vector3.new(0, 0, 0)) or Vector3.new(0, 0, 0)
							v147 = v146.X
							v148 = v146.Y
							v149 = v145.Z
							v150 = v146.Z
							v151 = math.min(v149, v150)
							v142.Position = Vector3.new(v147, v148, v151)
						end
						v142.Parent = v116
						v_u_117.muzzle = v142
					end
				else
					v137 = v127 == "Muzzle" and v121 and v121 or v116
					v136.Part0 = v137
					v136.Part1 = v134
					v136.Parent = v134
					v133.Name = "Att_" .. v127
					v133:SetAttribute("AttachmentId", v128)
					v133.Parent = v_u_115
					v_u_117.attachments[v127] = v133
					if v127 == "Optic" then
						v_u_117.opticModel = v133
						v_u_117.opticId = v128
						v138 = v134:FindFirstChild("AimPoint")
						if v138 then
							v_u_117.aimPoint = v138
						end
						v_u_117.reticlePoint = v134:FindFirstChild("ReticlePoint")
						v_u_117.lens = v133:FindFirstChild("Lens", true)
						v139 = v_u_3.get(v128)
						if v139 == nil then
							v140 = false
						else
							v140 = v139.Canted == true
						end
						v_u_117.canted = v140
					elseif v127 == "Grip" then
						v_u_117.gripAtt = v134:FindFirstChild("Grip")
					else
						if v127 ~= "Muzzle" then
							continue
						end
						v141 = v134:FindFirstChild("Muzzle")
						v142 = Instance.new("Attachment")
						v142.Name = "MuzzleTip"
						if v141 and v141:IsA("Attachment") then
							v142.CFrame = v116.CFrame:ToObjectSpace(v141.WorldCFrame)
						else
							v143, v144 = v133:GetBoundingBox()
							v145 = v116.CFrame:PointToObjectSpace((v143 * CFrame.new(0, 0, -v144.Z / 2)).Position)
							v146 = v_u_117.muzzle and (v_u_117.muzzle.Position or Vector3.new(0, 0, 0)) or Vector3.new(0, 0, 0)
							v147 = v146.X
							v148 = v146.Y
							v149 = v145.Z
							v150 = v146.Z
							v151 = math.min(v149, v150)
							v142.Position = Vector3.new(v147, v148, v151)
						end
						v142.Parent = v116
						v_u_117.muzzle = v142
					end
				end
			else
				v137 = v127 == "Muzzle" and v121 and v121 or v116
				v136.Part0 = v137
				v136.Part1 = v134
				v136.Parent = v134
				v133.Name = "Att_" .. v127
				v133:SetAttribute("AttachmentId", v128)
				v133.Parent = v_u_115
				v_u_117.attachments[v127] = v133
				if v127 == "Optic" then
					v_u_117.opticModel = v133
					v_u_117.opticId = v128
					v138 = v134:FindFirstChild("AimPoint")
					if v138 then
						v_u_117.aimPoint = v138
					end
					v_u_117.reticlePoint = v134:FindFirstChild("ReticlePoint")
					v_u_117.lens = v133:FindFirstChild("Lens", true)
					v139 = v_u_3.get(v128)
					if v139 == nil then
						v140 = false
					else
						v140 = v139.Canted == true
					end
					v_u_117.canted = v140
				elseif v127 == "Grip" then
					v_u_117.gripAtt = v134:FindFirstChild("Grip")
				else
					if v127 ~= "Muzzle" then
						continue
					end
					v141 = v134:FindFirstChild("Muzzle")
					v142 = Instance.new("Attachment")
					v142.Name = "MuzzleTip"
					if v141 and v141:IsA("Attachment") then
						v142.CFrame = v116.CFrame:ToObjectSpace(v141.WorldCFrame)
					else
						v143, v144 = v133:GetBoundingBox()
						v145 = v116.CFrame:PointToObjectSpace((v143 * CFrame.new(0, 0, -v144.Z / 2)).Position)
						v146 = v_u_117.muzzle and (v_u_117.muzzle.Position or Vector3.new(0, 0, 0)) or Vector3.new(0, 0, 0)
						v147 = v146.X
						v148 = v146.Y
						v149 = v145.Z
						v150 = v146.Z
						v151 = math.min(v149, v150)
						v142.Position = Vector3.new(v147, v148, v151)
					end
					v142.Parent = v116
					v_u_117.muzzle = v142
				end
			end
		else
			v133:Destroy()
		end
	end
	local function v157(p152, p153) -- name: ownParts
		-- upvalues: (copy) v_u_115, (copy) v_u_117
		for _, v154 in v_u_115:GetDescendants() do
			if not (v154:IsA("BasePart") and p152[v154.Name]) then
				continue
			end
			local v155 = false
			for _, v156 in v_u_117.attachments do
				if not v154:IsDescendantOf(v156) then
					continue
				end
				v155 = true
			end
			if v155 then
				break
			end
			p153(v154)
		end
	end
	if p101.Muzzle and v_u_117.attachments.Muzzle then
		local v158 = {}
		for _, v159 in v_u_4.MuzzleDeviceNames do
			v158[v159] = true
		end
		local v160 = v_u_115:GetAttribute("MuzzleDevicePart")
		if type(v160) == "string" then
			v158[v160] = true
		end
		v157(v158, v_u_75)
	end
	local v161 = p101.Stock
	if type(v161) == "string" and (v_u_4.TubeStocks[p101.Stock] and v_u_117.attachments.Stock) then
		v157({
			["Stock"] = true,
			["StockPad"] = true
		}, v_u_75)
	end
	if p101.Grip and v_u_117.attachments.Grip then
		v157({
			["Foregrip"] = true,
			["FrontGrip"] = true
		}, v_u_75)
	end
	if p101.Optic and v_u_117.opticModel then
		for _, v162 in { "IronFront", "IronRear" } do
			local v163 = v_u_115:GetAttribute(v162 .. "Fold")
			local v164 = v116:FindFirstChild(v162)
			if type(v163) == "number" and (v164 and v164:IsA("Motor6D")) then
				v164.C0 = v164.C0 * CFrame.Angles(math.rad(v163), 0, 0)
				v_u_117.motorsC0[v164] = v164.C0
			else
				local v165 = v_u_115:FindFirstChild(v162, true)
				if not v165 or v165:IsDescendantOf(v_u_117.opticModel) then
					continue
				end
				v_u_75(v165)
			end
		end
	end
	if p101.Mag and v_u_3.mod(p101.Mag, "ExtMag") then
		v_u_4.extendMag(v_u_117)
	end
	if v103.anchored then
		v116.Anchored = true
	end
	return v_u_115, v_u_117
end
function v_u_4.setLocalTransparency(p166, p167) -- name: setLocalTransparency
	if p166 then
		for _, v168 in p166:GetDescendants() do
			if not v168:IsA("BasePart") then
				continue
			end
			v168.LocalTransparencyModifier = p167
		end
	end
end
function v_u_4.signature(p169) -- name: signature
	if type(p169) ~= "table" then
		return ""
	end
	local v170 = p169.attachments or {}
	local v171 = table.concat
	local v172 = {}
	local v173 = p169.id
	local v174 = tostring(v173)
	local v175 = p169.uid
	local v176 = tostring(v175)
	local v177 = v170.Muzzle
	local v178 = tostring(v177)
	local v179 = v170.Grip
	local v180 = tostring(v179)
	local v181 = v170.Optic
	local v182 = tostring(v181)
	local v183 = v170.Mag
	local v184 = tostring(v183)
	local v185 = v170.Stock
	__set_list(v172, 1, {v174, v176, v178, v180, v182, v184, (tostring(v185))})
	return v171(v172, "|")
end
return v_u_4