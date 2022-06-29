-- Just an example, supposed to be placed in /lua/custom/

local M = {}
local override = require "custom.plugins.configs"

-- make sure you maintain the structure of `core/default_config.lua` here,

-- example of changing theme:
M.ui = {
   theme = "catppuccin", -- default theme
   theme_toggle = { "ayu-dark", "catppuccin" },
   transparency = false,
}

M.plugins = {

   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },

   override = {
      ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
   },

   -- custom plugins
   user = require "custom.plugins.extra_plugins",
}

return M
