-- Decompiled by Executor
-- Path: ReplicatedStorage.Client.Controllers.ViewmodelController.Reticle

local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Shared.Config.AttachmentConfig)
local v_u_4 = {}
local v_u_5 = nil
local v_u_6 = nil
local v_u_7 = nil
local v_u_8 = nil
local v_u_9 = nil
local v_u_10 = nil
local v_u_11 = nil
local v_u_12 = nil
local v_u_13 = nil
local v_u_14 = nil
local v_u_15 = nil
local v_u_16 = 0
local function v_u_23() -- name: build
	-- upvalues: (copy) v_u_4, (copy) v_u_1, (ref) v_u_6, (ref) v_u_7, (ref) v_u_14, (ref) v_u_15, (ref) v_u_8, (ref) v_u_11, (ref) v_u_9, (ref) v_u_10, (ref) v_u_12, (ref) v_u_13, (ref) v_u_5
	local v17 = not v_u_4._parent and v_u_1.LocalPlayer
	if v17 then
		v17 = v_u_1.LocalPlayer:FindFirstChildOfClass("PlayerGui")
	end
	if v17 then
		local v18 = Instance.new("ScreenGui")
		v18.Name = "CombatReflex"
		v18.ResetOnSpawn = false
		v18.IgnoreGuiInset = true
		v18.ScreenInsets = Enum.ScreenInsets.None
		v18.DisplayOrder = 3
		v18.Enabled = false
		v_u_6 = Instance.new("CanvasGroup")
		v_u_6.Name = "Window"
		v_u_6.BackgroundTransparency = 1
		v_u_6.AnchorPoint = Vector2.new(0.5, 0.5)
		v_u_6.Size = UDim2.fromOffset(10, 10)
		v_u_6.Parent = v18
		v_u_7 = Instance.new("UICorner")
		v_u_7.CornerRadius = UDim.new(0.5, 0)
		v_u_7.Parent = v_u_6
		v_u_14 = Instance.new("Frame")
		v_u_14.Name = "Glass"
		v_u_14.BorderSizePixel = 0
		v_u_14.Size = UDim2.fromScale(1, 1)
		v_u_14.BackgroundColor3 = Color3.fromRGB(150, 170, 255)
		v_u_14.BackgroundTransparency = 0.86
		v_u_14.ZIndex = 0
		v_u_14.Parent = v_u_6
		local v19 = Instance.new("UIGradient")
		v19.Rotation = 90
		v19.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.4), NumberSequenceKeypoint.new(0.35, 1), NumberSequenceKeypoint.new(1, 1) })
		v19.Parent = v_u_14
		v_u_15 = Instance.new("UICorner")
		v_u_15.CornerRadius = UDim.new(0.5, 0)
		v_u_15.Parent = v_u_14
		v_u_8 = Instance.new("Frame")
		v_u_8.Name = "Holder"
		v_u_8.BackgroundTransparency = 1
		v_u_8.AnchorPoint = Vector2.new(0.5, 0.5)
		v_u_8.Size = UDim2.fromOffset(0, 0)
		v_u_8.Parent = v_u_6
		v_u_11 = Instance.new("Frame")
		v_u_11.Name = "Halo"
		v_u_11.AnchorPoint = Vector2.new(0.5, 0.5)
		v_u_11.Position = UDim2.fromScale(0, 0)
		v_u_11.BorderSizePixel = 0
		v_u_11.BackgroundTransparency = 0.82
		v_u_11.Parent = v_u_8
		local v20 = Instance.new("UICorner")
		v20.CornerRadius = UDim.new(0.5, 0)
		v20.Parent = v_u_11
		v_u_9 = Instance.new("Frame")
		v_u_9.Name = "Dot"
		v_u_9.AnchorPoint = Vector2.new(0.5, 0.5)
		v_u_9.Position = UDim2.fromScale(0, 0)
		v_u_9.BorderSizePixel = 0
		v_u_9.ZIndex = 2
		v_u_9.Parent = v_u_8
		local v21 = Instance.new("UICorner")
		v21.CornerRadius = UDim.new(0.5, 0)
		v21.Parent = v_u_9
		v_u_10 = Instance.new("UIStroke")
		v_u_10.Thickness = 1
		v_u_10.Transparency = 0.45
		v_u_10.Parent = v_u_9
		v_u_12 = Instance.new("Frame")
		v_u_12.Name = "Ring"
		v_u_12.AnchorPoint = Vector2.new(0.5, 0.5)
		v_u_12.Position = UDim2.fromScale(0, 0)
		v_u_12.BackgroundTransparency = 1
		v_u_12.ZIndex = 2
		v_u_12.Parent = v_u_8
		local v22 = Instance.new("UICorner")
		v22.CornerRadius = UDim.new(0.5, 0)
		v22.Parent = v_u_12
		v_u_13 = Instance.new("UIStroke")
		v_u_13.Thickness = 2
		v_u_13.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		v_u_13.Parent = v_u_12
		v18.Parent = v17
		v_u_5 = v18
	end
end
function v_u_4.hide() -- name: hide
	-- upvalues: (ref) v_u_5, (ref) v_u_16
	if v_u_5 then
		v_u_5.Enabled = false
	end
	v_u_16 = 0
end
function v_u_4.update(p24) -- name: update
	-- upvalues: (copy) v_u_4, (ref) v_u_5, (copy) v_u_23, (copy) v_u_3, (ref) v_u_16, (ref) v_u_6, (ref) v_u_7, (ref) v_u_15, (ref) v_u_8, (ref) v_u_9, (ref) v_u_10, (ref) v_u_11, (ref) v_u_12, (ref) v_u_13
	if type(p24) ~= "table" or (not p24.center or (not p24.aim or ((p24.alpha or 0) <= 0.02 or (p24.radius or 0) < 3))) then
		v_u_4.hide()
		return
	end
	if not v_u_5 then
		v_u_23()
	end
	if not v_u_5 then
		return
	end
	local v25 = workspace.CurrentCamera.ViewportSize.Y / 1080
	local v26 = v_u_3.ReticleStyle or {}
	local v27 = p24.color or Color3.fromRGB(255, 40, 40)
	local v28 = p24.alpha
	local v29 = math.clamp(v28, 0, 1)
	local v30 = p24.aspect or 1
	if v_u_16 == 0 then
		v_u_16 = 2 * p24.radius
	else
		local v31 = 2 * p24.radius - v_u_16
		if math.abs(v31) >= 1.5 then
			v_u_16 = 2 * p24.radius
		end
	end
	local v32 = v_u_16 / 2 + 0.5
	local v33 = math.floor(v32) * 2
	local v34 = v33 * v30 / 2 + 0.5
	local v35 = math.floor(v34) * 2
	v_u_5.Enabled = true
	local v36 = p24.center.X + 0.5
	local v37 = math.floor(v36)
	local v38 = p24.center.Y + 0.5
	local v39 = math.floor(v38)
	v_u_6.Position = UDim2.fromOffset(v37, v39)
	v_u_6.Size = UDim2.fromOffset(v35, v33)
	local v40 = p24.corner
	if type(v40) == "number" then
		local v41 = v_u_7
		local v42 = UDim.new
		local v43 = p24.corner
		v41.CornerRadius = v42(math.clamp(v43, 0, 0.5), 0)
	else
		v_u_7.CornerRadius = v30 > 1.05 and UDim.new(0.16, 0) or UDim.new(0.5, 0)
	end
	v_u_15.CornerRadius = v_u_7.CornerRadius
	v_u_6.GroupTransparency = 1 - v29
	local v44 = p24.aim.X - p24.center.X
	local v45 = p24.aim.Y - p24.center.Y
	if v44 * v44 + v45 * v45 < 1 then
		v44 = 0
		v45 = 0
	end
	local v46 = v_u_8
	local v47 = UDim2.fromOffset
	local v48 = v35 / 2
	local v49 = v44 + 0.5
	local v50 = v48 + math.floor(v49)
	local v51 = v33 / 2
	local v52 = v45 + 0.5
	v46.Position = v47(v50, v51 + math.floor(v52))
	local v53 = (v26.DotSize or 4) * 1.25 * v25 + 0.5
	local v54 = math.floor(v53)
	local v55 = math.max(3, v54)
	v_u_9.Size = UDim2.fromOffset(v55, v55)
	v_u_9.BackgroundColor3 = v27:Lerp(Color3.new(1, 1, 1), 0.18)
	v_u_10.Color = v27
	local v56 = v_u_10
	local v57 = v55 * 0.35 + 0.5
	local v58 = math.floor(v57)
	v56.Thickness = math.max(1, v58)
	v_u_11.Size = UDim2.fromOffset(v55 * 3.2, v55 * 3.2)
	v_u_11.BackgroundColor3 = v27
	if p24.style == "Holo" then
		local v59 = (v26.HoloRing or 34) * v25 + 0.5
		local v60 = math.floor(v59)
		v_u_12.Visible = true
		v_u_12.Size = UDim2.fromOffset(v60, v60)
		v_u_13.Color = v27
		local v61 = v_u_13
		local v62 = 2 * v25 + 0.5
		local v63 = math.floor(v62)
		v61.Thickness = math.max(1, v63)
	else
		v_u_12.Visible = false
	end
end
return v_u_4