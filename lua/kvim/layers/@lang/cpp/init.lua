local function load(layers)
	if layers.treesitter then
		table.insert(layers.treesitter.parsers, "c")
		table.insert(layers.treesitter.parsers, "cpp")
	end

	if layers.lsp then
		layers.lsp.configs.clangd = {}
	end
end

return {
	load = load,
	load_after = { "lsp" }
}
