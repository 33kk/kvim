local function plugins(use)
	use { "nvim-treesitter/nvim-treesitter" }
end

local function preload(layers)
	layers.treesitter = {
		parsers = {}
	}
end

local function postload(layers)
	require("nvim-treesitter.configs").setup {
		ensure_installed = layers.treesitter.parsers,
		ignore_install = { },

		highlight = {
			enable = true,
			disable = { },
			additional_vim_regex_highlighting = false,
		},

		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn",
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm",
			},
		},
		indent = {
			enable = true
		}
	}

	vim.opt.foldmethod = "expr"
	vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
end

return {
	plugins = plugins,

	preload = preload,
	preload_after = { "core" },
	postload = postload
}
