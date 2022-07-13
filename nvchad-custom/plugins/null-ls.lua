-- Responsible for formatting:

local null_ls = require "null-ls"
local b = null_ls.builtins

--
-- nulls.formatting_sync
--

local sources = {
   -- Lua
   b.formatting.stylua,
   --b.diagnostics.luacheck.with { extra_args = { "--globals vim" } },

   -- Rust
   b.formatting.rustfmt,

   -- Cpp
   --b.formatting.clang_format,
   -- b.formatting.clang_format.with { extra_filetypes = { "cuda" } },
   -- Golang
   --b.formatting.gofmt,
   -- b.formatting.goimports,
}

local M = {}

M.setup = function()
   null_ls.setup {
      debug = true,
      sources = sources,

      -- format on save
      on_attach = function(client)
         if client.resolved_capabilities.document_formatting then
            vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
         end
      end,
   }
end

return M
