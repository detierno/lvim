lvim.log.level = "warn"

lvim.format_on_save = false
lvim.lint_on_save = false
lvim.colorscheme = "spacegray"

vim.opt.wrap = false
vim.opt.relativenumber = true



-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

lvim.keys.normal_mode["<C-Up>"] = { ":resize -2<CR>", { silent = true } }
lvim.keys.normal_mode["<C-Down>"] = { ":resize +2<CR>", { silent = true } }
lvim.keys.normal_mode["<C-Left>"] = { ":vertical resize -2<CR>", { silent = true } }
lvim.keys.normal_mode["<leader>tt"] = { ":TestFile<CR>", { silent = true } }
lvim.keys.normal_mode["<leader>tn"] = { ":TestNearest<CR>", { silent = true } }
lvim.keys.normal_mode["<leader>ta"] = { ":TestSuite<CR>", { silent = true } }
lvim.keys.normal_mode["<leader>tl"] = { ":TestLast<CR>", { silent = true } }
lvim.keys.normal_mode["<leader>o"] = { ":Twilight<CR>", { silent = true } }
-- lvim.keys.insert_mode["<C-A>"] = { "<buffer> <expr> <C-R> registers#peek('<C-R>')", { silent = true } }
-- lvim.keys.normal_mode["s"] = { ":HopWord<cr>", { silent = true} }

lvim.builtin.treesitter.indent = { enable = true, disable = { "ruby" } }

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

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

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
lvim.builtin.treesitter.highlight.enabled = true

lvim.lsp.diagnostics.virtual_text = false

lvim.colorscheme = "tokyonight"

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
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

vim.cmd([[
 " swap : with ;
nnoremap ; ;
nnoremap : ;
vnoremap ; :
vnoremap : ;
noremap : ;
noremap ; :
" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d
let test#strategy = 'neovim'
let test#neovim#term_position = "vert botright 100"
imap <buffer> <expr> <C-A> registers#peek('<C-R>')

set shell=/bin/bash
]])


lvim.plugins = {
  -- { "tpope/vim-rails" },
  -- { "tpope/vim-capslock" },
  { "mg979/vim-visual-multi" },
  { "folke/twilight.nvim" },
  { "lourenci/github-colors" },
  { "ChristianChiarulli/nvcode-color-schemes.vim" },
  { "folke/tokyonight.nvim" },
  { "vim-test/vim-test" },

  -- {
    -- 'nvim-telescope/telescope.nvim', tag = '0.1.0',
  -- or                            , branch = '0.1.x',
    -- requires = { {'nvim-lua/plenary.nvim'} }
  -- },

  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").on_attach()
    end,
    event = "InsertEnter",
  },

  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  },

  {
    'unblevable/quick-scope'
  },

  { "tversteeg/registers.nvim" },

  -- {
  --   "stevearc/dressing.nvim",
  --   config = function()
  --     require("user.dress").config()
  --   end,
  --   disable = not lvim.builtin.dressing.active,
  --   event = "BufWinEnter",
  -- },

  -- { 'nvim-lualine/lualine.nvim',
  --  requires = {'kyazdani42/nvim-web-devicons', opt = true}
  -- },

    { "ggandor/lightspeed.nvim" },

  -- {
  --   "phaazon/hop.nvim",
  --   as = "hop",
  --   keys = { "s" },
  --   config = function()
  --     -- you can configure Hop the way you like here; see :h hop-config
  --     require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
  --     vim.api.nvim_set_keymap("n", "s", ":HopWord<cr>", {})
  --   end,
  -- },

  { 'numkil/ag.nvim' },

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
  {
    'sonph/onehalf', rtp = 'vim'
  },
  { 'NLKNguyen/papercolor-theme' },
  { 'altercation/vim-colors-solarized' }
}

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
--     {"folke/tokyonight.nvim"},
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
