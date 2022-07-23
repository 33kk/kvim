local function plugins(use)
	use { "neovim/nvim-lspconfig" }
	use { "williamboman/nvim-lsp-installer" }
end

local function preload(layers)
	require("nvim-lsp-installer").setup {
		-- automatic_installation = true,
	}

	layers.lsp = {
		configs = {},
		on_attaches = {
			function(_, bufnr)
				require("kvim.layers.lsp.mappings")(layers, bufnr)
			end
		},
		capabilities = vim.lsp.protocol.make_client_capabilities()
	}
end

local function postload(layers)
	local lspconfig = require("lspconfig")

	local defaults = {
		on_attach = function(...)
			for _, fn in ipairs(layers.lsp.on_attaches) do
				fn(...)
			end
		end,
		capabilities = layers.lsp.capabilities
	}

	for server, config in pairs(layers.lsp.configs) do
		lspconfig[server].setup(vim.tbl_extend("force", defaults, config))
	end
end

return {
	plugins = plugins,

	preload = preload,
	preload_after = { "core", "utils" },
	postload = postload
}
