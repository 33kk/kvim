local function load(layers, defs)
	if defs.treesitter then
		table.insert(layers.treesitter.parsers, "javascript")
		table.insert(layers.treesitter.parsers, "typescript")
		table.insert(layers.treesitter.parsers, "jsdoc")
	end

	if defs["null-ls"] then
		table.insert(layers.nls.sources, require("null-ls").builtins.diagnostics.eslint)
		table.insert(layers.nls.sources, require("null-ls").builtins.formatting.eslint)
	end

	if defs.lsp then
		layers.lsp.configs.tsserver = {}
	end
end

return {
	load = load,
	load_after = { "lsp", "treesitter" }
}
