-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
    -- Package manager
    use 'wbthomason/packer.nvim'

    -- Fuzzy Finder (files, lsp, etc)
    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

    -- Highlight, edit, and navigate code
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    }
    -- Visualize treesitter objects
    use { 'nvim-treesitter/playground' }
    -- Additional text objects via treesitter
    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }

    -- Git
    use { 'tpope/vim-fugitive' }

    -- Auto pairing
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- View real-time markdown
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- Add indentation guides even on blank lines
    use 'lukas-reineke/indent-blankline.nvim'

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- See the cursor jump
    use { 'danilamihailov/beacon.nvim' }

    -- tpope the legend
    use('tpope/vim-surround')
    -- apply repeat to plugin maps
    use('tpope/vim-repeat')

    -- undo tree visualization
    use('mbbill/undotree')

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

    -- Themes
    use 'folke/tokyonight.nvim'
    use 'navarasu/onedark.nvim' -- Theme inspired by Atom
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    if is_bootstrap then
        require('packer').sync()
    end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- [[ Basic Keymaps ]]
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- No need to reqch for Esc key
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('i', 'JK', '<Esc>')
-- vim.keymap.set('i', 'kj', '<Esc>:w<CR>')

-- Won't loose my replace register content
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>d", "\"_dP")
vim.keymap.set("v", "<leader>d", "\"_dP")

-- source without exiting
vim.keymap.set("n", "<leader>so", ":so $MYVIMRC<CR>")
vim.keymap.set("n", "<leader>vim", ":tabf $MYVIMRC<CR>")

-- tabbing 
vim.keymap.set("v", ">", "><Esc>gv")
vim.keymap.set("v", "<", "<<Esc>gv")

-- [[ Movement Keymaps ]]
vim.keymap.set('n', '<leader>j', "<C-W><C-J>")
vim.keymap.set('n', '<leader>k', "<C-W><C-K>")
vim.keymap.set('n', '<leader>l', "<C-W><C-L>")
vim.keymap.set('n', '<leader>h', "<C-W><C-H>")

-- [[ Geneal Settings ]]
-- Make line numbers default
vim.opt.relativenumber = true
vim.opt.number = true

-- Share clipboards
vim.opt.clipboard = "unnamedplus"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false
vim.o.breakindent = true
vim.o.linebreak = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "number"

-- Decrease update time
vim.opt.updatetime = 50

-- Enable mouse mode
vim.o.mouse = 'a'

-- Netrw
vim.g.netrw_liststyle = 3

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme rose-pine]]

-- Opening new windows
vim.opt.splitbelow = true
vim.opt.splitright = true

-- [[ Configure indent-blankline ]]
-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
    char = '┊',
    show_trailing_blankline_indent = false,
}

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

vim.keymap.set('n', '<leader>b', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = 'Fuzzily search in current buffer]' })
vim.keymap.set('n', '<leader>mm', require('telescope.builtin').keymaps)
vim.keymap.set('n', '<leader>cs', require('telescope.builtin').colorscheme)


vim.keymap.set('n', '<leader>LS', require('telescope.builtin').oldfiles)
vim.keymap.set('n', '<leader>ls', require('telescope.builtin').buffers)
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files)
vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files)
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags)
-- vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string)
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics)

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`

require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "help", "python", "lua", "vim"},

    -- Indentation based on treesitter for the = operator
    indent = { enable = true },

    -- Incremental selection based on the named nodes from the grammar
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<CR>',
            scope_incremental = '<CR>',
            node_incremental = '<TAB>',
            node_decremental = '<S-TAB>',
        },
    },

    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['aa'] = '@parameter.outer',
                ['ia'] = '@parameter.inner',
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']m'] = '@class.outer',
                [']]'] = '@function.outer',
            },
            goto_next_end = {
                [']M'] = '@class.outer',
                [']['] = '@function.outer',
            },
            goto_previous_start = {
                ['[m'] = '@class.outer',
                ['[['] = '@function.outer',
            },
            goto_previous_end = {
                ['[M'] = '@class.outer',
                ['[]'] = '@function.outer',
            },
        }
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}

-- [[ Configure undotree ]]
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.g.undotree_SetFocusWhenToggle = 1

-- [[ LSP Configuration ]]
local lsp = require("lsp-zero")

lsp.preset('recommended')

lsp.ensure_installed({
    'pyright',
    'eslint'
})

vim.diagnostic.config({
  virtual_text = {
    -- source = "always",  -- Or "if_many"
    source = "always",
    prefix = '●', -- Could be '■', '▎', 'x'
  },
  severity_sort = true,
  float = {
    source = "always",  -- Or "if_many"
  },
})
vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d]', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })

-- This fucntion gets run when an LSP connects to a particular buffer
lsp.on_attach(function(_, bufnr)
    print("lsp attached")
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gr", require('telescope.builtin').lsp_references, opts)
    -- vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", '<leader>vd', require('telescope.builtin').diagnostics, opts)
    vim.keymap.set("n", '<leader>ds', require('telescope.builtin').lsp_document_symbols, opts)
    vim.keymap.set("n", '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, opts)
    vim.keymap.set("n", '<leader>a', function() vim.lsp.buf.format() end, opts)

end)

lsp.setup()
