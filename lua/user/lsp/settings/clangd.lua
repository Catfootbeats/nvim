local clangd_nvim = require'clangd_nvim'

require'nvim_lsp'.clangd.setup{
    capabilities = {
        textDocument = {
            semanticHighlightingCapabilities = {
                semanticHighlighting = true
            }
        }
    },
    on_init = clangd_nvim.on_init
}