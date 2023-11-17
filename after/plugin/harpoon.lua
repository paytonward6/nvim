-- Harpoon Configuration --

-- Keymaps --
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>ha", '<cmd>lua require("harpoon.mark").add_file()<CR>', opts)
vim.keymap.set("n", "<leader>hr", '<cmd>lua require("harpoon.mark").rm_file()<CR>', opts)
vim.keymap.set("n", "<leader>hh", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)

-- Global Settings

require("harpoon").setup({
    global_settings = {
    -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
    save_on_toggle = false,

    -- saves the harpoon file upon every change. disabling is unrecommended.
    save_on_change = true,

    -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
    enter_on_sendcmd = false,

    -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
    tmux_autoclose_windows = false,

    -- filetypes that you want to prevent from adding to the harpoon list menu.
    excluded_filetypes = { "harpoon" },

    -- set marks specific to each git branch inside git repository
    mark_branch = false,
}
})
