local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   local servers = {
      "gopls",
      "clangd",
      "rust_analyzer",
      "html",
      "cssls",
      "tsserver",
   }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = function(client, bufnr)
            attach(client, bufnr)
            -- change gopls server capabilities
            if lsp == "gopls" then
               client.resolved_capabilities.document_formatting = true
               client.resolved_capabilities.document_range_formatting = true
            end
         end,
         capabilities = capabilities,
      }
   end
end

return M
