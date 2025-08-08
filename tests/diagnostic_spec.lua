local utils = require('utils.utils')
local List = require('java-core.utils.list')

describe('nvim-java basic tests', function()
	it('should load jdtls and spring-boot on file open', function()
		vim.cmd.edit('apps/simple/Diagnostics.java')
		utils.wait_for_jdtls()
		utils.wait_for_diagnostics()
		local diagnostics = vim.diagnostic.get(0)
		local found_syntax_error = List:new(diagnostics):find(function(diag)
			return diag.message
				== 'Syntax error, insert ";" to complete BlockStatements'
		end)

		assert(
			found_syntax_error,
			'Could not find the missing semicolon diagnostic error'
		)
	end)
end)
