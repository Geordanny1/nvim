local map = vim.keymap.set


-- select all
map("n", "<C-a>", "ggVG")

-- quit buffer
map("n", "<leader>q", ":q<CR>")

-- save file
map("n", "<leader>w", ":w<CR>")

-- window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- clear search
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- smart split
map("n", "<leader>s", function()
  local wins = vim.api.nvim_tabpage_list_wins(0)
  if #wins % 2 == 0 then
    vim.cmd("split")
    vim.cmd("wincmd j")
  else
    vim.cmd("vsplit")
    vim.cmd("wincmd l")
  end
end)

-- scroll centered
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- next search result centered
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-----------------------------------------------------------------------
-- VISUAL MODE IMPROVEMENTS
-----------------------------------------------------------------------
-- indent and reselect
map("v", "<", "<gv")
map("v", ">", ">gv")

-- move lines up/down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

