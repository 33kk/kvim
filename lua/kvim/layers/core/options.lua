return function(layers)
	local utils = layers.utils

	utils.set_opts({
		mouse = "a",
		autoread = true,
		clipboard = { append = "unnamedplus" },
		completeopt = { "menu", "menuone", "noselect" },

		ignorecase = true,
		smartcase = true,

		encoding = "utf-8",

		-- spell = true,
		-- spelllang = { 'en_us' },

		number = true,
		relativenumber = true,
		signcolumn = "yes",
		colorcolumn = "80",

		showmode = false,
		shortmess = { append = "c" },

		tabstop = 2,
		shiftwidth = 2,
		softtabstop = -1,
		expandtab = false,
		smarttab = true,

		wrap = true,
		linebreak = true,
		breakindent = true,

		scrolloff = 5,
		sidescrolloff = 12,

		splitbelow = true,
		splitright = true,

		foldmethod = "syntax",
		foldlevelstart = 9999,

		guifont = "JetBrainsMono Nerd Font Mono:h14",
		termguicolors = utils.has("termguicolors"), -- is the check even necessary?

		langremap = true
	})

	utils.set_variables({
		cursorhold_updatetime = 500,
		neovide_transparency = 0.8
	}, "g")

	utils.set_variables({
		loaded_zip = 1,
		loaded_gzip = 1,
		loaded_zipPlugin = 1,
		loaded_tar = 1,
		loaded_tarPlugin = 1,
		loaded_getscript = 1,
		loaded_getscriptPlugin = 1,
		loaded_vimball = 1,
		loaded_vimballPlugin = 1,
		loaded_2html_plugin = 1,
		loaded_matchit = 1,
		loaded_matchparen = 1,
		loaded_man = 1,
		loaded_logiPat = 1,
		loaded_rrhelper = 1,
		loaded_netrw = 1,
		loaded_netrwPlugin = 1,
		loaded_netrwSettings = 1,
		loaded_netrwFileHandlers = 1,
		loaded_tutor_mode_plugin = 1
	}, "g")
end
