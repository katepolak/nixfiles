return {
	"saghen/blink.cmp",
	version = "1.*",

	---@module 'blink-cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "enter",
			[ "<Tab>" ] = {
				function(cmp)
					if cmp.snippet_active() then
						return cmp.accept()
					else
						return cmp.select_next()
					end
				end,
				"select_next",
				"fallback"
			},
			[ "<S-Tab>" ] = {
				"select_prev",
				"fallback"
			}
		},
		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100
				}
			}
		},
		signature = {
			enabled = true
		},
		completion = {
			list = {
				selection = {
					preselect = false,
					auto_insert = true
				}
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 100
			}
		}
	}
}
