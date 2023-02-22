--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "lunar"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "javascript",
    "json",
    "lua",
    "python",
    "typescript",
    "tsx",
    "css",
    "rust",
    "java",
    "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
-- lvim.plugins = {
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
--
--


-- DUBON CUSTOM START
-- Additional Plugins
lvim.plugins = {
    -- diagnostics, references, telescope results, quickfix and location lists
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },

    -- jump to the line
    {
        "nacro90/numb.nvim",
        event = "BufRead",
        config = function()
          require("numb").setup {
              show_numbers = true, -- Enable 'number' for the window while peeking
              show_cursorline = true, -- Enable 'cursorline' for the window while peeking
          }
        end,
    },

    -- vim-matchup
    -- navigate and highlight matching words
    {
        "andymass/vim-matchup",
        event = "CursorMoved",
        config = function()
          vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end,
    },

    -- git diff in a single tabpage
    {
        "sindrets/diffview.nvim",
        event = "BufRead",
    },

    -- show git blame
    {
        "f-person/git-blame.nvim",
        event = "BufRead",
        config = function()
          vim.cmd "highlight default link gitblame SpecialComment"
          vim.g.gitblame_enabled = 0
        end,
    },

    -- generate shareable file permalinks for several git web frontend hosts
    {
        "ruifm/gitlinker.nvim",
        event = "BufRead",
        config = function()
          require("gitlinker").setup {
              opts = {
                  -- remote = 'github', -- force the use of a specific remote
                  -- adds current line nr in the url for normal mode
                  add_current_line_on_normal_mode = true,
                  -- callback for what to do with the url
                  action_callback = require("gitlinker.actions").open_in_browser,
                  -- print the url after performing the action
                  print_url = false,
                  -- mapping to call url generation
                  mappings = "<leader>gy",
              },
          }
        end,
        requires = "nvim-lua/plenary.nvim",
    },

    -- edit and review GitHub issues and pull requests
    {
        "pwntester/octo.nvim",
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'kyazdani42/nvim-web-devicons',
        },
        config = function()
          require("octo").setup()
        end,
    },

    -- autoclose and autorename html tag
    {
        "windwp/nvim-ts-autotag",
        config = function()
          require("nvim-ts-autotag").setup()
        end,
    },

    -- rainbow parentheses
    {
        "mrjones2014/nvim-ts-rainbow",
    },

    --  view treesitter information
    {
        "nvim-treesitter/playground",
        event = "BufRead",
    },

    -- Show current function at the top of the screen when function does not fit in screen
    {
        "romgrk/nvim-treesitter-context",
        config = function()
          require("treesitter-context").setup {
              enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
              throttle = true, -- Throttles plugin updates (may improve performance)
              max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
              patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
                  -- For all filetypes
                  -- Note that setting an entry here replaces all other patterns for this entry.
                  -- By setting the 'default' entry below, you can control which nodes you want to
                  -- appear in the context window.
                  default = {
                      'class',
                      'function',
                      'method',
                  },
              },
          }
        end
    },

    -- lsp diagnostics highlight groups for non lsp colorschemes
    {
        "folke/lsp-colors.nvim",
        event = "BufRead",
    },

    --colorscheme creation aid
    {
        "rktjmp/lush.nvim",
    },

    --color highlighter
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
          require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
              RGB = true, -- #RGB hex codes
              RRGGBB = true, -- #RRGGBB hex codes
              RRGGBBAA = true, -- #RRGGBBAA hex codes
              rgb_fn = true, -- CSS rgb() and rgba() functions
              hsl_fn = true, -- CSS hsl() and hsla() functions
              css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
              css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
          })
        end,
    },

    -- previewing goto definition calls
    {
        "rmagatti/goto-preview",
        config = function()
          require('goto-preview').setup {
              width = 120, -- Width of the floating window
              height = 25, -- Height of the floating window
              default_mappings = false, -- Bind default mappings
              debug = false, -- Print debug information
              opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
              post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
              -- You can use "default_mappings = true" setup option
              -- Or explicitly set keybindings
              -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
              -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
              -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
          }
        end
    },

    -- cwd to the project's root directory
    {
        "ahmedkhalf/lsp-rooter.nvim",
        event = "BufRead",
        config = function()
          require("lsp-rooter").setup()
        end,
    },

    -- hint when you type
    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function() require "lsp_signature".on_attach() end,
    },

    -- a tree like view for symbols
    {
        "simrat39/symbols-outline.nvim",
        config = function()
          require('symbols-outline').setup()
        end
    },

    -- automatically saving your work whenever you make changes to it
    {
        "Pocco81/auto-save.nvim",
        config = function()
          require("auto-save").setup()
        end,
    },

    -- interactive scratchpad for hackers
    {
        "metakirby5/codi.vim",
        cmd = "Codi",
    },

    -- let a computer write code for you
    { "zbirenbaum/copilot.lua",
        event = { "VimEnter" },
        config = function()
          vim.defer_fn(function()
            require("copilot").setup {
                plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
            }
          end, 100)
        end,
    },

    { "zbirenbaum/copilot-cmp",
        after = { "copilot.lua", "nvim-cmp" },
    },

    -- preview markdown in neovim
    -- You must install glow globally
    -- https://github.com/charmbracelet/glow
    -- yay -S glow
    {
        "npxbr/glow.nvim",
        ft = { "markdown" }
        -- run = "yay -S glow"
    },

    -- preview markdown in the browser
    {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        ft = "markdown",
        config = function()
          vim.g.mkdp_auto_start = 1
        end,
    },

    -- smooth scrolling

    {
        "karb94/neoscroll.nvim",
        event = "WinScrolled",
        config = function()
          require('neoscroll').setup({
              -- All these keys will be mapped to their corresponding default scrolling animation
              mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
                  '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
              hide_cursor = true, -- Hide cursor while scrolling
              stop_eof = true, -- Stop at <EOF> when scrolling downwards
              use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
              respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
              cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
              easing_function = nil, -- Default easing function
              pre_hook = nil, -- Function to run before the scrolling animation starts
              post_hook = nil, -- Function to run after the scrolling animation ends
          })
        end
    },

    -- next generation note-taking
    { "oberblastmeister/neuron.nvim" },

    -- pick up where you left off
    {
        "ethanholz/nvim-lastplace",
        event = "BufRead",
        config = function()
          require("nvim-lastplace").setup({
              lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
              lastplace_ignore_filetype = {
                  "gitcommit", "gitrebase", "svn", "hgcommit",
              },
              lastplace_open_folds = true,
          })
        end,
    },

    -- simple session management
    {
        "folke/persistence.nvim",
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        module = "persistence",
        config = function()
          require("persistence").setup {
              dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
              options = { "buffers", "curdir", "tabpages", "winsize" },
          }
        end,
    },

    -- highlight and search for todo comments
    {
        "folke/todo-comments.nvim",
        event = "BufRead",
        config = function()
          require("todo-comments").setup()
        end,
    },

    -- underlines the word under the cursor
    {
        "itchyny/vim-cursorword",
        event = { "BufEnter", "BufNewFile" },
        config = function()
          vim.api.nvim_command("augroup user_plugin_cursorword")
          vim.api.nvim_command("autocmd!")
          vim.api.nvim_command("autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0")
          vim.api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
          vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
          vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
          vim.api.nvim_command("augroup END")
        end
    },

    -- metrics, insights, and time tracking automatically generated from your programming activity
    {
        "wakatime/vim-wakatime"
    },

    -- live edit html, css, and javascript
    {
        "turbio/bracey.vim",
        cmd = { "Bracey", "BracyStop", "BraceyReload", "BraceyEval" },
        run = "npm install --prefix server",
    },

    --
    --
    --
    --
}


-- Enable rainbow parentheses
lvim.builtin.treesitter.rainbow.enable = true

-- Trouble Keybindings
lvim.builtin.which_key.mappings["t"] = {
    name = "Diagnostics",
    t = { "<cmd>TroubleToggle<cr>", "trouble" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
    r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

-- Persistence Config
lvim.builtin.which_key.mappings["S"] = {
    name = "Session",
    c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
    l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
    Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

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
