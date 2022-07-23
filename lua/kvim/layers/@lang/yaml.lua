local function load(layers, defs)
	if defs.lsp then
		layers.lsp.configs["yamlls"] = {
			settings = {
				yaml = {
					schemaStore = {
						enable = true,
						url = "https://www.schemastore.org/api/json/catalog.json",
					}
				}
			}
		}
	end
end

return {
	depends = { "lsp" },

	load = load,
	load_after = { "lsp", "treesitter" }
}
