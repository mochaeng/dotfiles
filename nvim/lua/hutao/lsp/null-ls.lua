local ok, null_ls = pcall(require, "null-ls")
if not ok then
	return
end

local formatting = null_ls.builtins.formatting

local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		formatting.stylua,
		formatting.prettier,
	},
	-- formatting on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							-- apply whatever logic you want (in this example, we'll only use null-ls)
							return client.name == "null-ls"
						end,
						-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
						bufnr = bufnr,
					})
					--vim.lsp.buf.formatting_sync()
				end,
			})
		end
	end,
})
