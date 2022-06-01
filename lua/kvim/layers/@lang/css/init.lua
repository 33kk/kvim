local function load(layers)
	if layers.treesitter then
		table.insert(layers.treesitter.parsers, "css")
		table.insert(layers.treesitter.parsers, "scss")
	end

	if layers.lsp then
		layers.lsp.configs.cssls = {}
	end
end

return {
	load = load,
	load_after = { "lsp", "treesitter" }
}
