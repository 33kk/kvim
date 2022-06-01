local function plugins(use)
	use { "dhruvasagar/vim-table-mode" }
end

return {
	plugins = plugins,

	load_after = { "core" }
}
