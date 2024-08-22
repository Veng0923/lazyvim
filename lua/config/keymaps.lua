-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set_keymap = vim.api.nvim_set_keymap

-- vim.keymap.set("n", "j", "k")
-- vim.keymap.set("n", "k", "j")
-- vim.keymap.set("n", "<C-k>", "<C-j>")
-- vim.keymap.set("n", "<C-j>", "<C-k>")
-- 映射 Caps Lock 为 Esc
--set_keymap("i", "<C-L>", "<Esc>", { noremap = true, silent = true })
--set_keymap("n", "<C-L>", "<Esc>", { noremap = true, silent = true })
--set_keymap("x", "<C-L>", "<Esc>", { noremap = true, silent = true })

-- line start line end
set_keymap("n", "<C-a>", "^", { noremap = true, silent = true })
set_keymap("n", "<C-e>", "$", { noremap = true, silent = true })
set_keymap("v", "<C-c>", "y", { noremap = true, silent = true })

-- Gitsigns
set_keymap("n", "<leader>gj", "<cmd>Gitsigns next_hunk<CR>", { silent = true, noremap = true })
set_keymap("n", "<leader>gk", "<Cmd>Gitsigns prev_hhunk<CR>", { silent = true, noremap = true })
set_keymap("n", "<leader>hs", ":Gitsigns stage_hunk<CR>", { silent = true, noremap = true })
set_keymap("v", "<leader>hs", ":Gitsigns stage_hunk<CR>", { silent = true, noremap = true })
set_keymap("n", "<leader>hr", ":Gitsigns reset_hunk<CR>", { silent = true, noremap = true })
set_keymap("v", "<leader>hr", ":Gitsigns reset_hunk<CR>", { silent = true, noremap = true })
set_keymap("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>", { silent = true, noremap = true })
set_keymap("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>", { silent = true, noremap = true })
set_keymap("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>", { silent = true, noremap = true })
set_keymap("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>", { silent = true, noremap = true })
set_keymap("n", "<leader>hb", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', { silent = true, noremap = true })
set_keymap("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { silent = true, noremap = true })
set_keymap("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>", { silent = true, noremap = true })
set_keymap("n", "<leader>hD", '<cmd>lua require"gitsigns".diffthis("~")<CR>', { silent = true, noremap = true })
set_keymap("n", "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>", { silent = true, noremap = true })
set_keymap("o", "ih", ":<C-U>Gitsigns select_hunk<CR>", { silent = true, noremap = true })
set_keymap("x", "ih", ":<C-U>Gitsigns select_hunk<CR>", { silent = true, noremap = true })

-- teletscope fine grep; bookmark
set_keymap("n", "<leader>ff", [[<cmd>lua require('telescope.builtin').find_files()<cr>]], {})
set_keymap("n", "<leader>fg", [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], {})
set_keymap("n", "<leader>fb", [[<cmd>lua require('telescope.builtin').buffers()<cr>]], {})
set_keymap("n", "<leader>fh", [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], {})
set_keymap("n", "<leader>fs", [[<cmd>lua require('telescope').symbols()<cr>]], { noremap = true, silent = true })
set_keymap("n", "<leader>ma", [[<cmd>Telescope vim_bookmarks current_file<cr>]], {})
set_keymap("n", "<leader>mA", [[<cmd>Telescope vim_bookmarks all<cr>]], {})
set_keymap("n", "<leader>fo", [[<cmd>Telescope oldfiles theme=dropdown previewer=false<cr>]], {})

-- inc-rename
vim.keymap.set("n", "<leader>rn", ":IncRename ")

-- undotree
vim.keymap.set("n", "<leader><F5>", vim.cmd.UndotreeToggle)
