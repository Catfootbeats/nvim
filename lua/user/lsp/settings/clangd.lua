local clangd_nvim = require'clangd_nvim'

require'nvim_lsp'.clangd.setup{
    handlers = lsp_status.extensions.clangd.setup(),
  init_options = {
    clangdFileStatus = true
  },
  on_attach = mix_attach,
  capabilities = lsp_status.capabilities
}
