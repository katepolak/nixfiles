return {
	"kepano/flexoki-neovim",
	dev      = true,
	priority = 1000,

	---@module "flexoki"
	---@type FlexokiOptions
	opts = {
		auto_apply = true,
		highlight_groups = {
			["TransWhiteBg"] = { bg = "#EEEEEE", fg = "#100F0F" },
			["TransWhiteFg"] = { fg = "#EEEEEE" },

			["TransPinkBg"] = { bg = "#F5A9B8", fg = "#100F0F" },
			["TransPinkFg"] = { fg = "#F5A9B8" },

			["TransBlueBg"] = { bg = "#5BCEFA", fg = "#100F0F" },
			["TransBlueFg"] = { fg = "#5BCEFA" },

			["TransWP"] = { bg = "#EEEEEE", fg = "#F5A9B8" },
			["TransPB"] = { bg = "#F5A9B8", fg = "#5BCEFA" },
			["TransBP"] = { bg = "#5BCEFA", fg = "#F5A9B8" },
			["TransPW"] = { bg = "#F5A9B8", fg = "#EEEEEE" }
		}
	}
}
