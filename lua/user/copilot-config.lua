-- Custom Plugins File
-- josephdubon@pm.me
--
-- This file is for your personal plugins.
-- Put all your custom plugins in this file.
-- This way, when you update awesome, your custom
-- plugins will not get overwritten.
--
--
-- GitHub Copilot Config
-- https://github.com/LunarVim/LunarVim/issues/1856#issuecomment-954224770
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
local cmp = require "cmp"

-- Remap <Tab> to accept the suggestion
lvim.builtin.cmp.mapping["<Tab>"] = function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  else
    local copilot_keys = vim.fn["copilot#Accept"]()
    if copilot_keys ~= "" then
      vim.api.nvim_feedkeys(copilot_keys, "i", true)
    else
      fallback()
    end
  end
end


