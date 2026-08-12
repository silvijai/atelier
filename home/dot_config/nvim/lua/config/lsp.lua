local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config("omnisharp", {
  capabilities = capabilities,
  cmd = { "omnisharp" },
  settings = {
    omnisharp = {
      enable_import_completion = true,
      enable_roslyn_analyzers = true,
      organize_imports_on_format = true,
    },
  },
})
vim.lsp.enable("omnisharp")

vim.lsp.config("pylsp", { capabilities = capabilities })
vim.lsp.enable("pylsp")

vim.lsp.config("rust_analyzer", { capabilities = capabilities })
vim.lsp.enable("rust_analyzer")

vim.lsp.config("ts_ls", {
  capabilities = capabilities,
  filetypes = {
    "javascript", "javascriptreact", "javascript.jsx",
    "typescript", "typescriptreact", "typescript.tsx",
  },
})
vim.lsp.enable("ts_ls")
