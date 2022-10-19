
let mapleader=","

"These call the lua files in the lua folder in this directory
lua require('init')
lua require('plugins')
lua require('mappings')

set relativenumber
set number

colorscheme ayu

"tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"popup autocomplete menu keybinds
ino <silent><expr> <C-s> pumvisible() ? "\<C-e>" : "\<C-s>"
ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
ino <silent><expr> <Tab>   pumvisible() ? (complete_info().selected == -1 ? "\<C-n><C-y>" : "\<C-y>") : "\<Tab>"
ino <silent><expr> <CR>   pumvisible() ? "\<C-y>" : "\<CR>"


