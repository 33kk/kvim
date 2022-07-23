local function plugins(use)
	use { "jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" }
	}
end

local function preload(layers)
	layers.nls = {
		sources = {}
	}
end

local function postload(layers)
	local nls = require("null-ls")

	nls.setup {
		sources = layers.nls.sources,
	}
end

return {
	plugins = plugins,

	preload = preload,
	preload_after = { "core", "lsp" },
	postload = postload
}
