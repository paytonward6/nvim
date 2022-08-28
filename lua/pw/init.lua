--require("ag.autocmd") -- lua autocommands
local no_plugins = require("pw.plugins") -- plugins
require("pw.mappings")
if no_plugins then return end
require("pw.plugin-conf.treesitter")
require("pw.nvim-tree")
require("pw.plugin-conf.telescope")
require("pw.lsp_config")
require("pw.plugin-conf.nvm-cmp")
