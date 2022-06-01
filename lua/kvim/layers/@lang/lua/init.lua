local function load(layers)
	local runtime_path = vim.split(package.path, ";")
	table.insert(runtime_path, "lua/?.lua")
	table.insert(runtime_path, "lua/?/init.lua")

	if layers.treesitter then
		table.insert(layers.treesitter.parsers, "lua")
	end

	if layers.nls then
		table.insert(layers.nls.sources, require("null-ls").builtins.formatting.stylua)
	end

	if layers.lsp then
		layers.lsp.configs["sumneko_lua"] = {
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
						path = runtime_path,
					},
					diagnostics = {
						globals = { "vim" },
					},

					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
					},
					telemetry = {
						enable = false,
					},
				},
			},
			root_dir = require("lspconfig").util.root_pattern("nvim", "lua", ".git", ".gitignore"),
		}
	end
end

return {
	depends = { "lsp" },

	load = load,
	load_after = { "lsp", "treesitter", "null-ls" }
}
