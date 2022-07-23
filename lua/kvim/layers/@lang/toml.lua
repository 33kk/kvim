local function load(layers, defs)
	if defs.treesitter then
		table.insert(layers.treesitter.parsers, "toml")
	end

	if defs.lsp then
		layers.lsp.configs["taplo"] = {}
	end
end

return {
	load = load,
	load_after = { "lsp", "treesitter" }
}
