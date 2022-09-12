-- This file can be loaded by calling `lua require('plugins')` from init.vim


-- packages managed by packer, can be found on github at `wbthomason/packer.nvim`
return require('packer').startup(function(use)

    -- Packer itself
    use 'wbthomason/packer.nvim'

    -- Configurations for Nvim LSP
    use 'neovim/nvim-lspconfig'
    
    -- ayu color theme
    use 'Shatur/neovim-ayu'

    -- Status bar
    use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
    -- use 'powerline/powerline'

    -- auto close braces and stuff
    use 'jiangmiao/auto-pairs'

    -- provides auto completion
    use 'ms-jpq/coq_nvim'
    use('ms-jpq/coq.artifacts', { branch = 'artifacts'})

    use 'kyazdani42/nvim-web-devicons'

    -- file explorer
    use 'kyazdani42/nvim-tree.lua'

    -- symbols outline
    use 'simrat39/symbols-outline.nvim'

    -- auto save
    use 'Pocco81/auto-save.nvim'

    -- git integration
    use 'tpope/vim-fugitive'

end)
