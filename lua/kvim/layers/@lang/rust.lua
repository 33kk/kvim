local function plugins(use)
	use { "simrat39/rust-tools.nvim" }
end

local function postload(layers, defs)
	if defs.treesitter then
		table.insert(layers.treesitter.parsers, "rust")
	end

	-- if defs.lsp then
		-- layers.lsp.configs.rust_analyzer = {}
	-- end

	if defs.lsp then
		require('rust-tools').setup {
			-- HACK: Ugly code duplication, running in postload
			server = {
				on_attach = function(...)
					for _, fn in ipairs(layers.lsp.on_attaches) do
						fn(...)
					end
				end,
				capabilities = layers.lsp.capabilities
			}
		}
	end
end

return {
	plugins = plugins,

	postload = postload,
	postload_after = { "lsp", "treesitter" }
}
