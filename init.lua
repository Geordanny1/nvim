vim.g.mapleader = " "

vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2

vim.o.guicursor = 'i:block'


vim.pack.add({

    { src = 'https://github.com/vague-theme/vague.nvim' },
    { src = 'https://github.com/nvim-mini/mini.nvim' , version = 'stable'},
    { src = 'https://github.com/mattn/emmet-vim'},

  })

vim.cmd.colorscheme('vague')

require('mini.icons').setup()
require('mini.pairs').setup()
require('mini.completion').setup()
require('mini.surround').setup()

vim.g.user_emmet_settings = {
  variables = { lang = 'En' },
  html = {
    default_attributes = {
      option = { value = vim.NIL },
      textarea = { id = vim.NIL, name = vim.NIL, cols = 10, rows = 10 },
    },
    snippets = {
      ['html:5'] = "<!DOCTYPE html>\n"
        .. "<html lang=\"${lang}\">\n"
        .. "<head>\n"
        .. "\t<meta charset=\"${charset}\">\n"
        .. "\t<title></title>\n"
        .. "\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
        .. "</head>\n"
        .. "<body>\n\t${child}|\n</body>\n"
        .. "</html>",
    },
  },
}

vim.keymap.set('n', '<leader>e', ':Ex<CR>')

vim.keymap.set('n', '<leader>w', ':w<CR>')



