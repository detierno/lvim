-- general
lvim.format_on_save = false
lvim.lint_on_save = true
lvim.colorscheme = "spacegray"

vim.opt.wrap = false
vim.opt.relativenumber = true

-- lvim.builtin.compe.autocomplete = true

-- keymappings
lvim.leader = "space"

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.notify.active = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell", "gdscript", "teal", "godotResource" }
lvim.builtin.treesitter.highlight.enabled = true

lvim.lsp.diagnostics.virtual_text = false

lvim.colorscheme = "tokyonight"

-- lvim.keys.normal_mode["<Tab>"] = ":bnext<CR>"
-- lvim.keys.normal_mode["<C-Tab>"] = ":bprevious<CR>"
lvim.keys.normal_mode["<C-Up>"] = { ":resize -2<CR>", { silent = true } }
lvim.keys.normal_mode["<C-Down>"] = { ":resize +2<CR>", { silent = true } }
lvim.keys.normal_mode["<C-Left>"] = { ":vertical resize -2<CR>", { silent = true } }

--
-- lvim.keys.normal_mode = {
--   --   Navigate buffers
--   {'<Tab>', ':bnext<CR>'},
--   {'<S-Tab>', ':bprevious<CR>'},
--
--   -- Resize with arrows
--   { "<C-Up>", ":resize -2<CR>", { silent = true } },
--   { "<C-Down>", ":resize +2<CR>", { silent = true } },
--   { "<C-Left>", ":vertical resize -2<CR>", { silent = true } },
--   { "<C-Right>", ":vertical resize +2<CR>", { silent = true } },
--
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

]])

vim.list_extend(lvim.lsp.override, { "solargraph" })

local util = require("lspconfig/util")
local opts = {
    cmd = { "solargraph", "stdio" },
    filetypes = { "ruby" },
    init_options = {
      formatting = true
    },
    root_dir = util.root_pattern("Gemfile", ".git"),
    settings = {
      solargraph = {
        diagnostics = true
      }
    }
}
 -- require("lvim.lsp.manager").setup("solargraph", opts)
 require("lspconfig")["solargraph"].setup(opts)


lvim.plugins = {
  { "tpope/vim-rails" },
  { "mileszs/ack.vim" },
  { "ggandor/lightspeed.nvim" },
  { "mg979/vim-visual-multi" },
  { "tpope/vim-capslock" },
  { "lourenci/github-colors" },
  { "ChristianChiarulli/nvcode-color-schemes.vim" },
  { "folke/tokyonight.nvim" },
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").on_attach()
    end,
    event = "InsertEnter",
  },
   {
    "kevinhwang91/nvim-bqf",
    event = "BufRead",
  },
  { 'nvim-lualine/lualine.nvim',
   requires = {'kyazdani42/nvim-web-devicons', opt = true}
  },
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
}
