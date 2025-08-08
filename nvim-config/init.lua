-- stylua: ignore
vim.pack.add({
	'https://github.com/mason-org/mason.nvim',
	'https://github.com/MunifTanjim/nui.nvim',
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/mfussenegger/nvim-dap',
	'https://github.com/JavaHello/spring-boot.nvim',
	{ src = 'https://github.com/nvim-java/lua-async-await', 		version = os.getenv('LUA_ASYNC_AWAIT_BRANCH') },
	{ src = 'https://github.com/nvim-java/nvim-java-core', 			version = os.getenv('NVIM_JAVA_CORE_BRANCH') },
	{ src = 'https://github.com/nvim-java/nvim-java-dap', 			version = os.getenv('NVIM_JAVA_DAP_BRANCH') },
	{ src = 'https://github.com/nvim-java/nvim-java-refactor', 	version = os.getenv('NVIM_JAVA_REFACTOR_BRANCH') },
	{ src = 'https://github.com/nvim-java/nvim-java-test', 			version = os.getenv('NVIM_JAVA_TEST_BRANCH') },
	{ src = 'https://github.com/nvim-java/nvim-java', 					version = os.getenv('NVIM_JAVA_BRANCH') },
})

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
