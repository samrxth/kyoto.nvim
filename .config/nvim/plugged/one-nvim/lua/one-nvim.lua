local vim, api, fn, exe, go = vim, vim.api, vim.fn, vim.api.nvim_command, vim.go

--[[ VARIABLES ]]
-- These are constants for the indexes in the colors that were defined before.
local _NONE = 'NONE'
local _PALETTE_256  = 2
local _PALETTE_ANSI = 3
local _PALETTE_HEX  = 1
local _TYPE_STRING = 'string'
local _TYPE_TABLE  = 'table'

-- Determine which set of colors to use.
local _USE_HEX = go.termguicolors
local _USE_256 = tonumber(go.t_Co) > 255
	or string.find(vim.env.TERM, '256')

--[[ HELPER FUNCTIONS ]]

-- Add the 'blend' parameter to some highlight command, if there is one.
local function blend(command, attributes) -- {{{ †
	if attributes.blend then -- There is a value for the `highlight-blend` field.
		command[#command+1]=' blend='..attributes.blend
	end
end

-- filter a highlight group's style information
local function filter_group_style(value)
	return value ~= 'background'
		and value ~= 'blend'
		and value ~= 'foreground'
		and value ~= 'special'
end

-- Get the color value of a color variable, or "NONE" as a default.
local function get(color, index) -- {{{ †
	if type(color) == _TYPE_TABLE and color[index] then
		return color[index]
	elseif type(color) == _TYPE_STRING then
		return color
	else
		return _NONE
	end
end

--[[ If using hex and 256-bit colors, then populate the gui* and cterm* args.
	If using 16-bit colors, just populate the cterm* args. ]]
local colorize = _USE_HEX and function(command, attributes) -- {{{ †
	command[#command+1]=' guibg='..get(attributes.bg, _PALETTE_HEX)..' guifg='..get(attributes.fg, _PALETTE_HEX)
end or _USE_256 and function(command, attributes)
	command[#command+1]=' ctermbg='..get(attributes.bg, _PALETTE_256)..' ctermfg='..get(attributes.fg, _PALETTE_256)
end or function(command, attributes)
	command[#command+1]=' ctermbg='..get(attributes.bg, _PALETTE_ANSI)..' ctermfg='..get(attributes.fg, _PALETTE_ANSI)
end

-- This function appends `selected_attributes` to the end of `highlight_cmd`.
local stylize = _USE_HEX and function(command, style, color)
	command[#command+1]=' gui='..style

	if color then -- There is an undercurl color.
		command[#command+1]=' guisp='..get(color, _PALETTE_HEX)
	end
end or function(command, style)
	command[#command+1]=' cterm='..style
end

local function tohex(rgb) return string.format('#%06x', rgb) end

-- Load specific &bg instructions
local function use_background_with(attributes)
	return setmetatable(
		attributes[go.background],
		{['__index'] = attributes}
	)
end

--[[ MODULE ]]

local highlite = {}

function highlite.group(group_name)
	local no_errors, group_definition = pcall(api.nvim_get_hl_by_name, group_name, go.termguicolors)

	if not no_errors then group_definition = {} end

	-- the style of the highlight group
	local style = vim.tbl_filter(filter_group_style, vim.tbl_keys(group_definition))
	if group_definition.special then
		style.color = tohex(group_definition.special)
	end

	return {
		['fg'] = group_definition.foreground and tohex(group_definition.foreground) or _NONE,
		['bg'] = group_definition.background and tohex(group_definition.background) or _NONE,
		['blend'] = group_definition.blend,
		['style'] = style or _NONE
	}
end

-- Generate a `:highlight` command from a group and some attributes.
function highlite.highlight(highlight_group, attributes) -- {{{ †
	-- The base highlight command
	local highlight_cmd = {'hi! ', highlight_group}

	if type(attributes) == _TYPE_STRING then -- `highlight_group` is a link to another group.
		highlight_cmd[3] = highlight_cmd[2]
		highlight_cmd[2] = 'link '
		highlight_cmd[4] = ' '
		highlight_cmd[5] = attributes
	else -- The `highlight_group` is uniquely defined.
		-- Take care of special instructions for certain background colors.
		if attributes[go.background] then
			attributes = use_background_with(attributes)
		end

		colorize(highlight_cmd, attributes)
		blend(highlight_cmd, attributes)

		local style = attributes.style or _NONE

		if type(style) == _TYPE_TABLE then
			-- Concat all of the entries together with a comma between before styling.
			stylize(highlight_cmd, table.concat(style, ','), style.color)
		else -- The style is just a single entry.
			stylize(highlight_cmd, style)
		end
	end

	exe(table.concat(highlight_cmd))
end

function highlite:highlight_terminal(terminal_ansi_colors)
	for index, color in ipairs(terminal_ansi_colors) do
		vim.g['terminal_color_'..index] = go.termguicolors and color[_PALETTE_HEX] or color[_PALETTE_256] or get(color, _PALETTE_ANSI)
	end
end

return setmetatable(highlite, {
	['__call'] = function(self, normal, highlights, terminal_ansi_colors)
		-- function to resolve function highlight groups being defined by function calls.
		local function resolve(tbl, key, resolve_links)
			local value = tbl[key]
			local value_type = type(value)
			if value_type == 'function' then
				-- lazily cache the result; next time, if it isn't a function this step will be skipped
				tbl[key] = value(setmetatable({}, {
					['__index'] = function(_, inner_key) return resolve(tbl, inner_key, true) end
				}))
			elseif value_type == _TYPE_STRING and not string.find(value, '^#') and resolve_links then
				return resolve(tbl, tbl[key], resolve_links)
			end

			return tbl[key]
		end


		-- save the colors_name before syntax reset
		local color_name = vim.g.colors_name

		-- Clear the highlighting.
		exe 'hi clear'

		-- If the syntax has been enabled, reset it.
		if fn.exists 'syntax_on' then exe 'syntax reset' end

		-- replace the colors_name
		vim.g.colors_name = color_name
		color_name = nil

		-- If we aren't using hex nor 256 colorsets.
		if not (_USE_HEX or _USE_256) then go.t_Co = '16' end

		-- Highlight the baseline.
		self.highlight('Normal', normal)

		-- Highlight everything else.
		for highlight_group, _ in pairs(highlights) do
			self.highlight(highlight_group, resolve(highlights, highlight_group, false))
		end

		-- Set the terminal highlight colors.
		self:highlight_terminal(terminal_ansi_colors)
	end
})
