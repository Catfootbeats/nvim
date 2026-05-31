require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	},
	log_level = vim.log.levels.WARN,
})

require("mason-lspconfig").setup {
	-- A list of servers to automatically install if they're not already installed
	ensure_installed = {
		'pylsp',
		'lua_ls',
		"jsonls",
		"clangd",
	},
	automatic_installation = true,
}
