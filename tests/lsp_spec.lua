local utils = require("utils.utils")
local List = require("java-core.utils.list")

describe("nvim-java basic tests", function()
	it("should load jdtls and spring-boot on file open", function()
		vim.cmd.edit("apps/simple/LspTest.java")
		utils.wait_for_jdtls()
		local lsps = vim.lsp.get_clients()

		local lsp_names = List:new(lsps):map(function(lsp)
			return lsp.name
		end)

		assert(lsp_names:includes("jdtls"), "jdtls is not loded")
		assert(lsp_names:includes("spring-boot"), "spring-boot is not loded")
	end)
end)
