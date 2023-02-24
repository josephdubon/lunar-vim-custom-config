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
linters.setup {
    { command = "eslint", filetypes = { "typescript", "typescriptreact" } }
}

-- Formatter Config
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    {
        command = "prettier",
        filetypes = { "typescript", "typescriptreact" },
    },
}

-- TailwindCSS Config
require("lvim.lsp.manager").setup "tailwindcss"
