-- Decompiled by Executor
-- Path: ReplicatedStorage.Client.Controllers.UI_Admin.Staff

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("HttpService")
local v3 = v1:WaitForChild("Client"):WaitForChild("UIKit")
local v4 = require(v3.Theme)
local v_u_5 = require(v3.UI)
local v_u_6 = require(v3.Root)
local v_u_7 = require(v3.Deps)
local v_u_8 = require(v3.Art)
local v_u_9 = v4.Color
local v_u_10 = v4.Font
local v_u_11 = {}
local v_u_12 = {
	"JANUARY",
	"FEBRUARY",
	"MARCH",
	"APRIL",
	"MAY",
	"JUNE",
	"JULY",
	"AUGUST",
	"SEPTEMBER",
	"OCTOBER",
	"NOVEMBER",
	"DECEMBER"
}
local v_u_13 = nil
local v_u_14 = nil
local v_u_15 = false
local v_u_16 = 0
local v_u_17 = false
local v_u_18 = nil
local v_u_19 = nil
local v_u_20 = nil
local v_u_21 = nil
local v_u_22 = nil
local v_u_23 = nil
local v_u_24 = nil
local v_u_25 = 0
local v_u_26 = 0
local v_u_27 = nil
local v_u_28 = nil
local v_u_29 = nil
local v_u_30 = nil
local v_u_31 = nil
local v_u_32 = nil
local v_u_33 = nil
local v_u_34 = nil
local v_u_35 = nil
local v_u_36 = nil
local v_u_37 = nil
local v_u_38 = nil
local v_u_39 = nil
local v_u_40 = nil
local v_u_41 = nil
local v_u_42 = nil
local v_u_43 = nil
local v_u_44 = nil
local v_u_45 = {}
local v_u_46 = {}
local v_u_47 = nil
local function v_u_52(p_u_48) -- name: query
	-- upvalues: (copy) v_u_7
	local v_u_49 = v_u_7.remote("StaffQuery")
	if v_u_49 and v_u_49:IsA("RemoteFunction") then
		local v50, v51 = pcall(function()
			-- upvalues: (copy) v_u_49, (copy) p_u_48
			return v_u_49:InvokeServer(p_u_48)
		end)
		if v50 then
			return v51
		else
			return nil
		end
	else
		return nil
	end
end
local function v_u_58(p53, p54) -- name: arm
	-- upvalues: (ref) v_u_23, (copy) v_u_9, (ref) v_u_44, (ref) v_u_47, (ref) v_u_15
	local v_u_55 = {
		["key"] = p53,
		["at"] = os.clock()
	}
	v_u_23 = v_u_55
	local v56 = v_u_9.Accent
	if v_u_44 then
		v_u_44.Text = p54
		v_u_44.TextColor3 = v56 or v_u_9.TextDim
	end
	v_u_47()
	task.delay(5.1, function()
		-- upvalues: (ref) v_u_23, (copy) v_u_55, (ref) v_u_15, (ref) v_u_9, (ref) v_u_44, (ref) v_u_47
		if v_u_23 == v_u_55 then
			v_u_23 = nil
			if v_u_15 then
				local v57 = v_u_9.TextDim
				if v_u_44 then
					v_u_44.Text = "Not confirmed in time."
					v_u_44.TextColor3 = v57 or v_u_9.TextDim
				end
				v_u_47()
			end
		end
	end)
end
local function v_u_61() -- name: refreshList
	-- upvalues: (copy) v_u_52, (ref) v_u_18, (ref) v_u_26, (ref) v_u_27
	local v59 = v_u_52({
		["op"] = "staffList"
	})
	if type(v59) ~= "table" or v59.error then
		if v59 == nil and v_u_27 then
			v_u_27.Text = "Request failed (owner only)."
		end
		return false
	end
	v_u_18 = v59
	local v60 = v59.now
	v_u_26 = (tonumber(v60) or os.time()) - os.time()
	return true
end
local function v_u_68() -- name: refreshLog
	-- upvalues: (copy) v_u_52, (ref) v_u_20, (ref) v_u_21, (ref) v_u_19, (copy) v_u_9, (ref) v_u_44
	local v62 = v_u_52({
		["op"] = "banLog",
		["month"] = nil,
		["by"] = nil,
		["month"] = v_u_20,
		["by"] = v_u_21
	})
	if type(v62) ~= "table" or v62.error then
		if type(v62) == "table" and (v62.error and v62.error ~= "rate") then
			local v63 = v62.error
			local v64 = tostring(v63)
			local v65 = v_u_9.Red
			if v_u_44 then
				v_u_44.Text = v64
				v_u_44.TextColor3 = v65 or v_u_9.TextDim
			end
		end
		return false
	end
	v_u_19 = v62
	local v66 = v62.month
	local v67
	if type(v66) == "string" then
		v67 = v62.month
	else
		v67 = v_u_20
	end
	v_u_20 = v67
	return true
end
local function v_u_83(p69, p70) -- name: act
	-- upvalues: (ref) v_u_17, (ref) v_u_23, (copy) v_u_9, (ref) v_u_44, (ref) v_u_47, (copy) v_u_2, (copy) v_u_52, (ref) v_u_18, (ref) v_u_15, (copy) v_u_68
	if v_u_17 then
		return
	else
		v_u_17 = true
		v_u_23 = nil
		local v71 = v_u_9.TextDim
		if v_u_44 then
			v_u_44.Text = "Working..."
			v_u_44.TextColor3 = v71 or v_u_9.TextDim
		end
		v_u_47()
		p69.nonce = v_u_2:GenerateGUID(false)
		local v72 = v_u_52(p69)
		v_u_17 = false
		if type(v72) == "table" and v72.ok then
			local v73 = v72.msg or "Done."
			local v74 = tostring(v73)
			local v75 = v_u_9.Green
			if v_u_44 then
				v_u_44.Text = v74
				v_u_44.TextColor3 = v75 or v_u_9.TextDim
			end
			local v76 = v72.list
			if type(v76) == "table" then
				v_u_18 = v72.list
			end
			local v77 = v72.discord
			if type(v77) == "table" and v_u_18 then
				v_u_18.discord = v72.discord
			end
			if p70 then
				p70()
			end
			v_u_47()
			task.spawn(function()
				-- upvalues: (ref) v_u_15, (ref) v_u_68, (ref) v_u_47
				task.wait(1.1)
				if v_u_15 and v_u_68() then
					v_u_47()
				end
			end)
		else
			if type(v72) == "table" then
				local v78 = v72.discord
				if type(v78) == "table" and v_u_18 then
					v_u_18.discord = v72.discord
				end
			end
			if type(v72) == "table" and v72.error then
				local v79
				if v72.error == "rate" then
					v79 = "Too fast, try again."
				else
					local v80 = v72.error
					v79 = tostring(v80)
				end
				local v81 = v_u_9.Red
				if v_u_44 then
					v_u_44.Text = v79
					v_u_44.TextColor3 = v81 or v_u_9.TextDim
				end
			else
				local v82 = v_u_9.Red
				if v_u_44 then
					v_u_44.Text = "Request failed (owner only / server busy)."
					v_u_44.TextColor3 = v82 or v_u_9.TextDim
				end
			end
			v_u_47()
		end
	end
end
local function v_u_113() -- name: addPressed
	-- upvalues: (ref) v_u_29, (copy) v_u_9, (ref) v_u_44, (ref) v_u_24, (ref) v_u_23, (copy) v_u_83, (ref) v_u_31, (ref) v_u_25, (copy) v_u_52, (ref) v_u_15, (ref) v_u_47, (copy) v_u_58
	local v84 = v_u_29.Text
	local v85 = string.gsub(v84, "^%s+", "")
	local v86 = string.gsub(v85, "%s+$", "")
	if v86 == "" then
		local v87 = v_u_9.Accent
		if v_u_44 then
			v_u_44.Text = "Type the new moderator\'s UserId (or username)."
			v_u_44.TextColor3 = v87 or v_u_9.TextDim
		end
		return
	else
		if v_u_24 and v_u_24.q == v86 then
			local v88 = v_u_24.id
			local v89 = "add:" .. tostring(v88)
			local v90
			if v_u_23 == nil or v_u_23.key ~= v89 then
				v90 = false
			else
				v90 = os.clock() - v_u_23.at <= 5
			end
			if v90 then
				v_u_83({
					["op"] = "staffAdd",
					["target"] = nil,
					["target"] = v_u_24.id
				}, function()
					-- upvalues: (ref) v_u_29, (ref) v_u_24, (ref) v_u_31
					v_u_29.Text = ""
					v_u_24 = nil
					v_u_31.Text = ""
				end)
				return
			end
		end
		v_u_25 = v_u_25 + 1
		local v91 = v_u_25
		v_u_31.Text = "Checking..."
		v_u_31.TextColor3 = v_u_9.TextDim
		local v92 = v_u_52({
			["op"] = "lookup",
			["q"] = nil,
			["q"] = v86
		})
		if v91 == v_u_25 and v_u_15 then
			if type(v92) == "table" and not v92.error then
				v92.q = v86
				v_u_24 = v92
				local v93 = nil
				local v94
				if v92.self then
					v94 = "That\'s you: the owner already has every power."
				elseif v92.prot == "a staff member" then
					v94 = "Already on the staff."
				elseif v92.prot then
					local v95 = v92.prot
					v94 = "That account is " .. tostring(v95) .. "."
				else
					v94 = v92.banned and "Careful: this account is banned right now." or v93
				end
				local v96 = v92.display or v92.name
				local v97 = tostring(v96)
				local v98 = v_u_31
				local v99 = string.format
				local v100 = v92.name
				local v101 = tostring(v100)
				local v102 = v92.id
				v98.Text = v99("%s (@%s) \194\183 UserId %s%s", v97, v101, tostring(v102), not v94 and "" or " \194\183 " .. v94)
				local v103 = v_u_31
				local v104
				if v94 then
					v104 = v_u_9.Accent
				else
					v104 = v_u_9.Text
				end
				v103.TextColor3 = v104
				if v92.self or v92.prot then
					v_u_47()
				else
					local v105 = v_u_58
					local v106 = v92.id
					local v107 = "add:" .. tostring(v106)
					local v108 = string.format
					local v109 = v92.name
					v105(v107, v108("Make @%s a moderator (live on all servers)? Press CONFIRM ADD.", (tostring(v109))))
				end
			else
				v_u_24 = nil
				local v110 = v_u_31
				local v111
				if type(v92) == "table" then
					if v92.error == "rate" then
						v111 = "Too fast, try again."
					else
						local v112 = v92.error
						v111 = tostring(v112)
					end
				else
					v111 = "Request failed."
				end
				v110.Text = v111
				v_u_31.TextColor3 = v_u_9.Red
				v_u_47()
				return
			end
		else
			return
		end
	end
end
local function v_u_137(p114) -- name: modRow
	-- upvalues: (copy) v_u_45, (copy) v_u_5, (copy) v_u_9, (ref) v_u_32, (copy) v_u_10, (copy) v_u_83, (ref) v_u_21, (ref) v_u_22, (ref) v_u_20, (copy) v_u_68, (ref) v_u_47, (ref) v_u_23, (copy) v_u_58
	local v115 = v_u_45[p114]
	if v115 then
		return v115
	end
	local v116 = v_u_5.new("Frame", {
		["Name"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 0.6,
		["Size"] = nil,
		["LayoutOrder"] = nil,
		["Parent"] = nil,
		["Name"] = "Mod" .. p114,
		["BackgroundColor3"] = v_u_9.BgLight,
		["Size"] = UDim2.new(1, -6, 0, 90),
		["LayoutOrder"] = p114,
		["Parent"] = v_u_32
	})
	v_u_5.corner(v116, 3)
	local v_u_117 = {
		["frame"] = nil,
		["name"] = nil,
		["stats"] = nil,
		["sub"] = nil,
		["data"] = nil,
		["frame"] = v116,
		["name"] = v_u_5.label({
			["Name"] = "Name",
			["Text"] = "",
			["Font"] = nil,
			["TextSize"] = 15,
			["Position"] = nil,
			["Size"] = nil,
			["TextTruncate"] = nil,
			["Parent"] = nil,
			["Font"] = v_u_10.Bold,
			["Position"] = UDim2.fromOffset(10, 6),
			["Size"] = UDim2.new(1, -112, 0, 18),
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Parent"] = v116
		}),
		["stats"] = v_u_5.label({
			["Name"] = "Stats",
			["Text"] = "",
			["TextSize"] = 13,
			["TextColor3"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextTruncate"] = nil,
			["Parent"] = nil,
			["TextColor3"] = v_u_9.TextDim,
			["Position"] = UDim2.fromOffset(10, 27),
			["Size"] = UDim2.new(1, -112, 0, 16),
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Parent"] = v116
		}),
		["sub"] = v_u_5.label({
			["Name"] = "Sub",
			["Text"] = "",
			["TextSize"] = 12,
			["TextColor3"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextTruncate"] = nil,
			["Parent"] = nil,
			["TextColor3"] = v_u_9.TextFaint,
			["Position"] = UDim2.fromOffset(10, 45),
			["Size"] = UDim2.new(1, -20, 0, 14),
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Parent"] = v116
		})
	}
	v_u_117.toggle = v_u_5.button("On", {
		["Name"] = "Toggle",
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["TextSize"] = 13,
		["Parent"] = nil,
		["AnchorPoint"] = Vector2.new(1, 0),
		["Position"] = UDim2.new(1, -8, 0, 8),
		["Size"] = UDim2.fromOffset(92, 30),
		["Parent"] = v116
	}, function()
		-- upvalues: (ref) v_u_117, (ref) v_u_83
		local v118 = v_u_117.data
		if v118 then
			v_u_83({
				["op"] = "staffSet",
				["target"] = nil,
				["on"] = nil,
				["target"] = v118.id,
				["on"] = not v118.on
			})
		end
	end, "primary")
	local v119 = v_u_5.frame({
		["Name"] = "Buttons",
		["Position"] = nil,
		["Size"] = nil,
		["Parent"] = nil,
		["Position"] = UDim2.fromOffset(8, 62),
		["Size"] = UDim2.new(1, -16, 0, 24),
		["Parent"] = v116
	})
	v_u_5.list(v119, false, 6)
	v_u_117.logBtn = v_u_5.button("Log", {
		["Name"] = "Log",
		["Size"] = nil,
		["TextSize"] = 11,
		["LayoutOrder"] = 1,
		["Parent"] = nil,
		["Size"] = UDim2.fromOffset(62, 24),
		["Parent"] = v119
	}, function()
		-- upvalues: (ref) v_u_117, (ref) v_u_21, (ref) v_u_22, (ref) v_u_20, (ref) v_u_68, (ref) v_u_47
		local v120 = v_u_117.data
		if v120 then
			local v121 = v120.id
			local v122 = v120.name
			v_u_21 = v121
			v_u_22 = v122
			v_u_20 = nil
			task.spawn(function()
				-- upvalues: (ref) v_u_68, (ref) v_u_47
				v_u_68()
				v_u_47()
			end)
		end
	end, "ghost")
	v_u_117.undoBtn = v_u_5.button("Undo bans 7d", {
		["Name"] = "Undo",
		["Size"] = nil,
		["TextSize"] = 11,
		["LayoutOrder"] = 2,
		["Parent"] = nil,
		["Size"] = UDim2.fromOffset(122, 24),
		["Parent"] = v119
	}, function()
		-- upvalues: (ref) v_u_117, (ref) v_u_23, (ref) v_u_83, (ref) v_u_58
		local v123 = v_u_117.data
		if v123 then
			local v124 = v123.id
			local v125 = "undo:" .. tostring(v124)
			local v126
			if v_u_23 == nil or v_u_23.key ~= v125 then
				v126 = false
			else
				v126 = os.clock() - v_u_23.at <= 5
			end
			if v126 then
				v_u_83({
					["op"] = "undoMod",
					["mod"] = nil,
					["days"] = 7,
					["mod"] = v123.id
				})
			else
				local v127 = v_u_58
				local v128 = string.format
				local v129 = v123.name
				v127(v125, v128("Unban EVERY still-active ban made by @%s in the last 7 days? Press CONFIRM.", (tostring(v129))))
			end
		else
			return
		end
	end, "default")
	v_u_117.removeBtn = v_u_5.button("Remove", {
		["Name"] = "Remove",
		["Size"] = nil,
		["TextSize"] = 11,
		["LayoutOrder"] = 3,
		["Parent"] = nil,
		["Size"] = UDim2.fromOffset(92, 24),
		["Parent"] = v119
	}, function()
		-- upvalues: (ref) v_u_117, (ref) v_u_23, (ref) v_u_83, (ref) v_u_58
		local v130 = v_u_117.data
		if v130 then
			local v131 = v130.id
			local v132 = "remove:" .. tostring(v131)
			local v133
			if v_u_23 == nil or v_u_23.key ~= v132 then
				v133 = false
			else
				v133 = os.clock() - v_u_23.at <= 5
			end
			if v133 then
				v_u_83({
					["op"] = "staffRemove",
					["target"] = nil,
					["target"] = v130.id
				})
			else
				local v134 = v_u_58
				local v135 = string.format
				local v136 = v130.name
				v134(v132, v135("Remove @%s from the staff (live on all servers)? Press CONFIRM.", (tostring(v136))))
			end
		else
			return
		end
	end, "danger")
	v_u_45[p114] = v_u_117
	return v_u_117
end
local function v_u_153(p138) -- name: logRow
	-- upvalues: (copy) v_u_46, (copy) v_u_5, (copy) v_u_9, (ref) v_u_40, (copy) v_u_10, (ref) v_u_23, (copy) v_u_83, (copy) v_u_58
	local v139 = v_u_46[p138]
	if v139 then
		return v139
	end
	local v140 = v_u_5.new("Frame", {
		["Name"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 0.6,
		["Size"] = nil,
		["LayoutOrder"] = nil,
		["Parent"] = nil,
		["Name"] = "Entry" .. p138,
		["BackgroundColor3"] = v_u_9.BgLight,
		["Size"] = UDim2.new(1, -6, 0, 70),
		["LayoutOrder"] = p138,
		["Parent"] = v_u_40
	})
	v_u_5.corner(v140, 3)
	local v_u_141 = {
		["frame"] = nil,
		["l1"] = nil,
		["st"] = nil,
		["l2"] = nil,
		["l3"] = nil,
		["data"] = nil,
		["frame"] = v140,
		["l1"] = v_u_5.label({
			["Name"] = "Who",
			["Text"] = "",
			["Font"] = nil,
			["TextSize"] = 14,
			["Position"] = nil,
			["Size"] = nil,
			["TextTruncate"] = nil,
			["Parent"] = nil,
			["Font"] = v_u_10.Bold,
			["Position"] = UDim2.fromOffset(10, 6),
			["Size"] = UDim2.new(1, -130, 0, 18),
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Parent"] = v140
		}),
		["st"] = v_u_5.label({
			["Name"] = "State",
			["Text"] = "",
			["Font"] = nil,
			["TextSize"] = 12,
			["TextXAlignment"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Font"] = v_u_10.Bold,
			["TextXAlignment"] = Enum.TextXAlignment.Right,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(1, -10, 0, 7),
			["Size"] = UDim2.fromOffset(116, 16),
			["Parent"] = v140
		}),
		["l2"] = v_u_5.label({
			["Name"] = "What",
			["Text"] = "",
			["TextSize"] = 13,
			["TextColor3"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextTruncate"] = nil,
			["Parent"] = nil,
			["TextColor3"] = v_u_9.TextDim,
			["Position"] = UDim2.fromOffset(10, 26),
			["Size"] = UDim2.new(1, -20, 0, 16),
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Parent"] = v140
		}),
		["l3"] = v_u_5.label({
			["Name"] = "Where",
			["Text"] = "",
			["TextSize"] = 12,
			["TextColor3"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextTruncate"] = nil,
			["Parent"] = nil,
			["TextColor3"] = v_u_9.TextFaint,
			["Position"] = UDim2.fromOffset(10, 46),
			["Size"] = UDim2.new(1, -124, 0, 16),
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Parent"] = v140
		})
	}
	v_u_141.unban = v_u_5.button("Unban", {
		["Name"] = "Unban",
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["TextSize"] = 12,
		["Parent"] = nil,
		["AnchorPoint"] = Vector2.new(1, 1),
		["Position"] = UDim2.new(1, -8, 1, -6),
		["Size"] = UDim2.fromOffset(104, 26),
		["Parent"] = v140
	}, function()
		-- upvalues: (ref) v_u_141, (ref) v_u_23, (ref) v_u_83, (ref) v_u_58
		local v142 = v_u_141.data
		if v142 then
			local v143 = v142.id
			local v144 = "unban:" .. tostring(v143)
			local v145
			if v_u_23 == nil or v_u_23.key ~= v144 then
				v145 = false
			else
				v145 = os.clock() - v_u_23.at <= 5
			end
			if v145 then
				v_u_83({
					["op"] = "unban",
					["id"] = nil,
					["t"] = nil,
					["id"] = v142.id,
					["t"] = v142.t
				})
			else
				local v146 = v_u_58
				local v147 = string.format
				local v148 = v142.tn
				local v149 = tostring(v148)
				local v150 = v142.id
				local v151 = tostring(v150)
				local v152 = v142.bn
				v146(v144, v147("Unban @%s (ban %s by @%s)? Press CONFIRM.", v149, v151, (tostring(v152))))
			end
		else
			return
		end
	end, "default")
	v_u_46[p138] = v_u_141
	return v_u_141
end
local function v_u_159(p154) -- name: entryState
	-- upvalues: (ref) v_u_26, (copy) v_u_9
	local v155 = p154.st
	if v155 == "ok" then
		local v156 = p154.d
		local v157 = tonumber(v156) or 0
		if v157 >= 0 then
			local v158 = p154.t
			if (tonumber(v158) or 0) + v157 * 86400 <= os.time() + v_u_26 then
				return "EXPIRED", v_u_9.TextFaint, false
			end
		end
		return "ACTIVE", v_u_9.Red, true
	elseif v155 == "pending" then
		return "PENDING (?)", v_u_9.Accent, true
	elseif v155 == "failed" then
		return "FAILED", v_u_9.TextFaint, false
	elseif v155 == "unbanned" then
		return "UNBANNED", v_u_9.Green, false
	elseif v155 == "replaced" then
		return "REPLACED", v_u_9.TextFaint, false
	else
		return string.upper((tostring(v155 or "?"))), v_u_9.TextDim, false
	end
end
local function v_u_175(p160) -- name: discordText
	-- upvalues: (copy) v_u_9
	if type(p160) == "table" then
		if p160.configured then
			local v161 = string.format
			local v162 = p160.sent
			local v163 = tonumber(v162) or 0
			local v164 = p160.failed
			local v165 = v161("Discord: connected \194\183 this server: %d sent, %d failed", v163, tonumber(v164) or 0)
			local v166 = p160.queue
			if (tonumber(v166) or 0) > 0 then
				v165 = v165 .. " \194\183 " .. p160.queue .. " waiting"
			end
			local v167
			if p160.lastErr == nil then
				v167 = false
			else
				local v168 = p160.lastErrAt
				local v169 = tonumber(v168) or 0
				local v170 = p160.lastOkAt
				v167 = (tonumber(v170) or 0) < v169
			end
			if v167 then
				local v171 = p160.lastErr
				v165 = v165 .. " \194\183 last error: " .. tostring(v171)
			end
			if v167 then
				return v165, v_u_9.Red
			else
				return v165, v_u_9.Green
			end
		else
			local v172 = string.format
			local v173 = p160.secretName or "DZ_StaffWebhook"
			local v174 = v172("Discord: NOT SET UP (Creator Dashboard -> Secrets -> \"%s\")", (tostring(v173)))
			if p160.http == false then
				v174 = v174 .. " \194\183 Allow HTTP Requests is OFF"
			end
			if p160.studio then
				v174 = v174 .. " \194\183 Studio Play can\'t read secrets"
			end
			return v174, v_u_9.Accent
		end
	else
		return "Discord: -", v_u_9.TextDim
	end
end
local function v_u_223() -- name: renderMods
	-- upvalues: (ref) v_u_18, (copy) v_u_137, (copy) v_u_9, (ref) v_u_26, (copy) v_u_5, (ref) v_u_17, (ref) v_u_21, (ref) v_u_23, (copy) v_u_45, (ref) v_u_33
	local v176
	if v_u_18 then
		local v177 = v_u_18.mods
		v176 = type(v177) ~= "table" and {} or v_u_18.mods
	else
		v176 = {}
	end
	for v178, v179 in v176 do
		local v180 = v_u_137(v178)
		v180.data = v179
		v180.frame.Visible = true
		v180.frame.BackgroundTransparency = v179.on and 0.55 or 0.8
		local v181 = v180.name
		local v182 = v179.name
		v181.Text = "@" .. tostring(v182) .. (v179.on and "" or "  \194\183  SWITCHED OFF")
		local v183 = v180.name
		local v184
		if v179.on then
			v184 = v_u_9.Text
		else
			v184 = v_u_9.TextFaint
		end
		v183.TextColor3 = v184
		local v185 = v179.n
		local v186 = tonumber(v185) or 0
		local v187 = v180.stats
		local v188
		if v186 > 0 then
			local v189 = string.format
			local v190 = "%d ban%s \194\183 %d this week \194\183 last %s"
			local v191 = v186 == 1 and "" or "s"
			local v192 = v179.w
			local v193 = tonumber(v192) or 0
			local v194 = v179.last
			local v195 = tonumber(v194)
			local v196
			if v195 and v195 > 0 then
				local v197 = os.time() + v_u_26 - v195
				local v198 = math.max(0, v197)
				if v198 < 60 then
					v196 = "just now"
				elseif v198 < 3600 then
					v196 = v198 // 60 .. "m ago"
				elseif v198 < 86400 then
					v196 = v198 // 3600 .. "h ago"
				else
					v196 = v198 // 86400 .. "d ago"
				end
			else
				v196 = "-"
			end
			v188 = v189(v190, v186, v191, v193, v196)
		else
			v188 = "no bans yet"
		end
		v187.Text = v188
		local v199 = v180.sub
		local v200 = string.format
		local v201 = "UserId %s \194\183 added %s%s"
		local v202 = v179.id
		local v203 = tostring(v202)
		local v204 = v179.t
		local v205 = tonumber(v204)
		local v206
		if v205 and v205 > 0 then
			local v207 = os.time() + v_u_26 - v205
			local v208 = math.max(0, v207)
			if v208 < 60 then
				v206 = "just now"
			elseif v208 < 3600 then
				v206 = v208 // 60 .. "m ago"
			elseif v208 < 86400 then
				v206 = v208 // 3600 .. "h ago"
			else
				v206 = v208 // 86400 .. "d ago"
			end
		else
			v206 = "-"
		end
		v199.Text = v200(v201, v203, v206, v179.online and " \194\183 ON THIS SERVER" or "")
		v180.toggle.Text = v179.on and "ON" or "OFF"
		v_u_5.setVariant(v180.toggle, v179.on and "primary" or "danger")
		v_u_5.setDisabled(v180.toggle, v_u_17)
		v_u_5.setVariant(v180.logBtn, v_u_21 == v179.id and "selected" or "ghost")
		local v209 = v180.undoBtn
		local v210 = v179.id
		local v211 = "undo:" .. tostring(v210)
		local v212
		if v_u_23 == nil or v_u_23.key ~= v211 then
			v212 = false
		else
			v212 = os.clock() - v_u_23.at <= 5
		end
		v209.Text = v212 and "CONFIRM?" or "UNDO BANS 7D"
		local v213 = v_u_5.setVariant
		local v214 = v180.undoBtn
		local v215 = v179.id
		local v216 = "undo:" .. tostring(v215)
		local v217
		if v_u_23 == nil or v_u_23.key ~= v216 then
			v217 = false
		else
			v217 = os.clock() - v_u_23.at <= 5
		end
		v213(v214, v217 and "danger" or "default")
		v_u_5.setDisabled(v180.undoBtn, v_u_17 or v186 == 0)
		local v218 = v180.removeBtn
		local v219 = v179.id
		local v220 = "remove:" .. tostring(v219)
		local v221
		if v_u_23 == nil or v_u_23.key ~= v220 then
			v221 = false
		else
			v221 = os.clock() - v_u_23.at <= 5
		end
		v218.Text = v221 and "CONFIRM?" or "REMOVE"
		v_u_5.setDisabled(v180.removeBtn, v_u_17)
	end
	for v222 = #v176 + 1, #v_u_45 do
		v_u_45[v222].frame.Visible = false
		v_u_45[v222].data = nil
	end
	v_u_33.Visible = #v176 == 0
	v_u_33.Text = v_u_18 and "No moderators yet. Type a UserId above and press ADD MODERATOR." or "Loading..."
end
local function v_u_305() -- name: renderLog
	-- upvalues: (ref) v_u_19, (ref) v_u_36, (ref) v_u_20, (copy) v_u_12, (copy) v_u_5, (ref) v_u_34, (ref) v_u_17, (ref) v_u_35, (ref) v_u_37, (ref) v_u_21, (ref) v_u_22, (copy) v_u_9, (ref) v_u_38, (ref) v_u_39, (copy) v_u_153, (ref) v_u_26, (copy) v_u_159, (ref) v_u_23, (copy) v_u_46, (ref) v_u_41
	local v224
	if v_u_19 then
		local v225 = v_u_19.entries
		v224 = type(v225) ~= "table" and {} or v_u_19.entries
	else
		v224 = {}
	end
	local v226 = v_u_36
	local v227
	if v_u_19 then
		v227 = v_u_19.month
	else
		v227 = v_u_20
	end
	local v228
	if type(v227) == "string" and #v227 == 6 then
		local v229 = string.sub(v227, 1, 4)
		local v230 = tonumber(v229)
		local v231 = string.sub(v227, 5, 6)
		local v232 = tonumber(v231)
		v228 = string.format("%s %d", v_u_12[v232 or 1] or "?", v230 or 0)
	else
		v228 = "THIS MONTH"
	end
	v226.Text = v228
	v_u_5.setDisabled(v_u_34, v_u_17 or not v_u_19)
	local v233 = v_u_5.setDisabled
	local v234 = v_u_35
	local v235 = v_u_17
	if not v235 then
		local v236 = v_u_19
		if v236 then
			v236 = v_u_19.next
		end
		v235 = not v236
	end
	v233(v234, v235)
	local v237 = v_u_37
	local v238
	if v_u_21 then
		local v239 = v_u_22 or v_u_21
		v238 = "ONLY @" .. string.upper((tostring(v239)))
	else
		v238 = "ALL MODERATORS + YOUR BANS"
	end
	v237.Text = v238
	local v240 = v_u_37
	local v241
	if v_u_21 then
		v241 = v_u_9.Accent
	else
		v241 = v_u_9.TextDim
	end
	v240.TextColor3 = v241
	v_u_38.Visible = v_u_21 ~= nil
	local v242 = v_u_39
	local v243
	if v_u_19 then
		local v244 = string.format
		local v245 = #v224
		local v246 = v_u_19.total
		v243 = v244("%d shown \194\183 %d logged this month \194\183 times in your local time", v245, tonumber(v246) or 0)
	else
		v243 = ""
	end
	v242.Text = v243
	for v247, v248 in v224 do
		local v249 = v_u_153(v247)
		v249.data = v248
		v249.frame.Visible = true
		local v250
		if v248.br == "owner" then
			v250 = v248.src == "anticheat" and "YOU (anti-cheat panel)" or "YOU"
		else
			local v251 = v248.bn
			v250 = "MOD @" .. tostring(v251)
		end
		local v252 = v249.l1
		local v253 = string.format
		local v254 = v248.t
		local v255 = os.date
		local v256 = (tonumber(v254) or 0) - v_u_26
		local v257 = math.floor(v256)
		local v258, v259 = pcall(v255, "%d %b %H:%M", v257)
		local v260 = not v258 and "?" or v259
		local v261 = v248.tn
		v252.Text = v253("%s  \194\183  %s banned @%s", v260, v250, (tostring(v261)))
		local v262, v263, v264 = v_u_159(v248)
		v249.st.Text = v262
		v249.st.TextColor3 = v263
		local v265 = v248.nf
		local v266 = (type(v265) ~= "string" or v248.nf == "") and "" or " \194\183 note: " .. v248.nf
		local v267 = v249.l2
		local v268 = v248.d
		local v269 = tonumber(v268) or 0
		local v270 = v269 < 0 and "PERMANENT" or v269 .. (v269 == 1 and " DAY" or " DAYS")
		local v271 = v248.rl or (v248.r or "?")
		v267.Text = v270 .. " \194\183 " .. tostring(v271) .. v266
		local v272 = ""
		if v248.st == "unbanned" then
			local v273 = " \194\183 unbanned by @"
			local v274 = v248.ubn or "?"
			local v275 = tostring(v274)
			local v276 = " "
			local v277 = v248.ub
			local v278 = tonumber(v277)
			local v279
			if v278 and v278 > 0 then
				local v280 = os.time() + v_u_26 - v278
				local v281 = math.max(0, v280)
				if v281 < 60 then
					v279 = "just now"
				elseif v281 < 3600 then
					v279 = v281 // 60 .. "m ago"
				elseif v281 < 86400 then
					v279 = v281 // 3600 .. "h ago"
				else
					v279 = v281 // 86400 .. "d ago"
				end
			else
				v279 = "-"
			end
			v272 = v273 .. v275 .. v276 .. v279
		elseif v248.st == "replaced" then
			local v282 = v248.rb or "?"
			v272 = " \194\183 replaced by ban " .. tostring(v282)
		elseif v248.st == "failed" then
			local v283 = v248.err or "error"
			v272 = " \194\183 " .. tostring(v283)
		end
		local v284 = v249.l3
		local v285 = string.format
		local v286 = "%s%s \194\183 job %s \194\183 log %s \194\183 player id %s%s"
		local v287 = string.upper
		local v288 = v248.srv or "?"
		local v289 = v287((tostring(v288)))
		local v290
		if v248.map then
			local v291 = v248.map
			v290 = " \194\183 " .. tostring(v291)
		else
			v290 = ""
		end
		local v292 = v248.job or "?"
		local v293 = tostring(v292)
		local v294 = v248.id
		local v295 = tostring(v294)
		local v296 = v248.to
		v284.Text = v285(v286, v289, v290, v293, v295, tostring(v296), v272)
		v249.frame.BackgroundTransparency = v262 == "ACTIVE" and 0.5 or 0.72
		v249.unban.Visible = v264
		local v297 = v248.id
		local v298 = "unban:" .. tostring(v297)
		local v299 = v249.unban
		local v300
		if v_u_23 == nil or v_u_23.key ~= v298 then
			v300 = false
		else
			v300 = os.clock() - v_u_23.at <= 5
		end
		v299.Text = v300 and "CONFIRM?" or "UNBAN"
		local v301 = v_u_5.setVariant
		local v302 = v249.unban
		local v303
		if v_u_23 == nil or v_u_23.key ~= v298 then
			v303 = false
		else
			v303 = os.clock() - v_u_23.at <= 5
		end
		v301(v302, v303 and "danger" or "default")
		v_u_5.setDisabled(v249.unban, v_u_17)
	end
	for v304 = #v224 + 1, #v_u_46 do
		v_u_46[v304].frame.Visible = false
		v_u_46[v304].data = nil
	end
	v_u_41.Visible = #v224 == 0
	v_u_41.Text = v_u_19 and (v_u_21 and "No bans by this moderator in this month." or "No bans in this month.") or "Loading..."
end
v_u_47 = function()
	-- upvalues: (ref) v_u_14, (ref) v_u_18, (ref) v_u_27, (copy) v_u_9, (ref) v_u_28, (copy) v_u_5, (ref) v_u_17, (ref) v_u_24, (ref) v_u_23, (ref) v_u_30, (copy) v_u_223, (copy) v_u_305, (copy) v_u_175, (ref) v_u_42, (ref) v_u_43
	if v_u_14 then
		if v_u_18 then
			local v306 = 0
			local v307 = 0
			for _, v308 in v_u_18.mods or {} do
				v306 = v306 + 1
				if not v308.on then
					continue
				end
				v307 = v307 + 1
			end
			local v309 = v_u_27
			local v310 = string.format
			local v311 = v306 == 1 and "" or "s"
			local v312 = v_u_18.max
			local v313 = tonumber(v312) or 30
			local v314 = v_u_18.cooldown
			local v315 = (tonumber(v314) or 600) // 60
			local v316 = v_u_18.paused and "PAUSED" or "active"
			local v317 = v_u_18.v
			v309.Text = v310("%d moderator%s (%d ON) \194\183 max %d \194\183 cooldown %d min \194\183 mod bans %s \194\183 list v%d%s%s", v306, v311, v307, v313, v315, v316, tonumber(v317) or 0, v_u_18.ready == false and " (loading)" or "", v_u_18.memory and " \194\183 Studio: memory only" or "")
			local v318 = v_u_27
			local v319
			if v_u_18.paused then
				v319 = v_u_9.Red
			else
				v319 = v_u_9.TextDim
			end
			v318.TextColor3 = v319
			v_u_28.Text = v_u_18.paused and "RESUME MOD BANS" or "PAUSE MOD BANS"
			v_u_5.setVariant(v_u_28, v_u_18.paused and "primary" or "danger")
		end
		v_u_5.setDisabled(v_u_28, v_u_17 or not v_u_18)
		local v320
		if v_u_24 == nil then
			v320 = false
		else
			local v321 = v_u_24.id
			local v322 = "add:" .. tostring(v321)
			if v_u_23 == nil or v_u_23.key ~= v322 then
				v320 = false
			else
				v320 = os.clock() - v_u_23.at <= 5
			end
		end
		v_u_30.Text = v320 and "CONFIRM ADD" or "ADD MODERATOR"
		v_u_5.setVariant(v_u_30, v320 and "danger" or "primary")
		v_u_5.setDisabled(v_u_30, v_u_17)
		v_u_223()
		v_u_305()
		local v323 = v_u_175
		local v324 = v_u_18
		if v324 then
			v324 = v_u_18.discord
		end
		local v325, v326 = v323(v324)
		v_u_42.Text = v325
		v_u_42.TextColor3 = v326
		v_u_5.setDisabled(v_u_43, v_u_17 or not v_u_18)
	end
end
local function v_u_336() -- name: layout
	-- upvalues: (ref) v_u_14, (copy) v_u_6
	if v_u_14 then
		local v327 = v_u_6.virtualSize()
		local v328 = v_u_6.topInset()
		local v329 = v327.X - 24
		local v330 = math.clamp(v329, 720, 1200)
		local v331 = v327.Y - v328 - 20
		local v332 = math.clamp(v331, 520, 740)
		v_u_14.Size = UDim2.fromOffset(v330, v332)
		local v333 = v_u_14
		local v334 = UDim2.new
		local v335 = (v327.Y - v328 - v332) / 2
		v333.Position = v334(0.5, 0, 0, v328 + math.max(0, v335))
	end
end
local function v_u_349() -- name: build
	-- upvalues: (ref) v_u_13, (copy) v_u_6, (copy) v_u_5, (copy) v_u_9, (ref) v_u_14, (copy) v_u_336, (copy) v_u_8, (copy) v_u_10, (ref) v_u_27, (ref) v_u_28, (ref) v_u_18, (copy) v_u_83, (copy) v_u_11, (ref) v_u_29, (ref) v_u_24, (ref) v_u_31, (ref) v_u_23, (ref) v_u_47, (copy) v_u_113, (ref) v_u_30, (ref) v_u_32, (ref) v_u_33, (ref) v_u_34, (ref) v_u_19, (ref) v_u_20, (copy) v_u_68, (ref) v_u_36, (ref) v_u_35, (ref) v_u_37, (ref) v_u_38, (ref) v_u_21, (ref) v_u_22, (ref) v_u_39, (ref) v_u_40, (ref) v_u_41, (ref) v_u_42, (ref) v_u_43, (ref) v_u_44
	if not v_u_13 then
		v_u_13 = v_u_6.screen("UI_AdminStaff", {
			["order"] = 97,
			["fullscreen"] = true,
			["enabled"] = false
		})
		local v337 = v_u_13.root
		v_u_5.new("TextButton", {
			["Name"] = "Backdrop",
			["Text"] = "",
			["Modal"] = true,
			["AutoButtonColor"] = false,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 0.45,
			["Size"] = nil,
			["Parent"] = nil,
			["BackgroundColor3"] = v_u_9.Black,
			["Size"] = UDim2.fromScale(1, 1),
			["Parent"] = v337
		})
		local v338 = v_u_5.panel({
			["Name"] = "Panel",
			["AnchorPoint"] = nil,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 0.05,
			["Size"] = nil,
			["Parent"] = nil,
			["AnchorPoint"] = Vector2.new(0.5, 0),
			["BackgroundColor3"] = v_u_9.Panel,
			["Size"] = UDim2.fromOffset(1200, 740),
			["Parent"] = v337
		}, true)
		v_u_14 = v338
		v_u_5.corner(v338, 4)
		v_u_5.padding(v338, 18, 18, 14, 12)
		v_u_336()
		v_u_6.onScaleChanged(v_u_336)
		v_u_5.new("ImageLabel", {
			["Name"] = "Icon",
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["ImageColor3"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Image"] = v_u_8.Image.icon_shield_defend,
			["ImageColor3"] = v_u_9.Accent,
			["Position"] = UDim2.fromOffset(0, 1),
			["Size"] = UDim2.fromOffset(28, 28),
			["Parent"] = v338
		})
		v_u_5.label({
			["Name"] = "Title",
			["Text"] = "STAFF",
			["Font"] = nil,
			["TextSize"] = 22,
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Font"] = v_u_10.Bold,
			["Position"] = UDim2.fromOffset(36, 0),
			["Size"] = UDim2.fromOffset(90, 30),
			["Parent"] = v338
		})
		v_u_5.label({
			["Name"] = "Sub",
			["Text"] = "MODERATORS & BAN LOG \194\183 OWNER ONLY",
			["Font"] = nil,
			["TextSize"] = 11,
			["TextColor3"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Font"] = v_u_10.Bold,
			["TextColor3"] = v_u_9.Accent,
			["Position"] = UDim2.fromOffset(122, 2),
			["Size"] = UDim2.fromOffset(280, 28),
			["Parent"] = v338
		})
		v_u_27 = v_u_5.label({
			["Name"] = "Status",
			["Text"] = "Loading...",
			["TextSize"] = 12,
			["TextColor3"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextTruncate"] = nil,
			["Parent"] = nil,
			["TextColor3"] = v_u_9.TextDim,
			["Position"] = UDim2.fromOffset(0, 32),
			["Size"] = UDim2.new(1, -360, 0, 16),
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Parent"] = v338
		})
		v_u_28 = v_u_5.button("Pause mod bans", {
			["Name"] = "Pause",
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextSize"] = 13,
			["Parent"] = nil,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(1, -152, 0, 0),
			["Size"] = UDim2.fromOffset(196, 32),
			["Parent"] = v338
		}, function()
			-- upvalues: (ref) v_u_18, (ref) v_u_83
			if v_u_18 then
				v_u_83({
					["op"] = "staffPause",
					["paused"] = nil,
					["paused"] = not v_u_18.paused
				})
			end
		end, "danger")
		v_u_5.button("Refresh", {
			["Name"] = "Refresh",
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextSize"] = 13,
			["Parent"] = nil,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(1, -40, 0, 0),
			["Size"] = UDim2.fromOffset(104, 32),
			["Parent"] = v338
		}, function()
			-- upvalues: (ref) v_u_11
			task.spawn(v_u_11.refresh)
		end, "default")
		v_u_5.new("ImageButton", {
			["Name"] = "Close",
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["AutoButtonColor"] = false,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Image"] = v_u_8.Image.icon_close,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(1, 0, 0, 1),
			["Size"] = UDim2.fromOffset(30, 30),
			["Parent"] = v338
		}).Activated:Connect(function()
			-- upvalues: (ref) v_u_11
			v_u_11.close()
		end)
		local v339 = v_u_5.panel({
			["Name"] = "Mods",
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 0.35,
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["BackgroundColor3"] = v_u_9.Bg,
			["Position"] = UDim2.fromOffset(0, 58),
			["Size"] = UDim2.new(0.4, -6, 1, -114),
			["Parent"] = v338
		})
		v_u_5.padding(v339, 10, 10, 8, 8)
		v_u_5.caption("Moderators", {
			["TextSize"] = 12,
			["Size"] = nil,
			["Parent"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 16),
			["Parent"] = v339
		})
		local v340 = v_u_5.frame({
			["Name"] = "Add",
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Position"] = UDim2.fromOffset(0, 22),
			["Size"] = UDim2.new(1, 0, 0, 34),
			["Parent"] = v339
		})
		v_u_29 = v_u_5.new("TextBox", {
			["Name"] = "UserId",
			["Text"] = "",
			["PlaceholderText"] = "UserId or username",
			["ClearTextOnFocus"] = false,
			["Font"] = nil,
			["TextSize"] = 14,
			["TextColor3"] = nil,
			["PlaceholderColor3"] = nil,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 0.2,
			["TextXAlignment"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Font"] = v_u_10.Bold,
			["TextColor3"] = v_u_9.White,
			["PlaceholderColor3"] = v_u_9.TextFaint,
			["BackgroundColor3"] = v_u_9.BgLight,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["Size"] = UDim2.new(1, -164, 1, 0),
			["Parent"] = v340
		})
		v_u_5.corner(v_u_29, 3)
		v_u_5.padding(v_u_29, 8, 8, 0, 0)
		v_u_29:GetPropertyChangedSignal("Text"):Connect(function()
			-- upvalues: (ref) v_u_29, (ref) v_u_24, (ref) v_u_31, (ref) v_u_23, (ref) v_u_47
			local v341 = string.gsub(v_u_29.Text, "[^%w_@]", "")
			local v342 = string.sub(v341, 1, 24)
			if v342 == v_u_29.Text then
				if v_u_24 then
					local v343 = v_u_24.q
					local v344 = string.gsub(v342, "^%s+", "")
					if v343 ~= string.gsub(v344, "%s+$", "") then
						v_u_24 = nil
						v_u_31.Text = ""
						if v_u_23 then
							local v345 = v_u_23.key
							if string.sub(v345, 1, 4) == "add:" then
								v_u_23 = nil
							end
						end
						v_u_47()
					end
				end
			else
				v_u_29.Text = v342
			end
		end)
		v_u_29.FocusLost:Connect(function(p346)
			-- upvalues: (ref) v_u_113
			if p346 then
				task.spawn(v_u_113)
			end
		end)
		v_u_30 = v_u_5.button("Add moderator", {
			["Name"] = "AddBtn",
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextSize"] = 13,
			["Parent"] = nil,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.fromScale(1, 0),
			["Size"] = UDim2.new(0, 156, 1, 0),
			["Parent"] = v340
		}, function()
			-- upvalues: (ref) v_u_113
			task.spawn(v_u_113)
		end, "primary")
		v_u_31 = v_u_5.label({
			["Name"] = "AddInfo",
			["Text"] = "",
			["TextSize"] = 12,
			["TextColor3"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextTruncate"] = nil,
			["Parent"] = nil,
			["TextColor3"] = v_u_9.TextDim,
			["Position"] = UDim2.fromOffset(0, 60),
			["Size"] = UDim2.new(1, 0, 0, 16),
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Parent"] = v339
		})
		v_u_32 = v_u_5.scroll({
			["Name"] = "List",
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Position"] = UDim2.fromOffset(0, 82),
			["Size"] = UDim2.new(1, 0, 1, -82),
			["Parent"] = v339
		}, 4)
		v_u_33 = v_u_5.label({
			["Name"] = "Empty",
			["Text"] = "",
			["TextSize"] = 13,
			["TextColor3"] = nil,
			["TextWrapped"] = true,
			["TextYAlignment"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["TextColor3"] = v_u_9.TextDim,
			["TextYAlignment"] = Enum.TextYAlignment.Top,
			["Position"] = UDim2.fromOffset(4, 88),
			["Size"] = UDim2.new(1, -8, 0, 40),
			["Parent"] = v339
		})
		local v347 = v_u_5.panel({
			["Name"] = "Log",
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 0.35,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["BackgroundColor3"] = v_u_9.Bg,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(1, 0, 0, 58),
			["Size"] = UDim2.new(0.6, -6, 1, -114),
			["Parent"] = v338
		})
		v_u_5.padding(v347, 10, 10, 8, 8)
		local v348 = v_u_5.frame({
			["Name"] = "Toolbar",
			["Size"] = nil,
			["Parent"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 30),
			["Parent"] = v347
		})
		v_u_34 = v_u_5.button("<", {
			["Name"] = "Prev",
			["Size"] = nil,
			["TextSize"] = 15,
			["Parent"] = nil,
			["Size"] = UDim2.fromOffset(36, 30),
			["Parent"] = v348
		}, function()
			-- upvalues: (ref) v_u_19, (ref) v_u_20, (ref) v_u_68, (ref) v_u_47
			if v_u_19 and v_u_19.prev then
				v_u_20 = v_u_19.prev
				task.spawn(function()
					-- upvalues: (ref) v_u_68, (ref) v_u_47
					v_u_68()
					v_u_47()
				end)
			end
		end, "default")
		v_u_36 = v_u_5.label({
			["Name"] = "Month",
			["Text"] = "",
			["Font"] = nil,
			["TextSize"] = 14,
			["TextXAlignment"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Font"] = v_u_10.Bold,
			["TextXAlignment"] = Enum.TextXAlignment.Center,
			["Position"] = UDim2.fromOffset(40, 0),
			["Size"] = UDim2.fromOffset(170, 30),
			["Parent"] = v348
		})
		v_u_35 = v_u_5.button(">", {
			["Name"] = "Next",
			["Position"] = nil,
			["Size"] = nil,
			["TextSize"] = 15,
			["Parent"] = nil,
			["Position"] = UDim2.fromOffset(214, 0),
			["Size"] = UDim2.fromOffset(36, 30),
			["Parent"] = v348
		}, function()
			-- upvalues: (ref) v_u_19, (ref) v_u_20, (ref) v_u_68, (ref) v_u_47
			if v_u_19 and v_u_19.next then
				v_u_20 = v_u_19.next
				task.spawn(function()
					-- upvalues: (ref) v_u_68, (ref) v_u_47
					v_u_68()
					v_u_47()
				end)
			end
		end, "default")
		v_u_37 = v_u_5.label({
			["Name"] = "Filter",
			["Text"] = "",
			["Font"] = nil,
			["TextSize"] = 12,
			["Position"] = nil,
			["Size"] = nil,
			["TextTruncate"] = nil,
			["Parent"] = nil,
			["Font"] = v_u_10.Bold,
			["Position"] = UDim2.fromOffset(264, 0),
			["Size"] = UDim2.new(1, -374, 1, 0),
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Parent"] = v348
		})
		v_u_38 = v_u_5.button("Show all", {
			["Name"] = "ShowAll",
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextSize"] = 12,
			["Visible"] = false,
			["Parent"] = nil,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.fromScale(1, 0),
			["Size"] = UDim2.fromOffset(104, 30),
			["Parent"] = v348
		}, function()
			-- upvalues: (ref) v_u_21, (ref) v_u_22, (ref) v_u_68, (ref) v_u_47
			v_u_21 = nil
			v_u_22 = nil
			task.spawn(function()
				-- upvalues: (ref) v_u_68, (ref) v_u_47
				v_u_68()
				v_u_47()
			end)
		end, "default")
		v_u_39 = v_u_5.label({
			["Name"] = "Count",
			["Text"] = "",
			["TextSize"] = 12,
			["TextColor3"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextTruncate"] = nil,
			["Parent"] = nil,
			["TextColor3"] = v_u_9.TextFaint,
			["Position"] = UDim2.fromOffset(0, 36),
			["Size"] = UDim2.new(1, 0, 0, 14),
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Parent"] = v347
		})
		v_u_40 = v_u_5.scroll({
			["Name"] = "Entries",
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["Position"] = UDim2.fromOffset(0, 56),
			["Size"] = UDim2.new(1, 0, 1, -56),
			["Parent"] = v347
		}, 4)
		v_u_41 = v_u_5.label({
			["Name"] = "Empty",
			["Text"] = "",
			["TextSize"] = 13,
			["TextColor3"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Parent"] = nil,
			["TextColor3"] = v_u_9.TextDim,
			["Position"] = UDim2.fromOffset(4, 62),
			["Size"] = UDim2.new(1, -8, 0, 20),
			["Parent"] = v347
		})
		v_u_42 = v_u_5.label({
			["Name"] = "Discord",
			["Text"] = "",
			["TextSize"] = 13,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextTruncate"] = nil,
			["Parent"] = nil,
			["AnchorPoint"] = Vector2.new(0, 1),
			["Position"] = UDim2.new(0, 0, 1, -22),
			["Size"] = UDim2.new(1, -160, 0, 26),
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Parent"] = v338
		})
		v_u_43 = v_u_5.button("Send test", {
			["Name"] = "DiscordTest",
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextSize"] = 12,
			["Parent"] = nil,
			["AnchorPoint"] = Vector2.new(1, 1),
			["Position"] = UDim2.new(1, 0, 1, -22),
			["Size"] = UDim2.fromOffset(150, 28),
			["Parent"] = v338
		}, function()
			-- upvalues: (ref) v_u_83
			v_u_83({
				["op"] = "discordTest"
			})
		end, "default")
		v_u_44 = v_u_5.label({
			["Name"] = "Msg",
			["Text"] = "",
			["TextSize"] = 13,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["TextTruncate"] = nil,
			["Parent"] = nil,
			["AnchorPoint"] = Vector2.new(0, 1),
			["Position"] = UDim2.fromScale(0, 1),
			["Size"] = UDim2.new(1, 0, 0, 18),
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["Parent"] = v338
		})
		v_u_47()
	end
end
function v_u_11.refresh() -- name: refresh
	-- upvalues: (copy) v_u_61, (ref) v_u_47, (copy) v_u_68
	if v_u_61() then
		v_u_47()
	end
	if v_u_68() then
		v_u_47()
	end
end
function v_u_11.open() -- name: open
	-- upvalues: (ref) v_u_15, (copy) v_u_349, (ref) v_u_16, (ref) v_u_13, (copy) v_u_7, (copy) v_u_336, (ref) v_u_44, (copy) v_u_9, (copy) v_u_11, (ref) v_u_17
	if not v_u_15 then
		v_u_349()
		v_u_15 = true
		v_u_16 = v_u_16 + 1
		local v_u_350 = v_u_16
		v_u_13.gui.Enabled = true
		v_u_7.cursor("UI_AdminStaff", true)
		v_u_336()
		if v_u_44 then
			v_u_44.Text = ""
			v_u_44.TextColor3 = v_u_9.TextDim
		end
		task.spawn(v_u_11.refresh)
		task.spawn(function()
			-- upvalues: (ref) v_u_15, (ref) v_u_16, (copy) v_u_350, (ref) v_u_17, (ref) v_u_11
			while v_u_15 and v_u_16 == v_u_350 do
				task.wait(15)
				if not v_u_15 or (v_u_16 ~= v_u_350 or v_u_17) then
					continue
				end
				v_u_11.refresh()
			end
		end)
	end
end
function v_u_11.close() -- name: close
	-- upvalues: (ref) v_u_15, (ref) v_u_16, (ref) v_u_23, (ref) v_u_13, (copy) v_u_7
	if v_u_15 then
		v_u_15 = false
		v_u_16 = v_u_16 + 1
		v_u_23 = nil
		if v_u_13 then
			v_u_13.gui.Enabled = false
		end
		v_u_7.cursor("UI_AdminStaff", false)
	end
end
function v_u_11.isOpen() -- name: isOpen
	-- upvalues: (ref) v_u_15
	return v_u_15
end
function v_u_11._debug(p351, p352, p353) -- name: _debug
	-- upvalues: (copy) v_u_46, (copy) v_u_45, (ref) v_u_15, (ref) v_u_27, (ref) v_u_44, (ref) v_u_42, (ref) v_u_31, (ref) v_u_30, (ref) v_u_28, (ref) v_u_36, (ref) v_u_37, (ref) v_u_39, (ref) v_u_29, (copy) v_u_113, (copy) v_u_83, (ref) v_u_21, (ref) v_u_22, (copy) v_u_68, (ref) v_u_47, (ref) v_u_23, (copy) v_u_58, (ref) v_u_18
	if not game:GetService("RunService"):IsStudio() then
		return nil
	end
	if p351 ~= "state" then
		if p351 == "add" then
			v_u_29.Text = tostring(p352)
			task.wait()
			v_u_113()
		elseif p351 == "modBtn" then
			for _, v354 in v_u_45 do
				if not v354.data or v354.data.id ~= p352 then
					continue
				end
				if p353 == "toggle" then
					v_u_83({
						["op"] = "staffSet",
						["target"] = nil,
						["on"] = nil,
						["target"] = v354.data.id,
						["on"] = not v354.data.on
					})
				elseif p353 == "log" then
					local v355 = v354.data.id
					local v356 = v354.data.name
					v_u_21 = v355
					v_u_22 = v356
					v_u_68()
					v_u_47()
				else
					if p353 ~= "undo" and p353 ~= "remove" then
						continue
					end
					local v357 = v354.data.id
					local v358 = p353 .. ":" .. tostring(v357)
					local v359
					if v_u_23 == nil or v_u_23.key ~= v358 then
						v359 = false
					else
						v359 = os.clock() - v_u_23.at <= 5
					end
					if v359 then
						local v360 = v_u_83
						local v361
						if p353 == "undo" then
							v361 = {
								["op"] = "undoMod",
								["mod"] = nil,
								["days"] = 7,
								["mod"] = v354.data.id
							}
						else
							v361 = {
								["op"] = "staffRemove",
								["target"] = nil,
								["target"] = v354.data.id
							}
						end
						v360(v361)
					else
						v_u_58(v358, "Press CONFIRM.")
					end
				end
			end
		elseif p351 == "unban" then
			for _, v362 in v_u_46 do
				if not v362.data or (v362.data.to ~= p352 or not v362.unban.Visible) then
					continue
				end
				local v363 = v362.data.id
				local v364 = "unban:" .. tostring(v363)
				local v365
				if v_u_23 == nil or v_u_23.key ~= v364 then
					v365 = false
				else
					v365 = os.clock() - v_u_23.at <= 5
				end
				if v365 then
					v_u_83({
						["op"] = "unban",
						["id"] = nil,
						["t"] = nil,
						["id"] = v362.data.id,
						["t"] = v362.data.t
					})
				else
					v_u_58(v364, "Press CONFIRM.")
				end
			end
		elseif p351 == "pause" then
			if v_u_18 then
				v_u_83({
					["op"] = "staffPause",
					["paused"] = nil,
					["paused"] = not v_u_18.paused
				})
			end
		elseif p351 == "all" then
			v_u_21 = nil
			v_u_22 = nil
			v_u_68()
			v_u_47()
		elseif p351 == "test" then
			v_u_83({
				["op"] = "discordTest"
			})
		end
		return true
	end
	local v366 = {}
	for _, v367 in v_u_46 do
		if not v367.frame.Visible then
			continue
		end
		local v368 = v367.l1.Text
		local v369 = v367.st.Text
		local v370 = v367.l2.Text
		local v371 = v367.l3.Text
		local v372 = v367.unban.Visible
		local v373 = v368 .. " | " .. v369 .. " | " .. v370 .. " | " .. v371 .. " | unban:" .. tostring(v372)
		table.insert(v366, v373)
	end
	local v374 = {}
	for _, v375 in v_u_45 do
		if not v375.frame.Visible then
			continue
		end
		local v376 = v375.name.Text .. " | " .. v375.stats.Text .. " | " .. v375.sub.Text .. " | " .. v375.toggle.Text
		table.insert(v374, v376)
	end
	local v377 = {
		["open"] = v_u_15
	}
	local v378 = v_u_27
	if v378 then
		v378 = v_u_27.Text
	end
	v377.status = v378
	local v379 = v_u_44
	if v379 then
		v379 = v_u_44.Text
	end
	v377.msg = v379
	local v380 = v_u_42
	if v380 then
		v380 = v_u_42.Text
	end
	v377.discord = v380
	local v381 = v_u_31
	if v381 then
		v381 = v_u_31.Text
	end
	v377.add = v381
	local v382 = v_u_30
	if v382 then
		v382 = v_u_30.Text
	end
	v377.addBtn = v382
	local v383 = v_u_28
	if v383 then
		v383 = v_u_28.Text
	end
	v377.pause = v383
	local v384 = v_u_36
	if v384 then
		v384 = v_u_36.Text
	end
	v377.month = v384
	local v385 = v_u_37
	if v385 then
		v385 = v_u_37.Text
	end
	v377.filter = v385
	local v386 = v_u_39
	if v386 then
		v386 = v_u_39.Text
	end
	v377.count = v386
	v377.mods = v374
	v377.log = v366
	return v377
end
return v_u_11