-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

local opt = vim.opt
--opt.relativenumber = false  -- 相对行号
opt.tabstop = 4 -- Tab 显示为4个空格
opt.shiftwidth = 4 -- 自动缩进为4格
vim.g.autoformat = false    -- 自动格式化文件
vim.g.NERDSpaceDelims = 1   -- 注释分割符添加空格

vim.opt.clipboard = "unnamedplus"
