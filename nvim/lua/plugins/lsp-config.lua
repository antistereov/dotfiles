return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "rust_analyzer", "ts_ls", "yamlls", "pyright", "angularls" },
        })

        vim.diagnostic.config({ virtual_text = true })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
}
