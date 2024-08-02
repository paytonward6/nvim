require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")
-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").sumneko_lua.setup {}
-- require("lspconfig").rust_analyzer.setup {}
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Keymaps
local custom_attach = require("pw.lsp").custom_attach
-- Language Setups
--

lspconfig.elixirls.setup {
    cmd = {vim.fn.resolve(vim.fn.stdpath "data" .. "/mason/packages/elixir-ls/language_server.sh")},
    capabilities = capabilities,
    on_attach = function()
        custom_attach(client, bufnr)
    end,
}

lspconfig.pyright.setup{
    capabilities = capabilities,
    on_attach = function()
        custom_attach(client, bufnr)
    end,
} -- Connect to server

lspconfig.gleam.setup{
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


--lspconfig.tsserver.setup{
--    capabilities = capabilities,
--    on_attach = function()
--        custom_attach(client, bufnr)
--    end,
--} -- Connect to server

lspconfig.ltex.setup{
    autostart = false,
    capabilities = capabilities,
    on_attach = function()
        custom_attach(client, bufnr)
    end,
}

lspconfig.cssls.setup{
    capabilities = capabilities,
    filetypes={"css", "scss", "less", "html", "heex"},
    on_attach = function()
        custom_attach(client, bufnr)
    end,
} -- Connect to server

lspconfig.html.setup{
    filetypes = {"html", "heex"},
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
    autostart = true,
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
