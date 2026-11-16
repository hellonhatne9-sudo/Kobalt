-- Decompiled by Executor
-- Path: ReplicatedStorage.Client.Controllers.UI_Staff

local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("HttpService")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("TextChatService")
local v_u_5 = game:GetService("UserInputService")
local v6 = script.Parent.Parent:WaitForChild("UIKit")
local v7 = require(v6.Theme)
local v_u_8 = require(v6.UI)
local v_u_9 = require(v6.Root)
local v_u_10 = require(v6.Deps)
local v_u_11 = require(v6.Art)
local v_u_12 = v7.Color
local v_u_13 = v7.Font
local v_u_14 = {}
local v_u_15 = nil
local v_u_16 = false
local v_u_17 = nil
local v_u_18 = {}
local v_u_19 = false
local v_u_20 = 0
local v_u_21 = false
local v_u_22 = 0
local v_u_23 = "HERE"
local v_u_24 = {
	["here"] = {},
	["recent"] = {}
}
local v_u_25 = nil
local v_u_26 = nil
local v_u_27 = false
local v_u_28 = nil
local v_u_29 = ""
local v_u_30 = false
local v_u_31 = 0
local v_u_32 = nil
local v_u_33 = false
local v_u_34 = 0
local v_u_35 = -100
local v_u_36 = nil
local v_u_37 = nil
local v_u_38 = nil
local v_u_39 = nil
local v_u_40 = nil
local v_u_41 = nil
local v_u_42 = nil
local v_u_43 = nil
local v_u_44 = {}
local v_u_45 = nil
local v_u_46 = nil
local v_u_47 = {}
local v_u_48 = nil
local v_u_49 = nil
local v_u_50 = nil
local v_u_51 = nil
local v_u_52 = nil
local v_u_53 = {}
local v_u_54 = nil
local v_u_55 = nil
local v_u_56 = nil
local v_u_57 = {}
local v_u_58 = nil
local v_u_59 = nil
local v_u_60 = nil
local v_u_61 = nil
local v_u_62 = nil
local v_u_63 = nil
local v_u_64 = ""
local v_u_65 = nil
local v_u_66 = false
local v_u_67 = false
local function v_u_72(p_u_68) -- name: query
	-- upvalues: (copy) v_u_10
	local v_u_69 = v_u_10.remote("StaffQuery")
	if v_u_69 and v_u_69:IsA("RemoteFunction") then
		local v70, v71 = pcall(function()
			-- upvalues: (copy) v_u_69, (copy) p_u_68
			return v_u_69:InvokeServer(p_u_68)
		end)
		if v70 then
			return v71
		else
			return nil
		end
	else
		return nil
	end
end
local function v_u_75(p73) -- name: reasonOf
	-- upvalues: (ref) v_u_17
	if not (v_u_17 and p73) then
		return nil
	end
	for _, v74 in v_u_17.reasons or {} do
		if v74.id ~= p73 then
			continue
		end
		return v74
	end
	return nil
end
local v_u_76 = nil
local function v_u_87() -- name: canBan
	-- upvalues: (ref) v_u_17, (ref) v_u_19, (ref) v_u_15, (ref) v_u_25, (ref) v_u_26, (copy) v_u_75, (ref) v_u_28, (ref) v_u_29, (ref) v_u_18, (ref) v_u_20
	if not v_u_17 then
		return false, "Loading..."
	end
	if v_u_19 and v_u_15 ~= "owner" then
		return false, "Moderator bans are paused by the owner."
	end
	if not v_u_25 or (v_u_25.checking or not v_u_25.id) then
		return false, "Pick a player first."
	end
	if v_u_25.self then
		return false, "You can\'t ban yourself."
	end
	if v_u_25.prot and (v_u_15 ~= "owner" or v_u_25.prot ~= "a staff member") then
		local v77 = v_u_25.prot
		return false, "This player is protected (" .. tostring(v77) .. ")."
	end
	if v_u_25.banned and v_u_15 ~= "owner" then
		return false, "This player is already banned."
	end
	if v_u_26 == nil then
		return false, "Pick a duration."
	end
	local v78 = v_u_75(v_u_28)
	if not v78 then
		return false, "Pick a reason."
	end
	if v78.note then
		local v79 = v_u_29
		local v80 = string.gsub(v79, "^%s+", "")
		local v81 = string.gsub(v80, "%s+$", "")
		if (utf8.len(v81) or #v81) < 3 then
			local v82 = v78.label
			return false, "Write a short note (needed for " .. tostring(v82) .. ")."
		end
	end
	if v_u_15 ~= "owner" and v_u_18 then
		local v83 = v_u_18.next
		if tonumber(v83) and v_u_18.next > os.time() + v_u_20 then
			local v84 = v_u_18.next - (os.time() + v_u_20)
			local v85 = math.ceil(v84)
			local v86 = math.max(0, v85)
			return false, "Cooldown: you can ban again in " .. string.format("%d:%02d", v86 // 60, v86 % 60) .. "."
		end
	end
	return true, ""
end
v_u_76 = function()
	-- upvalues: (ref) v_u_62, (ref) v_u_64, (ref) v_u_65, (copy) v_u_12, (copy) v_u_87, (ref) v_u_33
	if v_u_62 then
		if v_u_64 == "" then
			local v88, v89 = v_u_87()
			v_u_62.Text = (v88 or v_u_33) and "" or v89
			v_u_62.TextColor3 = v_u_12.TextFaint
		else
			v_u_62.Text = v_u_64
			v_u_62.TextColor3 = v_u_65 or v_u_12.TextDim
		end
	else
		return
	end
end
local function v_u_95() -- name: updateStatus
	-- upvalues: (ref) v_u_42, (ref) v_u_15, (copy) v_u_12, (ref) v_u_19, (ref) v_u_18, (ref) v_u_20
	if v_u_42 then
		if v_u_15 == "owner" then
			v_u_42.Text = "OWNER \194\183 NO COOLDOWN"
			v_u_42.TextColor3 = v_u_12.Green
			return
		elseif v_u_19 then
			v_u_42.Text = "BANS PAUSED BY THE OWNER"
			v_u_42.TextColor3 = v_u_12.Red
		else
			if v_u_18 then
				local v90 = v_u_18.next
				if tonumber(v90) and v_u_18.next > os.time() + v_u_20 then
					local v91 = v_u_42
					local v92 = v_u_18.next - (os.time() + v_u_20)
					local v93 = math.ceil(v92)
					local v94 = math.max(0, v93)
					v91.Text = "NEXT BAN IN " .. string.format("%d:%02d", v94 // 60, v94 % 60)
					v_u_42.TextColor3 = v_u_12.Accent
					return
				end
			end
			v_u_42.Text = "READY TO BAN"
			v_u_42.TextColor3 = v_u_12.Green
		end
	else
		return
	end
end
local function v_u_105(p96) -- name: acText
	if type(p96) ~= "table" then
		return "anti-cheat clean"
	end
	local v97 = p96.s
	if (tonumber(v97) or 0) > 0 then
		v99 = string.format
		v100 = p96.s
		v101 = tonumber(v100) or 0
		v102 = p96.m
		v103 = tonumber(v102) or 0
		v104 = p96.c
		return v99("anti-cheat %.1f (max %.1f)%s", v101, v103, (type(v104) ~= "string" or p96.c == "") and "" or " \194\183 " .. p96.c)
	end
	local v98 = p96.m
	if (tonumber(v98) or 0) <= 0 then
		return "anti-cheat clean"
	end
	local v99 = string.format
	local v100 = p96.s
	local v101 = tonumber(v100) or 0
	local v102 = p96.m
	local v103 = tonumber(v102) or 0
	local v104 = p96.c
	return v99("anti-cheat %.1f (max %.1f)%s", v101, v103, (type(v104) ~= "string" or p96.c == "") and "" or " \194\183 " .. p96.c)
end
local function v_u_106(_) -- name: selectRow end
local function v_u_111(p107) -- name: rowUi
	-- upvalues: (copy) v_u_47, (copy) v_u_8, (copy) v_u_12, (ref) v_u_45, (copy) v_u_13, (ref) v_u_25, (ref) v_u_106
	local v108 = v_u_47[p107]
	if v108 then
		return v108
	end
	local v_u_109 = v_u_8.new("TextButton", {
		["Name"] = nil,
		["Text"] = "",
		["AutoButtonColor"] = false,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 0.6,
		["Size"] = nil,
		["LayoutOrder"] = nil,
		["Parent"] = nil,
		["Name"] = "Row" .. p107,
		["BackgroundColor3"] = v_u_12.BgLight,
		["Size"] = UDim2.new(1, -6, 0, 58),
		["LayoutOrder"] = p107,
		["Parent"] = v_u_45
	})
	v_u_8.corner(v_u_109, 3)
	local v_u_110 = {
		["btn"] = nil,
		["nm"] = nil,
		["sub"] = nil,
		["tag"] = nil,
		["data"] = nil,
		["hover"] = false,
		["btn"] = v_u_109,
		["nm"] = v_u_8.label({
			["Name"] = "Name",
			["Text"] = "",
			["Font"] = nil,
			["TextSize"] = 16,
			["Position"] = nil,
			["Size"] = nil,
			["TextTruncate"] = nil,
			["Parent"] = nil,
			["Font"] = v_u_13.Bold,
			["Position"] = UDim2.fromOffset(10, 6),
			["Size"] = UDim2.new(1, -100, 0, 20),
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Parent"] = v_u_109
		}),
		["sub"] = v_u_8.label({
			["Name"] = "Sub",
			["Text"] = "",
			["TextSize"] = 13,
			["TextColor3"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextTruncate"] = nil,
			["Parent"] = nil,
			["TextColor3"] = v_u_12.TextDim,
			["Position"] = UDim2.fromOffset(10, 30),
			["Size"] = UDim2.new(1, -20, 0, 18),
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Parent"] = v_u_109
		}),
		["tag"] = v_u_8.label({
			["Name"] = "Tag",
			["Text"] = "",
			["Font"] = nil,
			["TextSize"] = 12,
			["TextXAlignment"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Font"] = v_u_13.Bold,
			["TextXAlignment"] = Enum.TextXAlignment.Right,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(1, -10, 0, 8),
			["Size"] = UDim2.fromOffset(86, 16),
			["Parent"] = v_u_109
		})
	}
	v_u_109.MouseEnter:Connect(function()
		-- upvalues: (ref) v_u_110, (ref) v_u_25, (copy) v_u_109
		v_u_110.hover = true
		if not v_u_25 or (not v_u_110.data or v_u_25.id ~= v_u_110.data.id) then
			v_u_109.BackgroundTransparency = 0.4
		end
	end)
	v_u_109.MouseLeave:Connect(function()
		-- upvalues: (ref) v_u_110, (ref) v_u_25, (copy) v_u_109
		v_u_110.hover = false
		if not v_u_25 or (not v_u_110.data or v_u_25.id ~= v_u_110.data.id) then
			v_u_109.BackgroundTransparency = 0.6
		end
	end)
	v_u_109.Activated:Connect(function()
		-- upvalues: (ref) v_u_110, (ref) v_u_106
		if v_u_110.data then
			v_u_106(v_u_110.data)
		end
	end)
	v_u_47[p107] = v_u_110
	return v_u_110
end
local function v_u_153() -- name: renderList
	-- upvalues: (ref) v_u_45, (copy) v_u_24, (copy) v_u_44, (copy) v_u_8, (ref) v_u_23, (copy) v_u_111, (ref) v_u_25, (copy) v_u_12, (copy) v_u_105, (ref) v_u_20, (copy) v_u_47, (ref) v_u_46
	if v_u_45 then
		local v112 = v_u_24.here or {}
		local v113 = v_u_24.recent or {}
		v_u_44.HERE.Text = string.format("THIS SERVER (%d)", #v112)
		v_u_44.RECENT.Text = string.format("RECENT (%d)", #v113)
		v_u_8.setVariant(v_u_44.HERE, v_u_23 == "HERE" and "selected" or "default")
		v_u_8.setVariant(v_u_44.RECENT, v_u_23 == "RECENT" and "selected" or "default")
		if v_u_23 ~= "HERE" then
			v112 = v113
		end
		for v114, v115 in v112 do
			local v116 = v_u_111(v114)
			v116.data = v115
			v116.btn.Visible = true
			local v117
			if v_u_25 == nil then
				v117 = false
			else
				v117 = v_u_25.id == v115.id
			end
			local v118 = v116.btn
			local v119
			if v117 then
				v119 = v_u_12.Hover
			else
				v119 = v_u_12.BgLight
			end
			v118.BackgroundColor3 = v119
			v116.btn.BackgroundTransparency = v117 and 0.15 or (v116.hover and 0.4 or 0.6)
			local v120 = v115.display or v115.name
			local v121 = tostring(v120)
			local v122 = v116.nm
			local v123 = v115.name
			local v124
			if v121 == tostring(v123) then
				local v125 = v115.name
				v124 = "@" .. tostring(v125)
			else
				local v126 = string.format
				local v127 = v115.name
				v124 = v126("%s (@%s)", v121, (tostring(v127)))
			end
			v122.Text = v124
			local v128 = v116.nm
			local v129
			if v115.me or v115.prot then
				v129 = v_u_12.TextFaint
			else
				v129 = v_u_12.Text
			end
			v128.TextColor3 = v129
			if v_u_23 == "HERE" then
				local v130 = v115.age
				local v131 = tonumber(v130) or 0
				local v132 = v116.sub
				local v133 = string.format
				local v134 = string.upper
				local v135 = v115.dev or "?"
				v132.Text = v133("%s \194\183 account %s \194\183 %s", v134((tostring(v135))), v131 < 1 and "new today" or v131 .. "d", v_u_105(v115.ac))
				local v136 = v115.ac
				local v137
				if type(v136) == "table" then
					local v138 = v115.ac.m
					v137 = (tonumber(v138) or 0) >= 6
				else
					v137 = false
				end
				v116.tag.Text = v115.me and "YOU" or (v115.prot and "STAFF" or (v137 and "SUSPECT" or (v131 < 7 and "NEW ACCOUNT" or "")))
				local v139 = v116.tag
				local v140
				if v115.me or v115.prot then
					v140 = v_u_12.TextFaint
				elseif v137 then
					v140 = v_u_12.Red
				else
					v140 = v_u_12.Accent
				end
				v139.TextColor3 = v140
			else
				local v141 = v116.sub
				local v142 = string.format
				local v143 = "Seen %s \194\183 %s server \194\183 id %s"
				local v144 = v115.t
				local v145 = os.time() + v_u_20 - (tonumber(v144) or os.time() + v_u_20)
				local v146 = math.max(0, v145)
				local v147
				if v146 < 60 then
					v147 = "just now"
				elseif v146 < 3600 then
					v147 = v146 // 60 .. " min ago"
				else
					v147 = v146 // 3600 .. " h ago"
				end
				local v148 = string.lower
				local v149 = v115.srv or "?"
				local v150 = v148((tostring(v149)))
				local v151 = v115.id
				v141.Text = v142(v143, v147, v150, (tostring(v151)))
				v116.tag.Text = v115.prot and "STAFF" or ""
				v116.tag.TextColor3 = v_u_12.TextFaint
			end
		end
		for v152 = #v112 + 1, #v_u_47 do
			v_u_47[v152].btn.Visible = false
			v_u_47[v152].data = nil
		end
		v_u_46.Visible = #v112 == 0
		v_u_46.Text = v_u_23 == "HERE" and "Loading players..." or "Nobody yet. Players you share a server with (lobby or match) show up here for 1 hour."
	end
end
local function v_u_182() -- name: renderForm
	-- upvalues: (ref) v_u_49, (ref) v_u_25, (copy) v_u_12, (ref) v_u_50, (ref) v_u_51, (ref) v_u_15, (copy) v_u_53, (copy) v_u_8, (ref) v_u_26, (ref) v_u_27, (ref) v_u_55, (copy) v_u_57, (ref) v_u_28, (copy) v_u_75, (ref) v_u_58, (ref) v_u_29, (ref) v_u_17, (copy) v_u_87, (ref) v_u_30, (ref) v_u_60, (ref) v_u_33, (ref) v_u_61, (ref) v_u_76
	if v_u_49 then
		local v154 = v_u_25
		if v154 then
			if v154.checking then
				v_u_49.Text = "Checking..."
				v_u_49.TextColor3 = v_u_12.TextDim
				v_u_50.Text = ""
				v_u_51.Text = ""
			else
				v_u_49.TextColor3 = v_u_12.White
				local v155 = v154.display or v154.name
				local v156 = tostring(v155)
				local v157 = v_u_49
				local v158 = v154.name
				local v159
				if v156 == tostring(v158) then
					local v160 = v154.name
					v159 = "@" .. tostring(v160)
				else
					local v161 = string.format
					local v162 = v154.name
					v159 = v161("%s (@%s)", v156, (tostring(v162)))
				end
				v157.Text = v159
				local v163 = v_u_50
				local v164 = string.format
				local v165 = v154.id
				v163.Text = v164("UserId %s \194\183 %s", tostring(v165), v154.here and "on this server" or "on another server or offline")
				local v166 = "Can be banned (applies on every server, online or offline)."
				local v167 = v_u_12.Green
				if v154.self then
					v167 = v_u_12.TextFaint
					v166 = "That\'s you."
				elseif v154.prot and (v_u_15 ~= "owner" or v154.prot ~= "a staff member") then
					local v168 = v154.prot
					v166 = "Protected: " .. tostring(v168) .. " can\'t be banned."
					v167 = v_u_12.Red
				elseif v154.banned then
					local v169 = v154.banned.text or "Already banned."
					v166 = tostring(v169)
					v167 = v_u_12.Red
					if v_u_15 == "owner" then
						v166 = v166 .. " A new ban replaces it."
						v167 = v_u_12.Accent
					end
				elseif v154.prot then
					v167 = v_u_12.Accent
					v166 = "Staff member (you can still ban as owner)."
				elseif v154.warn then
					local v170 = v154.warn
					v166 = tostring(v170)
					v167 = v_u_12.Accent
				end
				v_u_51.Text = v166
				v_u_51.TextColor3 = v167
			end
		else
			v_u_49.Text = "No player selected"
			v_u_49.TextColor3 = v_u_12.TextDim
			v_u_50.Text = "Pick a player on the left, or type any UserId / username (any server, or offline) and press FIND."
			v_u_51.Text = ""
		end
		for _, v171 in v_u_53 do
			v_u_8.setVariant(v171.b, v_u_26 == v171.d and not v_u_27 and "selected" or "default")
		end
		if v_u_55 then
			v_u_8.setVariant(v_u_55, v_u_26 == -1 and "danger" or "default")
		end
		for v172, v173 in v_u_57 do
			v_u_8.setVariant(v173, v_u_28 == v172 and "selected" or "default")
		end
		local v174 = v_u_75(v_u_28)
		local v175 = v_u_29
		v_u_58.Text = string.upper(string.format("Note \194\183 only the owner sees it%s \194\183 %d/%d", v174 and v174.note and " \194\183 required" or "", utf8.len(v175) or #v175, v_u_17 and v_u_17.noteMax or 120))
		local v176, _ = v_u_87()
		if v_u_30 then
			v_u_60.Text = "CONFIRM BAN"
			v_u_8.setVariant(v_u_60, "danger")
		else
			local v177 = v_u_60
			local v178
			if v_u_26 == nil then
				v178 = "BAN"
			else
				local v179 = v_u_26
				v178 = "BAN \194\183 " .. (v179 == nil and "" or (v179 < 0 and "PERMANENT" or v179 .. "D"))
			end
			v177.Text = v178
			v_u_8.setVariant(v_u_60, "primary")
		end
		v_u_8.setDisabled(v_u_60, v_u_33 or not v176)
		local v180 = v_u_61
		local v181 = v_u_30
		if v181 then
			v181 = not v_u_33
		end
		v180.Visible = v181
		v_u_76()
	end
end
local function v_u_197()
	-- upvalues: (ref) v_u_40, (ref) v_u_41, (ref) v_u_15, (ref) v_u_18, (ref) v_u_43, (ref) v_u_20, (copy) v_u_95, (copy) v_u_153, (copy) v_u_182
	if v_u_40 then
		v_u_41.Text = v_u_15 == "owner" and "OWNER" or "MODERATOR"
		local v183 = v_u_18
		if v183 then
			v183 = v_u_18.n
		end
		local v184 = tonumber(v183) or 0
		local v185 = v_u_18
		if v185 then
			v185 = v_u_18.w
		end
		local v186 = tonumber(v185) or 0
		local v187 = v_u_43
		local v188 = string.format
		local v189 = "Your bans: %d total \194\183 %d this week%s"
		local v190
		if v_u_18 then
			local v191 = v_u_18.last
			if tonumber(v191) then
				local v192 = " \194\183 last "
				local v193 = v_u_18.last
				local v194 = os.time() + v_u_20 - (tonumber(v193) or os.time() + v_u_20)
				local v195 = math.max(0, v194)
				local v196
				if v195 < 60 then
					v196 = "just now"
				elseif v195 < 3600 then
					v196 = v195 // 60 .. " min ago"
				else
					v196 = v195 // 3600 .. " h ago"
				end
				v190 = v192 .. v196
			else
				v190 = ""
			end
		else
			v190 = ""
		end
		v187.Text = v188(v189, v184, v186, v190)
		v_u_95()
		v_u_153()
		v_u_182()
	end
end
local function v_u_205(p198) -- name: applyHello
	-- upvalues: (ref) v_u_15, (ref) v_u_17, (ref) v_u_18, (ref) v_u_19, (ref) v_u_20
	if type(p198) ~= "table" or p198.error then
		return false
	end
	local v199 = p198.role
	local v200
	if type(v199) == "string" then
		v200 = p198.role
	else
		v200 = nil
	end
	v_u_15 = v200
	local v201 = p198.cfg
	local v202
	if type(v201) == "table" then
		v202 = p198.cfg
	else
		v202 = v_u_17
	end
	v_u_17 = v202
	local v203 = p198.me
	v_u_18 = type(v203) ~= "table" and {} or p198.me
	v_u_19 = p198.paused == true
	local v204 = p198.now
	v_u_20 = (tonumber(v204) or os.time()) - os.time()
	return v_u_15 ~= nil
end
local function v_u_212(p206, p207) -- name: applyLookup
	-- upvalues: (ref) v_u_34, (ref) v_u_25, (copy) v_u_12, (ref) v_u_64, (ref) v_u_65, (ref) v_u_66, (ref) v_u_76, (ref) v_u_197
	if p206 == v_u_34 then
		if type(p207) == "table" then
			if p207.error then
				v_u_25 = nil
				local v208
				if p207.error == "rate" then
					v208 = "Too fast, try again."
				else
					local v209 = p207.error
					v208 = tostring(v209)
				end
				local v210 = v_u_12.Red
				v_u_64 = v208
				v_u_65 = v210
				v_u_66 = false
				if v_u_76 then
					v_u_76()
				end
			else
				v_u_25 = p207
				v_u_64 = ""
				v_u_65 = nil
				v_u_66 = false
				if v_u_76 then
					v_u_76()
				end
			end
		else
			v_u_25 = nil
			local v211 = v_u_12.Red
			v_u_64 = "Request failed (not authorized or server busy)."
			v_u_65 = v211
			v_u_66 = false
			if v_u_76 then
				v_u_76()
			end
		end
		v_u_197()
	end
end
function v_u_14.lookup(p213) -- name: lookup
	-- upvalues: (copy) v_u_12, (ref) v_u_64, (ref) v_u_65, (ref) v_u_66, (ref) v_u_76, (ref) v_u_34, (ref) v_u_30, (ref) v_u_32, (ref) v_u_31, (ref) v_u_25, (ref) v_u_197, (ref) v_u_35, (copy) v_u_212, (copy) v_u_72
	local v214 = tostring(p213 or "")
	local v215 = string.gsub(v214, "^%s+", "")
	local v_u_216 = string.gsub(v215, "%s+$", "")
	if v_u_216 == "" then
		local v217 = v_u_12.Accent
		v_u_64 = "Type a UserId or a username."
		v_u_65 = v217
		v_u_66 = false
		if v_u_76 then
			v_u_76()
		end
	else
		v_u_34 = v_u_34 + 1
		local v_u_218 = v_u_34
		v_u_30 = false
		v_u_32 = nil
		v_u_31 = v_u_31 + 1
		if v_u_66 then
			v_u_64 = ""
			v_u_65 = nil
			v_u_66 = false
		end
		v_u_25 = {
			["checking"] = true
		}
		v_u_197()
		task.spawn(function()
			-- upvalues: (ref) v_u_35, (copy) v_u_218, (ref) v_u_34, (ref) v_u_212, (ref) v_u_72, (copy) v_u_216
			local v219 = 1.3 - (os.clock() - v_u_35)
			if v219 > 0 then
				task.wait(v219)
			end
			if v_u_218 == v_u_34 then
				v_u_35 = os.clock()
				v_u_212(v_u_218, (v_u_72({
					["op"] = "lookup",
					["q"] = nil,
					["q"] = v_u_216
				})))
			end
		end)
	end
end
function v_u_14.find() -- name: find
	-- upvalues: (ref) v_u_48, (copy) v_u_14
	if v_u_48 then
		v_u_14.lookup(v_u_48.Text)
	end
end
v_u_106 = function(p220)
	-- upvalues: (copy) v_u_12, (ref) v_u_64, (ref) v_u_65, (ref) v_u_66, (ref) v_u_76, (ref) v_u_48, (copy) v_u_14
	if p220.me then
		local v221 = v_u_12.TextDim
		v_u_64 = "That\'s you."
		v_u_65 = v221
		v_u_66 = false
		if v_u_76 then
			v_u_76()
		end
	else
		if v_u_48 then
			local v222 = v_u_48
			local v223 = p220.name or p220.id
			v222.Text = tostring(v223)
		end
		local v224 = v_u_14.lookup
		local v225 = p220.id
		v224((tostring(v225)))
	end
end
local function v_u_231() -- name: refreshLists
	-- upvalues: (copy) v_u_72, (copy) v_u_24
	local v226 = v_u_72({
		["op"] = "players"
	})
	if type(v226) ~= "table" or v226.error then
		return false
	end
	local v227 = v_u_24
	local v228 = v226.here
	v227.here = type(v228) ~= "table" and {} or v226.here
	local v229 = v_u_24
	local v230 = v226.recent
	v229.recent = type(v230) ~= "table" and {} or v226.recent
	return true
end
local function v_u_268() -- name: onBan
	-- upvalues: (ref) v_u_33, (copy) v_u_87, (copy) v_u_12, (ref) v_u_64, (ref) v_u_65, (ref) v_u_66, (ref) v_u_76, (ref) v_u_25, (copy) v_u_75, (ref) v_u_28, (ref) v_u_30, (ref) v_u_31, (ref) v_u_32, (copy) v_u_2, (ref) v_u_26, (ref) v_u_197, (ref) v_u_63, (copy) v_u_72, (ref) v_u_29, (ref) v_u_48, (ref) v_u_59, (ref) v_u_18, (ref) v_u_20, (copy) v_u_231, (ref) v_u_21
	if v_u_33 then
		return
	else
		local v232, v233 = v_u_87()
		if v232 then
			local v234 = v_u_25
			local v235 = v_u_75(v_u_28)
			if v_u_30 then
				v_u_33 = true
				local v236 = v_u_12.TextDim
				v_u_64 = "Banning..."
				v_u_65 = v236
				v_u_66 = false
				if v_u_76 then
					v_u_76()
				end
				v_u_197()
				local v237 = v_u_72
				local v238 = {
					["op"] = "ban",
					["target"] = nil,
					["days"] = nil,
					["reason"] = nil,
					["note"] = nil,
					["nonce"] = nil,
					["target"] = v234.id,
					["days"] = v_u_26,
					["reason"] = v_u_28
				}
				local v239 = v_u_29
				local v240 = string.gsub(v239, "^%s+", "")
				v238.note = string.gsub(v240, "%s+$", "")
				v238.nonce = v_u_32
				local v241 = v237(v238)
				v_u_33 = false
				v_u_30 = false
				v_u_32 = nil
				v_u_31 = v_u_31 + 1
				if v_u_66 then
					v_u_64 = ""
					v_u_65 = nil
					v_u_66 = false
				end
				if type(v241) == "table" and v241.ok then
					local v242 = v241.msg or "Banned."
					local v243 = tostring(v242) .. " It\'s in the log and sent to the owner."
					local v244 = v_u_12.Green
					v_u_64 = v243
					v_u_65 = v244
					v_u_66 = false
					if v_u_76 then
						v_u_76()
					end
					v_u_25 = nil
					if v_u_48 then
						v_u_48.Text = ""
					end
					v_u_59.Text = ""
					v_u_29 = ""
					local v245 = v241.next
					if tonumber(v245) then
						v_u_18.next = v241.next
					end
					local v246 = v_u_18
					local v247 = v_u_18.n
					v246.n = (tonumber(v247) or 0) + 1
					local v248 = v_u_18
					local v249 = v_u_18.w
					v248.w = (tonumber(v249) or 0) + 1
					v_u_18.last = os.time() + v_u_20
					task.spawn(function()
						-- upvalues: (ref) v_u_231, (ref) v_u_21, (ref) v_u_197
						task.wait(1.1)
						if v_u_231() and v_u_21 then
							v_u_197()
						end
					end)
				elseif type(v241) == "table" and v241.error then
					local v250
					if v241.error == "rate" then
						v250 = "Too fast, try again."
					else
						local v251 = v241.error
						v250 = tostring(v251)
					end
					local v252 = v_u_12.Red
					v_u_64 = v250
					v_u_65 = v252
					v_u_66 = false
					if v_u_76 then
						v_u_76()
					end
					local v253 = v241.next
					if tonumber(v253) then
						v_u_18.next = v241.next
					end
				else
					local v254 = v_u_12.Red
					v_u_64 = "Request failed (not authorized or server busy). Nothing was done."
					v_u_65 = v254
					v_u_66 = false
					if v_u_76 then
						v_u_76()
					end
				end
				v_u_197()
				local v255 = v_u_63
				if v255 and v255.AbsoluteCanvasSize.Y > v255.AbsoluteWindowSize.Y + 2 then
					v255.CanvasPosition = Vector2.new(0, v255.AbsoluteCanvasSize.Y)
				end
			else
				v_u_30 = true
				v_u_31 = v_u_31 + 1
				local v_u_256 = v_u_31
				v_u_32 = v_u_2:GenerateGUID(false)
				local v257 = string.format
				local v258 = v234.name
				local v259 = tostring(v258)
				local v260 = v_u_26
				local v261 = v260 == nil and "?" or (v260 < 0 and "PERMANENTLY" or "for " .. v260 .. (v260 == 1 and " day" or " days"))
				local v262 = v235 and v235.label or "?"
				local v263 = v257("Ban @%s %s for \"%s\"? Press CONFIRM BAN.", v259, v261, (tostring(v262)))
				local v264 = v_u_12.Accent
				v_u_64 = v263
				v_u_65 = v264
				v_u_66 = false
				if v_u_76 then
					v_u_76()
				end
				v_u_66 = true
				v_u_197()
				local v265 = v_u_63
				if v265 and v265.AbsoluteCanvasSize.Y > v265.AbsoluteWindowSize.Y + 2 then
					v265.CanvasPosition = Vector2.new(0, v265.AbsoluteCanvasSize.Y)
				end
				task.delay(6, function()
					-- upvalues: (ref) v_u_30, (ref) v_u_31, (copy) v_u_256, (ref) v_u_33, (ref) v_u_32, (ref) v_u_66, (ref) v_u_64, (ref) v_u_65, (ref) v_u_12, (ref) v_u_76, (ref) v_u_197
					if v_u_30 and (v_u_31 == v_u_256 and not v_u_33) then
						v_u_30 = false
						v_u_32 = nil
						v_u_31 = v_u_31 + 1
						if v_u_66 then
							v_u_64 = ""
							v_u_65 = nil
							v_u_66 = false
						end
						local v266 = v_u_12.TextDim
						v_u_64 = "Not confirmed in time. Press BAN again."
						v_u_65 = v266
						v_u_66 = false
						if v_u_76 then
							v_u_76()
						end
						v_u_197()
					end
				end)
			end
		else
			local v267 = v_u_12.Accent
			v_u_64 = v233
			v_u_65 = v267
			v_u_66 = false
			if v_u_76 then
				v_u_76()
			end
			return
		end
	end
end
local function v_u_278() -- name: layout
	-- upvalues: (ref) v_u_40, (ref) v_u_36, (copy) v_u_9
	if v_u_40 then
		local v269 = v_u_36 or v_u_9.virtualSize()
		local v270 = v_u_36 and 64 or v_u_9.topInset()
		local v271 = v269.X - 24
		local v272 = math.clamp(v271, 640, 1180)
		local v273 = v269.Y - v270 - 12
		local v274 = math.clamp(v273, 400, 700)
		v_u_40.Size = UDim2.fromOffset(v272, v274)
		local v275 = v_u_40
		local v276 = UDim2.new
		local v277 = (v269.Y - v270 - v274) / 2
		v275.Position = v276(0.5, 0, 0, v270 + math.max(0, v277))
	end
end
local function v_u_283(p279) -- name: inputBox
	-- upvalues: (copy) v_u_8, (copy) v_u_13, (copy) v_u_12
	local v280 = v_u_8.new("TextBox", {
		["Text"] = "",
		["ClearTextOnFocus"] = false,
		["Font"] = nil,
		["TextSize"] = 16,
		["TextColor3"] = nil,
		["PlaceholderColor3"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 0.2,
		["TextXAlignment"] = nil,
		["TextTruncate"] = nil,
		["Font"] = v_u_13.Bold,
		["TextColor3"] = v_u_12.White,
		["PlaceholderColor3"] = v_u_12.TextFaint,
		["BackgroundColor3"] = v_u_12.BgLight,
		["TextXAlignment"] = Enum.TextXAlignment.Left,
		["TextTruncate"] = Enum.TextTruncate.AtEnd
	})
	for v281, v282 in p279 do
		if v281 == "Parent" then
			continue
		end
		v280[v281] = v282
	end
	v_u_8.corner(v280, 3)
	v_u_8.padding(v280, 10, 10, 0, 0)
	v280.Parent = p279.Parent
	return v280
end
local function v_u_309() -- name: buildDynamic
	-- upvalues: (ref) v_u_67, (ref) v_u_17, (ref) v_u_52, (copy) v_u_8, (ref) v_u_26, (ref) v_u_27, (ref) v_u_54, (ref) v_u_30, (ref) v_u_32, (ref) v_u_31, (ref) v_u_66, (ref) v_u_64, (ref) v_u_65, (ref) v_u_197, (copy) v_u_53, (copy) v_u_283, (copy) v_u_12, (ref) v_u_76, (ref) v_u_55, (copy) v_u_57, (ref) v_u_56, (ref) v_u_28
	if not v_u_67 and (v_u_17 and v_u_52) then
		v_u_67 = true
		local v284 = v_u_17.maxDays
		local v_u_285 = tonumber(v284) or 365
		for v286, v_u_287 in v_u_17.quick or {} do
			if type(v_u_287) ~= "number" or (v_u_287 < 1 or v_u_287 > v_u_285) then
				continue
			end
			local v288 = v_u_53
			local v289 = {
				["b"] = v_u_8.button(v_u_287 .. "D", {
					["Name"] = nil,
					["Size"] = nil,
					["TextSize"] = 15,
					["LayoutOrder"] = nil,
					["Parent"] = nil,
					["Name"] = "D" .. v_u_287,
					["Size"] = UDim2.fromOffset(66, 42),
					["LayoutOrder"] = v286,
					["Parent"] = v_u_52
				}, function()
					-- upvalues: (ref) v_u_26, (copy) v_u_287, (ref) v_u_27, (ref) v_u_54, (ref) v_u_30, (ref) v_u_32, (ref) v_u_31, (ref) v_u_66, (ref) v_u_64, (ref) v_u_65, (ref) v_u_197
					v_u_26 = v_u_287
					v_u_27 = false
					if v_u_54 then
						v_u_54.Text = ""
					end
					v_u_30 = false
					v_u_32 = nil
					v_u_31 = v_u_31 + 1
					if v_u_66 then
						v_u_64 = ""
						v_u_65 = nil
						v_u_66 = false
					end
					v_u_64 = ""
					v_u_65 = nil
					v_u_66 = false
					v_u_197()
				end, "default"),
				["d"] = v_u_287
			}
			table.insert(v288, v289)
		end
		local v_u_290 = v_u_283({
			["Name"] = "Days",
			["PlaceholderText"] = "days",
			["TextSize"] = 15,
			["TextXAlignment"] = nil,
			["Size"] = nil,
			["LayoutOrder"] = 50,
			["Parent"] = nil,
			["TextXAlignment"] = Enum.TextXAlignment.Center,
			["Size"] = UDim2.fromOffset(86, 42),
			["Parent"] = v_u_52
		})
		v_u_54 = v_u_290
		v_u_290:GetPropertyChangedSignal("Text"):Connect(function()
			-- upvalues: (copy) v_u_290, (copy) v_u_285, (ref) v_u_26, (ref) v_u_27, (ref) v_u_30, (ref) v_u_32, (ref) v_u_31, (ref) v_u_66, (ref) v_u_64, (ref) v_u_65, (ref) v_u_197, (ref) v_u_12, (ref) v_u_76
			local v291 = string.gsub(v_u_290.Text, "%D", "")
			local v292 = string.sub(v291, 1, 4)
			if v292 == v_u_290.Text then
				local v293 = tonumber(v292)
				local v294 = false
				if v293 and (v293 >= 1 and v293 <= v_u_285) then
					v_u_26 = v293
					v_u_27 = true
				elseif v292 == "" then
					if v_u_27 then
						v_u_26 = nil
						v_u_27 = false
					end
				else
					v_u_26 = nil
					v_u_27 = true
					v294 = true
				end
				v_u_30 = false
				v_u_32 = nil
				v_u_31 = v_u_31 + 1
				if v_u_66 then
					v_u_64 = ""
					v_u_65 = nil
					v_u_66 = false
				end
				v_u_64 = ""
				v_u_65 = nil
				v_u_66 = false
				v_u_197()
				if v294 then
					local v295 = string.format("Days: 1 to %d (or PERMANENT).", v_u_285)
					local v296 = v_u_12.Accent
					v_u_64 = v295
					v_u_65 = v296
					v_u_66 = false
					if v_u_76 then
						v_u_76()
					end
				end
			else
				v_u_290.Text = v292
			end
		end)
		if v_u_17.perm then
			v_u_55 = v_u_8.button("Permanent", {
				["Name"] = "Perm",
				["Size"] = nil,
				["TextSize"] = 14,
				["LayoutOrder"] = 60,
				["Parent"] = nil,
				["Size"] = UDim2.fromOffset(130, 42),
				["Parent"] = v_u_52
			}, function()
				-- upvalues: (ref) v_u_26, (ref) v_u_27, (copy) v_u_290, (ref) v_u_30, (ref) v_u_32, (ref) v_u_31, (ref) v_u_66, (ref) v_u_64, (ref) v_u_65, (ref) v_u_197
				v_u_26 = -1
				v_u_27 = false
				v_u_290.Text = ""
				v_u_30 = false
				v_u_32 = nil
				v_u_31 = v_u_31 + 1
				if v_u_66 then
					v_u_64 = ""
					v_u_65 = nil
					v_u_66 = false
				end
				v_u_64 = ""
				v_u_65 = nil
				v_u_66 = false
				v_u_197()
			end, "default")
		end
		for v297, v_u_298 in v_u_17.reasons or {} do
			if type(v_u_298) ~= "table" then
				continue
			end
			local v299 = v_u_298.id
			if type(v299) ~= "string" then
				continue
			end
			local v300 = v_u_298.label or v_u_298.id
			local v301 = tostring(v300)
			local v302 = v_u_57
			local v303 = v_u_298.id
			local v304 = v_u_8.button
			local v305 = {
				["Name"] = nil,
				["Size"] = nil,
				["TextSize"] = 13,
				["LayoutOrder"] = nil,
				["Parent"] = nil,
				["Name"] = v_u_298.id
			}
			local v306 = UDim2.fromOffset
			local v307 = (utf8.len(v301) or #v301) * 8.2 + 24
			local v308 = math.floor(v307)
			v305.Size = v306(math.max(90, v308), 42)
			v305.LayoutOrder = v297
			v305.Parent = v_u_56
			v302[v303] = v304(v301, v305, function()
				-- upvalues: (ref) v_u_28, (copy) v_u_298, (ref) v_u_30, (ref) v_u_32, (ref) v_u_31, (ref) v_u_66, (ref) v_u_64, (ref) v_u_65, (ref) v_u_197
				v_u_28 = v_u_298.id
				v_u_30 = false
				v_u_32 = nil
				v_u_31 = v_u_31 + 1
				if v_u_66 then
					v_u_64 = ""
					v_u_65 = nil
					v_u_66 = false
				end
				v_u_64 = ""
				v_u_65 = nil
				v_u_66 = false
				v_u_197()
			end, "default")
		end
	end
end
local function v_u_352() -- name: build
	-- upvalues: (ref) v_u_39, (copy) v_u_9, (copy) v_u_8, (copy) v_u_12, (ref) v_u_40, (copy) v_u_278, (copy) v_u_11, (copy) v_u_13, (ref) v_u_41, (ref) v_u_43, (ref) v_u_42, (copy) v_u_14, (copy) v_u_44, (ref) v_u_23, (ref) v_u_197, (ref) v_u_45, (ref) v_u_46, (ref) v_u_63, (ref) v_u_48, (copy) v_u_283, (ref) v_u_49, (ref) v_u_50, (ref) v_u_51, (ref) v_u_52, (ref) v_u_56, (ref) v_u_58, (ref) v_u_59, (ref) v_u_17, (ref) v_u_29, (ref) v_u_30, (ref) v_u_32, (ref) v_u_31, (ref) v_u_66, (ref) v_u_64, (ref) v_u_65, (ref) v_u_60, (copy) v_u_268, (ref) v_u_61, (ref) v_u_76, (ref) v_u_62, (copy) v_u_309
	if not v_u_39 then
		v_u_39 = v_u_9.screen("UI_Staff", {
			["order"] = 94,
			["fullscreen"] = true,
			["enabled"] = false
		})
		local v310 = v_u_39.root
		v_u_8.new("TextButton", {
			["Name"] = "Backdrop",
			["Text"] = "",
			["Modal"] = true,
			["AutoButtonColor"] = false,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 0.45,
			["Size"] = nil,
			["Parent"] = nil,
			["BackgroundColor3"] = v_u_12.Black,
			["Size"] = UDim2.fromScale(1, 1),
			["Parent"] = v310
		})
		local v311 = v_u_8.panel({
			["Name"] = "Panel",
			["AnchorPoint"] = nil,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 0.04,
			["Size"] = nil,
			["Parent"] = nil,
			["AnchorPoint"] = Vector2.new(0.5, 0),
			["BackgroundColor3"] = v_u_12.Panel,
			["Size"] = UDim2.fromOffset(1180, 700),
			["Parent"] = v310
		}, true)
		v_u_40 = v311
		v_u_8.corner(v311, 4)
		v_u_8.padding(v311, 16, 16, 12, 10)
		v_u_278()
		v_u_9.onScaleChanged(v_u_278)
		v_u_8.new("ImageLabel", {
			["Name"] = "Icon",
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["ImageColor3"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Image"] = v_u_11.Image.icon_shield_defend,
			["ImageColor3"] = v_u_12.Accent,
			["Position"] = UDim2.fromOffset(0, 1),
			["Size"] = UDim2.fromOffset(28, 28),
			["Parent"] = v311
		})
		v_u_8.label({
			["Name"] = "Title",
			["Text"] = "STAFF PANEL",
			["Font"] = nil,
			["TextSize"] = 22,
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Font"] = v_u_13.Bold,
			["Position"] = UDim2.fromOffset(36, 0),
			["Size"] = UDim2.fromOffset(170, 30),
			["Parent"] = v311
		})
		v_u_41 = v_u_8.label({
			["Name"] = "Role",
			["Text"] = "",
			["Font"] = nil,
			["TextSize"] = 12,
			["TextColor3"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Font"] = v_u_13.Bold,
			["TextColor3"] = v_u_12.Accent,
			["Position"] = UDim2.fromOffset(208, 3),
			["Size"] = UDim2.fromOffset(110, 26),
			["Parent"] = v311
		})
		v_u_43 = v_u_8.label({
			["Name"] = "Stats",
			["Text"] = "",
			["TextSize"] = 13,
			["TextColor3"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextTruncate"] = nil,
			["Parent"] = nil,
			["TextColor3"] = v_u_12.TextDim,
			["Position"] = UDim2.fromOffset(36, 30),
			["Size"] = UDim2.new(0.5, -40, 0, 18),
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Parent"] = v311
		})
		v_u_42 = v_u_8.label({
			["Name"] = "Status",
			["Text"] = "",
			["Font"] = nil,
			["TextSize"] = 16,
			["TextXAlignment"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextTruncate"] = nil,
			["Parent"] = nil,
			["Font"] = v_u_13.Bold,
			["TextXAlignment"] = Enum.TextXAlignment.Right,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(1, -84, 0, 0),
			["Size"] = UDim2.new(0.5, -110, 0, 30),
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Parent"] = v311
		})
		v_u_8.new("ImageButton", {
			["Name"] = "Refresh",
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["ImageColor3"] = nil,
			["AutoButtonColor"] = false,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Image"] = v_u_11.Image.icon_refresh,
			["ImageColor3"] = v_u_12.TextDim,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(1, -44, 0, 2),
			["Size"] = UDim2.fromOffset(28, 28),
			["Parent"] = v311
		}).Activated:Connect(function()
			-- upvalues: (ref) v_u_14
			task.spawn(v_u_14.refresh)
		end)
		v_u_8.new("ImageButton", {
			["Name"] = "Close",
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["AutoButtonColor"] = false,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Image"] = v_u_11.Image.icon_close,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(1, 0, 0, 1),
			["Size"] = UDim2.fromOffset(30, 30),
			["Parent"] = v311
		}).Activated:Connect(function()
			-- upvalues: (ref) v_u_14
			v_u_14.close()
		end)
		local v312 = v_u_8.panel({
			["Name"] = "Players",
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 0.35,
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["BackgroundColor3"] = v_u_12.Bg,
			["Position"] = UDim2.fromOffset(0, 56),
			["Size"] = UDim2.new(0.38, -6, 1, -78),
			["Parent"] = v311
		})
		v_u_8.padding(v312, 8, 8, 8, 8)
		local v313 = v_u_8.frame({
			["Name"] = "Tabs",
			["Size"] = nil,
			["Parent"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 40),
			["Parent"] = v312
		})
		v_u_8.list(v313, false, 6)
		for v314, v_u_315 in { "HERE", "RECENT" } do
			v_u_44[v_u_315] = v_u_8.button(v_u_315 == "HERE" and "This server" or "Recent", {
				["Name"] = nil,
				["Size"] = nil,
				["TextSize"] = 14,
				["LayoutOrder"] = nil,
				["Parent"] = nil,
				["Name"] = v_u_315,
				["Size"] = UDim2.new(0.5, -3, 1, 0),
				["LayoutOrder"] = v314,
				["Parent"] = v313
			}, function()
				-- upvalues: (ref) v_u_23, (copy) v_u_315, (ref) v_u_197
				v_u_23 = v_u_315
				v_u_197()
			end, "default")
		end
		v_u_45 = v_u_8.scroll({
			["Name"] = "List",
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Position"] = UDim2.fromOffset(0, 48),
			["Size"] = UDim2.new(1, 0, 1, -48),
			["Parent"] = v312
		}, 4)
		v_u_46 = v_u_8.label({
			["Name"] = "Empty",
			["Text"] = "",
			["TextSize"] = 14,
			["TextColor3"] = nil,
			["TextWrapped"] = true,
			["TextYAlignment"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Visible"] = false,
			["Parent"] = nil,
			["TextColor3"] = v_u_12.TextDim,
			["TextYAlignment"] = Enum.TextYAlignment.Top,
			["Position"] = UDim2.fromOffset(6, 56),
			["Size"] = UDim2.new(1, -12, 0, 60),
			["Parent"] = v312
		})
		local v316 = v_u_8.panel({
			["Name"] = "Ban",
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 0.35,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["BackgroundColor3"] = v_u_12.Bg,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(1, 0, 0, 56),
			["Size"] = UDim2.new(0.62, -6, 1, -78),
			["Parent"] = v311
		})
		local v_u_317 = v_u_8.scroll({
			["Name"] = "Form",
			["Size"] = nil,
			["Parent"] = nil,
			["Size"] = UDim2.fromScale(1, 1),
			["Parent"] = v316
		}, 5)
		v_u_63 = v_u_317
		v_u_8.padding(v_u_317, 12, 14, 10, 12)
		local v_u_318 = 0
		local function v322(p319) -- name: cap
			-- upvalues: (ref) v_u_8, (ref) v_u_318, (copy) v_u_317
			local v320 = v_u_8.caption
			local v321 = {
				["TextSize"] = 12,
				["Size"] = nil,
				["LayoutOrder"] = nil,
				["Parent"] = nil,
				["Size"] = UDim2.new(1, 0, 0, 14)
			}
			v_u_318 = v_u_318 + 1
			v321.LayoutOrder = v_u_318
			v321.Parent = v_u_317
			return v320(p319, v321)
		end
		v322("Player")
		local v323 = v_u_8.frame
		local v324 = {
			["Name"] = "Find",
			["Size"] = nil,
			["LayoutOrder"] = nil,
			["Parent"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 42)
		}
		v_u_318 = v_u_318 + 1
		v324.LayoutOrder = v_u_318
		v324.Parent = v_u_317
		local v325 = v323(v324)
		v_u_48 = v_u_283({
			["Name"] = "Query",
			["PlaceholderText"] = "UserId or username",
			["Size"] = nil,
			["Parent"] = nil,
			["Size"] = UDim2.new(1, -124, 1, 0),
			["Parent"] = v325
		})
		v_u_48:GetPropertyChangedSignal("Text"):Connect(function()
			-- upvalues: (ref) v_u_48
			local v326 = string.gsub(v_u_48.Text, "[^%w_@]", "")
			local v327 = string.sub(v326, 1, 24)
			if v327 ~= v_u_48.Text then
				v_u_48.Text = v327
			end
		end)
		v_u_48.FocusLost:Connect(function(p328)
			-- upvalues: (ref) v_u_14
			if p328 then
				v_u_14.find()
			end
		end)
		v_u_8.button("Find", {
			["Name"] = "FindBtn",
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextSize"] = 15,
			["Parent"] = nil,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.fromScale(1, 0),
			["Size"] = UDim2.new(0, 116, 1, 0),
			["Parent"] = v325
		}, function()
			-- upvalues: (ref) v_u_14
			v_u_14.find()
		end, "default")
		local v329 = v_u_8.panel
		local v330 = {
			["Name"] = "Target",
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 0.45,
			["Size"] = nil,
			["LayoutOrder"] = nil,
			["Parent"] = nil,
			["BackgroundColor3"] = v_u_12.BgLight,
			["Size"] = UDim2.new(1, 0, 0, 68)
		}
		v_u_318 = v_u_318 + 1
		v330.LayoutOrder = v_u_318
		v330.Parent = v_u_317
		local v331 = v329(v330)
		v_u_8.padding(v331, 12, 12, 8, 8)
		v_u_49 = v_u_8.label({
			["Name"] = "Name",
			["Text"] = "",
			["Font"] = nil,
			["TextSize"] = 17,
			["Size"] = nil,
			["TextTruncate"] = nil,
			["Parent"] = nil,
			["Font"] = v_u_13.Bold,
			["Size"] = UDim2.new(1, 0, 0, 18),
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Parent"] = v331
		})
		v_u_50 = v_u_8.label({
			["Name"] = "Sub",
			["Text"] = "",
			["TextSize"] = 13,
			["TextColor3"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextTruncate"] = nil,
			["Parent"] = nil,
			["TextColor3"] = v_u_12.TextDim,
			["Position"] = UDim2.fromOffset(0, 19),
			["Size"] = UDim2.new(1, 0, 0, 16),
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Parent"] = v331
		})
		v_u_51 = v_u_8.label({
			["Name"] = "Status",
			["Text"] = "",
			["Font"] = nil,
			["TextSize"] = 14,
			["Position"] = nil,
			["Size"] = nil,
			["TextTruncate"] = nil,
			["Parent"] = nil,
			["Font"] = v_u_13.Bold,
			["Position"] = UDim2.fromOffset(0, 36),
			["Size"] = UDim2.new(1, 0, 0, 16),
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Parent"] = v331
		})
		v322("Duration")
		local v332 = v_u_8.frame
		local v333 = {
			["Name"] = "Duration",
			["Size"] = nil,
			["AutomaticSize"] = nil,
			["LayoutOrder"] = nil,
			["Parent"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 42),
			["AutomaticSize"] = Enum.AutomaticSize.Y
		}
		v_u_318 = v_u_318 + 1
		v333.LayoutOrder = v_u_318
		v333.Parent = v_u_317
		v_u_52 = v332(v333)
		v_u_8.list(v_u_52, false, 6).Wraps = true
		v322("Reason")
		local v334 = v_u_8.frame
		local v335 = {
			["Name"] = "Reason",
			["Size"] = nil,
			["AutomaticSize"] = nil,
			["LayoutOrder"] = nil,
			["Parent"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 42),
			["AutomaticSize"] = Enum.AutomaticSize.Y
		}
		v_u_318 = v_u_318 + 1
		v335.LayoutOrder = v_u_318
		v335.Parent = v_u_317
		v_u_56 = v334(v335)
		v_u_8.list(v_u_56, false, 6).Wraps = true
		v_u_58 = v322("Note")
		local v336 = v_u_283
		local v337 = {
			["Name"] = "Note",
			["PlaceholderText"] = "What did you see? Ticket / clip... (needed for Other)",
			["Font"] = nil,
			["TextSize"] = 15,
			["Size"] = nil,
			["LayoutOrder"] = nil,
			["Parent"] = nil,
			["Font"] = v_u_13.Medium,
			["Size"] = UDim2.new(1, 0, 0, 42)
		}
		v_u_318 = v_u_318 + 1
		v337.LayoutOrder = v_u_318
		v337.Parent = v_u_317
		v_u_59 = v336(v337)
		v_u_59:GetPropertyChangedSignal("Text"):Connect(function()
			-- upvalues: (ref) v_u_59, (ref) v_u_17, (ref) v_u_29, (ref) v_u_30, (ref) v_u_32, (ref) v_u_31, (ref) v_u_66, (ref) v_u_64, (ref) v_u_65, (ref) v_u_197
			local v338 = v_u_59.Text
			local v339 = string.gsub(v338, "[%c]", " ")
			local v340
			if v_u_17 then
				local v341 = v_u_17.noteMax
				v340 = tonumber(v341) or 120
			else
				v340 = 120
			end
			if (utf8.len(v339) or #v339) > v340 then
				local v342 = utf8.offset
				local v343 = v340 + 1
				local v344, v345 = pcall(v342, v339, v343)
				if v344 and v345 then
					local v346 = v345 - 1
					v339 = string.sub(v339, 1, v346)
				else
					v339 = string.sub(v339, 1, v340)
				end
			end
			if v339 == v338 then
				v_u_29 = v339
				v_u_30 = false
				v_u_32 = nil
				v_u_31 = v_u_31 + 1
				if v_u_66 then
					v_u_64 = ""
					v_u_65 = nil
					v_u_66 = false
				end
				v_u_64 = ""
				v_u_65 = nil
				v_u_66 = false
				v_u_197()
			else
				v_u_59.Text = v339
			end
		end)
		local v347 = v_u_8.frame
		local v348 = {
			["Name"] = "Actions",
			["Size"] = nil,
			["LayoutOrder"] = nil,
			["Parent"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 48)
		}
		v_u_318 = v_u_318 + 1
		v348.LayoutOrder = v_u_318
		v348.Parent = v_u_317
		local v349 = v347(v348)
		v_u_60 = v_u_8.button("Ban", {
			["Name"] = "BanBtn",
			["Size"] = nil,
			["TextSize"] = 17,
			["Parent"] = nil,
			["Size"] = UDim2.new(0.62, 0, 1, 0),
			["Parent"] = v349
		}, v_u_268, "primary")
		v_u_61 = v_u_8.button("Cancel", {
			["Name"] = "Cancel",
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextSize"] = 15,
			["Visible"] = false,
			["Parent"] = nil,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.fromScale(1, 0),
			["Size"] = UDim2.new(0.36, 0, 1, 0),
			["Parent"] = v349
		}, function()
			-- upvalues: (ref) v_u_30, (ref) v_u_32, (ref) v_u_31, (ref) v_u_66, (ref) v_u_64, (ref) v_u_65, (ref) v_u_76, (ref) v_u_197
			v_u_30 = false
			v_u_32 = nil
			v_u_31 = v_u_31 + 1
			if v_u_66 then
				v_u_64 = ""
				v_u_65 = nil
				v_u_66 = false
			end
			v_u_64 = "Cancelled."
			v_u_65 = nil
			v_u_66 = false
			if v_u_76 then
				v_u_76()
			end
			v_u_197()
		end, "default")
		local v350 = v_u_8.label
		local v351 = {
			["Name"] = "Msg",
			["Text"] = "",
			["TextSize"] = 14,
			["TextWrapped"] = true,
			["TextYAlignment"] = nil,
			["Size"] = nil,
			["LayoutOrder"] = nil,
			["Parent"] = nil,
			["TextYAlignment"] = Enum.TextYAlignment.Top,
			["Size"] = UDim2.new(1, 0, 0, 40)
		}
		v_u_318 = v_u_318 + 1
		v351.LayoutOrder = v_u_318
		v351.Parent = v_u_317
		v_u_62 = v350(v351)
		v_u_8.label({
			["Name"] = "Footer",
			["Text"] = "Every ban is logged and sent to the owner. Open: STAFF tab \194\183 /mod in chat \194\183 Ctrl+Shift+F8 (PC).",
			["TextSize"] = 12,
			["TextColor3"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextTruncate"] = nil,
			["Parent"] = nil,
			["TextColor3"] = v_u_12.TextFaint,
			["AnchorPoint"] = Vector2.new(0, 1),
			["Position"] = UDim2.fromScale(0, 1),
			["Size"] = UDim2.new(1, 0, 0, 16),
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Parent"] = v311
		})
		v_u_309()
		v_u_197()
	end
end
local function v_u_356() -- name: placeButton
	-- upvalues: (ref) v_u_38, (copy) v_u_9
	if v_u_38 then
		local v353 = v_u_9.sidePad() or 0
		local v354 = v_u_9.getScale()
		local v355 = v353 / math.max(v354, 0.01)
		v_u_38.Position = UDim2.new(1, -v355, 0.62, 0)
	end
end
local function v_u_361() -- name: buildButton
	-- upvalues: (ref) v_u_37, (copy) v_u_9, (copy) v_u_8, (copy) v_u_12, (copy) v_u_11, (copy) v_u_13, (copy) v_u_14, (ref) v_u_38, (copy) v_u_356
	if not v_u_37 then
		v_u_37 = v_u_9.screen("UI_StaffButton", {
			["order"] = 9,
			["fullscreen"] = true,
			["enabled"] = false
		})
		local v_u_357 = v_u_8.new("TextButton", {
			["Name"] = "Staff",
			["Text"] = "",
			["AutoButtonColor"] = false,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 0.2,
			["AnchorPoint"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["BackgroundColor3"] = v_u_12.Panel,
			["AnchorPoint"] = Vector2.new(1, 0.5),
			["Size"] = UDim2.fromOffset(38, 116),
			["Parent"] = v_u_37.root
		})
		v_u_8.corner(v_u_357, 4)
		v_u_8.stroke(v_u_357, v_u_12.Accent, 0.55, 1)
		v_u_8.new("ImageLabel", {
			["Name"] = "Icon",
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["ImageColor3"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Image"] = v_u_11.Image.icon_shield_defend,
			["ImageColor3"] = v_u_12.Accent,
			["AnchorPoint"] = Vector2.new(0.5, 0),
			["Position"] = UDim2.new(0.5, 0, 0, 8),
			["Size"] = UDim2.fromOffset(24, 24),
			["Parent"] = v_u_357
		})
		v_u_8.label({
			["Name"] = "Label",
			["Text"] = "STAFF",
			["Font"] = nil,
			["TextSize"] = 15,
			["TextColor3"] = nil,
			["TextXAlignment"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Rotation"] = -90,
			["Parent"] = nil,
			["Font"] = v_u_13.Bold,
			["TextColor3"] = v_u_12.Accent,
			["TextXAlignment"] = Enum.TextXAlignment.Center,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Position"] = UDim2.new(0.5, 0, 0.5, 16),
			["Size"] = UDim2.fromOffset(72, 20),
			["Parent"] = v_u_357
		})
		v_u_357.MouseEnter:Connect(function()
			-- upvalues: (copy) v_u_357
			v_u_357.BackgroundTransparency = 0.05
		end)
		v_u_357.MouseLeave:Connect(function()
			-- upvalues: (copy) v_u_357
			v_u_357.BackgroundTransparency = 0.2
		end)
		v_u_357.Activated:Connect(function()
			-- upvalues: (ref) v_u_14
			v_u_14.toggle()
		end)
		v_u_38 = v_u_357
		if v_u_38 then
			local v358 = v_u_9.sidePad() or 0
			local v359 = v_u_9.getScale()
			local v360 = v358 / math.max(v359, 0.01)
			v_u_38.Position = UDim2.new(1, -v360, 0.62, 0)
		end
		v_u_9.onScaleChanged(v_u_356)
	end
end
function v_u_14.refresh() -- name: refresh
	-- upvalues: (copy) v_u_72, (ref) v_u_21, (copy) v_u_14, (copy) v_u_205, (copy) v_u_309, (copy) v_u_231, (ref) v_u_197
	local v362 = v_u_72({
		["op"] = "hello"
	})
	if v362 == nil then
		if v_u_21 then
			v_u_14.close()
		end
	else
		if v_u_205(v362) then
			v_u_309()
		end
		task.wait(0.05)
		v_u_231()
		v_u_197()
	end
end
function v_u_14.open() -- name: open
	-- upvalues: (ref) v_u_21, (ref) v_u_15, (copy) v_u_205, (copy) v_u_72, (copy) v_u_352, (ref) v_u_22, (ref) v_u_39, (copy) v_u_10, (copy) v_u_278, (ref) v_u_197, (copy) v_u_14, (copy) v_u_95, (ref) v_u_33, (copy) v_u_182, (copy) v_u_231, (copy) v_u_153
	if v_u_21 then
		return
	elseif v_u_15 or v_u_205((v_u_72({
		["op"] = "hello"
	}))) then
		v_u_352()
		v_u_21 = true
		v_u_22 = v_u_22 + 1
		local v_u_363 = v_u_22
		v_u_39.gui.Enabled = true
		v_u_10.cursor("UI_Staff", true)
		v_u_278()
		v_u_197()
		task.spawn(v_u_14.refresh)
		task.spawn(function()
			-- upvalues: (ref) v_u_21, (ref) v_u_22, (copy) v_u_363, (ref) v_u_95, (ref) v_u_33, (ref) v_u_182, (ref) v_u_231, (ref) v_u_153, (ref) v_u_72, (ref) v_u_14, (ref) v_u_205, (ref) v_u_197
			local v364 = 0
			while v_u_21 and v_u_22 == v_u_363 do
				task.wait(1)
				if not v_u_21 or v_u_22 ~= v_u_363 then
					break
				end
				v364 = v364 + 1
				v_u_95()
				if not v_u_33 then
					v_u_182()
				end
				if v364 % 10 == 0 and (not v_u_33 and (v_u_231() and (v_u_21 and v_u_22 == v_u_363))) then
					v_u_153()
				end
				if v364 % 30 ~= 0 or v_u_33 then
					continue
				end
				local v365 = v_u_72({
					["op"] = "hello"
				})
				if v365 == nil then
					v_u_14.close()
					return
				end
				if not v_u_205(v365) or (not v_u_21 or v_u_22 ~= v_u_363) then
					continue
				end
				v_u_197()
			end
		end)
	end
end
function v_u_14.close() -- name: close
	-- upvalues: (ref) v_u_21, (ref) v_u_22, (ref) v_u_30, (ref) v_u_32, (ref) v_u_31, (ref) v_u_66, (ref) v_u_64, (ref) v_u_65, (ref) v_u_39, (copy) v_u_10
	if v_u_21 then
		v_u_21 = false
		v_u_22 = v_u_22 + 1
		v_u_30 = false
		v_u_32 = nil
		v_u_31 = v_u_31 + 1
		if v_u_66 then
			v_u_64 = ""
			v_u_65 = nil
			v_u_66 = false
		end
		if v_u_39 then
			v_u_39.gui.Enabled = false
		end
		v_u_10.cursor("UI_Staff", false)
	end
end
function v_u_14.toggle() -- name: toggle
	-- upvalues: (ref) v_u_21, (copy) v_u_14
	if v_u_21 then
		v_u_14.close()
	else
		task.spawn(v_u_14.open)
	end
end
function v_u_14.isOpen() -- name: isOpen
	-- upvalues: (ref) v_u_21
	return v_u_21
end
function v_u_14.previewSize(p366) -- name: previewSize
	-- upvalues: (copy) v_u_3, (ref) v_u_36, (copy) v_u_278
	if v_u_3:IsStudio() then
		v_u_36 = p366
		v_u_278()
	end
end
local function v_u_382() -- name: setupDebug
	-- upvalues: (copy) v_u_3, (copy) v_u_1, (copy) v_u_87, (ref) v_u_15, (ref) v_u_16, (ref) v_u_37, (ref) v_u_21, (ref) v_u_25, (ref) v_u_26, (ref) v_u_28, (ref) v_u_29, (ref) v_u_30, (ref) v_u_33, (ref) v_u_18, (ref) v_u_19, (ref) v_u_23, (copy) v_u_24, (ref) v_u_42, (ref) v_u_64, (ref) v_u_62, (ref) v_u_60, (ref) v_u_49, (ref) v_u_50, (ref) v_u_51, (copy) v_u_14, (ref) v_u_27, (ref) v_u_32, (ref) v_u_31, (ref) v_u_66, (ref) v_u_65, (ref) v_u_197, (ref) v_u_54, (ref) v_u_59, (copy) v_u_268
	if v_u_3:IsStudio() then
		local v367 = v_u_1.LocalPlayer
		if v367 then
			local v368 = Instance.new("BindableFunction")
			v368.Name = "StaffUIDebug"
			function v368.OnInvoke(p369, p370, p371)
				-- upvalues: (ref) v_u_87, (ref) v_u_15, (ref) v_u_16, (ref) v_u_37, (ref) v_u_21, (ref) v_u_25, (ref) v_u_26, (ref) v_u_28, (ref) v_u_29, (ref) v_u_30, (ref) v_u_33, (ref) v_u_18, (ref) v_u_19, (ref) v_u_23, (ref) v_u_24, (ref) v_u_42, (ref) v_u_64, (ref) v_u_62, (ref) v_u_60, (ref) v_u_49, (ref) v_u_50, (ref) v_u_51, (ref) v_u_14, (ref) v_u_27, (ref) v_u_32, (ref) v_u_31, (ref) v_u_66, (ref) v_u_65, (ref) v_u_197, (ref) v_u_54, (ref) v_u_59, (ref) v_u_268
				if p369 ~= "state" then
					if p369 == "open" then
						v_u_14.open()
					elseif p369 == "close" then
						v_u_14.close()
					elseif p369 == "lookup" then
						v_u_14.lookup(p370)
					elseif p369 == "days" then
						v_u_26 = p370
						v_u_27 = false
						v_u_30 = false
						v_u_32 = nil
						v_u_31 = v_u_31 + 1
						if v_u_66 then
							v_u_64 = ""
							v_u_65 = nil
							v_u_66 = false
						end
						v_u_197()
					elseif p369 == "box" then
						if v_u_54 then
							v_u_54.Text = tostring(p370)
						end
					elseif p369 == "reason" then
						v_u_28 = p370
						v_u_30 = false
						v_u_32 = nil
						v_u_31 = v_u_31 + 1
						if v_u_66 then
							v_u_64 = ""
							v_u_65 = nil
							v_u_66 = false
						end
						v_u_197()
					elseif p369 == "note" then
						v_u_59.Text = tostring(p370)
					elseif p369 == "press" then
						v_u_268()
					elseif p369 == "tab" then
						v_u_23 = p370
						v_u_197()
					elseif p369 == "preview" then
						local v372 = v_u_14.previewSize
						local v373
						if p370 then
							v373 = Vector2.new(p370, p371)
						else
							v373 = nil
						end
						v372(v373)
					end
					return true
				end
				local v374, v375 = v_u_87()
				local v376 = {
					["role"] = v_u_15,
					["showButton"] = v_u_16
				}
				local v377
				if v_u_37 == nil then
					v377 = false
				else
					v377 = v_u_37.gui.Enabled
				end
				v376.buttonOn = v377
				v376.isOpen = v_u_21
				v376.target = v_u_25
				v376.days = v_u_26
				v376.reason = v_u_28
				v376.note = v_u_29
				v376.confirming = v_u_30
				v376.busy = v_u_33
				v376.me = v_u_18
				v376.paused = v_u_19
				v376.tab = v_u_23
				v376.here = #(v_u_24.here or {})
				v376.recent = #(v_u_24.recent or {})
				v376.canBan = v374
				v376.why = v375
				local v378 = v_u_42
				if v378 then
					v378 = v_u_42.Text
				end
				v376.status = v378
				v376.msg = v_u_64
				local v379 = v_u_62
				if v379 then
					v379 = v_u_62.Text
				end
				v376.hint = v379
				local v380 = v_u_60
				if v380 then
					v380 = v_u_60.Text
				end
				v376.ban = v380
				local v381 = v_u_49
				if v381 then
					v381 = v_u_49.Text .. " | " .. v_u_50.Text .. " | " .. v_u_51.Text
				end
				v376.card = v381
				return v376
			end
			v368.Parent = v367
		end
	else
		return
	end
end
function v_u_14.init() -- name: init end
function v_u_14.start() -- name: start
	-- upvalues: (copy) v_u_10, (ref) v_u_15, (ref) v_u_16, (copy) v_u_14, (copy) v_u_361, (ref) v_u_37, (copy) v_u_5, (copy) v_u_4, (copy) v_u_1, (copy) v_u_382
	if v_u_10.live then
		v_u_10.on("StaffNotify", function(p383)
			-- upvalues: (ref) v_u_15, (ref) v_u_16, (ref) v_u_14, (ref) v_u_361, (ref) v_u_37
			if type(p383) == "table" then
				if p383.kind == "role" then
					local v384 = p383.role
					local v385
					if type(v384) == "string" then
						v385 = p383.role
					else
						v385 = nil
					end
					v_u_15 = v385
					v_u_16 = p383.button == true
					if not v_u_15 then
						v_u_14.close()
					end
					if v_u_16 and v_u_15 ~= nil then
						v_u_361()
						v_u_37.gui.Enabled = true
						return
					end
					if v_u_37 then
						v_u_37.gui.Enabled = false
						return
					end
				elseif p383.kind == "open" then
					task.spawn(v_u_14.open)
				end
			end
		end)
		v_u_5.InputBegan:Connect(function(p386)
			-- upvalues: (ref) v_u_15, (ref) v_u_5, (ref) v_u_14
			if v_u_15 ~= nil and (p386.KeyCode == Enum.KeyCode.F8 and not v_u_5:GetFocusedTextBox()) then
				if (v_u_5:IsKeyDown(Enum.KeyCode.LeftControl) or v_u_5:IsKeyDown(Enum.KeyCode.RightControl)) and (v_u_5:IsKeyDown(Enum.KeyCode.LeftShift) or v_u_5:IsKeyDown(Enum.KeyCode.RightShift)) then
					v_u_14.toggle()
				end
			end
		end)
		task.spawn(function()
			-- upvalues: (ref) v_u_4, (ref) v_u_1, (ref) v_u_14
			local v387 = v_u_4:FindFirstChild("DZStaffCommand", true)
			local v388 = os.clock()
			while not v387 and os.clock() - v388 < 60 do
				task.wait(2)
				v387 = v_u_4:FindFirstChild("DZStaffCommand", true)
			end
			if v387 and v387:IsA("TextChatCommand") then
				v387.Triggered:Connect(function(p389)
					-- upvalues: (ref) v_u_1, (ref) v_u_14
					local v390 = v_u_1.LocalPlayer
					if v390 and (p389 and p389.UserId == v390.UserId) then
						task.spawn(v_u_14.open)
					end
				end)
			end
		end)
		v_u_382()
	end
end
return v_u_14