local function load(layers, defs)
	if defs.treesitter then
		table.insert(layers.treesitter.parsers, "c")
		table.insert(layers.treesitter.parsers, "cpp")
	end

	if defs.lsp then
		layers.lsp.configs.clangd = {}
	end
end

return {
	load = load,
	load_after = { "lsp" }
}
