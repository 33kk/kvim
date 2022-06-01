local function load(layers)
	if layers.treesitter then
		table.insert(layers.treesitter.parsers, "javascript")
		table.insert(layers.treesitter.parsers, "typescript")
		table.insert(layers.treesitter.parsers, "jsdoc")
	end

	if layers.nls then
		table.insert(layers.nls.sources, require("null-ls").builtins.diagnostics.eslint)
		table.insert(layers.nls.sources, require("null-ls").builtins.formatting.eslint)
	end

	if layers.lsp then
		layers.lsp.configs.tsserver = {}
	end
end

return {
	load = load,
	load_after = { "lsp", "treesitter" }
}
