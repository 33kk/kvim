local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values

local merged_keymaps = {
	{ mode = "", keys = "d", desc = "Delete", },
	{ mode = "", keys = "c", desc = "Change", },
	{ mode = "", keys = "y", desc = "Yank (copy)", },
	{ mode = "", keys = "g~", desc = "Toggle case", },
	{ mode = "", keys = "gu", desc = "Lowercase", },
	{ mode = "", keys = "gU", desc = "Uppercase", },
	{ mode = "", keys = ">", desc = "Indent right", },
	{ mode = "", keys = "<", desc = "Indent left", },
	{ mode = "", keys = "zf", desc = "Create fold", },
	{ mode = "", keys = "!", desc = "Filter though external program", },
	{ mode = "", keys = "v", desc = "Visual Character Mode", },
	{ mode = "", keys = "V", desc = "Visual Line Mode", },
	{ mode = "", keys = "h", desc = "Left", },
	{ mode = "", keys = "j", desc = "Down", },
	{ mode = "", keys = "k", desc = "Up", },
	{ mode = "", keys = "l", desc = "Right", },
	{ mode = "", keys = "w", desc = "Next word", },
	{ mode = "", keys = "%", desc = "Matching character: '()', '{}', '[]'", },
	{ mode = "", keys = "b", desc = "Previous word", },
	{ mode = "", keys = "e", desc = "Next end of word", },
	{ mode = "", keys = "ge", desc = "Previous end of word", },
	{ mode = "", keys = "0", desc = "Start of line", },
	{ mode = "", keys = "^", desc = "Start of line (non-blank)", },
	{ mode = "", keys = "$", desc = "End of line", },
	{ mode = "", keys = "f", desc = "Move to next char", },
	{ mode = "", keys = "F", desc = "Move to previous char", },
	{ mode = "", keys = "t", desc = "Move before next char", },
	{ mode = "", keys = "T", desc = "Move before previous char", },
	{ mode = "", keys = "gg", desc = "First line", },
	{ mode = "", keys = "G", desc = "Last line", },
	{ mode = "", keys = "{", desc = "Previous empty line", },
	{ mode = "", keys = "}", desc = "Next empty line", },
	{ mode = "", keys = 'a"', desc = "double quoted string", },
	{ mode = "", keys = "a'", desc = "single quoted string", },
	{ mode = "", keys = "a(", desc = "same as ab", },
	{ mode = "", keys = "a)", desc = "same as ab", },
	{ mode = "", keys = "a<", desc = "a <> from '<' to the matching '>'", },
	{ mode = "", keys = "a>", desc = "same as a<", },
	{ mode = "", keys = "aB", desc = "a Block from [{ to ]} (with brackets)", },
	{ mode = "", keys = "aW", desc = "a WORD (with white space)", },
	{ mode = "", keys = "a", desc = "a [] from '[' to the matching ']'", },
	{ mode = "", keys = "a]", desc = "same as a[", },
	{ mode = "", keys = "a`", desc = "string in backticks", },
	{ mode = "", keys = "ab", desc = "a block from [( to ]) (with braces)", },
	{ mode = "", keys = "ap", desc = "a paragraph (with white space)", },
	{ mode = "", keys = "as", desc = "a sentence (with white space)", },
	{ mode = "", keys = "at", desc = "a tag block (with white space)", },
	{ mode = "", keys = "aw", desc = "a word (with white space)", },
	{ mode = "", keys = "a{", desc = "same as aB", },
	{ mode = "", keys = "a}", desc = "same as aB", },
	{ mode = "", keys = 'i"', desc = "double quoted string without the quotes", },
	{ mode = "", keys = "i'", desc = "single quoted string without the quotes", },
	{ mode = "", keys = "i(", desc = "same as ib", },
	{ mode = "", keys = "i)", desc = "same as ib", },
	{ mode = "", keys = "i<lt>", desc = "inner <> from '<' to the matching '>'", },
	{ mode = "", keys = "i>", desc = "same as i<", },
	{ mode = "", keys = "iB", desc = "inner Block from [{ and ]}", },
	{ mode = "", keys = "iW", desc = "inner WORD", },
	{ mode = "", keys = "i", desc = "inner [] from '[' to the matching ']'", },
	{ mode = "", keys = "i]", desc = "same as i[", },
	{ mode = "", keys = "i`", desc = "string in backticks without the backticks", },
	{ mode = "", keys = "ib", desc = "inner block from [( to ])", },
	{ mode = "", keys = "ip", desc = "inner paragraph", },
	{ mode = "", keys = "is", desc = "inner sentence", },
	{ mode = "", keys = "it", desc = "inner tag block", },
	{ mode = "", keys = "iw", desc = "inner word", },
	{ mode = "", keys = "i{", desc = "same as iB", },
	{ mode = "", keys = "i}", desc = "same as iB", },
	{ mode = "", keys = "<c-w>s", desc = "Split window", },
	{ mode = "", keys = "<c-w>v", desc = "Split window vertically", },
	{ mode = "", keys = "<c-w>w", desc = "Switch windows", },
	{ mode = "", keys = "<c-w>q", desc = "Quit a window", },
	{ mode = "", keys = "<c-w>T", desc = "Break out into a new tab", },
	{ mode = "", keys = "<c-w>x", desc = "Swap current with next", },
	{ mode = "", keys = "<c-w>-", desc = "Decrease height", },
	{ mode = "", keys = "<c-w>+", desc = "Increase height", },
	{ mode = "", keys = "<c-w><", desc = "Decrease width", },
	{ mode = "", keys = "<c-w>>", desc = "Increase width", },
	{ mode = "", keys = "<c-w>|", desc = "Max out the width", },
	{ mode = "", keys = "<c-w>=", desc = "Equally high and wide", },
	{ mode = "", keys = "<c-w>h", desc = "Go to the left window", },
	{ mode = "", keys = "<c-w>l", desc = "Go to the right window", },
	{ mode = "", keys = "<c-w>k", desc = "Go to the up window", },
	{ mode = "", keys = "<c-w>j", desc = "Go to the down window", },
	{ mode = "", keys = "zo", desc = "Open fold under cursor", },
	{ mode = "", keys = "zO", desc = "Open all folds under cursor", },
	{ mode = "", keys = "zc", desc = "Close fold under cursor", },
	{ mode = "", keys = "zC", desc = "Close all folds under cursor", },
	{ mode = "", keys = "za", desc = "Toggle fold under cursor", },
	{ mode = "", keys = "zA", desc = "Toggle all folds under cursor", },
	{ mode = "", keys = "zv", desc = "Show cursor line", },
	{ mode = "", keys = "zM", desc = "Close all folds", },
	{ mode = "", keys = "zR", desc = "Open all folds", },
	{ mode = "", keys = "zm", desc = "Fold more", },
	{ mode = "", keys = "zr", desc = "Fold less", },
	{ mode = "", keys = "zx", desc = "Update folds", },
	{ mode = "", keys = "zz", desc = "Center this line", },
	{ mode = "", keys = "zt", desc = "Top this line", },
	{ mode = "", keys = "zb", desc = "Bottom this line", },
	{ mode = "", keys = "zg", desc = "Add word to spell list", },
	{ mode = "", keys = "zw", desc = "Mark word as bad/misspelling", },
	{ mode = "", keys = "ze", desc = "Right this line", },
	{ mode = "", keys = "zs", desc = "Left this line", },
	{ mode = "", keys = "zH", desc = "Half screen to the left", },
	{ mode = "", keys = "zL", desc = "Half screen to the right", },
	{ mode = "", keys = "z=", desc = "Spelling suggestions", },
	{ mode = "", keys = "[{", desc = "Previous {", },
	{ mode = "", keys = "[(", desc = "Previous (", },
	{ mode = "", keys = "[<", desc = "Previous <", },
	{ mode = "", keys = "[m", desc = "Previous method start", },
	{ mode = "", keys = "[M", desc = "Previous method end", },
	{ mode = "", keys = "[%", desc = "Previous unmatched group", },
	{ mode = "", keys = "[s", desc = "Previous misspelled word", },
	{ mode = "", keys = "{", desc = "Next {", },
	{ mode = "", keys = "(", desc = "Next (", },
	{ mode = "", keys = "<", desc = "Next <", },
	{ mode = "", keys = "m", desc = "Next method start", },
	{ mode = "", keys = "M", desc = "Next method end", },
	{ mode = "", keys = "%", desc = "Next unmatched group", },
	{ mode = "", keys = "s", desc = "Next misspelled word", },
	{ mode = "", keys = "H", desc = "Home line of window (top)", },
	{ mode = "", keys = "M", desc = "Middle line of window", },
	{ mode = "", keys = "L", desc = "Last line of window", },
	{ mode = "", keys = "gf", desc = "Go to file under cursor", },
	{ mode = "", keys = "gx", desc = "Open the file under cursor with system app", },
	{ mode = "", keys = "gi", desc = "Move to the last insertion and INSERT", },
	{ mode = "", keys = "gv", desc = "Switch to VISUAL using last selection", },
	{ mode = "", keys = "gn", desc = "Search forwards and select", },
	{ mode = "", keys = "gN", desc = "Search backwards and select", },
	{ mode = "", keys = "g%", desc = "Cycle backwards through results", }
}

for _, value in ipairs(_G.keymaps) do
	table.insert(merged_keymaps, value)
end

local displayer = require("telescope.pickers.entry_display").create {
	separator = "▏",
	items = {
		{ width = 2 },
		{ width = 20 },
		{ remaining = true },
	},
}

local make_display = function(entry)
	return displayer {
		entry.mode,
		entry.keys,
		entry.desc,
	}
end

local keymaps = function(opts)
	opts = opts or {}
	pickers.new(opts, {
		prompt_title = "Keymaps",
		finder = finders.new_table {
			results = vim.tbl_extend("keep", _G.keymaps, merged_keymaps),
			entry_maker = function(entry)
				return {
					mode = entry.mode,
					keys = entry.keys,
					desc = entry.desc,
					--
					valid = true,
					value = entry,
					ordinal = entry.mode .. " " .. entry.keys .. " " .. entry.desc,
					display = make_display
				}
			end
		},
		attach_mappings = function(prompt_bufnr)
			actions.select_default:replace(function()
				local selection = action_state.get_selected_entry()
				if selection == nil then
					return
				end
				local ret = actions.close(prompt_bufnr)
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(selection.value.keys, true, false, true), "t", true)
				return ret
			end)
			return true
		end,
		sorter = conf.generic_sorter(opts),
	}):find()
end

-- TODO: Turn this into an extension
keymaps()

