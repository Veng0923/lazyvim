return {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({
        winopts = {
          preview = {
            layout = "vertical", -- 将预览窗口放在浏览框的下方
            height = 0.30, -- 预览窗口的高度，占用 30% 的窗口高度
          },
        },
      })
    end,
  },
}
