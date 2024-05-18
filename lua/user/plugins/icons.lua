return {
	"nvim-tree/nvim-web-devicons",
	lazy = true,
	config = function()
		require("nvim-web-devicons").set_default_icon("", "#6d8086", 65)
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
				icon = "",
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
				color = "#00a2FF",
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
				icon = "",
				color = "#207245",
				cterm_color = "29",
				name = "Xls",
			},
			["xlsx"] = {
				icon = "",
				color = "#207245",
				cterm_color = "29",
				name = "Xlsx",
			},
			["templ"] = {
				icon = "",
				color = "#dbbd30",
				cterm_color = "178",
				name = "Templ",
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
				color = "#FaF743",
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
				icon = "",
				color = "#cbcb41",
				cterm_color = "185",
				name = "Favicon",
			},
			["gruntfile"] = {
				icon = "",
				color = "#e37933",
				cterm_color = "166",
				name = "Gruntfile",
			},
			["ppt"] = {
				icon = "󰐩",
				color = "#cb4a32",
				cterm_color = "214",
				name = "Ppt",
			},
			["java"] = {
				icon = "",
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
				icon = "",
				color = "#4d5a5e",
				cterm_color = "240",
				name = "Csh",
			},
			["terminal"] = {
				icon = "",
				color = "#31B53E",
				cterm_color = "34",
				name = "Terminal",
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
			["fish"] = {
				icon = "",
				color = "#4d5a5e",
				cterm_color = "240",
				name = "Fish",
			},
			["awk"] = {
				icon = "",
				color = "#4d5a5e",
				cterm_color = "240",
				name = "Awk",
			},
			["ksh"] = {
				icon = "",
				color = "#4d5a5e",
				cterm_color = "240",
				name = "Ksh",
			},
			["bash"] = {
				icon = "",
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
				color = "#FF6400",
				cterm_color = "202",
				name = "Astro",
			},
			["cjs"] = {
				icon = "",
				color = "#cbcb41",
				cterm_color = "185",
				name = "Cjs",
			},
			["mjs"] = {
				icon = "",
				color = "#F1e05a",
				cterm_color = "185",
				name = "Mjs",
			},
			["js"] = {
				icon = "",
				color = "#cbcb41",
				cterm_color = "185",
				name = "Js",
			},
			["ogg"] = {
				icon = "",
				color = "#66D8EF",
				cterm_color = "45",
				name = "Ogg",
			},
			["opus"] = {
				icon = "",
				color = "#F88A02",
				cterm_color = "208",
				name = "OPUS",
			},
			["tex"] = {
				icon = "",
				color = "#3D6117",
				cterm_color = "22",
				name = "Tex",
			},
			["txt"] = {
				icon = "",
				color = "#89e051",
				cterm_color = "113",
				name = "Txt",
			},
			["markdown"] = {
				icon = "",
				color = "#519aba",
				cterm_color = "74",
				name = "Markdown",
			},
			["md"] = {
				icon = "",
				color = "#FFFFFF",
				cterm_color = "231",
				name = "Md",
			},
			["mdx"] = {
				icon = "",
				color = "#519aba",
				cterm_color = "74",
				name = "Mdx",
			},
			["rmd"] = {
				icon = "",
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
			["less"] = {
				icon = "",
				color = "#F3F7EF",
				cterm_color = "54",
				name = "Less",
			},
			["css"] = {
				icon = "",
				color = "#42a5F5",
				cterm_color = "75",
				name = "Css",
			},
			["tfvars"] = {
				icon = "",
				color = "#5F43E9",
				cterm_color = "93",
				name = "TFVars",
			},
			["csv"] = {
				icon = "",
				color = "#89e051",
				cterm_color = "113",
				name = "Csv",
			},
			["mint"] = {
				icon = "󰣭",
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
				icon = "",
				color = "#7F52FF",
				cterm_color = "99",
				name = "Kotlin",
			},
			["kts"] = {
				icon = "",
				color = "#7F52FF",
				cterm_color = "99",
				name = "KotlinScript",
			},
			["xul"] = {
				icon = "",
				color = "#e37933",
				cterm_color = "166",
				name = "Xul",
			},
			["glb"] = {
				icon = "",
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
				color = "#F3d400",
				cterm_color = "220",
				name = "Nim",
			},
			["build.zig.zon"] = {
				icon = "󰵁",
				color = "#F69a1b",
				cterm_color = "172",
				name = "ZigObjectNotation",
			},
			["zig"] = {
				icon = "󰵁",
				color = "#F69a1b",
				cterm_color = "172",
				name = "Zig",
			},
			["sol"] = {
				icon = "",
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
				icon = "󰯭",
				color = "#0078d4",
				cterm_color = "32",
				name = "AzureCli",
			},
			["procfile"] = {
				icon = "󰰉",
				color = "#a074c4",
				cterm_color = "140",
				name = "Procfile",
			},
			["toml"] = {
				icon = "",
				color = "#FFFFFF",
				cterm_color = "236",
				name = "Toml",
			},
			["m4a"] = {
				icon = "",
				color = "#66D8EF",
				cterm_color = "45",
				name = "M4A",
			},
			["flac"] = {
				icon = "",
				color = "#66D8EF",
				cterm_color = "45",
				name = "Flac",
			},
			["mp3"] = {
				icon = "",
				color = "#66D8EF",
				cterm_color = "45",
				name = "Mp3",
			},
			["wav"] = {
				icon = "",
				color = "#66D8EF",
				cterm_color = "45",
				name = "Wav",
			},
			["3gp"] = {
				icon = "",
				color = "#FD971F",
				cterm_color = "208",
				name = "3gp",
			},
			["aac"] = {
				icon = "",
				color = "#66D8EF",
				cterm_color = "45",
				name = "Aac",
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
			["ass"] = {
				icon = "󰨗",
				color = "#FFb713",
				cterm_color = "214",
				name = "Ass",
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
			["svg"] = {
				icon = "󰕙",
				color = "#FFb13b",
				cterm_color = "214",
				name = "Svg",
			},
			["lua"] = {
				icon = "󰢱",
				color = "#51a0cF",
				cterm_color = "74",
				name = "Lua",
			},
			["luau"] = {
				icon = "󰢱",
				color = "#00a2FF",
				cterm_color = "75",
				name = "Luau",
			},
			["eot"] = {
				icon = "󱔏",
				color = "#ECECEC",
				cterm_color = "255",
				name = "EmbeddedOpenTypeFont",
			},
			["flc"] = {
				icon = "󱔏",
				color = "#ECECEC",
				cterm_color = "255",
				name = "FIGletFontControl",
			},
			["flf"] = {
				icon = "󱔏",
				color = "#ECECEC",
				cterm_color = "255",
				name = "FIGletFontFormat",
			},
			["lff"] = {
				icon = "󱔏",
				color = "#ECECEC",
				cterm_color = "255",
				name = "LibrecadFontFile",
			},
			["otf"] = {
				icon = "󱔏",
				color = "#ECECEC",
				cterm_color = "255",
				name = "OpenTypeFont",
			},
			["ttf"] = {
				icon = "󱔏",
				color = "#ECECEC",
				cterm_color = "255",
				name = "TrueTypeFont",
			},
			["woff"] = {
				icon = "󱔏",
				color = "#ECECEC",
				cterm_color = "255",
				name = "WebOpenFontFormat",
			},
			["woff2"] = {
				icon = "󱔏",
				color = "#ECECEC",
				cterm_color = "255",
				name = "WebOpenFontFormat",
			},
			["bak"] = {
				icon = "󱈎",
				color = "#6d8086",
				cterm_color = "66",
				name = "Backup",
			},
			["brep"] = {
				icon = "󰺾",
				color = "#839463",
				cterm_color = "101",
				name = "BoundaryRepresentation",
			},
			["cast"] = {
				icon = "",
				color = "#FD971F",
				cterm_color = "208",
				name = "Asciinema",
			},
			["mpv.conf"] = {
				icon = "",
				color = "#3b1342",
				cterm_color = "53",
				name = "Mpv",
			},
			["xcstrings"] = {
				icon = "󱊺",
				color = "#2596be",
				cterm_color = "31",
				name = "XcLocalization",
			},
			["strings"] = {
				icon = "󱊺",
				color = "#2596be",
				cterm_color = "31",
				name = "Localization",
			},
			["qm"] = {
				icon = "󱊺",
				color = "#2596be",
				cterm_color = "31",
				name = "Localization",
			},
			["po"] = {
				icon = "",
				color = "#2596be",
				cterm_color = "31",
				name = "Localization",
			},
			["pot"] = {
				icon = "",
				color = "#2596be",
				cterm_color = "31",
				name = "Localization",
			},
			["nfo"] = {
				icon = "󰋽",
				color = "#FFFFcd",
				cterm_color = "230",
				name = "Nfo",
			},
			["info"] = {
				icon = "󰋽",
				color = "#FFFFcd",
				cterm_color = "230",
				name = "Info",
			},
			["hurl"] = {
				icon = "󰧈",
				color = "#FF0288",
				cterm_color = "198",
				name = "Hurl",
			},
			-- ["f90"] = {
			-- 	icon = "󱈚",
			-- 	color = "#734F96",
			-- 	cterm_color = "97",
			-- 	name = "Fortran",
			-- },
			["bib"] = {
				icon = "",
				color = "#cbcb41",
				cterm_color = "185",
				name = "BibTeX",
			},
			["xcf"] = {
				icon = "",
				color = "#635b46",
				cterm_color = "240",
				name = "GIMP",
			},

			-- ch
			["vue"] = {
				icon = "",
				color = "#8dc149",
				cterm_color = "113",
				name = "Vue",
			},
			["vsix"] = {
				icon = "",
				color = "#854CC7",
				cterm_color = "98",
				name = "Vsix",
			},
			["suo"] = {
				icon = "",
				color = "#854CC7",
				cterm_color = "98",
				name = "Suo",
			},
			["sln"] = {
				icon = "",
				color = "#854CC7",
				cterm_color = "98",
				name = "Sln",
			},
			["skp"] = {
				icon = "",
				color = "#839463",
				cterm_color = "101",
				name = "SketchUp",
			},
			["sldasm"] = {
				icon = "",
				color = "#839463",
				cterm_color = "101",
				name = "SolidWorksAsm",
			},
			["sldprt"] = {
				icon = "",
				color = "#839463",
				cterm_color = "101",
				name = "SolidWorksPrt",
			},
			["slvs"] = {
				icon = "",
				color = "#839463",
				cterm_color = "101",
				name = "SolveSpace",
			},
			["ste"] = {
				icon = "",
				color = "#839463",
				cterm_color = "101",
				name = "Ste",
			},
			["step"] = {
				icon = "",
				color = "#839463",
				cterm_color = "101",
				name = "Step",
			},
			["stp"] = {
				icon = "",
				color = "#839463",
				cterm_color = "101",
				name = "Stp",
			},
			["dwg"] = {
				icon = "",
				color = "#839463",
				cterm_color = "101",
				name = "AutoCADDwg",
			},
			["dxf"] = {
				icon = "",
				color = "#839463",
				cterm_color = "101",
				name = "AutoCADDxf",
			},
			["f3d"] = {
				icon = "",
				color = "#839463",
				cterm_color = "101",
				name = "Fusion360",
			},
			["ifc"] = {
				icon = "",
				color = "#839463",
				cterm_color = "101",
				name = "Ifc",
			},
			["ige"] = {
				icon = "",
				color = "#839463",
				cterm_color = "101",
				name = "Ige",
			},
			["iges"] = {
				icon = "",
				color = "#839463",
				cterm_color = "101",
				name = "Iges",
			},
			["igs"] = {
				icon = "",
				color = "#839463",
				cterm_color = "101",
				name = "Igs",
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
			["cfg"] = {
				icon = "",
				color = "#ECECEC",
				cterm_color = "255",
				name = "Configuration",
			},
			[".settings.json"] = {
				icon = "",
				color = "#854CC7",
				cterm_color = "98",
				name = "SettingsJson",
			},
			["nu"] = {
				icon = "",
				color = "#3aa675",
				cterm_color = "36",
				name = "Nushell",
			},
			["cbl"] = {
				icon = "󰠳",
				color = "#005ca5",
				cterm_color = "25",
				name = "Cobol",
			},
			["cob"] = {
				icon = "󰠳",
				color = "#005ca5",
				cterm_color = "25",
				name = "Cobol",
			},
			["cobol"] = {
				icon = "󰠳",
				color = "#005ca5",
				cterm_color = "25",
				name = "Cobol",
			},
			["cpy"] = {
				icon = "󰠳",
				color = "#005ca5",
				cterm_color = "25",
				name = "Cobol",
			},
			["cr"] = {
				icon = "󰡶",
				color = "#c8c8c8",
				cterm_color = "251",
				name = "Crystal",
			},
			["drl"] = {
				icon = "󰧑",
				color = "#FFaFaF",
				cterm_color = "217",
				name = "Drools",
			},
			["kdenlive"] = {
				icon = "",
				color = "#83b8F2",
				cterm_color = "110",
				name = "Kdenlive",
			},
			["kdenlivetitle"] = {
				icon = "",
				color = "#83b8F2",
				cterm_color = "110",
				name = "Kdenlive",
			},
			["kdenlive-layoutsrc"] = {
				icon = "",
				color = "#83b8F2",
				cterm_color = "110",
				name = "KdenliveLayoutsrc",
			},
			["kdenliverc"] = {
				icon = "",
				color = "#83b8F2",
				cterm_color = "110",
				name = "Kdenliverc",
			},
			["pom.xml"] = {
				icon = "",
				color = "#7a0d21",
				cterm_color = "52",
				name = "Maven",
			},
			["kpp"] = {
				icon = "󰉼",
				color = "#F245Fb",
				cterm_color = "201",
				name = "Krita",
			},
			["kra"] = {
				icon = "󰉼",
				color = "#F245Fb",
				cterm_color = "201",
				name = "Krita",
			},
			["krz"] = {
				icon = "󰉼",
				color = "#F245Fb",
				cterm_color = "201",
				name = "Krita",
			},
			["kritadisplayrc"] = {
				icon = "󰉼",
				color = "#F245Fb",
				cterm_color = "201",
				name = "Kritadisplayrc",
			},
			["kritarc"] = {
				icon = "󰉼",
				color = "#F245Fb",
				cterm_color = "201",
				name = "Kritarc",
			},
			[".SRCINFO"] = {
				icon = "󱂸",
				color = "#0F94d2",
				cterm_color = "67",
				name = "SRCINFO",
			},
			["hyprland.conf"] = {
				icon = "",
				color = "#00aaae",
				cterm_color = "37",
				name = "Hyprland",
			},
			["ml"] = {
				icon = "",
				color = "#e37933",
				cterm_color = "166",
				name = "Ml",
			},
			["mli"] = {
				icon = "",
				color = "#e37933",
				cterm_color = "166",
				name = "Mli",
			},
			["PKGBUILD"] = {
				icon = "",
				color = "#0F94d2",
				cterm_color = "67",
				name = "PKGBUILD",
			},
			["mts"] = {
				icon = "",
				color = "#519aba",
				cterm_color = "74",
				name = "Mts",
			},
			["cson"] = {
				icon = "",
				color = "#cbcb41",
				cterm_color = "185",
				name = "Cson",
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
			["tsconfig.json"] = {
				icon = "",
				color = "#519aba",
				cterm_color = "74",
				name = "TSConfig",
			},
			["ts"] = {
				icon = "",
				color = "#519aba",
				cterm_color = "74",
				name = "Ts",
			},
			["cts"] = {
				icon = "",
				color = "#519aba",
				cterm_color = "74",
				name = "Cts",
			},
			["config"] = {
				icon = "",
				color = "#6d8086",
				cterm_color = "66",
				name = "Config",
			},
			["webmanifest"] = {
				icon = "",
				color = "#F1e05a",
				cterm_color = "185",
				name = "Webmanifest",
			},
			["sha1"] = {
				icon = "",
				color = "#8c86aF",
				cterm_color = "103",
				name = "Sha1",
			},
			["sha224"] = {
				icon = "",
				color = "#8c86aF",
				cterm_color = "103",
				name = "Sha224",
			},
			["sha256"] = {
				icon = "",
				color = "#8c86aF",
				cterm_color = "103",
				name = "Sha256",
			},
			["sha384"] = {
				icon = "",
				color = "#8c86aF",
				cterm_color = "103",
				name = "Sha384",
			},
			["sha512"] = {
				icon = "",
				color = "#8c86aF",
				cterm_color = "103",
				name = "Sha512",
			},
			["md5"] = {
				icon = "",
				color = "#8c86aF",
				cterm_color = "103",
				name = "Md5",
			},
			["nswag"] = {
				icon = "",
				color = "#85ea2d",
				cterm_color = "112",
				name = "Nswag",
			},
			["kbx"] = {
				icon = "󰷖",
				color = "#737672",
				cterm_color = "243",
				name = "Kbx",
			},
			["fcbak"] = {
				icon = "",
				color = "#cb0d0d",
				cterm_color = "160",
				name = "FreeCAD",
			},
			["fcmacro"] = {
				icon = "",
				color = "#cb0d0d",
				cterm_color = "160",
				name = "FreeCAD",
			},
			["fcmat"] = {
				icon = "",
				color = "#cb0d0d",
				cterm_color = "160",
				name = "FreeCAD",
			},
			["fcparam"] = {
				icon = "",
				color = "#cb0d0d",
				cterm_color = "160",
				name = "FreeCAD",
			},
			["fcscript"] = {
				icon = "",
				color = "#cb0d0d",
				cterm_color = "160",
				name = "FreeCAD",
			},
			["fcstd"] = {
				icon = "",
				color = "#cb0d0d",
				cterm_color = "160",
				name = "FreeCAD",
			},
			["fcstd1"] = {
				icon = "",
				color = "#cb0d0d",
				cterm_color = "160",
				name = "FreeCAD",
			},
			["fctb"] = {
				icon = "",
				color = "#cb0d0d",
				cterm_color = "160",
				name = "FreeCAD",
			},
			["fctl"] = {
				icon = "",
				color = "#cb0d0d",
				cterm_color = "160",
				name = "FreeCAD",
			},
			["FreeCAD.conf"] = {
				icon = "",
				color = "#cb0d0d",
				cterm_color = "160",
				name = "FreeCADConfig",
			},
			[".babelrc"] = {
				icon = "",
				color = "#cbcb41",
				cterm_color = "185",
				name = "Babelrc",
			},
			["rb"] = {
				icon = "",
				color = "#701516",
				cterm_color = "52",
				name = "Rb",
			},
			["scala"] = {
				icon = "",
				color = "#cc3e44",
				cterm_color = "167",
				name = "Scala",
			},
			["sc"] = {
				icon = "",
				color = "#cc3e44",
				cterm_color = "167",
				name = "ScalaScript",
			},
			["php"] = {
				icon = "",
				color = "#a074c4",
				cterm_color = "140",
				name = "Php",
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
			["cppm"] = {
				icon = "",
				color = "#519aba",
				cterm_color = "74",
				name = "Cppm",
			},
			["c"] = {
				icon = "",
				color = "#599eFF",
				cterm_color = "74",
				name = "C",
			},
			["cs"] = {
				icon = "",
				color = "#596706",
				cterm_color = "58",
				name = "Cs",
			},
			["dropbox"] = {
				icon = "",
				color = "#0061FE",
				cterm_color = "27",
				name = "Dropbox",
			},
			["h"] = {
        icon = "H",
				color = "#a074c4",
				cterm_color = "140",
				name = "H",
			},
			["hh"] = {
				icon = "H",
				color = "#a074c4",
				cterm_color = "140",
				name = "Hh",
			},
			["hpp"] = {
				icon = "H",
				color = "#a074c4",
				cterm_color = "140",
				name = "Hpp",
			},
			["hxx"] = {
				icon = "H",
				color = "#a074c4",
				cterm_color = "140",
				name = "Hxx",
			},
		})
	end,
}
