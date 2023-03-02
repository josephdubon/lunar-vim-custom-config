-- Custom Tmux Config File
-- josephdubon@pm.me
--
-- This is a custom config file for Tmux.
--
-- Tmux Config
--

config = function()
  return require('tmux').setup({
          -- change keybindings to avoid comflict with lunarvim
          copy_sync = {
              enable = true,
              redirect_to_clipboard = true,
          },
          navigation = {
              enable_default_keybindings = true,
          },
          resize = {
              enable_default_keybindings = true,
          },
          window = {
              enable_default_keybindings = true,
          },
      })
end
