local ok, mason = pcall(require, "mason")
if not ok then return end

local ok_mlsp, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok_mlsp then return end

mason.setup()

mason_lspconfig.setup({
    ensure_installed = {
        "sumneko_lua",
        "rust_analyzer",
        "html",
        "cssls"
    }
})

