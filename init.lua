local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(require("pw.plugins"))


-- Essentials
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.python3_host_skip_check = 1
vim.g.bulitin_lsp = true
vim.g.markdown_folding = 1
vim.opt.spelllang = 'en_us'
vim.opt.filetype = "on"

-- Netrw
--vim.g.netrw_browse_split = 3
--vim.g.netrw_winsize = 75
--vim.g.netrw_preview = 1
--vim.g.sort_by = "exten"
--vim.g.netrw_banner = 0

vim.opt.clipboard:append("unnamedplus")


-- Colors
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- COLORSCHEME
--vim.cmd('colorscheme catppuccin')
vim.cmd.colorscheme('tokyonight-moon')
vim.cmd('highlight VertSplit guifg=#aab4be')


-- Behaviors
-- Make 'H' open help in vertical split
vim.opt.belloff = "all" -- NO BELLS!
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- ins-completion how vsnip likes it
vim.opt.swapfile = false -- no swap files
vim.opt.inccommand = "nosplit" -- preview %s commands live as I type
vim.opt.undofile = true -- keep track of my 'undo's between sessions
vim.opt.grepprg = "rg --vimgrep --smart-case --no-heading" -- search with rg
vim.opt.grepformat = "%f:%l:%c:%m" -- filename:line number:column number:error message
vim.opt.mouse = "nv" -- use mouse in normal, visual modes

-- Indentation
vim.opt.autoindent = true -- continue indentation to new line
vim.opt.smartindent = true -- add extra indent when it makes sense
vim.opt.smarttab = true -- <Tab> at the start of a line behaves as expected
vim.opt.expandtab = true -- <Tab> inserts spaces
vim.opt.shiftwidth = 4 -- >>, << shift line by 4 spaces
vim.opt.tabstop = 4 -- <Tab> appears as 4 spaces
vim.opt.softtabstop = 4 -- <Tab> behaves as 4 spaces when editing


--vim.cmd("highlight! default link GitSignsDeleteLn GitSignsDelete") -- render deleted lines in preview window correctly
-- Look and feel
vim.opt.number = true -- numbers?
vim.opt.relativenumber = true
vim.opt.signcolumn = "auto" -- show the sign column if necessary
vim.opt.cursorline = false -- don't highlight current line
vim.opt.list = true -- show list chars
vim.opt.listchars:append({
    -- these list chars
    nbsp = "␣",
    extends = "…",
    precedes = "…",
    trail = "·",
    --multispace = "·",
})
vim.opt.scrolloff = 5 -- padding between cursor and top/bottom of window
vim.opt.foldlevel = 1 -- allow folding the whole way down
vim.opt.foldlevelstart = 99 -- open files with all folds open
vim.opt.splitright = true -- prefer vsplitting to the right
vim.opt.splitbelow = true -- prefer splitting below
vim.opt.wrap = true -- don't wrap my text
vim.opt.linebreak = true
--vim.opt.textwidth = 120 -- wrap here for comments by default
vim.opt.cursorline = true -- hightlight line cursor is on
vim.opt.laststatus = 3 -- single global statusline

-- Searching
vim.opt.wildmenu = true -- tab complete on command line
vim.opt.wildmode = {"list", "full"} -- see `:h wildmode`
vim.opt.ignorecase = false -- case sensitive search...
vim.opt.smartcase = true -- unless I use caps
vim.opt.hlsearch = true -- highlight matching text
vim.opt.incsearch = true -- update results while I type

require("pw") -- load my lua configs
