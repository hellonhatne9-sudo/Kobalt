-- Decompiled by Executor
-- Path: ReplicatedStorage.Client.Controllers.UI_HUD.Weapon

local v_u_1 = game:GetService("UserInputService")
local v2 = script.Parent.Parent.Parent:WaitForChild("UIKit")
local v3 = require(v2.Theme)
local v_u_4 = require(v2.UI)
local v_u_5 = require(v2.Art)
local v_u_6 = require(v2.Deps)
local v_u_7 = require(v2.Inv)
local v_u_8 = require(v2.ItemIcon)
local v_u_9 = require(v2.ItemInfo)
local v_u_10 = v3.Color
local v_u_11 = v3.Font
local v12 = {}
local v_u_13 = {
	"Primary1",
	"Primary2",
	"Pistol",
	"Melee",
	"Throwable"
}
local v_u_14 = {
	["Primary1"] = {
		["w"] = 204,
		["iw"] = 150,
		["ih"] = 40,
		["gun"] = true
	},
	["Primary2"] = {
		["w"] = 204,
		["iw"] = 150,
		["ih"] = 40,
		["gun"] = true
	},
	["Pistol"] = {
		["w"] = 118,
		["iw"] = 72,
		["ih"] = 36,
		["gun"] = true
	},
	["Melee"] = {
		["w"] = 72,
		["iw"] = 54,
		["ih"] = 36
	},
	["Throwable"] = {
		["w"] = 72,
		["iw"] = 38,
		["ih"] = 32,
		["iy"] = -6
	}
}
local v_u_15 = {
	["Frag"] = { "FRAG", Color3.fromRGB(150, 215, 105) },
	["Smoke"] = { "SMOKE", Color3.fromRGB(215, 218, 222) },
	["Stun"] = { "STUN", Color3.fromRGB(255, 222, 90) },
	["Molotov"] = { "MOLOTOV", Color3.fromRGB(255, 140, 60) }
}
local v_u_16 = Rect.new(24, 24, 816, 236)
local v_u_17 = nil
local v_u_18 = nil
local v_u_19 = {}
local v_u_20 = nil
local v_u_21 = nil
local v_u_22 = nil
local v_u_23 = 0
local v_u_24 = nil
local v_u_25 = nil
local v_u_26 = nil
local v_u_27 = nil
local v_u_28 = nil
local function v_u_47(p29, p30, p31) -- name: slotBox
	-- upvalues: (copy) v_u_14, (copy) v_u_4, (copy) v_u_5, (copy) v_u_16, (copy) v_u_10, (copy) v_u_11, (copy) v_u_8, (copy) v_u_19
	local v32 = v_u_14[p30]
	local v33 = v_u_4.frame({
		["Name"] = nil,
		["Size"] = nil,
		["LayoutOrder"] = nil,
		["Visible"] = false,
		["Parent"] = nil,
		["Name"] = "Slot" .. p29,
		["Size"] = UDim2.fromOffset(v32.w, 62),
		["LayoutOrder"] = p29,
		["Parent"] = p31
	})
	local v34 = v_u_4.new("ImageLabel", {
		["Name"] = "Bg",
		["BackgroundTransparency"] = 1,
		["Image"] = nil,
		["ScaleType"] = nil,
		["SliceCenter"] = nil,
		["SliceScale"] = 0.25,
		["Size"] = nil,
		["Parent"] = nil,
		["Image"] = v_u_5.Image.weapon_slot,
		["ScaleType"] = Enum.ScaleType.Slice,
		["SliceCenter"] = v_u_16,
		["Size"] = UDim2.fromScale(1, 1),
		["Parent"] = v33
	})
	v_u_5.set(v34, (p30 == "Melee" and true or p30 == "Throwable") and "slot_aruncabil" or "slot_arma", 0.3875)
	local v35 = p30 == "Melee" and true or p30 == "Throwable"
	local v36 = v_u_4.new
	local v37 = "Frame"
	local v38 = {
		["Name"] = "Num",
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 1,
		["Position"] = nil,
		["Size"] = nil,
		["ZIndex"] = 3,
		["Parent"] = nil,
		["BackgroundColor3"] = v_u_10.White
	}
	local v39
	if v35 then
		v39 = UDim2.fromOffset(4, 3)
	else
		v39 = UDim2.fromOffset(0, 0)
	end
	v38.Position = v39
	local v40
	if v35 then
		v40 = UDim2.fromOffset(15, 15)
	else
		v40 = UDim2.new(0, 22, 1, 0)
	end
	v38.Size = v40
	v38.Parent = v33
	local v41 = v36(v37, v38)
	local v42 = v_u_4.label({
		["Text"] = nil,
		["Font"] = nil,
		["TextSize"] = nil,
		["TextColor3"] = nil,
		["TextXAlignment"] = nil,
		["Size"] = nil,
		["ZIndex"] = 3,
		["Parent"] = nil,
		["Text"] = tostring(p29),
		["Font"] = v_u_11.Bold,
		["TextSize"] = v35 and 11 or 13,
		["TextColor3"] = v_u_10.TextDim,
		["TextXAlignment"] = Enum.TextXAlignment.Center,
		["Size"] = UDim2.fromScale(1, 1),
		["Parent"] = v41
	})
	local v43 = v_u_8.create(nil, {
		["flat"] = true,
		["flip"] = true,
		["aspect"] = nil,
		["size"] = nil,
		["anchor"] = nil,
		["position"] = nil,
		["aspect"] = v32.iw / v32.ih,
		["size"] = UDim2.fromOffset(v32.iw, v32.ih),
		["anchor"] = Vector2.new(0.5, 0.5),
		["position"] = UDim2.new(0.5, v32.gun and 8 or 0, 0.5, v32.gun and -5 or (v32.iy or -2))
	})
	v43.Parent = v33
	local v44 = v_u_4.shadow(v_u_4.label({
		["Name"] = "Ammo",
		["Text"] = "",
		["RichText"] = true,
		["Font"] = nil,
		["TextSize"] = 17,
		["TextColor3"] = nil,
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["ZIndex"] = 3,
		["Parent"] = nil,
		["Font"] = v_u_11.Bold,
		["TextColor3"] = v_u_10.White,
		["AnchorPoint"] = Vector2.new(0, 1),
		["Position"] = UDim2.new(0, 27, 1, -3),
		["Size"] = UDim2.new(1, -34, 0, 20),
		["Parent"] = v33
	}), 0.5)
	local v45 = v_u_4.shadow(v_u_4.label({
		["Name"] = "Count",
		["Text"] = "",
		["Font"] = nil,
		["TextSize"] = 14,
		["TextXAlignment"] = nil,
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["ZIndex"] = 3,
		["Parent"] = nil,
		["Font"] = v_u_11.Bold,
		["TextXAlignment"] = Enum.TextXAlignment.Right,
		["AnchorPoint"] = Vector2.new(1, 0),
		["Position"] = UDim2.new(1, -6, 0, 4),
		["Size"] = UDim2.fromOffset(30, 16),
		["Parent"] = v33
	}), 0.35)
	local v46
	if p30 == "Throwable" then
		v46 = v_u_4.shadow(v_u_4.label({
			["Name"] = "Kind",
			["Text"] = "",
			["Font"] = nil,
			["TextScaled"] = true,
			["TextColor3"] = nil,
			["TextXAlignment"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["ZIndex"] = 3,
			["Parent"] = nil,
			["Font"] = v_u_11.Bold,
			["TextColor3"] = v_u_10.White,
			["TextXAlignment"] = Enum.TextXAlignment.Center,
			["AnchorPoint"] = Vector2.new(0.5, 1),
			["Position"] = UDim2.new(0.5, 0, 1, -2),
			["Size"] = UDim2.new(1, -6, 0, 15),
			["Parent"] = v33
		}), 0.3)
		v_u_4.new("UITextSizeConstraint", {
			["MaxTextSize"] = 14,
			["MinTextSize"] = 8,
			["Parent"] = nil,
			["Parent"] = v46
		})
	else
		v46 = nil
	end
	v_u_19[p29] = {
		["box"] = nil,
		["slot"] = nil,
		["bg"] = nil,
		["num"] = nil,
		["numLabel"] = nil,
		["icon"] = nil,
		["ammo"] = nil,
		["count"] = nil,
		["zero"] = nil,
		["sel"] = false,
		["gun"] = nil,
		["kind"] = nil,
		["box"] = v33,
		["slot"] = p30,
		["bg"] = v34,
		["num"] = v41,
		["numLabel"] = v42,
		["icon"] = v43,
		["ammo"] = v44,
		["count"] = v45,
		["zero"] = v_u_4.shadow(v_u_4.label({
			["Name"] = "Zeroing",
			["Text"] = "",
			["Font"] = nil,
			["TextSize"] = 11,
			["TextColor3"] = nil,
			["TextXAlignment"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["ZIndex"] = 3,
			["Parent"] = nil,
			["Font"] = v_u_11.Bold,
			["TextColor3"] = v_u_10.TextDim,
			["TextXAlignment"] = Enum.TextXAlignment.Right,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(1, -6, 0, 4),
			["Size"] = UDim2.fromOffset(52, 14),
			["Parent"] = v33
		}), 0.4),
		["gun"] = v32.gun == true,
		["kind"] = v46
	}
end
function v12.build(p48, _, _) -- name: build
	-- upvalues: (ref) v_u_17, (copy) v_u_4, (ref) v_u_18, (copy) v_u_13, (copy) v_u_47, (ref) v_u_20, (copy) v_u_5, (ref) v_u_21, (ref) v_u_24, (copy) v_u_11, (copy) v_u_10, (ref) v_u_25
	v_u_17 = v_u_4.frame({
		["Name"] = "Weapon",
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["Parent"] = nil,
		["AnchorPoint"] = Vector2.new(0.5, 1),
		["Position"] = UDim2.new(0.5, 0, 1, -60),
		["Size"] = UDim2.fromOffset(694, 88),
		["Parent"] = p48
	})
	v_u_18 = v_u_4.frame({
		["Name"] = "Slots",
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["Parent"] = nil,
		["AnchorPoint"] = Vector2.new(0, 1),
		["Position"] = UDim2.fromScale(0, 1),
		["Size"] = UDim2.new(1, 0, 0, 62),
		["Parent"] = v_u_17
	})
	v_u_4.list(v_u_18, false, 6, Enum.HorizontalAlignment.Center, Enum.VerticalAlignment.Bottom)
	for v49, v50 in v_u_13 do
		v_u_47(v49, v50, v_u_18)
	end
	v_u_20 = v_u_4.frame({
		["Name"] = "FireMode",
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["Visible"] = false,
		["ZIndex"] = 2,
		["AnchorPoint"] = Vector2.new(0.5, 1),
		["Position"] = UDim2.new(0.5, 0, 0, 1),
		["Size"] = UDim2.fromOffset(104, 24)
	})
	local v51 = v_u_4.new("ImageLabel", {
		["Name"] = "Tab",
		["BackgroundTransparency"] = 1,
		["Image"] = nil,
		["ImageTransparency"] = 0.05,
		["Size"] = nil,
		["ZIndex"] = 2,
		["Parent"] = nil,
		["Image"] = v_u_5.Image.fire_mode_tab,
		["Size"] = UDim2.fromScale(1, 1),
		["Parent"] = v_u_20
	})
	if not v_u_5.set(v51, "chip_mod_foc", 0.3333333333333333) then
		v_u_5.set(v51, "chip_mod_foc_activ", 0.3333333333333333)
	end
	v_u_21 = v51
	v_u_24 = v_u_4.shadow(v_u_4.label({
		["Name"] = "Mode",
		["Text"] = "",
		["Font"] = nil,
		["TextSize"] = 13,
		["TextColor3"] = nil,
		["TextXAlignment"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["ZIndex"] = 3,
		["Parent"] = nil,
		["Font"] = v_u_11.Bold,
		["TextColor3"] = v_u_10.White,
		["TextXAlignment"] = Enum.TextXAlignment.Center,
		["Position"] = UDim2.fromOffset(14, 0),
		["Size"] = UDim2.new(1, -40, 1, 0),
		["Parent"] = v_u_20
	}), 0.5)
	v_u_25 = v_u_4.new("ImageLabel", {
		["Name"] = "Bullets",
		["BackgroundTransparency"] = 1,
		["Image"] = nil,
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["ZIndex"] = 3,
		["Parent"] = nil,
		["Image"] = v_u_5.Image.hud_munitie or v_u_5.Image.icon_ammo_triple,
		["AnchorPoint"] = Vector2.new(1, 0.5),
		["Position"] = UDim2.new(1, -16, 0.5, 0),
		["Size"] = UDim2.fromOffset(18, 18),
		["Parent"] = v_u_20
	})
end
function v12.init() -- name: init
	-- upvalues: (copy) v_u_7, (ref) v_u_26, (ref) v_u_17, (ref) v_u_27
	v_u_7.Changed:Connect(function()
		-- upvalues: (ref) v_u_26, (ref) v_u_17, (ref) v_u_27
		if v_u_26 and (v_u_17 and v_u_17.Visible) then
			local v52 = v_u_27
			local v53 = v_u_26
			pcall(v52, v53)
		end
	end)
end
function v12.start() -- name: start
	-- upvalues: (copy) v_u_6, (ref) v_u_26, (ref) v_u_17, (ref) v_u_27
	v_u_6.connectSignal("WeaponController", "Changed", function()
		-- upvalues: (ref) v_u_26, (ref) v_u_17, (ref) v_u_27
		if v_u_26 and v_u_17.Visible then
			local v54 = v_u_27
			local v55 = v_u_26
			pcall(v54, v55)
		end
	end)
end
local function v_u_66(p56, p57) -- name: setSelected
	-- upvalues: (copy) v_u_5, (copy) v_u_10
	if p56.sel ~= p57 then
		p56.sel = p57
		local v58 = v_u_5.set
		local v59 = p56.bg
		local v60 = p56.slot
		local v61
		if v60 == "Melee" and true or v60 == "Throwable" then
			v61 = p57 and "slot_aruncabil_activ" or "slot_aruncabil"
		else
			v61 = p57 and "slot_arma_activ" or "slot_arma"
		end
		if not v58(v59, v61, 0.3875) then
			local v62 = p56.bg
			local v63
			if p57 then
				v63 = v_u_5.Image.weapon_slot_active
			else
				v63 = v_u_5.Image.weapon_slot
			end
			v62.Image = v63
		end
		local v64 = p56.numLabel
		local v65
		if p57 then
			v65 = v_u_10.Accent
		else
			v65 = v_u_10.TextDim
		end
		v64.TextColor3 = v65
	end
end
local function v_u_79(p67, p68, p69, p70) -- name: magSizeOf
	-- upvalues: (copy) v_u_6
	local v71, v72, v73, v74, v75
	if not p67 then
		v77 = p70.magSize or 30
		v78 = v_u_6.config("ItemConfig")
		if p67 and p67.magSize or not v78 then
			v71 = v77
		else
			v72 = v78.magSize
			if type(v72) == "function" and p69 then
				v73 = v78.magSize
				v74 = p69.attachments
				v75, v71 = pcall(v73, p68, v74)
				if v75 and type(v71) == "number" then
					if v71 <= 0 then
						v71 = v77
					end
				else
					v71 = v77
				end
			else
				v71 = v77
			end
		end
		return v71
	end
	local v76 = p67.magSize
	local v77 = tonumber(v76)
	if v77 then
		v78 = v_u_6.config("ItemConfig")
		if p67 and p67.magSize or not v78 then
			v71 = v77
		else
			v72 = v78.magSize
			if type(v72) == "function" and p69 then
				v73 = v78.magSize
				v74 = p69.attachments
				v75, v71 = pcall(v73, p68, v74)
				if v75 and type(v71) == "number" then
					if v71 <= 0 then
						v71 = v77
					end
				else
					v71 = v77
				end
			else
				v71 = v77
			end
		end
		return v71
	end
	v77 = p70.magSize or 30
	local v78 = v_u_6.config("ItemConfig")
	if p67 and p67.magSize or not v78 then
		v71 = v77
	else
		v72 = v78.magSize
		if type(v72) == "function" and p69 then
			v73 = v78.magSize
			v74 = p69.attachments
			v75, v71 = pcall(v73, p68, v74)
			if v75 and type(v71) == "number" then
				if v71 <= 0 then
					v71 = v77
				end
			else
				v71 = v77
			end
		else
			v71 = v77
		end
	end
	return v71
end
v_u_27 = function(p80) -- name: render
	-- upvalues: (copy) v_u_7, (copy) v_u_6, (copy) v_u_19, (copy) v_u_8, (copy) v_u_66, (copy) v_u_9, (copy) v_u_79, (copy) v_u_10, (copy) v_u_15, (ref) v_u_20, (ref) v_u_24, (ref) v_u_22, (ref) v_u_21, (copy) v_u_5, (ref) v_u_23, (ref) v_u_25
	local v81 = p80.char
	local v82 = v_u_7.get()
	local v83 = v82.weapons or {}
	local v84 = v82.items or {}
	local v85
	if v81 then
		v85 = v81:GetAttribute("EquippedSlot")
	else
		v85 = v81
	end
	local v86, v87 = v_u_6.call("WeaponController", "getState")
	if not v86 or type(v87) ~= "table" then
		v87 = nil
	end
	if v87 and v87.slot then
		v85 = v87.slot
	end
	local v88 = v87 and v87.weaponId
	if not v88 then
		if v81 then
			v88 = v81:GetAttribute("Equipped")
		else
			v88 = v81
		end
	end
	if v88 == "" then
		v88 = nil
	end
	if not v88 then
		v85 = nil
	end
	local v89 = p80.knocked
	local v90 = v87 and v87.reloading
	if v90 then
		v81 = v90
	elseif v81 then
		v81 = v81:GetAttribute("Reloading") == true
	end
	local v91 = nil
	for _, v92 in v_u_19 do
		local v93 = v92.slot
		local v94 = nil
		local v95 = ""
		local v96
		if v93 == "Throwable" then
			v96 = v82.selectedThrowable
			if v96 then
				local v97 = v84[v96] or 0
				v95 = v97 <= 0 and "" or "x" .. tostring(v97)
				if v97 <= 0 then
					v96 = nil
				end
			end
		else
			v94 = v83[v93]
			if v94 then
				v96 = v94.id
			else
				v96 = v94
			end
		end
		v92.box.Visible = v96 ~= nil
		if v96 then
			v_u_8.set(v92.icon, v96)
			local v98 = v85 == v93
			local v99 = v_u_66
			local v100
			if v98 then
				v100 = not v89
			else
				v100 = v98
			end
			v99(v92, v100)
			local v101 = v_u_9.get(v96)
			local v102, v103
			if v94 and (v92.gun and (v101.ammo and v101.class ~= "Melee")) then
				local v104, v105, v106, v107, v108, v109, v110
				if v98 and v87 then
					local v111 = v87.ammo
					if type(v111) == "number" then
						v104 = v87.ammo
						v105 = v84[v101.ammo] or 0
						if v98 and v87 then
							v106 = v87.reserve
							if type(v106) == "number" then
								v105 = v87.reserve
							end
						end
						if v104 <= 0 then
							v102 = v105 <= 0
						else
							v102 = false
						end
						v107 = "#FFFFFF"
						if v98 and v81 then
							v107 = "#FFBE3C"
						elseif v98 then
							v108 = v_u_79(v87, v96, v94, v101) * 0.25
							v107 = v104 <= math.max(1, v108) and "#DC3C32" or v107
						end
						v109 = v105 <= 0 and "#DC3C32" or "#B4B4AE"
						v103 = string.format("<font color=\"%s\">%d</font><font color=\"%s\" size=\"13\">/%d</font>", v107, v104, v109, v105)
					else
						v110 = v94.ammo
						v104 = tonumber(v110) or 0
						v105 = v84[v101.ammo] or 0
						if v98 and v87 then
							v106 = v87.reserve
							if type(v106) == "number" then
								v105 = v87.reserve
							end
						end
						if v104 <= 0 then
							v102 = v105 <= 0
						else
							v102 = false
						end
						v107 = "#FFFFFF"
						if v98 and v81 then
							v107 = "#FFBE3C"
						elseif v98 then
							v108 = v_u_79(v87, v96, v94, v101) * 0.25
							v107 = v104 <= math.max(1, v108) and "#DC3C32" or v107
						end
						v109 = v105 <= 0 and "#DC3C32" or "#B4B4AE"
						v103 = string.format("<font color=\"%s\">%d</font><font color=\"%s\" size=\"13\">/%d</font>", v107, v104, v109, v105)
					end
				else
					v110 = v94.ammo
					v104 = tonumber(v110) or 0
					v105 = v84[v101.ammo] or 0
					if v98 and v87 then
						v106 = v87.reserve
						if type(v106) == "number" then
							v105 = v87.reserve
						end
					end
					if v104 <= 0 then
						v102 = v105 <= 0
					else
						v102 = false
					end
					v107 = "#FFFFFF"
					if v98 and v81 then
						v107 = "#FFBE3C"
					elseif v98 then
						v108 = v_u_79(v87, v96, v94, v101) * 0.25
						v107 = v104 <= math.max(1, v108) and "#DC3C32" or v107
					end
					v109 = v105 <= 0 and "#DC3C32" or "#B4B4AE"
					v103 = string.format("<font color=\"%s\">%d</font><font color=\"%s\" size=\"13\">/%d</font>", v107, v104, v109, v105)
				end
			else
				v102 = false
				v103 = ""
			end
			if v92.ammo.Text ~= v103 then
				v92.ammo.Text = v103
			end
			local v112 = v89 and 0.75 or (v98 and 0 or 0.35)
			local v113 = v_u_8.setTint
			local v114 = v92.icon
			local v115
			if v102 then
				v115 = v_u_10.Red
			else
				v115 = v_u_10.White
			end
			v113(v114, v115, v112)
			v92.ammo.TextTransparency = v89 and 0.6 or 0
			v92.numLabel.TextTransparency = v98 and not v89 and 0 or 0.3
			v92.count.Text = v95
			v92.count.TextTransparency = v112 * 0.8
			if v92.kind then
				local v116 = v_u_15[v96]
				local v117
				if v116 then
					v117 = v116[1]
				else
					v117 = string.upper(string.match(v101.name or v96, "^%S+") or v96)
				end
				if v92.kind.Text ~= v117 then
					v92.kind.Text = v117
				end
				local v118 = v92.kind
				local v119
				if v116 then
					v119 = v116[2]
				else
					v119 = v_u_10.White
				end
				v118.TextColor3 = v119
				v92.kind.TextTransparency = v112 * 0.6
			end
			local v120 = (not v98 or (v93 == "Melee" or v93 == "Throwable")) and true or false or v87 and v87.zeroing
			if not v120 then
				if v94 then
					v120 = v94.zeroing or nil
				else
					v120 = nil
				end
			end
			v92.zero.Text = (type(v120) ~= "number" or v120 <= 0) and "" or string.format("%dm", v120)
			if not v98 or (not v92.gun or v89) then
				continue
			end
			v91 = v92
		else
			v_u_66(v92, false)
			v92.ammo.Text = ""
			v92.count.Text = ""
			v92.zero.Text = ""
			if not v92.kind then
				continue
			end
			v92.kind.Text = ""
		end
	end
	if v91 then
		if v_u_20.Parent ~= v91.box then
			v_u_20.Parent = v91.box
		end
		local v121 = v83[v91.slot]
		local v122 = v87 and v87.fireMode
		if v122 then
			v121 = v122
		elseif v121 then
			v121 = v121.fireMode
		end
		local v123 = v_u_9.fireModeText(v121)
		local v124 = v81 and "RELOAD" or (v123 == "" and "SINGLE" or v123)
		if v_u_24.Text ~= v124 then
			v_u_24.Text = v124
		end
		local v125 = v_u_24
		local v126
		if v81 then
			v126 = v_u_10.Accent
		else
			v126 = v_u_10.White
		end
		v125.TextColor3 = v126
		local v127 = v91.slot
		local v128 = tostring(v127) .. "|" .. tostring(v121)
		if v_u_22 ~= nil and v_u_22 ~= v128 then
			local v129 = string.split(v_u_22, "|")[1]
			local v130 = v91.slot
			if v129 == tostring(v130) and (v_u_21 and v_u_5.Image.chip_mod_foc) then
				v_u_23 = v_u_23 + 1
				local v_u_131 = v_u_23
				v_u_5.set(v_u_21, "chip_mod_foc_activ", 0.3333333333333333)
				task.delay(0.7, function()
					-- upvalues: (copy) v_u_131, (ref) v_u_23, (ref) v_u_21, (ref) v_u_5
					if v_u_131 == v_u_23 and v_u_21 then
						v_u_5.set(v_u_21, "chip_mod_foc", 0.3333333333333333)
					end
				end)
			end
		end
		v_u_22 = v128
		local v132 = v_u_25
		local v133
		if v81 then
			v133 = v_u_10.Accent
		else
			v133 = v_u_10.White
		end
		v132.ImageColor3 = v133
		v_u_20.Visible = true
	else
		v_u_20.Visible = false
	end
end
local function v_u_154() -- name: applyCompact
	-- upvalues: (copy) v_u_1, (ref) v_u_28, (ref) v_u_17, (ref) v_u_18, (copy) v_u_19, (copy) v_u_14
	local v134 = v_u_1.TouchEnabled
	if v134 == v_u_28 then
		return
	else
		local v135 = v_u_28 == nil
		v_u_28 = v134
		if not v135 or v134 then
			local v136 = v134 and 0.8 or 1
			local v137 = v136 * 62 + 0.5
			local v138 = math.floor(v137)
			v_u_17.Size = UDim2.fromOffset(694, v138 + 24 + 2)
			v_u_18.Size = UDim2.new(1, 0, 0, v138)
			for _, v139 in v_u_19 do
				local v140 = v_u_14[v139.slot]
				v139.box.Size = UDim2.fromOffset(v140.w, v138)
				v139.bg.SliceScale = v136 * 0.3875
				local v141 = v139.icon
				local v142 = UDim2.fromOffset
				local v143 = v140.iw * v136 + 0.5
				local v144 = math.floor(v143)
				local v145 = v140.ih * v136 + 0.5
				v141.Size = v142(v144, (math.floor(v145)))
				local v146 = v139.icon
				local v147 = UDim2.new
				local v148 = 0.5
				local v149 = v140.gun and 8 or 0
				local v150 = 0.5
				local v151
				if v140.gun then
					local v152 = v136 * -5
					v151 = math.floor(v152)
				elseif v140.iy then
					local v153 = v140.iy * v136 + 0.5
					v151 = math.floor(v153)
				else
					v151 = -2
				end
				v146.Position = v147(v148, v149, v150, v151)
			end
		end
	end
end
function v12.slow(p155) -- name: slow
	-- upvalues: (ref) v_u_17, (ref) v_u_28, (copy) v_u_1, (copy) v_u_154, (ref) v_u_26, (ref) v_u_27
	local v156
	if p155.mode == "Game" and p155.deploy == nil then
		v156 = not p155.spectating
	else
		v156 = false
	end
	v_u_17.Visible = v156
	if v156 and v_u_28 ~= v_u_1.TouchEnabled then
		v_u_154()
	end
	if v156 then
		v_u_26 = p155
		v_u_27(p155)
	else
		v_u_26 = nil
	end
end
return v12