return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = "VeryLazy", -- Loads the UI after the core starts for speed
    opts = {
      options = {
        mode = "buffers", -- Shows your open files
        separator_style = "thin",
        show_buffer_close_icons = false,
        show_close_icon = false,
        -- This helps with your transparent Kitty background
        themable = true,
      }
    }
  }
}
