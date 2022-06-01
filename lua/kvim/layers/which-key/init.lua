local function plugins(use)
	use { "folke/which-key.nvim" }
end

local function preload(layers)
	layers.wk = require("which-key")
	layers.wk.setup()
end

return {
	plugins = plugins,

	preload = preload
}
