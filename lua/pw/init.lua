require("pw.mappings")
local no_plugins = require("pw.plugins") -- plugins
if no_plugins then return end
require("pw.plugin-conf.treesitter")
require("pw.nvim-tree")
require("pw.plugin-conf.telescope")
require("pw.lsp_config")
require("pw.plugin-conf.nvm-cmp")
require("pw.autocmd")
require("pw.plugin-conf.lualine")
require("pw.plugin-conf.harpoon")
--require("pw.plugin-conf.true-zen")
