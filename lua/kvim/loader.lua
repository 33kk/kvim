local packer = require("packer")

local M = {}

M.layer_definitions = {}
M.layer_data = {}

local function resolve_order_inner(out, visited, data, key_name, key, value)
	if value and not visited[key] then
		if value[key_name] and #value[key_name] > 0 then
			for _, after_key in ipairs(value[key_name]) do
				resolve_order_inner(out, visited, data, key_name, after_key, data[after_key])
			end
		end
		table.insert(out, value)
	end
	visited[key] = true
end

local function resolve_order(data, key_name)
	local out = {}
	local visited = {}

	for key, value in pairs(data) do
		resolve_order_inner(out, visited, data, key_name, key, value)
	end

	return out
end

local function run_hooks()
	for _, layer in ipairs(resolve_order(M.layer_definitions, "preload_after")) do
		if layer.preload then
			layer.preload(M.layer_data, M.layer_definitions)
		end
	end

	for _, layer in ipairs(resolve_order(M.layer_definitions, "load_after")) do
		if layer.load then
			layer.load(M.layer_data, M.layer_definitions)
		end
	end

	for _, layer in ipairs(resolve_order(M.layer_definitions, "postload_after")) do
		if layer.postload then
			layer.postload(M.layer_data, M.layer_definitions)
		end
	end
end

function M.add(layer)
	if type(layer) == "table" then
		for _, l in ipairs(layer) do
			M.add(l)
		end
		return
	end

	local is_ok, required_layer = pcall(require, "kvim.layers."..layer)
	if not is_ok or not type(required_layer) == "table" then
		error("Layer "..layer.." is invalid or not found.")
	end

	required_layer.id = layer
	M.layer_definitions[layer] = required_layer
end

function M.load(layers)
	if layers then
		M.add(layers)
	end

	for key, layer in pairs(M.layer_definitions) do
		if not layer.disabled then
			if layer.depends then
				for _, dep in ipairs(layer.depends) do
					if not M.layer_definitions[dep] then
						error("Layer " .. key .. " depends on " .. dep .. ", but but it is not found!")
					end
				end
			end
		end
	end

	packer.startup(function(use, use_rocks)
		use { "wbthomason/packer.nvim" }
		use { "lewis6991/impatient.nvim" }

		for _, layer in pairs(M.layer_definitions) do
			if layer.plugins then
				layer.plugins(use, use_rocks)
			end
		end
	end)

	if _G.packer_bootstrap then
		vim.api.nvim_create_autocmd("User", {
			pattern = "PackerComplete",
			once = true,
			callback = function()
				run_hooks()
				return true
			end
		})
		packer.sync()
	else
		run_hooks()
	end
end

return M
