local function plugins(use)
	use { "ray-x/lsp_signature.nvim" }
end

local function load()
	require("lsp_signature").setup {
		hint_enable = false
	}
end

return {
	plugins = plugins,

	load = load,
	load_after = { "core", "lsp" }
}
