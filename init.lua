vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.shiftround = true
vim.opt.relativenumber = true

-- Plugin setup
vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/nvim-mini/mini.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/rose-pine/neovim" },
})

-- mini plugins
require("mini.surround").setup()
require("mini.pairs").setup()

require("mini.pick").setup()
require("mini.starter").setup()
require("mini.basics").setup()

-- colorscheme
vim.cmd("colorscheme rose-pine")

-- mason setup
require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls" },
})

require("mason-tool-installer").setup({
	ensure_installed = {
		"stylua",
		"prettierd",
	},
})

-- LSP configuration using new API
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

-- enable lua_ls
vim.lsp.enable("lua_ls")

-- Conform (formatter) setup
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		html = { "prettierd", "prettier", stop_after_first = true },
		css = { "prettierd", "prettier", stop_after_first = true },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

-- completation command
vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", { desc = "Trigger completion" })

vim.keymap.set("n", "<leader>f", function()
	vim.cmd([[FzfLua files .]])
end)

vim.keymap.set("n", "<leader>cf", function()
	vim.cmd([[lua FzfLua.files({ cwd = '~/.config/nvim/' })]])
end)

vim.keymap.set("n", "<leader>b", function()
	vim.cmd([[FzfLua buffers]])
end)
