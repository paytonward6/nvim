-- || Native LSP Setup ||
local lspconfig = require("lspconfig")

  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Keymaps
local custom_attach = function(client, bufnr)
    local keymap_opts = { buffer = bufnr, silent = true, noremap = true }
    vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
    vim.keymap.set("n", "<c-]>", vim.lsp.buf.definition, keymap_opts)
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, keymap_opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, keymap_opts)
    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, keymap_opts)
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, keymap_opts)
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, keymap_opts)
    vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, keymap_opts)
    vim.keymap.set("n", "<leader>dl", vim.diagnostic.open_float, keymap_opts)
end

-- Language Setups

lspconfig.pyright.setup{
    capabilities = capabilities,
    on_attach = function()
        custom_attach(client, bufnr)
    end,
} -- Connect to server


lspconfig.tsserver.setup{
    capabilities = capabilities,
    on_attach = function()
        custom_attach(client, bufnr)
    end,
} -- Connect to server

lspconfig.cssls.setup{
    capabilities = capabilities,
    filetypes={"css", "scss", "less", "html"},
    on_attach = function()
        custom_attach(client, bufnr)
    end,
} -- Connect to server

lspconfig.html.setup{
    capabilities = capabilities,
    on_attach = function()
        custom_attach(client, bufnr)
    end,
} -- Connect to server

lspconfig.texlab.setup{
    capabilities = capabilities,
    filetypes = {"org", "plaintex", "tex"},
    on_attach = function()
        custom_attach(client, bufnr)
    end,
}

lspconfig.jdtls.setup{
    capabilities = capabilities,
    on_attach = function()
        custom_attach(client, bufnr)
    end,
}

lspconfig.solargraph.setup{
    filetypes = {"*.rb"},
    capabilities = capabilities,
    on_attach = function()
        custom_attach(client, bufnr)
    end,
}

lspconfig.rust_analyzer.setup({
    on_attach = function()
        custom_attach(client, bufnr)
    end,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
})

lspconfig.clangd.setup{
    --capabilities = capabilities,
    on_attach = function()
        custom_attach(client, bufnr)
    end,
}

lspconfig.bashls.setup({
    capabilities = capabilities,
    on_attach = custom_attach,
})

lspconfig.sumneko_lua.setup({
    capabilities = capabilities,
    on_attach = custom_attach,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})
