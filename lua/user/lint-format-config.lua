-- Custom Linters and Formatters File
-- josephdubon@pm.me
--
-- This file is for your person plugins.
-- Put all your custom config in this file.
-- This way, when you update, your custom
-- config will not get overwritten.
--
--
-- Linters Config
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {{ 
    command = "eslint", 
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" } 
  }}

-- Formatter Config
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
{
    name = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespace
    -- options such as `--line-width 80` become either `{"--line-width", "80"}` or `{"--line-width=80"}`
    args = {"--semi", "false"}, {"--single-quote", "false"},
    ---@usage only start in these filetypes, by default it will attach to all filetypes it supports
    filetypes = { "typescript", "typescriptreact" },
  },
}

-- TailwindCSS Config
require("lvim.lsp.manager").setup "tailwindcss"
