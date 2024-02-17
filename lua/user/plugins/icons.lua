return {
	-- Dependencie of `Alpha, Bufferline, Lualine, NvimTree`
	"nvim-tree/nvim-web-devicons",
	lazy = true,
	config = function()
		require("nvim-web-devicons").set_icon({
			["ini"] = {
				icon = "",
				color = "#6d8086",
				cterm_color = "66",
				name = "Ini",
			},
			[".bash_profile"] = {
				icon = "",
				color = "#89e051",
				cterm_color = "113",
				name = "BashProfile",
			},
			[".bashrc"] = {
				icon = "",
				color = "#89e051",
				cterm_color = "113",
				name = "BashProfile",
			},
			[".ds_store"] = {
				icon = "",
				color = "#41535b",
				cterm_color = "239",
				name = "DsStore",
			},
			[".gitconfig"] = {
				icon = "",
				color = "#41535b",
				cterm_color = "239",
				name = "GitConfig",
			},
			[".luaurc"] = {
				icon = "",
				color = "#00a2ff",
				cterm_color = "75",
				name = "Luaurc",
			},
			[".zprofile"] = {
				icon = "",
				color = "#89e051",
				cterm_color = "113",
				name = "Zshprofile",
			},
			[".zshenv"] = {
				icon = "",
				color = "#89e051",
				cterm_color = "113",
				name = "Zshenv",
			},
			[".zshrc"] = {
				icon = "",
				color = "#89e051",
				cterm_color = "113",
				name = "Zshrc",
			},
			["cmake"] = {
				icon = "",
				color = "#6d8086",
				cterm_color = "66",
				name = "CMake",
			},
			["gd"] = {
				icon = "",
				color = "#6d8086",
				cterm_color = "66",
				name = "GDScript",
			},
			["conf"] = {
				icon = "",
				color = "#6d8086",
				cterm_color = "66",
				name = "Conf",
			},
			["bat"] = {
				icon = "",
				color = "#C1F12E",
				cterm_color = "191",
				name = "Bat",
			},
			["xaml"] = {
				icon = "󰙳",
				color = "#512bd4",
				cterm_color = "56",
				name = "Xaml",
			},
			["xls"] = {
				icon = "󰰰",
				color = "#207245",
				cterm_color = "29",
				name = "Xls",
			},
			["xlsx"] = {
				icon = "󰰰",
				color = "#207245",
				cterm_color = "29",
				name = "Xlsx",
			},
			["xml"] = {
				icon = "",
				color = "#e37933",
				cterm_color = "166",
				name = "Xml",
			},
			["yaml"] = {
				icon = "",
				color = "#6d8086",
				cterm_color = "66",
				name = "Yaml",
			},
			["yml"] = {
				icon = "",
				color = "#6d8086",
				cterm_color = "66",
				name = "Yml",
			},
			["cmakelists.txt"] = {
				icon = "",
				color = "#6d8086",
				cterm_color = "66",
				name = "CMakeLists",
			},

			[".env"] = {
				icon = "",
				color = "#faf743",
				cterm_color = "227",
				name = "Env",
			},

			["avif"] = {
				icon = "",
				color = "#a074c4",
				cterm_color = "140",
				name = "Avif",
			},
			["scm"] = {
				icon = "",
				color = "#000000",
				cterm_color = "16",
				name = "Scheme",
			},
			["favicon.ico"] = {
				icon = "",
				color = "#cbcb41",
				cterm_color = "185",
				name = "Favicon",
			},
			["gruntfile"] = {
				icon = "",
				color = "#e37933",
				cterm_color = "166",
				name = "Gruntfile",
			},
			["pdf"] = {
				icon = "",
				color = "#b30b00",
				cterm_color = "124",
				name = "Pdf",
			},
			["ppt"] = {
				icon = "",
				color = "#cb4a32",
				cterm_color = "214",
				name = "Ppt",
			},
			["java"] = {
				icon = "",
				color = "#cc3e44",
				cterm_color = "167",
				name = "Java",
			},
			["ico"] = {
				icon = "",
				color = "#cbcb41",
				cterm_color = "185",
				name = "Ico",
			},
			["jpeg"] = {
				icon = "",
				color = "#a074c4",
				cterm_color = "140",
				name = "Jpeg",
			},
			["jpg"] = {
				icon = "",
				color = "#a074c4",
				cterm_color = "140",
				name = "Jpg",
			},
			["jxl"] = {
				icon = "",
				color = "#a074c4",
				cterm_color = "140",
				name = "JpegXl",
			},
			["webp"] = {
				icon = "",
				color = "#a074c4",
				cterm_color = "140",
				name = "Webp",
			},
			["bmp"] = {
				icon = "",
				color = "#a074c4",
				cterm_color = "140",
				name = "Bmp",
			},
			["png"] = {
				icon = "",
				color = "#a074c4",
				cterm_color = "140",
				name = "Png",
			},

			["csh"] = {
				icon = "",
				color = "#4d5a5e",
				cterm_color = "240",
				name = "Csh",
			},
			["terminal"] = {
				icon = "",
				color = "#31B53E",
				cterm_color = "34",
				name = "Terminal",
			},
			["sh"] = {
				icon = "",
				color = "#4d5a5e",
				cterm_color = "240",
				name = "Sh",
			},
			["zsh"] = {
				icon = "",
				color = "#89e051",
				cterm_color = "113",
				name = "Zsh",
			},
			["fish"] = {
				icon = "",
				color = "#4d5a5e",
				cterm_color = "240",
				name = "Fish",
			},
			["awk"] = {
				icon = "",
				color = "#4d5a5e",
				cterm_color = "240",
				name = "Awk",
			},
			["ksh"] = {
				icon = "",
				color = "#4d5a5e",
				cterm_color = "240",
				name = "Ksh",
			},
			["bash"] = {
				icon = "",
				color = "#89e051",
				cterm_color = "113",
				name = "Bash",
			},
			["gif"] = {
				icon = "",
				color = "#a074c4",
				cterm_color = "140",
				name = "Gif",
			},
			["astro"] = {
				icon = "",
				color = "#ff6400",
				cterm_color = "202",
				name = "Astro",
			},
			["js"] = {
				icon = "",
				color = "#cbcb41",
				cterm_color = "185",
				name = "Js",
			},
			["opus"] = {
				icon = "󰸪",
				color = "#F88A02",
				cterm_color = "208",
				name = "OPUS",
			},
			["php"] = {
				icon = "",
				color = "#a074c4",
				cterm_color = "140",
				name = "Php",
			},
			["tex"] = {
				icon = "",
				color = "#3D6117",
				cterm_color = "22",
				name = "Tex",
			},
			["txt"] = {
				icon = "",
				color = "#89e051",
				cterm_color = "113",
				name = "Txt",
			},
			["markdown"] = {
				icon = "",
				color = "#519aba",
				cterm_color = "74",
				name = "Markdown",
			},
			["md"] = {
				icon = "",
				color = "#ffffff",
				cterm_color = "231",
				name = "Md",
			},
			["mdx"] = {
				icon = "",
				color = "#519aba",
				cterm_color = "74",
				name = "Mdx",
			},
			["rmd"] = {
				icon = "",
				color = "#519aba",
				cterm_color = "74",
				name = "Rmd",
			},

			["doc"] = {
				icon = "",
				color = "#185abd",
				cterm_color = "26",
				name = "Doc",
			},
			["docx"] = {
				icon = "",
				color = "#185abd",
				cterm_color = "26",
				name = "Docx",
			},
			["coffee"] = {
				icon = "󰛊",
				color = "#cbcb41",
				cterm_color = "185",
				name = "Coffee",
			},
			["css"] = {
				icon = "",
				color = "#42a5f5",
				cterm_color = "75",
				name = "Css",
			},
			["tfvars"] = {
				icon = "",
				color = "#5F43E9",
				cterm_color = "93",
				name = "TFVars",
			},
			["csv"] = {
				icon = "",
				color = "#89e051",
				cterm_color = "113",
				name = "Csv",
			},

			["mint"] = {
				icon = "󰌪",
				color = "#87c095",
				cterm_color = "108",
				name = "Mint",
			},

			["pl"] = {
				icon = "",
				color = "#519aba",
				cterm_color = "74",
				name = "Pl",
			},
			["pm"] = {
				icon = "",
				color = "#519aba",
				cterm_color = "74",
				name = "Pm",
			},
			["t"] = {
				icon = "",
				color = "#519aba",
				cterm_color = "74",
				name = "Tor",
			},
			["kt"] = {
				icon = "󰰉",
				color = "#7F52FF",
				cterm_color = "99",
				name = "Kotlin",
			},
			["kts"] = {
				icon = "󰰉",
				color = "#7F52FF",
				cterm_color = "99",
				name = "KotlinScript",
			},
			["xul"] = {
				icon = "󰏚",
				color = "#e37933",
				cterm_color = "166",
				name = "Xul",
			},
			["glb"] = {
				icon = "󰏗",
				color = "#FFB13B",
				cterm_color = "214",
				name = "BinaryGLTF",
			},
			["twig"] = {
				icon = "󰥛",
				color = "#8dc149",
				cterm_color = "113",
				name = "Twig",
			},
			["nim"] = {
				icon = "",
				color = "#f3d400",
				cterm_color = "220",
				name = "Nim",
			},
			["zig"] = {
				icon = "󰵁",
				color = "#f69a1b",
				cterm_color = "172",
				name = "Zig",
			},
			["sol"] = {
				icon = "",
				color = "#519aba",
				cterm_color = "74",
				name = "Solidity",
			},
			["tf"] = {
				icon = "󱁢",
				color = "#5F43E9",
				cterm_color = "93",
				name = "Terraform",
			},
			["material"] = {
				icon = "󰍗",
				color = "#B83998",
				cterm_color = "163",
				name = "Material",
			},
			["applescript"] = {
				icon = "󰘳",
				color = "#6d8085",
				cterm_color = "66",
				name = "AppleScript",
			},
			["azcli"] = {
				icon = "",
				color = "#0078d4",
				cterm_color = "32",
				name = "AzureCli",
			},
			["procfile"] = {
				icon = "",
				color = "#a074c4",
				cterm_color = "140",
				name = "Procfile",
			},

			["toml"] = {
				icon = "󰰦",
				color = "#333333",
				cterm_color = "236",
				name = "Toml",
			},

			["mov"] = {
				icon = "",
				color = "#e9902d",
				cterm_color = "94",
				name = "MOV",
			},
			["mp4"] = {
				icon = "",
				color = "#e9902d",
				cterm_color = "94",
				name = "Mp4",
			},
			["webm"] = {
				icon = "",
				color = "#e9902d",
				cterm_color = "94",
				name = "Webm",
			},
			["mkv"] = {
				icon = "",
				color = "#e9902d",
				cterm_color = "94",
				name = "Mkv",
			},
			["m4v"] = {
				icon = "",
				color = "#e9902d",
				cterm_color = "94",
				name = "M4V",
			},
		})
	end,
}
