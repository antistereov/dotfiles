return {
	"voldikss/vim-floaterm",
	config = function()
		vim.keymap.set("n", "<leader>ft", ":FloatermNew<CR>")
	end,
}
