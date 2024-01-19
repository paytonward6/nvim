require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")
-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").sumneko_lua.setup {}
-- require("lspconfig").rust_analyzer.setup {}
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Keymaps
local custom_attach = function(client, bufnr)
    local keymap_opts = { buffer = bufnr, silent = true, noremap = true }
    vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
    vim.keymap.set("n", "<c-]>", vim.lsp.buf.definition, keymap_opts)
    vim.keymap.set("n", "<leader>gs", vim.lsp.buf.signature_help, keymap_opts)
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, keymap_opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, keymap_opts)
    vim.keymap.set("n", "<leader>bs", vim.lsp.buf.document_symbol, keymap_opts)
    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, keymap_opts)
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, keymap_opts)
    vim.keymap.set("n", "<leader>dd", vim.diagnostic.disable, keymap_opts)
    vim.keymap.set("n", "<leader>de", vim.diagnostic.enable, keymap_opts)
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

lspconfig.r_language_server.setup{
    capabilities = capabilities,
    on_attach = function()
        custom_attach(client, bufnr)
    end,
} -- Connect to server

lspconfig.clojure_lsp.setup{
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

lspconfig.ltex.setup{
    autostart = false,
    capabilities = capabilities,
    on_attach = function()
        custom_attach(client, bufnr)
    end,
}

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

lspconfig.ruby_ls.setup{
    --capabilities = capabilities,
    --on_attach = function()
    --    custom_attach(client, bufnr)
    --end,
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


lspconfig.gopls.setup {
    capabilities = capabilities,
    on_attach = custom_attach(client, bufnr),
    cmd = {"gopls", "serve"},
    filetypes = {"go", "gomod"},
    root_idr = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  }

lspconfig.bashls.setup({
    autostart = false,
    capabilities = capabilities,
    on_attach = custom_attach,
})

lspconfig.tailwindcss.setup({
    filetypes = {"html", "js", "css"},
    capabilities = capabilities,
    on_attach = custom_attach,
})

lspconfig.lua_ls.setup({
    autostart = false,
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
