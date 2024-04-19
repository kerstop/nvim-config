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

--suggestion window navigation
vim.keymap.set('i', '<Esc>', function() 
    return vim.fn.pumvisible() == 1 and "<C-e><Esc>" or "<Esc>"
end, { expr = true })
vim.keymap.set('i', '<Tab>', function()
  return vim.fn.pumvisible() == 1 and "<C-y>" or "<Tab>"
end, { expr = true })

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
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '', { noremap=true, silent=true, callback=vim.lsp.buf.declaration})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '', { noremap=true, silent=true, callback=vim.lsp.buf.definition})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '', { noremap=true, silent=true, callback=vim.lsp.buf.hover})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '', { noremap=true, silent=true, callback=vim.lsp.buf.implementation})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '', { noremap=true, silent=true, callback=vim.lsp.buf.signature_help})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>wa', '', { noremap=true, silent=true, callback=vim.lsp.buf.add_workspace_folder})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>wr', '', { noremap=true, silent=true, callback=vim.lsp.buf.remove_workspace_folder})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>D', '', { noremap=true, silent=true, callback=vim.lsp.buf.type_definition})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>rn', '', { noremap=true, silent=true, callback=vim.lsp.buf.rename})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>ca', '', { noremap=true, silent=true, callback=vim.lsp.buf.code_action})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '', { noremap=true, silent=true, callback=vim.lsp.buf.references})

    -- if the buffer is js use prettier
    if client.name == "tsserver" then 
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>f', ":Neoformat prettier<Enter>", {noremap=true, silent=true})
    else
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>f', function()
            vim.lsp.buf.format({ async = true }) end, {noremap=true, silent=true})
    end
end

return {on_attach = on_attach}
