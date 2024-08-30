-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set_keymap = vim.keymap.set

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
set_keymap("n", "<leader>ghs", ":Gitsigns stage_hunk<CR>", { silent = true, noremap = true })
set_keymap("v", "<leader>ghs", ":Gitsigns stage_hunk<CR>", { silent = true, noremap = true })
set_keymap("n", "<leader>ghr", ":Gitsigns reset_hunk<CR>", { silent = true, noremap = true })
set_keymap("v", "<leader>ghr", ":Gitsigns reset_hunk<CR>", { silent = true, noremap = true })
set_keymap("n", "<leader>ghS", "<cmd>Gitsigns stage_buffer<CR>", { silent = true, noremap = true })
set_keymap("n", "<leader>ghu", "<cmd>Gitsigns undo_stage_hunk<CR>", { silent = true, noremap = true })
set_keymap("n", "<leader>ghR", "<cmd>Gitsigns reset_buffer<CR>", { silent = true, noremap = true })
set_keymap("n", "<leader>ghp", "<cmd>Gitsigns preview_hunk<CR>", { silent = true, noremap = true })
set_keymap("n", "<leader>ghb", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', { silent = true, noremap = true })
set_keymap("n", "<leader>gtb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { silent = true, noremap = true })
set_keymap("n", "<leader>ghd", "<cmd>Gitsigns diffthis<CR>", { silent = true, noremap = true })
set_keymap("n", "<leader>ghD", '<cmd>lua require"gitsigns".diffthis("~")<CR>', { silent = true, noremap = true })
set_keymap("n", "<leader>gtd", "<cmd>Gitsigns toggle_deleted<CR>", { silent = true, noremap = true })
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
set_keymap("n", "<leader>rn", ":IncRename ")

-- undotree
set_keymap("n", "<leader><F5>", vim.cmd.UndotreeToggle)


-- copy path
-- 获取项目根目录的函数（根据你的项目结构调整）
local function get_project_root()
  -- 你可以使用类似于 .git 或其他项目标识文件来确定项目根目录
  local path = vim.fn.getcwd() -- 或者使用 vim.fn.finddir('.git', ';') 来找到项目根目录
  return path
end

-- 定义函数来复制当前缓冲区的相对项目路径到剪贴板
local function copy_current_buffer_relative_path()
  local absolute_path = vim.fn.expand('%:p')  -- 获取当前缓冲区的绝对路径
  local project_root = get_project_root()      -- 获取项目根目录
  local relative_path = vim.fn.fnamemodify(absolute_path, ':p:.' .. project_root)  -- 计算相对路径
  vim.fn.setreg('+', relative_path)            -- 将路径复制到系统剪贴板
  print('Copied relative path to clipboard: ' .. relative_path)
end

local function copy_current_buffer_filename()
  local filename = vim.fn.expand('%:t')
  vim.fn.setreg('+', filename)
  print('Copied filename to clipboard: ' .. filename)
end

-- 定义函数来复制当前缓冲区的路径到剪贴板
local function copy_current_buffer_path()
  local path = vim.fn.expand('%:p')  -- 获取当前缓冲区的完整路径
  vim.fn.setreg('+', path)           -- 将路径复制到系统剪贴板
  print('Copied absolute path to clipboard: ' .. path)
end

vim.api.nvim_create_user_command('CopyAbsoluteBufferPath', copy_current_buffer_path, {})
-- copy filename to clipboard
vim.api.nvim_create_user_command('CopyBufferFilename', copy_current_buffer_filename, {})
-- 创建一个命令来调用这个函数
vim.api.nvim_create_user_command('CopyBufferRelativePath', copy_current_buffer_relative_path, {})

set_keymap("n", "<leader>cp", "", {silent = true, desc = "Copy Path"})
set_keymap('n', '<leader>cpa', ": CopyAbsoluteBufferPath<cr>", { noremap = true, silent = true, desc = "Copy Absolute Path" })
set_keymap('n', '<leader>cpf', ": CopyBufferFilename<cr>", { noremap = true, silent = true, desc = "Copy FileName" })
set_keymap('n', '<leader>cpr', ": CopyBufferRelativePath<cr>", { noremap = true, silent = true, desc = "Copy Relative Path"})


-- 定义函数来在 Neovim 内部终端中打开当前缓冲区的路径
local function open_current_buffer_path_in_terminal()
  local absolute_path = vim.fn.expand('%:p:h')  -- 获取当前缓冲区的目录路径
  local terminal_cmd

  if vim.fn.has('unix') == 1 then
    terminal_cmd = 'cd ' .. vim.fn.shellescape(absolute_path) .. ' && exec $SHELL'
  elseif vim.fn.has('win32') == 1 then
    terminal_cmd = 'cd /d ' .. vim.fn.shellescape(absolute_path) .. ' && powershell'
  else
    print("Unsupported operating system")
    return
  end

  -- 打开一个新的终端窗口并运行命令
  vim.cmd('belowright split | terminal ' .. terminal_cmd)
end

local function open_root_in_terminal()
    vim.cmd('belowright split| terminal')
end

-- 创建一个命令来调用这个函数
vim.api.nvim_create_user_command('OpenBufferPathInTerminal', open_current_buffer_path_in_terminal, {})
vim.api.nvim_create_user_command('OpenRootPathInTerminal', open_root_in_terminal, {})

set_keymap("n", "<leader>t", "", {silent = true, desc = "terminal"})
set_keymap('n', '<leader>tb', ": OpenBufferPathInTerminal<cr>", { noremap = true, silent = true, desc = "open In Terminal" })
set_keymap('n', '<leader>to', ": OpenRootPathInTerminal<cr>", { noremap = true, silent = true, desc = "open root In Terminal" })

