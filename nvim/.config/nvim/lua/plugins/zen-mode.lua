-- In your plugin configuration file (e.g., lua/plugins/editor.lua)

return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      -- The width of the centered text window
      width = 120,
      options = {
        -- You can also set cursorline, etc., here for zen mode
      },
    },
  },
}
