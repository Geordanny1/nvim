require("keymaps")

-- Leader key - Space is the most popular choice
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Line numbers (absolute + relative is the standard)
vim.opt.number = true
vim.opt.relativenumber = true

-- System clipboard integration - MUST HAVE
vim.opt.clipboard = "unnamedplus"

-- Better search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- Indentation (most use 2 or 4 spaces)
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

-- UI improvements everyone uses
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- Performance tweaks
vim.opt.updatetime = 250  -- Faster completion
vim.opt.timeoutlen = 300  -- Faster which-key popup

-- Persistent undo (game changer!)
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Better splits
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.pack.add({
	{ src = "https://github.com/EdenEast/nightfox.nvim" },
	{ src = "https://github.com/nvim-mini/mini.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/mg979/vim-visual-multi" },
})

vim.cmd("colorscheme carbonfox")
require("mini.pairs").setup({})
require("mini.starter").setup({})
require("mini.surround").setup({})

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "javascript","html", "css", "python"},

  sync_install = false,

  auto_install = false,

  highlight = {
    enable = true,

  },
}

