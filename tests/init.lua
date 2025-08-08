vim.pack.add({
	'https://github.com/nvim-java/nvim-java-test',
	'https://github.com/mason-org/mason.nvim',
	'https://github.com/nvim-java/nvim-java-core',
	'https://github.com/nvim-java/lua-async-await',
	'https://github.com/nvim-java/nvim-java-refactor',
	'https://github.com/nvim-java/nvim-java-dap',
	'https://github.com/MunifTanjim/nui.nvim',
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/mfussenegger/nvim-dap',
	'https://github.com/JavaHello/spring-boot.nvim',
	'https://github.com/nvim-java/nvim-java',
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
