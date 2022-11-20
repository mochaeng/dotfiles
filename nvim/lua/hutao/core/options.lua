local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tab/identation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearence
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspaces
opt.backspace = "indent,eol,start"

-- clibboard
opt.clipboard = "unnamedplus"
