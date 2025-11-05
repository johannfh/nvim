-- Enable Nerd Font, by setting the `HAVE_NERD_FONT` environment
-- variable to `true` (default: `false`)
-- export HAVE_NERD_FONT=true
if os.getenv("HAVE_NERD_FONT") == "true" then
    vim.g.have_nerd_font = true
else
    vim.g.have_nerd_font = false
end

-- Show relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Set indentation width to 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- use spaces instead of tabs
vim.opt.expandtab = true

-- Enable break indent
vim.opt.breakindent = true

vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('data') .. '/undodir'

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 150

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

vim.opt.showmode = false

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Use LF over CRLF also on windows
vim.opt.fileformats = 'unix,dos'
