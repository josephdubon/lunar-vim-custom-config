-- Custom Plugins File
-- josephdubon@pm.me
--
-- This file is for your personal plugins.
-- Put all your custom plugins in this file.
-- This way, when you update awesome, your custom
-- plugins will not get overwritten.
--
--
-- Custom User Plugins
lvim.plugins = {
  -- palenight colortheme
  {
    "wilmanbarrios/palenight.nvim",
  },
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
        show_numbers = true,          -- Enable 'number' for the window while peeking
        show_cursorline = true,       -- Enable 'cursorline' for the window while peeking
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
    dependencies = "nvim-lua/plenary.nvim",
  },

  -- edit and review GitHub issues and pull requests
  {
    "pwntester/octo.nvim",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
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
        enable = true,         -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true,       -- Throttles plugin updates (may improve performance)
        max_lines = 0,         -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = {
                               -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
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
        RGB = true,            -- #RGB hex codes
        RRGGBB = true,         -- #RRGGBB hex codes
        RRGGBBAA = true,       -- #RRGGBBAA hex codes
        rgb_fn = true,         -- CSS rgb() and rgba() functions
        hsl_fn = true,         -- CSS hsl() and hsla() functions
        css = true,            -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,         -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },

  -- previewing goto definition calls
  {
    "rmagatti/goto-preview",
    config = function()
      require('goto-preview').setup {
        width = 120,                    -- Width of the floating window
        height = 25,                    -- Height of the floating window
        default_mappings = false,       -- Bind default mappings
        debug = false,                  -- Print debug information
        opacity = nil,                  -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil            -- A function taking two arguments, a buffer and a window to be ran as a hook.
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
  {
    "github/copilot.vim"
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
    build = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },

  -- smooth scrolling

  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    -- Journal config -- https://github.com/nvim-neorg/neorg/wiki/Journal
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true,                -- Hide cursor while scrolling
        stop_eof = true,                   -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false,       -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false,         -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true,       -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,             -- Default easing function
        pre_hook = nil,                    -- Function to run before the scrolling animation starts
        post_hook = nil,                   -- Function to run after the scrolling animation ends
      })
    end
  },

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
    event = "BufReadPre",     -- this will only start session saving when an actual file was opened
    lazy = true,
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
    build = "npm install --prefix server",
  },

  -- vimwiki, a personal wiki for vim
  {
    "vimwiki/vimwiki",
  },

  -- tmux, a terminal multiplexer
  {
    "aserowy/tmux.nvim",
    config = function()
      return require("tmux").setup()
    end,
  },
}

--
--
--
--
--
-- Custom User Plugins Config
--
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
