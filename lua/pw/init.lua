--require("ag.autocmd") -- lua autocommands
local no_plugins = require("pw.plugins") -- plugins
require("pw.mappings")
if no_plugins then return end
require("pw.treesitter")
require("pw.nvim-tree")
