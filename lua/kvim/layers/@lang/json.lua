local function plugins(use)
	use { "b0o/SchemaStore.nvim" }
end

local function load(layers, defs)
	if defs.treesitter then
		table.insert(layers.treesitter.parsers, "json")
		table.insert(layers.treesitter.parsers, "jsonc")
		table.insert(layers.treesitter.parsers, "json5")
	end

	if defs.lsp then
		layers.lsp.configs["jsonls"] = {
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
				}
			}
		}
	end
end

return {
	plugins = plugins,

	load = load,
	load_after = { "lsp", "treesitter" }
}
