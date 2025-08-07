local List = require("java-core.utils.list")

local M = {}

M.timeout = 10000 * 60 * 5
M.mason_timeout = 1000 * 60 * 5
M.expected_mason_pkgs = List:new({
	"java-test",
	"java-debug-adapter",
	"jdtls",
	"lombok-nightly",
	"spring-boot-tools",
})

function M.wait_for_jdtls()
	vim.print("waiting for jdtls")
	local jdtls_loaded = vim.wait(M.timeout, function()
		local clients = vim.lsp.get_clients({ name = "jdtls" })
		return #clients > 0
	end, 100)

	assert(jdtls_loaded, "JDTLS did not load before the timeout")
end

function M.wait_for_diagnostics(bufnr)
	vim.print("waiting for diagnostics")
	local diagnostics = vim.wait(M.timeout, function()
		local diags = vim.diagnostic.get(bufnr)
		return #diags > 0
	end, 100)

	assert(diagnostics, "No diagnostics were published before the timeout")
end

function M.wait_for_mason_install()
	vim.print("waiting for mason install")
	local all_installed = vim.wait(M.mason_timeout, function()
		local pkgs =
			List:new(require("mason-registry").get_installed_package_names())

		return M.expected_mason_pkgs:every(function(exp_pkg)
			return pkgs:includes(exp_pkg)
		end)
	end, 500)

	-- though package exists we cannot exit immediately becuase mason doing
	-- something in the background hens the sleep
	vim.cmd.sleep(5)

	assert(
		all_installed,
		"Failed to install all mason packages before the timeout. Installed packages::"
			.. List:new(require("mason-registry").get_installed_package_names())
				:join(", ")
	)
end

return M
