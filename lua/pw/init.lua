require("pw.mappings")
local no_plugins = require("pw.plugins") -- plugins
if no_plugins then return end
require("pw.plugin-conf.mini")
require("pw.plugin-conf.treesitter")
--require("pw.plugin-conf.nvim-tree")
require("pw.plugin-conf.telescope")
--require("pw.plugin-conf.lsp_config")
require("pw.plugin-conf.nvm-cmp")
require("pw.autocmd")
require("pw.plugin-conf.lualine")
--require("pw.plugin-conf.harpoon")
require("pw.plugin-conf.orgmode")
require("pw.plugin-conf.whichkey")
--require("pw.plugin-conf.rust-tools")
--require("pw.plugin-conf.dap")
require("pw.plugin-conf.metals")
require("pw.plugin-conf.indent-blankline")
--require("pw.plugin-conf.nvim-scrollbar")

require("pw.plugin-conf.mason")
