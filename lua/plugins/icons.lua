return {
	"nvim-tree/nvim-web-devicons",
	lazy = true,
	config = function()
		local devicons = require("nvim-web-devicons")
		devicons.set_default_icon("", "#6d8086", 65)
		local icon_replacements = {
			[""] = "",
		}
		for filetype, icon_data in pairs(devicons.get_icons()) do
			local new_icon = icon_replacements[icon_data.icon]
			if new_icon then
				devicons.set_icon({
					[filetype] = vim.tbl_extend("force", icon_data, { icon = new_icon }),
				})
			end
		end
		devicons.set_icon({
			[".babelrc"] = {
				icon = "ʙ",
				color = "#cbcb41",
				cterm_color = "185",
				name = "Babelrc",
			},
			[".env"] = {
				icon = "",
				color = "#FaF743",
				cterm_color = "227",
				name = "Env",
			},
			["env"] = {
				icon = "",
				color = "#faf743",
				cterm_color = "227",
				name = "Env",
			},
			[".SRCINFO"] = {
				icon = "",
				color = "#0F94d2",
				cterm_color = "67",
				name = "SRCINFO",
			},
			["avif"] = {
				icon = "",
				color = "#a074c4",
				cterm_color = "140",
				name = "Avif",
			},
			["build.zig.zon"] = {
				icon = "ℤ",
				color = "#F69a1b",
				cterm_color = "172",
				name = "ZigObjectNotation",
			},
			["zig"] = {
				icon = "ℤ",
				color = "#F69a1b",
				cterm_color = "172",
				name = "Zig",
			},
			["favicon.ico"] = {
				icon = "",
				color = "#cbcb41",
				cterm_color = "185",
				name = "Favicon",
			},
			["gleam"] = {
				icon = "",
				color = "#ffaff3",
				cterm_color = "219",
				name = "Gleam",
			},
			["i18n.config.js"] = {
				icon = "󰊿",
				color = "#7986cb",
				cterm_color = "104",
				name = "I18nConfig",
			},
			["i18n.config.ts"] = {
				icon = "󰊿",
				color = "#7986cb",
				cterm_color = "104",
				name = "I18nConfig",
			},
			["kdenlive"] = {
				icon = "",
				color = "#83b8F2",
				cterm_color = "110",
				name = "Kdenlive",
			},
			["kdenlivetitle"] = {
				icon = "",
				color = "#83b8F2",
				cterm_color = "110",
				name = "Kdenlive",
			},
			["kdenlive-layoutsrc"] = {
				icon = "",
				color = "#83b8F2",
				cterm_color = "110",
				name = "KdenliveLayoutsrc",
			},
			["kdenliverc"] = {
				icon = "",
				color = "#83b8F2",
				cterm_color = "110",
				name = "Kdenliverc",
			},
			["kritadisplayrc"] = {
				icon = "",
				color = "#F245Fb",
				cterm_color = "201",
				name = "Kritadisplayrc",
			},
			["kritarc"] = {
				icon = "",
				color = "#F245Fb",
				cterm_color = "201",
				name = "Kritarc",
			},
			["kpp"] = {
				icon = "",
				color = "#F245Fb",
				cterm_color = "201",
				name = "Krita",
			},
			["kra"] = {
				icon = "",
				color = "#F245Fb",
				cterm_color = "201",
				name = "Krita",
			},
			["krz"] = {
				icon = "",
				color = "#F245Fb",
				cterm_color = "201",
				name = "Krita",
			},
			["PKGBUILD"] = {
				icon = "",
				color = "#0F94d2",
				cterm_color = "67",
				name = "PKGBUILD",
			},
			["pom.xml"] = {
				icon = "",
				color = "#7a0d21",
				cterm_color = "52",
				name = "Maven",
			},
			["procfile"] = {
				icon = "",
				color = "#a074c4",
				cterm_color = "140",
				name = "Procfile",
			},
			["rmd"] = {
				icon = "",
				color = "#519aba",
				cterm_color = "74",
				name = "Rmd",
			},
			["markdown"] = {
				icon = "",
				color = "#519aba",
				cterm_color = "74",
				name = "Markdown",
			},
			["md"] = {
				icon = "",
				color = "#FFFFFF",
				cterm_color = "231",
				name = "Md",
			},
			["mdx"] = {
				icon = "",
				color = "#519aba",
				cterm_color = "74",
				name = "Mdx",
			},
			["security"] = {
				icon = "",
				color = "#BEC4C9",
				cterm_color = "251",
				name = "Security",
			},
			["security.md"] = {
				icon = "",
				color = "#BEC4C9",
				cterm_color = "251",
				name = "Security",
			},
			["tsconfig.json"] = {
				icon = "",
				color = "#519aba",
				cterm_color = "74",
				name = "TSConfig",
			},
			["vercel.json"] = {
				icon = "",
				color = "#ffffff",
				cterm_color = "231",
				name = "Vercel",
			},
			["workspace"] = {
				icon = "󰟀",
				color = "#89e051",
				cterm_color = "113",
				name = "BazelWorkspace",
			},
			["3gp"] = {
				icon = "",
				color = "#FD971F",
				cterm_color = "208",
				name = "3gp",
			},
			["app"] = {
				icon = "󰀲",
				color = "#9F0500",
				cterm_color = "124",
				name = "App",
			},
			["applescript"] = {
				icon = "󰘳",
				color = "#6d8085",
				cterm_color = "66",
				name = "AppleScript",
			},
			["ass"] = {
				icon = "󰨗",
				color = "#FFb713",
				cterm_color = "214",
				name = "Ass",
			},
			["lrc"] = {
				icon = "󰨗",
				color = "#FFb713",
				cterm_color = "214",
				name = "Lrc",
			},
			["srt"] = {
				icon = "󰨗",
				color = "#FFb713",
				cterm_color = "214",
				name = "Srt",
			},
			["ssa"] = {
				icon = "󰨗",
				color = "#FFb713",
				cterm_color = "214",
				name = "Ssa",
			},
			["sub"] = {
				icon = "󰨗",
				color = "#FFb713",
				cterm_color = "214",
				name = "Sub",
			},
			["astro"] = {
				icon = "",
				color = "#e23f67",
				cterm_color = "197",
				name = "Astro",
			},
			["awk"] = {
				icon = "",
				color = "#4d5a5e",
				cterm_color = "240",
				name = "Awk",
			},
			["bash"] = {
				icon = "",
				color = "#89e051",
				cterm_color = "113",
				name = "Bash",
			},
			["csh"] = {
				icon = "",
				color = "#4d5a5e",
				cterm_color = "240",
				name = "Csh",
			},
			["fish"] = {
				icon = "",
				color = "#4d5a5e",
				cterm_color = "240",
				name = "Fish",
			},
			["ksh"] = {
				icon = "",
				color = "#4d5a5e",
				cterm_color = "240",
				name = "Ksh",
			},
			["sh"] = {
				icon = "",
				color = "#4d5a5e",
				cterm_color = "240",
				name = "Sh",
			},
			["zsh"] = {
				icon = "",
				color = "#89e051",
				cterm_color = "113",
				name = "Zsh",
			},
			["bak"] = {
				icon = "",
				color = "#6d8086",
				cterm_color = "66",
				name = "Backup",
			},
			["bib"] = {
				icon = "",
				color = "#cbcb41",
				cterm_color = "185",
				name = "BibTeX",
			},
			["bmp"] = {
				icon = "",
				color = "#a074c4",
				cterm_color = "140",
				name = "Bmp",
			},
			["gif"] = {
				icon = "",
				color = "#a074c4",
				cterm_color = "140",
				name = "Gif",
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
			["png"] = {
				icon = "",
				color = "#a074c4",
				cterm_color = "140",
				name = "Png",
			},
			["webp"] = {
				icon = "",
				color = "#a074c4",
				cterm_color = "140",
				name = "Webp",
			},
			["brep"] = {
				icon = "󰺾",
				color = "#839463",
				cterm_color = "101",
				name = "BoundaryRepresentation",
			},
			["dwg"] = {
				icon = "󰺾",
				color = "#839463",
				cterm_color = "101",
				name = "AutoCADDwg",
			},
			["dxf"] = {
				icon = "󰺾",
				color = "#839463",
				cterm_color = "101",
				name = "AutoCADDxf",
			},
			["f3d"] = {
				icon = "󰺾",
				color = "#839463",
				cterm_color = "101",
				name = "Fusion360",
			},
			["ifc"] = {
				icon = "󰺾",
				color = "#839463",
				cterm_color = "101",
				name = "Ifc",
			},
			["ige"] = {
				icon = "󰺾",
				color = "#839463",
				cterm_color = "101",
				name = "Ige",
			},
			["iges"] = {
				icon = "󰺾",
				color = "#839463",
				cterm_color = "101",
				name = "Iges",
			},
			["igs"] = {
				icon = "󰺾",
				color = "#839463",
				cterm_color = "101",
				name = "Igs",
			},
			["skp"] = {
				icon = "󰺾",
				color = "#839463",
				cterm_color = "101",
				name = "SketchUp",
			},
			["sldasm"] = {
				icon = "󰺾",
				color = "#839463",
				cterm_color = "101",
				name = "SolidWorksAsm",
			},
			["sldprt"] = {
				icon = "󰺾",
				color = "#839463",
				cterm_color = "101",
				name = "SolidWorksPrt",
			},
			["slvs"] = {
				icon = "󰺾",
				color = "#839463",
				cterm_color = "101",
				name = "SolveSpace",
			},
			["ste"] = {
				icon = "󰺾",
				color = "#839463",
				cterm_color = "101",
				name = "Ste",
			},
			["step"] = {
				icon = "󰺾",
				color = "#839463",
				cterm_color = "101",
				name = "Step",
			},
			["stp"] = {
				icon = "󰺾",
				color = "#839463",
				cterm_color = "101",
				name = "Stp",
			},
			["cast"] = {
				icon = "󰄘",
				color = "#FD971F",
				cterm_color = "208",
				name = "Asciinema",
			},
			["cr"] = {
				icon = "",
				color = "#c8c8c8",
				cterm_color = "251",
				name = "Crystal",
			},
			["cson"] = {
				icon = "",
				color = "#cbcb41",
				cterm_color = "185",
				name = "Cson",
			},
			["css"] = {
				icon = "",
				color = "#42a5F5",
				cterm_color = "75",
				name = "Css",
			},
			["json"] = {
				icon = "",
				color = "#cbcb41",
				cterm_color = "185",
				name = "Json",
			},
			["json5"] = {
				icon = "",
				color = "#cbcb41",
				cterm_color = "185",
				name = "Json5",
			},
			["jsonc"] = {
				icon = "",
				color = "#cbcb41",
				cterm_color = "185",
				name = "Jsonc",
			},
			["nswag"] = {
				icon = "",
				color = "#85ea2d",
				cterm_color = "112",
				name = "Nswag",
			},
			["webmanifest"] = {
				icon = "",
				color = "#F1e05a",
				cterm_color = "185",
				name = "Webmanifest",
			},
			["desktop"] = {
				icon = "󰟀",
				color = "#563d7c",
				cterm_color = "54",
				name = "DesktopEntry",
			},
			["diff"] = {
				icon = "",
				color = "#41535b",
				cterm_color = "239",
				name = "Diff",
			},
			["patch"] = {
				icon = "",
				color = "#41535b",
				cterm_color = "239",
				name = "Patch",
			},
			["doc"] = {
				icon = "󱎒",
				color = "#185abd",
				cterm_color = "26",
				name = "Doc",
			},
			["docx"] = {
				icon = "󱎒",
				color = "#185abd",
				cterm_color = "26",
				name = "Docx",
			},
			["dropbox"] = {
				icon = "",
				color = "#0061FE",
				cterm_color = "27",
				name = "Dropbox",
			},
			["eot"] = {
				icon = "𝑨",
				color = "#ECECEC",
				cterm_color = "255",
				name = "EmbeddedOpenTypeFont",
			},
			["flc"] = {
				icon = "𝑨",
				color = "#ECECEC",
				cterm_color = "255",
				name = "FIGletFontControl",
			},
			["flf"] = {
				icon = "𝑨",
				color = "#ECECEC",
				cterm_color = "255",
				name = "FIGletFontFormat",
			},
			["lff"] = {
				icon = "𝑨",
				color = "#ECECEC",
				cterm_color = "255",
				name = "LibrecadFontFile",
			},
			["otf"] = {
				icon = "𝑨",
				color = "#ECECEC",
				cterm_color = "255",
				name = "OpenTypeFont",
			},
			["ttf"] = {
				icon = "𝑨",
				color = "#ECECEC",
				cterm_color = "255",
				name = "TrueTypeFont",
			},
			["woff"] = {
				icon = "𝑨",
				color = "#ECECEC",
				cterm_color = "255",
				name = "WebOpenFontFormat",
			},
			["woff2"] = {
				icon = "𝑨",
				color = "#ECECEC",
				cterm_color = "255",
				name = "WebOpenFontFormat",
			},
			["glb"] = {
				icon = "",
				color = "#FFB13B",
				cterm_color = "214",
				name = "BinaryGLTF",
			},
			["h"] = {
				icon = "ℍ",
				color = "#a074c4",
				cterm_color = "140",
				name = "H",
			},
			["hh"] = {
				icon = "ℍ",
				color = "#a074c4",
				cterm_color = "140",
				name = "Hh",
			},
			["hpp"] = {
				icon = "ℍ",
				color = "#a074c4",
				cterm_color = "140",
				name = "Hpp",
			},
			["hxx"] = {
				icon = "ℍ",
				color = "#a074c4",
				cterm_color = "140",
				name = "Hxx",
			},
			["hurl"] = {
				icon = "󰴽",
				color = "#FF0288",
				cterm_color = "198",
				name = "Hurl",
			},
			["info"] = {
				icon = "",
				color = "#FFFFcd",
				cterm_color = "230",
				name = "Info",
			},
			["nfo"] = {
				icon = "",
				color = "#FFFFcd",
				cterm_color = "230",
				name = "Nfo",
			},
			["nu"] = {
				icon = "",
				color = "#3aa675",
				cterm_color = "36",
				name = "Nushell",
			},
			["java"] = {
				icon = "",
				color = "#cc3e44",
				cterm_color = "167",
				name = "Java",
			},
			["kbx"] = {
				icon = "",
				color = "#737672",
				cterm_color = "243",
				name = "Kbx",
			},
			["kt"] = {
				icon = "𝐊",
				color = "#7F52FF",
				cterm_color = "99",
				name = "Kotlin",
			},
			["kts"] = {
				icon = "𝐊",
				color = "#7F52FF",
				cterm_color = "99",
				name = "KotlinScript",
			},
			["less"] = {
				icon = "",
				color = "#F3F7EF",
				cterm_color = "54",
				name = "Less",
			},
			["m4v"] = {
				icon = "",
				color = "#e9902d",
				cterm_color = "94",
				name = "M4V",
			},
			["mkv"] = {
				icon = "",
				color = "#e9902d",
				cterm_color = "94",
				name = "Mkv",
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
			["material"] = {
				icon = "󰍗",
				color = "#B83998",
				cterm_color = "163",
				name = "Material",
			},
			["mint"] = {
				icon = "",
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
			["po"] = {
				icon = "󰊿",
				color = "#2596be",
				cterm_color = "31",
				name = "Localization",
			},
			["pot"] = {
				icon = "󰊿",
				color = "#2596be",
				cterm_color = "31",
				name = "Localization",
			},
			["qm"] = {
				icon = "󰊿",
				color = "#2596be",
				cterm_color = "31",
				name = "Localization",
			},
			["strings"] = {
				icon = "󰊿",
				color = "#2596be",
				cterm_color = "31",
				name = "Localization",
			},
			["xcstrings"] = {
				icon = "󰊿",
				color = "#2596be",
				cterm_color = "31",
				name = "XcLocalization",
			},
			["ppt"] = {
				icon = "󰐨",
				color = "#cb4a32",
				cterm_color = "214",
				name = "Ppt",
			},
			["prisma"] = {
				icon = "󱥒",
				color = "#5a67d8",
				cterm_color = "62",
				name = "Prisma",
			},
			["ps1"] = {
				icon = "",
				color = "#4273ca",
				cterm_color = "68",
				name = "PsScriptfile",
			},
			["psd1"] = {
				icon = "",
				color = "#6975c4",
				cterm_color = "68",
				name = "PsManifestfile",
			},
			["psm1"] = {
				icon = "",
				color = "#6975c4",
				cterm_color = "68",
				name = "PsScriptModulefile",
			},
			["sol"] = {
				icon = "",
				color = "#519aba",
				cterm_color = "74",
				name = "Solidity",
			},
			["spec.js"] = {
				icon = "",
				color = "#cbcb41",
				cterm_color = "185",
				name = "SpecJs",
			},
			["spec.jsx"] = {
				icon = "",
				color = "#20c2e3",
				cterm_color = "45",
				name = "JavaScriptReactSpec",
			},
			["spec.ts"] = {
				icon = "",
				color = "#519aba",
				cterm_color = "74",
				name = "SpecTs",
			},
			["spec.tsx"] = {
				icon = "",
				color = "#1354bf",
				cterm_color = "26",
				name = "TypeScriptReactSpec",
			},
			["test.js"] = {
				icon = "",
				color = "#cbcb41",
				cterm_color = "185",
				name = "TestJs",
			},
			["test.jsx"] = {
				icon = "",
				color = "#20c2e3",
				cterm_color = "45",
				name = "JavaScriptReactTest",
			},
			["test.ts"] = {
				icon = "",
				color = "#519aba",
				cterm_color = "74",
				name = "TestTs",
			},
			["test.tsx"] = {
				icon = "",
				color = "#1354bf",
				cterm_color = "26",
				name = "TypeScriptReactTest",
			},
			["svg"] = {
				icon = "󰕙",
				color = "#FFb13b",
				cterm_color = "214",
				name = "Svg",
			},
			["swift"] = {
				icon = "󰀷",
				color = "#e37933",
				cterm_color = "166",
				name = "Swift",
			},
			["xcplayground"] = {
				icon = "󰀷",
				color = "#e37933",
				cterm_color = "166",
				name = "XcPlayground",
			},
			["terminal"] = {
				icon = "",
				color = "#31B53E",
				cterm_color = "34",
				name = "Terminal",
			},
			["toml"] = {
				icon = "",
				color = "#FFFFFF",
				cterm_color = "236",
				name = "Toml",
			},
			["twig"] = {
				icon = "󰪂",
				color = "#8dc149",
				cterm_color = "113",
				name = "Twig",
			},
			["txt"] = {
				icon = "",
				color = "#89e051",
				cterm_color = "113",
				name = "Txt",
			},
			["vue"] = {
				icon = "",
				color = "#8dc149",
				cterm_color = "113",
				name = "Vue",
			},
			["xcf"] = {
				icon = "",
				color = "#635b46",
				cterm_color = "240",
				name = "GIMP",
			},
			["xls"] = {
				icon = "󱎏",
				color = "#207245",
				cterm_color = "29",
				name = "Xls",
			},
			["xlsx"] = {
				icon = "󱎏",
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
			["xul"] = {
				icon = "",
				color = "#e37933",
				cterm_color = "166",
				name = "Xul",
			},
			["c"] = {
				icon = "",
				color = "#599eFF",
				cterm_color = "74",
				name = "C",
			},
			["cp"] = {
				icon = "",
				color = "#519aba",
				cterm_color = "74",
				name = "Cp",
			},
			["cpp"] = {
				icon = "",
				color = "#519aba",
				cterm_color = "74",
				name = "Cpp",
			},
		})
	end,
}
