return {
	"nvim-tree/nvim-web-devicons",
	lazy = true,
	config = function()
		require("nvim-web-devicons").set_icon({
			pdf = {
				icon = "",
				color = "#b30b00",
				cterm_color = "124",
				name = "Pdf",
			},
			ppt = {
				icon = "",
				color = "#cb4a32",
				cterm_color = "214",
				name = "Ppt",
			},
			astro = {
				icon = "",
				color = "#ff6400",
				cterm_color = "202",
				name = "Astro",
			},
			rb = {
				icon = "",
				color = "#a51401",
				cterm_color = "52",
				name = "Ruby",
			},
			gql = {
				icon = "",
				color = "#e535ab",
				cterm_color = "199",
				name = "GraphQL",
			},
		})
	end,
}
