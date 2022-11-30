local fb_actions = require "telescope".extensions.file_browser.actions
require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    find_files = {
        theme = "dropdown"
    }
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
     --file_browser = {
     --  mappings = {
     --       ["i"] = {
     --           ["C-r"] = fb_actions.rename({0}),
     --       }
     --   },
     --},
    -- please take a look at the readme of the extension you want to configure
  },
  --themes = {
  --    get_ivy = true
  --}
}
require("telescope").load_extension "file_browser"
