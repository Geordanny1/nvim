vim.g.mapleader = " "
vim.opt.guicursor = "n-v-c-i:block-blinkon0"
-- use the system clipboard
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
-- set tab size to 2 spaces, although for some reaon this only works on some type of fle for some reason
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.textwidth = 80
vim.pack.add({
	{ src = "https://github.com/rebelot/kanagawa.nvim" },
	{ src = "https://github.com/nvim-mini/mini.nvim" },
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
})
vim.cmd("colorscheme kanagawa-dragon")
require("mini.pairs").setup({})
require("mini.starter").setup({})
require("mini.icons").setup({})
require("mason").setup()
require("blink.cmp").setup({
	windows = {
		completion = {
			draw = {
				components = {
					kind_icon = {
						text = function(ctx)
							local key = ctx.kind:lower()
							local icon, _ = require("mini.icons").get("lsp", key)
							return icon or ""
						end,
						highlight = function(ctx)
							local key = ctx.kind:lower()
							local _, hl = require("mini.icons").get("lsp", key)
							return hl
						end,
					},
					kind = {
						highlight = function(ctx)
							local key = ctx.kind:lower()
							local _, hl = require("mini.icons").get("lsp", key)
							return hl
						end,
					},
				},
			},
		},
	},
	completion = {
		menu = {
			auto_show = false,
			auto_show_delay_ms = 500,
		},
	},
})
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier" },
	},
})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
