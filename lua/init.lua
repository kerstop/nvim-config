
-- command to initialize rust analyzer
require('lspconfig').rust_analyzer.setup{
    cmd = {"rustup", "run", "stable", "rust-analyzer"},
    on_attach = require("mappings").on_attach,
}

require('lspconfig').cssls.setup({
    on_attach = require("mappings").on_attach,
})

require('lspconfig').tsserver.setup({
    on_attach = require("mappings").on_attach,
})

require('lspconfig').pylsp.setup({
    on_attach = require("mappings").on_attach,
})

require('lspconfig').clangd.setup({
    on_attach = require("mappings").on_attach,
})

require('ayu').setup({
    mirage = true,
})

require('lualine').setup({
    options = {
        theme = 'ayu'
    }
})

require'nvim-treesitter.configs'.setup {
    ensure_installled = {"rust", "lua", "vim", "javascript", "typescript", "tsx", "toml"},
    highlight = {
        enable = true,
    },
    autotag = {
        enable = true,
    }
}

-- auto starts the auto complete
vim.g.coq_settings = { 
    auto_start = 'shut-up',
    keymap = { 
        recommended = false,
        manual_complete = "<c-l>",
    },
    limits = {
        completion_auto_timeout = 1.5,
    },
    clients = {
        snippets = {
            enabled = false,
        },
        lsp = {
            resolve_timeout = 1.5,
        },
    },
}

require("nvim-tree").setup({
    actions = {
        open_file = {
            resize_window = false,
        }
    },
    git = {
        ignore = false,
    }
})

require("auto-save").setup({
    execution_message = {
        cleaning_interval = 3000,
    }
})

require("symbols-outline").setup({})

-- diagnostics config
vim.diagnostic.config({
    virtual_text = { format = function(d) return "" end },
})
