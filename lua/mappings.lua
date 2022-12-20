function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<Leader>p", ":NvimTreeOpen<CR>", {silent = true})
map("n", "<Leader>t", ":bel 13split<CR>:terminal<CR>")
map("n", "<Leader>o", ":SymbolsOutline<CR>", {silent = true})

-- for switching panes
map("n", "<A-h>", ":wincmd h<CR>", {silent = true})
map("n", "<A-j>", ":wincmd j<CR>", {silent = true})
map("n", "<A-k>", ":wincmd k<CR>", {silent = true})
map("n", "<A-l>", ":wincmd l<CR>", {silent = true})
map("t", "<A-h>", "<C-\\><C-n>:wincmd h<CR>", {silent = true})
map("t", "<A-j>", "<C-\\><C-n>:wincmd j<CR>", {silent = true})
map("t", "<A-k>", "<C-\\><C-n>:wincmd k<CR>", {silent = true})
map("t", "<A-l>", "<C-\\><C-n>:wincmd l<CR>", {silent = true})


-- for exiting terminal mode with esc
map("t", "<Esc>", "<C-\\><C-n>", {noremap = true})

-- keymaps for LSP 
vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, {silent=true})
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {silent=true})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {silent=true})

-- this on attach function should be called when a language server starts up.
-- It will map the langauge server functionality to the specified keys
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<Leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, bufopts)
    vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<Leader>f', vim.lsp.buf.formatting, bufopts)
end

return {on_attach = on_attach}
