return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
        "nvim-tree/nvim-web-devicons",
        "yavorski/lualine-macro-recording.nvim"
    },
	config = function()
        -- Bubbles config for lualine
        -- Author: lokesh-krishna
        -- MIT license, see LICENSE for more details.

        -- stylua: ignore
        local colors = {
            gray      = '#1E1E2E',
            lightgray = '#45475a',
            orange    = '#F5C2E7',
            purple    = '#b4befe',
            red       = '#F38BA8',
            yellow    = '#F9E2AF',
            green     = '#A6E3A1',
            white     = '#BAC2DE',
            black     = '#45475A',
        }

		local custom_theme = {
			normal = {
				a = { bg = colors.purple, fg = colors.black, gui = "bold" },
				b = { bg = colors.lightgray, fg = colors.white },
				c = { bg = colors.gray, fg = colors.white },
			},
			insert = {
				a = { bg = colors.green, fg = colors.black, gui = "bold" },
				b = { bg = colors.lightgray, fg = colors.white },
				c = { bg = colors.gray, fg = colors.white },
			},
			visual = {
				a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
				b = { bg = colors.lightgray, fg = colors.white },
				c = { bg = colors.gray, fg = colors.white },
			},
			replace = {
				a = { bg = colors.red, fg = colors.black, gui = "bold" },
				b = { bg = colors.lightgray, fg = colors.white },
				c = { bg = colors.gray, fg = colors.white },
			},
			command = {
				a = { bg = colors.orange, fg = colors.black, gui = "bold" },
				b = { bg = colors.lightgray, fg = colors.white },
				c = { bg = colors.gray, fg = colors.white },
			},
			inactive = {
				a = { bg = colors.gray, fg = colors.white, gui = "bold" },
				b = { bg = colors.lightgray, fg = colors.white },
				c = { bg = colors.gray, fg = colors.white },
			},
		}

		require("lualine").setup({
			options = {
				theme = custom_theme,
				component_separators = "",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
				lualine_b = { "filename", "branch", "diff" },
				lualine_c = {
					"macro_recording", "%S" --[[ add your center components here in place of this comment ]]
				},
				lualine_x = {},
				lualine_y = { "filetype", "progress" },
				lualine_z = {
					{ "location", separator = { right = "" }, left_padding = 2 },
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
			extensions = {},
		})
	end,
}
