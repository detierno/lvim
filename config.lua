-- lvim.log.level = "warn"

lvim.format_on_save = false
lvim.lint_on_save = false

vim.opt.wrap = false
vim.opt.relativenumber = true

lvim.leader = "space"
lvim.builtin.treesitter.indent = { enable = true, disable = { "ruby" } }

lvim.builtin.bufferline.options.indicator_icon = nil
lvim.builtin.bufferline.options.indicator = { style = "icon", icon = "▎" }

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- keymappings [view all the defaults by pressing <leader>Lk]

lvim.keys.normal_mode["<C-Up>"] = { ":resize -2<CR>", { silent = true } }
lvim.keys.normal_mode["<C-Down>"] = { ":resize +2<CR>", { silent = true } }
lvim.keys.normal_mode["<C-Left>"] = { ":vertical resize -2<CR>", { silent = true } }
lvim.keys.normal_mode["<leader>tt"] = { ":TestFile<CR>", { silent = true } }
lvim.keys.normal_mode["<leader>tn"] = { ":TestNearest<CR>", { silent = true } }
lvim.keys.normal_mode["<leader>ta"] = { ":TestSuite<CR>", { silent = true } }
lvim.keys.normal_mode["<leader>tl"] = { ":TestLast<CR>", { silent = true } }
lvim.keys.normal_mode["<leader>o"] = { ":Twilight<CR>", { silent = true } }
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- lvim.keys.insert_mode["<C-A>"] = { "<buffer> <expr> <C-R> registers#peek('<C-R>')", { silent = true } }
-- lvim.keys.normal_mode["s"] = { ":HopWord<cr>", { silent = true} }

-- lvim.colorscheme = "tokyonight"
-- lvim.colorscheme = "catppuccin"
-- lvim.colorscheme = "nightfly"
lvim.colorscheme = "catppuccin-latte"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

vim.opt.shell = "/bin/sh"

-- -- TREESITTER

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
lvim.builtin.treesitter.highlight.enabled = false

vim.diagnostic.config({virtual_text = false})

lvim.plugins = {
  {
    'mrjones2014/dash.nvim',
    build = 'make install',
  },

  {
    "tpope/vim-rails",
    cmd = {
      "Eview",
      "Econtroller",
      "Emodel",
      "Smodel",
      "Sview",
      "Scontroller",
      "Vmodel",
      "Vview",
      "Vcontroller",
      "Tmodel",
      "Tview",
      "Tcontroller",
      "Rails",
      "Generate",
      "Runner",
      "Extract"
    }
  },


  -- { "mg979/vim-visual-multi" },
  { "folke/twilight.nvim" },
  {
    'f-person/auto-dark-mode.nvim'
  },
  { 'bluz71/vim-nightfly-guicolors' },
  { 'tyrannicaltoucan/vim-deep-space' },
  { 'projekt0n/github-nvim-theme' },
  { 
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
      require("catppuccin").setup()
      -- vim.api.nvim_command "colorscheme catppuccin"
    end
  },
  { "rebelot/kanagawa.nvim" },
  { 'rose-pine/neovim', },
  { "lourenci/github-colors" },
  { "rakr/vim-one" },
  { "ChristianChiarulli/nvcode-color-schemes.vim" },
  { 'duane9/nvim-rg' },
  -- { "folke/tokyonight.nvim" },
  { "vim-test/vim-test" },
  { 'unblevable/quick-scope' },
  { "tversteeg/registers.nvim" },
  -- { "ggandor/lightspeed.nvim" },
  { 'sonph/onehalf', rtp = 'vim' },
  -- { 'NLKNguyen/papercolor-theme' },
  -- { 'altercation/vim-colors-solarized' },
  -- { 'numkil/ag.nvim' },
  -- {
  --   'suketa/nvim-dap-ruby',
  --   config = function()
  --     require('dap-ruby').setup()
  --   end
  -- },
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   config = function()
  --     require("lsp_signature").on_attach()
  --   end,
  --   event = "InsertEnter",
  -- },

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
  }
}


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

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

lvim.builtin.cmp.cmdline.enable = true

-- lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"
-- table.insert(lvim.builtin.cmp.sources, 1, { name = "Copilot", group_index = 2 })
table.insert(lvim.plugins, {
  "zbirenbaum/copilot-cmp",
  event = "InsertEnter",
  dependencies = { "zbirenbaum/copilot.lua" },
  config = function()
    vim.defer_fn(function()
      require("copilot").setup() -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
      require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
    end, 100)
  end,
})

local auto_dark_mode = require('auto-dark-mode')

auto_dark_mode.setup({
	update_interval = 1000,
	set_dark_mode = function()
		vim.api.nvim_set_option('background', 'dark')
		vim.cmd('colorscheme nightfly')
	end,
	set_light_mode = function()
		vim.api.nvim_set_option('background', 'light')
		vim.cmd('colorscheme catppuccin-latte')
	end,
})
auto_dark_mode.init()
--
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
]])
