local function plugins(use)
	use { "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" }
end

local function load(layers, defs)
	if defs.lsp then
		layers.lsp.capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true
		}
	end

	if defs.treesitter then
		require("ufo").setup {
			provider_selector = function(bufnr, filetype, buftype)
				return {"treesitter", "indent"}
			end
		}
	else
		require("ufo").setup()
	end

	layers.utils.set_maps({
		{ "n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" } },
		{ "n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" } },
	})
end

return {
	plugins = plugins,

	load = load,
	load_after = { "core", "lsp", "treesitter" }
}
