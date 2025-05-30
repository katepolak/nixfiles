return {
	"saghen/blink.cmp",
	version = "1.*",
	opts = {
		keymap = { preset = "super-tab" },
		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100
				}
			}
		}
	}
}
