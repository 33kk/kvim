local function plugins(use)
	use { "lambdalisue/suda.vim" }
end

return {
	plugins = plugins,

	load_after = { "core" }
}
