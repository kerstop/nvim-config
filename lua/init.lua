
-- command to initialize rust analyzer
require('lspconfig').rust_analyzer.setup{
    cmd = {"rustup", "run", "nightly", "rust-analyzer"},
    on_attach = require("mappings").on_attach,
}

require('lspconfig').pylsp.setup({})

require('ayu').setup({
    mirage = true,
})

require('lualine').setup({
    options = {
        theme = 'ayu'
    }
})

-- auto starts the auto complete
vim.g.coq_settings = { 
    auto_start = 'shut-up',
    keymap = { 
        recommended = false,
        manual_complete = "<C-w>",
    },
}

require("nvim-tree").setup()

require("auto-save").setup({
    execution_message = {
        cleaning_interval = 3000,
    }
})

require("symbols-outline").setup({
    auto_close = true,
    keymaps = {
        hover_symbol = "<C-w>",
    }
})
