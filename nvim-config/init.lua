-- Debug function to print all environment variables
local function print_env_vars()
	local env_vars = {
		'LUA_ASYNC_AWAIT_BRANCH',
		'NVIM_JAVA_CORE_BRANCH',
		'NVIM_JAVA_DAP_BRANCH',
		'NVIM_JAVA_REFACTOR_BRANCH',
		'NVIM_JAVA_TEST_BRANCH',
		'NVIM_JAVA_BRANCH'
	}
	
	print("=== NVIM-JAVA DEBUG ENVIRONMENT VARIABLES ===")
	for _, var in ipairs(env_vars) do
		local value = os.getenv(var)
		if value and value ~= '' then
			print(string.format("[DEBUG] %s = %s", var, value))
		end
	end
	print("=== END DEBUG ===")
end

-- stylua: ignore
local function get_branch(env_var)
	local branch = os.getenv(env_var)
	return (branch and branch ~= '') and branch or nil
end

-- stylua: ignore
vim.pack.add({
	'https://github.com/mason-org/mason.nvim',
	'https://github.com/MunifTanjim/nui.nvim',
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/mfussenegger/nvim-dap',
	'https://github.com/JavaHello/spring-boot.nvim',
	{ src = 'https://github.com/nvim-java/lua-async-await', 		version = get_branch('LUA_ASYNC_AWAIT_BRANCH') },
	{ src = 'https://github.com/nvim-java/nvim-java-core', 			version = get_branch('NVIM_JAVA_CORE_BRANCH') },
	{ src = 'https://github.com/nvim-java/nvim-java-dap', 			version = get_branch('NVIM_JAVA_DAP_BRANCH') },
	{ src = 'https://github.com/nvim-java/nvim-java-refactor', 	version = get_branch('NVIM_JAVA_REFACTOR_BRANCH') },
	{ src = 'https://github.com/nvim-java/nvim-java-test', 			version = get_branch('NVIM_JAVA_TEST_BRANCH') },
	{ src = 'https://github.com/nvim-java/nvim-java', 					version = get_branch('NVIM_JAVA_BRANCH') },
})

print_env_vars()

require('mason').setup()
require('java').setup({ jdk = { auto_install = false } })
require('lspconfig').jdtls.setup({})

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		-- stylua: ignore
		vim.lsp.completion.enable( true, ev.data.client_id, ev.buf, { autotrigger = true })
	end,
})

vim.opt.completeopt = { 'menuone', 'noselect', 'popup' }
vim.o.tabstop = 2
vim.o.shiftwidth = 2
