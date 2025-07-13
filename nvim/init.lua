require("config.lazy")
require("config.keymap")

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set nowrap")
vim.cmd("set clipboard+=unnamedplus")

vim.opt.spell = true
vim.opt.spelllang = "en_us"
vim.opt.spelloptions:append("camel")
vim.wo.relativenumber = true
vim.opt.number = true
