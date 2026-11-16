-- Decompiled by Executor
-- Path: ReplicatedStorage.Client.Controllers.UI_Admin.AntiCheat

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("HttpService")
local v_u_3 = game:GetService("Players")
local v4 = v1:WaitForChild("Client"):WaitForChild("UIKit")
local v5 = require(v4.Theme)
local v_u_6 = require(v4.UI)
local v_u_7 = require(v4.Root)
local v_u_8 = require(v4.Deps)
local v_u_9 = require(v4.Art)
local v_u_10 = v5.Color
local v_u_11 = v5.Font
local v_u_12 = {}
local v_u_13 = { "Off", "Log", "On" }
local v_u_14 = {
	{ "1D", 1 },
	{ "7D", 7 },
	{ "30D", 30 },
	{ "PERM", -1 }
}
local v_u_15 = nil
local v_u_16 = nil
local v_u_17 = false
local v_u_18 = 0
local v_u_19 = false
local v_u_20 = nil
local v_u_21 = nil
local v_u_22 = -100
local v_u_23 = "FEED"
local v_u_24 = nil
local v_u_25 = nil
local v_u_26 = nil
local v_u_27 = nil
local v_u_28 = {}
local v_u_29 = nil
local v_u_30 = {}
local v_u_31 = nil
local v_u_32 = nil
local v_u_33 = {}
local v_u_34 = nil
local v_u_35 = {}
local v_u_36 = {}
local v_u_37 = nil
local function v_u_42(p_u_38) -- name: query
	-- upvalues: (copy) v_u_8
	local v_u_39 = v_u_8.remote("AdminQuery")
	if v_u_39 and v_u_39:IsA("RemoteFunction") then
		local v40, v41 = pcall(function()
			-- upvalues: (copy) v_u_39, (copy) p_u_38
			return v_u_39:InvokeServer(p_u_38)
		end)
		if v40 then
			return v41
		else
			return nil
		end
	else
		return nil
	end
end
local function v_u_50(p43) -- name: fmtAgo
	local v44 = tonumber(p43)
	if v44 and v44 > 0 then
		local v45 = os.time() - v44
		local v46 = math.max(0, v45)
		if v46 < 60 then
			return v46 .. "s ago"
		elseif v46 < 3600 then
			local v47 = v46 / 60
			return math.floor(v47) .. "m ago"
		elseif v46 < 86400 then
			local v48 = v46 / 3600
			return math.floor(v48) .. "h ago"
		else
			local v49 = v46 / 86400
			return math.floor(v49) .. "d ago"
		end
	else
		return "-"
	end
end
local function v_u_65(p51) -- name: countsText
	if type(p51) ~= "table" then
		return ""
	end
	local v52 = {}
	for v53, v54 in p51 do
		table.insert(v52, { v53, v54 })
	end
	table.sort(v52, function(p55, p56)
		return p55[2] > p56[2]
	end)
	local v57 = #v52
	local v58 = {}
	for v59 = 1, math.min(5, v57) do
		local v60 = string.format
		local v61 = v52[v59][1]
		local v62 = tostring(v61)
		local v63 = v52[v59][2]
		local v64 = tonumber(v63) or 0
		table.insert(v58, v60("%s \195\151%d", v62, v64))
	end
	return table.concat(v58, ", ")
end
function v_u_12.refresh(p66) -- name: refresh
	-- upvalues: (copy) v_u_42, (ref) v_u_24, (ref) v_u_20, (ref) v_u_23, (ref) v_u_22, (ref) v_u_21, (ref) v_u_37
	local v67 = v_u_42({
		["op"] = "acState"
	})
	if type(v67) == "table" then
		if v67.error then
			if v67.error ~= "rate" and v_u_24 then
				local v68 = v_u_24
				local v69 = v67.error
				v68.Text = "Error: " .. tostring(v69)
			end
		else
			v_u_20 = v67
			if p66 or v_u_23 == "SUSPECTS" and os.clock() - v_u_22 > 15 then
				local v70 = v_u_42({
					["op"] = "acSuspects"
				})
				if type(v70) == "table" and not v70.error then
					v_u_21 = v70
					v_u_22 = os.clock()
				end
			end
			v_u_37()
		end
	else
		if v_u_24 then
			v_u_24.Text = "Request failed (admins only)"
		end
		return
	end
end
local function v_u_101(p71, p72) -- name: act
	-- upvalues: (ref) v_u_19, (copy) v_u_10, (ref) v_u_25, (ref) v_u_37, (copy) v_u_2, (copy) v_u_42, (ref) v_u_20, (ref) v_u_22, (copy) v_u_12, (ref) v_u_23
	if v_u_19 then
		return
	end
	v_u_19 = true
	local v73 = v_u_10.TextDim
	if v_u_25 then
		v_u_25.Text = "Working..."
		v_u_25.TextColor3 = v73 or v_u_10.TextDim
	end
	v_u_37()
	p71.nonce = v_u_2:GenerateGUID(false)
	local v74 = v_u_42(p71)
	v_u_19 = false
	if type(v74) == "table" and v74.ok then
		local v75 = v74.state
		if type(v75) == "table" then
			v_u_20 = v74.state
		end
		local v76 = v74.info
		if type(v76) == "table" then
			if v76.error then
				local v77 = v76.error
				local v78 = "Ban history: " .. tostring(v77)
				local v79 = v_u_10.Red
				if v_u_25 then
					v_u_25.Text = v78
					v_u_25.TextColor3 = v79 or v_u_10.TextDim
				end
				v_u_22 = -100
				task.spawn(v_u_12.refresh, v_u_23 == "SUSPECTS")
				v_u_37()
				return
			elseif v76.none then
				local v80 = v_u_10.Green
				if v_u_25 then
					v_u_25.Text = "No bans on record for this user."
					v_u_25.TextColor3 = v80 or v_u_10.TextDim
				end
				v_u_22 = -100
				task.spawn(v_u_12.refresh, v_u_23 == "SUSPECTS")
				v_u_37()
			else
				local v81 = string.format
				local v82 = "Last record: %s%s \194\183 %s \194\183 %s"
				local v83 = v76.ban and "BANNED" or "unbanned"
				local v84, v85, v86, v87, v88, v89, v90, v91, v92
				if v76.ban then
					local v93 = v76.duration
					if tonumber(v93) and v76.duration < 0 then
						v84 = " (permanent)"
						v85 = v76.start or "?"
						v86 = tostring(v85)
						v87 = v76.private or (v76.reason or "")
						v88 = v81(v82, v83, v84, v86, (tostring(v87)))
						v89 = v_u_10.Accent
						if v_u_25 then
							v_u_25.Text = v88
							v_u_25.TextColor3 = v89 or v_u_10.TextDim
						end
					else
						if v76.ban then
							v90 = v76.duration
							if tonumber(v90) then
								v91 = string.format
								v92 = v76.duration / 86400 + 0.5
								v84 = v91(" (%dd)", (math.floor(v92)))
							else
								v84 = ""
							end
						else
							v84 = ""
						end
						v85 = v76.start or "?"
						v86 = tostring(v85)
						v87 = v76.private or (v76.reason or "")
						v88 = v81(v82, v83, v84, v86, (tostring(v87)))
						v89 = v_u_10.Accent
						if v_u_25 then
							v_u_25.Text = v88
							v_u_25.TextColor3 = v89 or v_u_10.TextDim
						end
					end
				else
					if v76.ban then
						v90 = v76.duration
						if tonumber(v90) then
							v91 = string.format
							v92 = v76.duration / 86400 + 0.5
							v84 = v91(" (%dd)", (math.floor(v92)))
						else
							v84 = ""
						end
					else
						v84 = ""
					end
					v85 = v76.start or "?"
					v86 = tostring(v85)
					v87 = v76.private or (v76.reason or "")
					v88 = v81(v82, v83, v84, v86, (tostring(v87)))
					v89 = v_u_10.Accent
					if v_u_25 then
						v_u_25.Text = v88
						v_u_25.TextColor3 = v89 or v_u_10.TextDim
					end
				end
				v_u_22 = -100
				task.spawn(v_u_12.refresh, v_u_23 == "SUSPECTS")
				v_u_37()
			end
		else
			local v94 = v74.msg or (p72 or "Done.")
			local v95 = tostring(v94)
			local v96 = v_u_10.Green
			if v_u_25 then
				v_u_25.Text = v95
				v_u_25.TextColor3 = v96 or v_u_10.TextDim
			end
			v_u_22 = -100
			task.spawn(v_u_12.refresh, v_u_23 == "SUSPECTS")
			v_u_37()
			return
		end
	else
		if type(v74) == "table" and v74.error == "rate" then
			local v97 = v_u_10.Accent
			if v_u_25 then
				v_u_25.Text = "Too fast, try again."
				v_u_25.TextColor3 = v97 or v_u_10.TextDim
			end
		else
			local v98
			if type(v74) == "table" and v74.error then
				local v99 = v74.error
				v98 = tostring(v99)
			else
				v98 = "Request failed (not authorized)."
			end
			local v100 = v_u_10.Red
			if v_u_25 then
				v_u_25.Text = v98
				v_u_25.TextColor3 = v100 or v_u_10.TextDim
			end
		end
		v_u_37()
		return
	end
end
local function v_u_110(p102, p103, p104, p_u_105) -- name: banWithConfirm
	-- upvalues: (copy) v_u_36, (copy) v_u_10, (ref) v_u_25, (ref) v_u_37, (copy) v_u_101
	local v106 = p102 .. ":" .. p103
	local v107 = os.clock()
	if v107 - (v_u_36[v106] or -100) > 4 then
		v_u_36[v106] = v107
		local v108 = string.format("Press again to %s %s%s.", p103 < 0 and "PERMANENTLY ban" or "ban for " .. p103 .. " day(s)", tostring(p104 or p102), not p104 and "" or " (" .. p102 .. ")")
		local v109 = v_u_10.Accent
		if v_u_25 then
			v_u_25.Text = v108
			v_u_25.TextColor3 = v109 or v_u_10.TextDim
		end
		if p_u_105 then
			p_u_105:SetAttribute("ConfirmAt", v107)
			v_u_37()
			task.delay(4.1, function()
				-- upvalues: (copy) p_u_105, (ref) v_u_37
				if p_u_105.Parent then
					v_u_37()
				end
			end)
		end
	else
		v_u_36[v106] = nil
		if p_u_105 then
			p_u_105:SetAttribute("ConfirmAt", nil)
		end
		v_u_101({
			["op"] = "acBan",
			["target"] = nil,
			["days"] = nil,
			["reason"] = "panel",
			["target"] = p102,
			["days"] = p103
		})
	end
end
local function v_u_120() -- name: layout
	-- upvalues: (ref) v_u_16, (copy) v_u_7
	if v_u_16 then
		local v111 = v_u_7.virtualSize()
		local v112 = v_u_7.topInset()
		local v113 = v111.X - 24
		local v114 = math.clamp(v113, 720, 1040)
		local v115 = v111.Y - v112 - 20
		local v116 = math.clamp(v115, 520, 720)
		v_u_16.Size = UDim2.fromOffset(v114, v116)
		local v117 = v_u_16
		local v118 = UDim2.new
		local v119 = (v111.Y - v112 - v116) / 2
		v117.Position = v118(0.5, 0, 0, v112 + math.max(0, v119))
	end
end
local function v_u_130(p121) -- name: rowUi
	-- upvalues: (copy) v_u_33, (copy) v_u_6, (copy) v_u_10, (ref) v_u_31, (copy) v_u_11, (copy) v_u_110, (copy) v_u_101, (ref) v_u_34
	local v122 = v_u_33[p121]
	if v122 then
		return v122
	end
	local v123 = v_u_6.new("Frame", {
		["Name"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 0.6,
		["Size"] = nil,
		["LayoutOrder"] = nil,
		["Parent"] = nil,
		["Name"] = "Row" .. p121,
		["BackgroundColor3"] = v_u_10.BgLight,
		["Size"] = UDim2.new(1, -6, 0, 40),
		["LayoutOrder"] = p121,
		["Parent"] = v_u_31
	})
	local v_u_124 = {
		["frame"] = nil,
		["a"] = nil,
		["b"] = nil,
		["data"] = nil,
		["frame"] = v123,
		["a"] = v_u_6.label({
			["Name"] = "A",
			["Text"] = "",
			["Font"] = nil,
			["TextSize"] = 13,
			["Position"] = nil,
			["Size"] = nil,
			["TextTruncate"] = nil,
			["Parent"] = nil,
			["Font"] = v_u_11.Bold,
			["Position"] = UDim2.fromOffset(10, 3),
			["Size"] = UDim2.new(1, -250, 0, 17),
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Parent"] = v123
		}),
		["b"] = v_u_6.label({
			["Name"] = "B",
			["Text"] = "",
			["TextSize"] = 11,
			["TextColor3"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextTruncate"] = nil,
			["Parent"] = nil,
			["TextColor3"] = v_u_10.TextDim,
			["Position"] = UDim2.fromOffset(10, 21),
			["Size"] = UDim2.new(1, -250, 0, 15),
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Parent"] = v123
		})
	}
	v_u_124.ban = v_u_6.button("Ban 7d", {
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["TextSize"] = 11,
		["Parent"] = nil,
		["AnchorPoint"] = Vector2.new(1, 0.5),
		["Position"] = UDim2.new(1, -6, 0.5, 0),
		["Size"] = UDim2.fromOffset(96, 28),
		["Parent"] = v123
	}, function()
		-- upvalues: (ref) v_u_124, (ref) v_u_110
		local v125 = v_u_124.data
		if v125 and v125.uid then
			v_u_110(v125.uid, 7, v125.name, v_u_124.ban)
		end
	end, "danger")
	v_u_124.kick = v_u_6.button("Kick", {
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["TextSize"] = 11,
		["Parent"] = nil,
		["AnchorPoint"] = Vector2.new(1, 0.5),
		["Position"] = UDim2.new(1, -108, 0.5, 0),
		["Size"] = UDim2.fromOffset(70, 28),
		["Parent"] = v123
	}, function()
		-- upvalues: (ref) v_u_124, (ref) v_u_101
		local v126 = v_u_124.data
		if v126 and v126.uid then
			v_u_101({
				["op"] = "acKick",
				["target"] = nil,
				["target"] = v126.uid
			})
		end
	end, "default")
	v_u_124.pick = v_u_6.button("Use id", {
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["TextSize"] = 11,
		["Parent"] = nil,
		["AnchorPoint"] = Vector2.new(1, 0.5),
		["Position"] = UDim2.new(1, -184, 0.5, 0),
		["Size"] = UDim2.fromOffset(60, 28),
		["Parent"] = v123
	}, function()
		-- upvalues: (ref) v_u_124, (ref) v_u_34
		local v127 = v_u_124.data
		if v127 and (v127.uid and v_u_34) then
			local v128 = v_u_34
			local v129 = v127.uid
			v128.Text = tostring(v129)
		end
	end, "ghost")
	v_u_33[p121] = v_u_124
	return v_u_124
end
local function v_u_161() -- name: build
	-- upvalues: (ref) v_u_15, (copy) v_u_7, (copy) v_u_6, (copy) v_u_10, (ref) v_u_16, (copy) v_u_120, (copy) v_u_11, (copy) v_u_9, (copy) v_u_12, (ref) v_u_24, (ref) v_u_26, (ref) v_u_20, (copy) v_u_101, (ref) v_u_27, (ref) v_u_29, (copy) v_u_30, (ref) v_u_23, (ref) v_u_37, (ref) v_u_34, (ref) v_u_25, (copy) v_u_35, (copy) v_u_14, (copy) v_u_110, (ref) v_u_32, (ref) v_u_31
	if not v_u_15 then
		v_u_15 = v_u_7.screen("UI_AdminAntiCheat", {
			["order"] = 97,
			["fullscreen"] = true,
			["enabled"] = false
		})
		local v131 = v_u_15.root
		v_u_6.new("TextButton", {
			["Name"] = "Backdrop",
			["Text"] = "",
			["Modal"] = true,
			["AutoButtonColor"] = false,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 0.45,
			["Size"] = nil,
			["Parent"] = nil,
			["BackgroundColor3"] = v_u_10.Black,
			["Size"] = UDim2.fromScale(1, 1),
			["Parent"] = v131
		})
		local v132 = v_u_6.panel({
			["Name"] = "Panel",
			["AnchorPoint"] = nil,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 0.06,
			["Size"] = nil,
			["Parent"] = nil,
			["AnchorPoint"] = Vector2.new(0.5, 0),
			["BackgroundColor3"] = v_u_10.Panel,
			["Size"] = UDim2.fromOffset(1040, 720),
			["Parent"] = v131
		}, true)
		v_u_16 = v132
		v_u_6.corner(v132, 4)
		v_u_6.padding(v132, 18, 18, 14, 14)
		v_u_120()
		v_u_7.onScaleChanged(v_u_120)
		v_u_6.label({
			["Name"] = "Title",
			["Text"] = "ANTI-CHEAT",
			["Font"] = nil,
			["TextSize"] = 22,
			["Size"] = nil,
			["Parent"] = nil,
			["Font"] = v_u_11.Bold,
			["Size"] = UDim2.new(0, 170, 0, 30),
			["Parent"] = v132
		})
		v_u_6.label({
			["Name"] = "Live",
			["Text"] = "LIVE ON ALL SERVERS",
			["Font"] = nil,
			["TextSize"] = 11,
			["TextColor3"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Font"] = v_u_11.Bold,
			["TextColor3"] = v_u_10.Accent,
			["Position"] = UDim2.fromOffset(172, 2),
			["Size"] = UDim2.new(0, 200, 0, 30),
			["Parent"] = v132
		})
		v_u_6.new("ImageButton", {
			["Name"] = "Close",
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["AutoButtonColor"] = false,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Image"] = v_u_9.Image.icon_close,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(1, 0, 0, 1),
			["Size"] = UDim2.fromOffset(28, 28),
			["Parent"] = v132
		}).Activated:Connect(function()
			-- upvalues: (ref) v_u_12
			v_u_12.close()
		end)
		v_u_6.button("Refresh", {
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextSize"] = 13,
			["Parent"] = nil,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(1, -40, 0, 0),
			["Size"] = UDim2.fromOffset(100, 30),
			["Parent"] = v132
		}, function()
			-- upvalues: (ref) v_u_12
			v_u_12.refresh(true)
		end, "default")
		v_u_24 = v_u_6.label({
			["Name"] = "Status",
			["Text"] = "Loading...",
			["TextSize"] = 12,
			["TextColor3"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextTruncate"] = nil,
			["Parent"] = nil,
			["TextColor3"] = v_u_10.TextDim,
			["Position"] = UDim2.fromOffset(0, 34),
			["Size"] = UDim2.new(1, 0, 0, 16),
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Parent"] = v132
		})
		v_u_26 = v_u_6.button("Anti-cheat: on", {
			["Name"] = "Master",
			["Position"] = nil,
			["Size"] = nil,
			["TextSize"] = 13,
			["Parent"] = nil,
			["Position"] = UDim2.fromOffset(0, 56),
			["Size"] = UDim2.fromOffset(200, 32),
			["Parent"] = v132
		}, function()
			-- upvalues: (ref) v_u_20, (ref) v_u_101
			if v_u_20 then
				v_u_101({
					["op"] = "acSet",
					["key"] = "Enabled",
					["value"] = nil,
					["value"] = not v_u_20.enabled
				})
			end
		end, "primary")
		v_u_27 = v_u_6.button("Auto-kick: off", {
			["Name"] = "AutoKick",
			["Position"] = nil,
			["Size"] = nil,
			["TextSize"] = 13,
			["Parent"] = nil,
			["Position"] = UDim2.fromOffset(208, 56),
			["Size"] = UDim2.fromOffset(170, 32),
			["Parent"] = v132
		}, function()
			-- upvalues: (ref) v_u_20, (ref) v_u_101
			if v_u_20 then
				v_u_101({
					["op"] = "acSet",
					["key"] = "AutoKick",
					["value"] = nil,
					["value"] = not v_u_20.autoKick
				})
			end
		end, "default")
		v_u_6.label({
			["Name"] = "Help",
			["Text"] = "OFF = check disabled \194\183 LOG = only recorded (feed / suspects), no correction \194\183 ON = recorded + corrected (pulled back). * = changed from default.",
			["TextSize"] = 11,
			["TextColor3"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextWrapped"] = true,
			["Parent"] = nil,
			["TextColor3"] = v_u_10.TextFaint,
			["Position"] = UDim2.fromOffset(390, 56),
			["Size"] = UDim2.new(1, -390, 0, 32),
			["Parent"] = v132
		})
		v_u_29 = v_u_6.frame({
			["Name"] = "Checks",
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Position"] = UDim2.fromOffset(0, 96),
			["Size"] = UDim2.new(1, 0, 0, 266),
			["Parent"] = v132
		})
		v_u_6.list(v_u_29, true, 2)
		local v133 = v_u_6.frame({
			["Name"] = "Tabs",
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Position"] = UDim2.fromOffset(0, 372),
			["Size"] = UDim2.new(1, 0, 0, 28),
			["Parent"] = v132
		})
		v_u_6.list(v133, false, 6)
		for v134, v_u_135 in {
			{ "FEED", "Feed \194\183 this server" },
			{ "PLAYERS", "Players here" },
			{ "SUSPECTS", "Suspects \194\183 all servers" }
		} do
			v_u_30[v_u_135[1]] = v_u_6.button(v_u_135[2], {
				["Size"] = nil,
				["TextSize"] = 12,
				["LayoutOrder"] = nil,
				["Parent"] = nil,
				["Size"] = UDim2.fromOffset(v134 == 3 and 190 or 150, 28),
				["LayoutOrder"] = v134,
				["Parent"] = v133
			}, function()
				-- upvalues: (ref) v_u_23, (copy) v_u_135, (ref) v_u_12, (ref) v_u_37
				v_u_23 = v_u_135[1]
				if v_u_23 == "SUSPECTS" then
					task.spawn(v_u_12.refresh, true)
				end
				v_u_37()
			end, "default")
		end
		v_u_6.label({
			["Name"] = "ManualCap",
			["Text"] = "ANY PLAYER BY USERID (also players who already left):",
			["Font"] = nil,
			["TextSize"] = 11,
			["TextColor3"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextTruncate"] = nil,
			["Parent"] = nil,
			["Font"] = v_u_11.Bold,
			["TextColor3"] = v_u_10.TextDim,
			["Position"] = UDim2.fromOffset(0, 406),
			["Size"] = UDim2.new(1, -510, 0, 28),
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Parent"] = v132
		})
		local v_u_136 = v_u_6.frame({
			["Name"] = "Manual",
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(1, 0, 0, 406),
			["Size"] = UDim2.fromOffset(500, 28),
			["Parent"] = v132
		})
		v_u_6.list(v_u_136, false, 4, Enum.HorizontalAlignment.Right)
		v_u_34 = v_u_6.new("TextBox", {
			["Name"] = "UserId",
			["Text"] = "",
			["PlaceholderText"] = "UserId",
			["ClearTextOnFocus"] = false,
			["Font"] = nil,
			["TextSize"] = 13,
			["TextColor3"] = nil,
			["PlaceholderColor3"] = nil,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 0.2,
			["TextXAlignment"] = nil,
			["Size"] = nil,
			["LayoutOrder"] = 1,
			["Parent"] = nil,
			["Font"] = v_u_11.Bold,
			["TextColor3"] = v_u_10.White,
			["PlaceholderColor3"] = v_u_10.TextFaint,
			["BackgroundColor3"] = v_u_10.BgLight,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["Size"] = UDim2.fromOffset(110, 28),
			["Parent"] = v_u_136
		})
		v_u_6.corner(v_u_34, 3)
		v_u_6.padding(v_u_34, 8, 8, 0, 0)
		v_u_34:GetPropertyChangedSignal("Text"):Connect(function()
			-- upvalues: (ref) v_u_34
			local v137 = v_u_34.Text:gsub("[^%d]", ""):sub(1, 13)
			if v137 ~= v_u_34.Text then
				v_u_34.Text = v137
			end
		end)
		local v_u_138 = 2
		local function v145(p139, p140, p141, p142) -- name: small
			-- upvalues: (ref) v_u_6, (ref) v_u_138, (copy) v_u_136, (ref) v_u_35
			local v143 = v_u_6.button(p139, {
				["Size"] = nil,
				["TextSize"] = 11,
				["LayoutOrder"] = nil,
				["Parent"] = nil,
				["Size"] = UDim2.fromOffset(p140, 28),
				["LayoutOrder"] = v_u_138,
				["Parent"] = v_u_136
			}, p141, p142 or "default")
			v_u_138 = v_u_138 + 1
			local v144 = v_u_35
			table.insert(v144, v143)
			return v143
		end
		v145("Kick", 50, function()
			-- upvalues: (ref) v_u_34, (ref) v_u_10, (ref) v_u_25, (ref) v_u_101
			local v146 = v_u_34.Text
			local v147 = tonumber(v146)
			if not v147 or v147 <= 0 then
				local v148 = v_u_10.Accent
				if v_u_25 then
					v_u_25.Text = "Type a UserId first (or press USE ID on a row)."
					v_u_25.TextColor3 = v148 or v_u_10.TextDim
					v147 = nil
				else
					v147 = nil
				end
			end
			if v147 then
				v_u_101({
					["op"] = "acKick",
					["target"] = nil,
					["target"] = v147
				})
			end
		end)
		for _, v_u_149 in v_u_14 do
			local v_u_150 = nil
			local v154 = v145("Ban " .. v_u_149[1], v_u_149[2] < 0 and 74 or 60, function()
				-- upvalues: (ref) v_u_34, (ref) v_u_10, (ref) v_u_25, (ref) v_u_110, (copy) v_u_149, (ref) v_u_150
				local v151 = v_u_34.Text
				local v152 = tonumber(v151)
				if not v152 or v152 <= 0 then
					local v153 = v_u_10.Accent
					if v_u_25 then
						v_u_25.Text = "Type a UserId first (or press USE ID on a row)."
						v_u_25.TextColor3 = v153 or v_u_10.TextDim
						v152 = nil
					else
						v152 = nil
					end
				end
				if v152 then
					v_u_110(v152, v_u_149[2], nil, v_u_150)
				end
			end, "danger")
			v154:SetAttribute("BanDays", v_u_149[2])
		end
		v145("Unban", 56, function()
			-- upvalues: (ref) v_u_34, (ref) v_u_10, (ref) v_u_25, (ref) v_u_101
			local v155 = v_u_34.Text
			local v156 = tonumber(v155)
			if not v156 or v156 <= 0 then
				local v157 = v_u_10.Accent
				if v_u_25 then
					v_u_25.Text = "Type a UserId first (or press USE ID on a row)."
					v_u_25.TextColor3 = v157 or v_u_10.TextDim
					v156 = nil
				else
					v156 = nil
				end
			end
			if v156 then
				v_u_101({
					["op"] = "acUnban",
					["target"] = nil,
					["target"] = v156
				})
			end
		end)
		v145("Check", 56, function()
			-- upvalues: (ref) v_u_34, (ref) v_u_10, (ref) v_u_25, (ref) v_u_101
			local v158 = v_u_34.Text
			local v159 = tonumber(v158)
			if not v159 or v159 <= 0 then
				local v160 = v_u_10.Accent
				if v_u_25 then
					v_u_25.Text = "Type a UserId first (or press USE ID on a row)."
					v_u_25.TextColor3 = v160 or v_u_10.TextDim
					v159 = nil
				else
					v159 = nil
				end
			end
			if v159 then
				v_u_101({
					["op"] = "acBanInfo",
					["target"] = nil,
					["target"] = v159
				})
			end
		end, "ghost")
		v_u_32 = v_u_6.label({
			["Name"] = "ListHead",
			["Text"] = "",
			["TextSize"] = 11,
			["TextColor3"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextTruncate"] = nil,
			["Parent"] = nil,
			["TextColor3"] = v_u_10.TextFaint,
			["Position"] = UDim2.fromOffset(0, 440),
			["Size"] = UDim2.new(1, 0, 0, 14),
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Parent"] = v132
		})
		v_u_31 = v_u_6.scroll({
			["Name"] = "List",
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Position"] = UDim2.fromOffset(0, 456),
			["Size"] = UDim2.new(1, 0, 1, -480),
			["Parent"] = v132
		}, 3)
		v_u_25 = v_u_6.label({
			["Name"] = "Msg",
			["Text"] = "",
			["TextSize"] = 12,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextTruncate"] = nil,
			["Parent"] = nil,
			["AnchorPoint"] = Vector2.new(0, 1),
			["Position"] = UDim2.new(0, 0, 1, 0),
			["Size"] = UDim2.new(1, 0, 0, 20),
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Parent"] = v132
		})
		v_u_37()
	end
end
local function v_u_169(p162, p_u_163) -- name: checkRow
	-- upvalues: (copy) v_u_28, (copy) v_u_6, (copy) v_u_10, (ref) v_u_29, (copy) v_u_11, (copy) v_u_13, (ref) v_u_20, (copy) v_u_101
	local v164 = v_u_28[p_u_163.id]
	if v164 then
		return v164
	end
	local v165 = v_u_6.new("Frame", {
		["Name"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 0.6,
		["Size"] = nil,
		["LayoutOrder"] = nil,
		["Parent"] = nil,
		["Name"] = "Check_" .. p_u_163.id,
		["BackgroundColor3"] = v_u_10.BgLight,
		["Size"] = UDim2.new(1, -2, 0, 36),
		["LayoutOrder"] = p162,
		["Parent"] = v_u_29
	})
	local v166 = {
		["frame"] = v165,
		["t"] = v_u_6.label({
			["Name"] = "T",
			["Text"] = "",
			["Font"] = nil,
			["TextSize"] = 13,
			["Position"] = nil,
			["Size"] = nil,
			["TextTruncate"] = nil,
			["Parent"] = nil,
			["Font"] = v_u_11.Bold,
			["Position"] = UDim2.fromOffset(10, 2),
			["Size"] = UDim2.new(1, -300, 0, 17),
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Parent"] = v165
		}),
		["d"] = v_u_6.label({
			["Name"] = "D",
			["Text"] = "",
			["TextSize"] = 11,
			["TextColor3"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextTruncate"] = nil,
			["Parent"] = nil,
			["TextColor3"] = v_u_10.TextDim,
			["Position"] = UDim2.fromOffset(10, 19),
			["Size"] = UDim2.new(1, -300, 0, 15),
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Parent"] = v165
		}),
		["btns"] = {}
	}
	for v167, v_u_168 in v_u_13 do
		v166.btns[v_u_168] = v_u_6.button(v_u_168, {
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextSize"] = 12,
			["Parent"] = nil,
			["AnchorPoint"] = Vector2.new(1, 0.5),
			["Position"] = UDim2.new(1, -6 - (3 - v167) * 92, 0.5, 0),
			["Size"] = UDim2.fromOffset(86, 28),
			["Parent"] = v165
		}, function()
			-- upvalues: (ref) v_u_20, (ref) v_u_101, (copy) p_u_163, (copy) v_u_168
			if v_u_20 then
				v_u_101({
					["op"] = "acSet",
					["key"] = "Check",
					["check"] = nil,
					["value"] = nil,
					["check"] = p_u_163.id,
					["value"] = v_u_168
				})
			end
		end, "default")
	end
	v_u_28[p_u_163.id] = v166
	return v166
end
local v_u_170 = {
	["corrected"] = v_u_10.Accent,
	["frozen"] = v_u_10.Red,
	["auto-kicked"] = v_u_10.Red
}
v_u_37 = function()
	-- upvalues: (ref) v_u_16, (ref) v_u_20, (ref) v_u_24, (copy) v_u_50, (ref) v_u_26, (copy) v_u_6, (ref) v_u_19, (ref) v_u_27, (copy) v_u_169, (copy) v_u_10, (copy) v_u_13, (copy) v_u_30, (ref) v_u_23, (copy) v_u_35, (copy) v_u_14, (ref) v_u_32, (copy) v_u_170, (copy) v_u_65, (ref) v_u_21, (copy) v_u_130, (copy) v_u_3, (copy) v_u_33
	if v_u_16 and v_u_20 then
		local v171 = v_u_20
		local v172 = v171.owner == true
		local v173 = v171.stats or {}
		local v174 = v_u_24
		local v175 = string.format
		local v176 = v171.v or 0
		local v177 = tostring(v176)
		local v178 = v171.ready == false and " (loading)" or ""
		local v179 = v171.role or "?"
		local v180 = tostring(v179)
		local v181 = v171.job or "?"
		local v182 = tostring(v181)
		local v183 = v171.running and "" or " (checks not running here)"
		local v184 = #(v171.players or {})
		local v185 = v173.ms
		v174.Text = v175("Settings v%s%s  \194\183  %s server %s%s  \194\183  %d players  \194\183  %.2f ms/tick  \194\183  %d incidents, %d corrections, %d freezes, %d kicks%s", v177, v178, v180, v182, v183, v184, tonumber(v185) or 0, v173.incidents or 0, v173.corrections or 0, v173.freezes or 0, v173.kicks or 0, not v171.changedAt and "" or "  \194\183  changed " .. v_u_50(v171.changedAt))
		v_u_26.Text = v171.enabled and "ANTI-CHEAT: ON" or "ANTI-CHEAT: OFF"
		if v171.defaults and v171.enabled ~= v171.defaults.enabled then
			local v186 = v_u_26
			v186.Text = v186.Text .. " *"
		end
		v_u_6.setVariant(v_u_26, v171.enabled and "primary" or "danger")
		v_u_6.setDisabled(v_u_26, v_u_19 or not v172)
		v_u_27.Text = v171.autoKick and "AUTO-KICK: ON" or "AUTO-KICK: OFF"
		if v171.defaults and v171.autoKick ~= v171.defaults.autoKick then
			local v187 = v_u_27
			v187.Text = v187.Text .. " *"
		end
		v_u_6.setVariant(v_u_27, v171.autoKick and "danger" or "default")
		v_u_6.setDisabled(v_u_27, v_u_19 or not v172)
		for v188, v189 in v171.checks or {} do
			local v190 = v_u_169(v188, v189)
			local v191 = v190.t
			local v192 = string.upper
			local v193 = v189.title
			v191.Text = v192((tostring(v193))) .. (v189.mode == v189.default and "" or "  *") .. (v171.enabled and "" or "   (all off: master switch)")
			local v194 = v190.t
			local v195
			if v171.enabled and v189.mode ~= "Off" then
				if v189.mode == "On" then
					v195 = v_u_10.Text
				else
					v195 = v_u_10.Accent
				end
			else
				v195 = v_u_10.TextFaint
			end
			v194.TextColor3 = v195
			local v196 = v190.d
			local v197 = v189.desc
			local v198 = tostring(v197)
			local v199 = string.upper
			local v200 = v189.default
			v196.Text = v198 .. "  \194\183  default " .. v199((tostring(v200)))
			for _, v201 in v_u_13 do
				local v202 = v190.btns[v201]
				v202.Text = string.upper(v201) .. (v201 == "On" and v189.noCorrection and " (=LOG)" or "")
				v_u_6.setVariant(v202, v189.mode == v201 and (v201 == "Off" and "danger" or (v201 == "On" and "primary" or "selected")) or "default")
				v_u_6.setDisabled(v202, v_u_19 or not v172)
			end
		end
		for v203, v204 in v_u_30 do
			v_u_6.setVariant(v204, v203 == v_u_23 and "selected" or "default")
		end
		for _, v205 in v_u_35 do
			local v206 = v205:GetAttribute("BanDays")
			if v206 then
				local v207 = v_u_14[1]
				for _, v208 in v_u_14 do
					if v208[2] ~= v206 then
						continue
					end
					v207 = v208
				end
				v205.Text = os.clock() - (v205:GetAttribute("ConfirmAt") or -100) <= 4 and "CONFIRM?" or "BAN " .. v207[1]
			end
			local v209 = v_u_6.setDisabled
			local v210 = not (v_u_19 or v172)
			if v210 then
				v210 = v205.Text ~= "KICK"
			end
			v209(v205, v210)
		end
		local v211 = {}
		if v_u_23 == "FEED" then
			v_u_32.Text = "Newest first \194\183 same player + check within 2 s are merged (\195\151n) \194\183 corrected = pulled back, logged = recorded only"
			for _, v212 in v171.feed or {} do
				local v213 = {
					["uid"] = nil,
					["name"] = nil,
					["a"] = nil,
					["b"] = nil,
					["color"] = nil,
					["here"] = true,
					["uid"] = v212.uid,
					["name"] = v212.name
				}
				local v214 = string.format
				local v215 = v212.t
				local v216 = os.date
				local v217 = tonumber(v215) or 0
				local v218 = math.floor(v217)
				local v219, v220 = pcall(v216, "%H:%M:%S", v218)
				local v221 = (not v219 or type(v220) ~= "string") and "--:--:--" or v220
				local v222 = v212.display or v212.name
				local v223 = tostring(v222)
				local v224 = v212.check
				v213.a = v214("%s  %s  \194\183  %s%s", v221, v223, tostring(v224), (v212.n or 1) <= 1 and "" or string.format("  \195\151%d", v212.n))
				local v225 = string.format
				local v226 = v212.detail
				local v227 = tostring(v226)
				local v228 = string.upper
				local v229 = v212.action
				local v230 = v228((tostring(v229)))
				local v231 = v212.name
				local v232 = tostring(v231)
				local v233 = v212.uid
				v213.b = v225("%s  \194\183  %s  \194\183  @%s (%s)%s", v227, v230, v232, tostring(v233), not v212.score and "" or string.format("  \194\183  score %.1f", v212.score))
				v213.color = v_u_170[v212.action] or v_u_10.Text
				table.insert(v211, v213)
			end
			if #v211 == 0 then
				local v234 = {
					["a"] = "No incidents on this server yet.",
					["b"] = "Everything recorded by the checks above shows up here.",
					["color"] = nil,
					["color"] = v_u_10.TextDim
				}
				table.insert(v211, v234)
			end
		elseif v_u_23 == "PLAYERS" then
			local v235 = v_u_32
			local v236 = string.format
			local v237 = v171.score and (v171.score.suspect or "?") or "?"
			local v238 = tostring(v237)
			local v239 = v171.score and (v171.score.kick or "?") or "?"
			v235.Text = v236("Score drops by 1 per minute \194\183 suspect at %s \194\183 auto-kick at %s (if on)", v238, (tostring(v239)))
			for _, v240 in v171.players or {} do
				local v241 = v240.rej or {}
				local v242 = {
					["uid"] = nil,
					["name"] = nil,
					["a"] = nil,
					["b"] = nil,
					["color"] = nil,
					["here"] = true,
					["uid"] = v240.uid,
					["name"] = v240.name
				}
				local v243 = string.format
				local v244 = v240.display
				local v245 = tostring(v244)
				local v246 = v240.name
				v242.a = v243("%s (@%s)  \194\183  score %.1f (max %.1f)", v245, tostring(v246), v240.score or 0, v240.max or 0)
				local v247 = string.format
				local v248 = v_u_65(v240.counts) == "" and "no incidents" or v_u_65(v240.counts)
				local v249 = v240.shots or 0
				local v250 = v240.hits or 0
				local v251 = v240.hs or 0
				local v252 = v241.wall or 0
				local v253 = v241.path or 0
				local v254 = v241.early or 0
				local v255 = v241.rewind or 0
				local v256 = v240.uid
				v242.b = v247("%s  \194\183  shots %d, hits %d, headshots %d  \194\183  rejected: wall %d, path %d, early %d, rewind %d  \194\183  id %s", v248, v249, v250, v251, v252, v253, v254, v255, (tostring(v256)))
				local v257
				if (v240.score or 0) >= (v171.score and (v171.score.suspect or 6) or 6) then
					v257 = v_u_10.Red
				elseif (v240.score or 0) > 0 then
					v257 = v_u_10.Accent
				else
					v257 = v_u_10.Text
				end
				v242.color = v257
				table.insert(v211, v242)
			end
		else
			local v258 = v_u_21 and v_u_21.list or {}
			local v259 = v_u_32
			local v260
			if v_u_21 then
				local v261 = string.format
				local v262 = #v258
				local v263 = v_u_21.global and "all servers, last 24 h" or "THIS server only (MemoryStore off in Studio / unavailable)"
				local v264 = v_u_21.job
				v260 = v261("%d suspects \194\183 %s \194\183 this server %s", v262, v263, (tostring(v264)))
			else
				v260 = "Loading suspects..."
			end
			v259.Text = v260
			for _, v265 in v258 do
				local v266 = {
					["uid"] = v265.uid,
					["name"] = v265.n
				}
				local v267 = string.format
				local v268 = v265.d or v265.n
				local v269 = tostring(v268)
				local v270 = v265.n
				local v271 = tostring(v270)
				local v272 = v265.s
				v266.a = v267("%s (@%s)  \194\183  max score %s%s", v269, v271, tostring(v272), v265.here and "  \194\183  ON THIS SERVER" or "")
				local v273 = string.format
				local v274 = v_u_65(v265.c)
				local v275 = v265.a or 0
				local v276 = tostring(v275)
				local v277 = v_u_50(v265.t)
				local v278 = v265.j
				local v279 = tostring(v278)
				local v280 = v265.r
				local v281 = tostring(v280)
				local v282 = v265.uid
				v266.b = v273("%s  \194\183  %s corrections  \194\183  %s  \194\183  server %s (%s)  \194\183  id %s", v274, v276, v277, v279, v281, (tostring(v282)))
				local v283
				if v265.here then
					v283 = v_u_10.Red
				else
					v283 = v_u_10.Text
				end
				v266.color = v283
				v266.here = v265.here
				table.insert(v211, v266)
			end
			if v_u_21 and #v258 == 0 then
				local v284 = {
					["a"] = "No suspects.",
					["b"] = "Players reach this list at the suspect score.",
					["color"] = nil,
					["color"] = v_u_10.TextDim
				}
				table.insert(v211, v284)
			end
		end
		for v285, v286 in v211 do
			local v287 = v_u_130(v285)
			v287.data = v286
			v287.frame.Visible = true
			v287.a.Text = v286.a
			v287.a.TextColor3 = v286.color or v_u_10.Text
			v287.b.Text = v286.b
			local v288 = v286.uid ~= nil
			v287.kick.Visible = v288
			v287.ban.Visible = v288
			v287.pick.Visible = v288
			if v287.lastUid ~= v286.uid then
				v287.lastUid = v286.uid
				v287.ban:SetAttribute("ConfirmAt", nil)
			end
			v287.ban.Text = os.clock() - (v287.ban:GetAttribute("ConfirmAt") or -100) <= 4 and "CONFIRM?" or "BAN 7D"
			v_u_6.setDisabled(v287.kick, v_u_19 or v286.uid == v_u_3.LocalPlayer.UserId)
			v_u_6.setDisabled(v287.ban, v_u_19 or (not v172 or v286.uid == v_u_3.LocalPlayer.UserId))
		end
		for v289 = #v211 + 1, #v_u_33 do
			v_u_33[v289].frame.Visible = false
			v_u_33[v289].data = nil
		end
	end
end
function v_u_12.open() -- name: open
	-- upvalues: (ref) v_u_17, (copy) v_u_161, (ref) v_u_18, (ref) v_u_15, (copy) v_u_8, (copy) v_u_120, (ref) v_u_25, (copy) v_u_10, (copy) v_u_12, (ref) v_u_19
	if not v_u_17 then
		v_u_161()
		v_u_17 = true
		v_u_18 = v_u_18 + 1
		local v_u_290 = v_u_18
		v_u_15.gui.Enabled = true
		v_u_8.cursor("UI_AdminAntiCheat", true)
		v_u_120()
		if v_u_25 then
			v_u_25.Text = ""
			v_u_25.TextColor3 = v_u_10.TextDim
		end
		task.spawn(v_u_12.refresh, true)
		task.spawn(function()
			-- upvalues: (ref) v_u_17, (ref) v_u_18, (copy) v_u_290, (ref) v_u_19, (ref) v_u_12
			while v_u_17 and v_u_18 == v_u_290 do
				task.wait(3)
				if not v_u_17 or (v_u_18 ~= v_u_290 or v_u_19) then
					continue
				end
				v_u_12.refresh(false)
			end
		end)
	end
end
function v_u_12.close() -- name: close
	-- upvalues: (ref) v_u_17, (ref) v_u_18, (ref) v_u_15, (copy) v_u_8
	if v_u_17 then
		v_u_17 = false
		v_u_18 = v_u_18 + 1
		if v_u_15 then
			v_u_15.gui.Enabled = false
		end
		v_u_8.cursor("UI_AdminAntiCheat", false)
	end
end
function v_u_12.isOpen() -- name: isOpen
	-- upvalues: (ref) v_u_17
	return v_u_17
end
return v_u_12