-- The `require('lspconfig')` "framework" is deprecated, use vim.lsp.config (see :help lspconfig-nvim-0.11) instead.
-- Feature will be removed in nvim-lspconfig v3.0.0

return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },

		-- use a release tag to download pre-built binaries
		version = "1.*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
			-- 'super-tab' for mappings similar to vscode (tab to accept)
			-- 'enter' for enter to accept
			-- 'none' for no mappings
			--
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			--
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = { preset = "default" },

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			-- (Default) Only show the documentation popup when manually triggered
			completion = { documentation = { auto_show = true } },

			signature = { enabled = true },

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						-- make lazydev completions top priority (see `:h blink.cmp`)
						score_offset = 100,
					},
				},
			},

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		config = function()
			-- local lspconfig = require("lspconfig")
			-- local lspconfig = vim.lsp.config()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- vim.lsp.config['luals'] = {
			--   -- Command and arguments to start the server.
			--   cmd = { 'lua-language-server' },

			--   -- Filetypes to automatically attach to.
			--   filetypes = { 'lua' },

			--   -- Sets the "root directory" to the parent directory of the file in the
			--   -- current buffer that contains either a ".luarc.json" or a
			--   -- ".luarc.jsonc" file. Files that share a root directory will reuse
			--   -- the connection to the same LSP server.
			--   root_markers = { '.luarc.json', '.luarc.jsonc' },

			--   -- Specific settings to send to the server. The schema for this is
			--   -- defined by the server. For example the schema for lua-language-server
			--   -- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
			--   settings = {
			--     Lua = {
			--       runtime = {
			--         version = 'LuaJIT',
			--       }
			--     }
			--   }
			-- }
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = { version = "Lua 5.1" },
						diagnostics = {
							globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
						},
					},
				},
			})

			vim.lsp.config("graphql", {
				capabilities = capabilities,
				filetypes = { "typescript", "typescriptreact", "typescript.tsx", "graphql" },
			})

			-- vim.lsp.config("denols", {
			-- 	on_attach = on_attach,
			-- 	root_markers = { "deno.json", "deno.jsonc" },
			-- })

			vim.lsp.config("ts_ls", {
				-- on_attach = on_attach,
				capabilities = capabilities,
				single_file_support = false,
				root_markers = { "package.json" },
				filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
				-- 			-- only for react
				-- 			-- remove quickfix popup for go-to-definition()
				-- 			handlers = {
				-- 				["textDocument/definition"] = function(err, result, method, ...)
				-- 					if vim.tbl_islist(result) and #result > 1 then
				-- 						local filtered_result = filter(result, filterReactDTS)
				-- 						return vim.lsp.handlers["textDocument/definition"](err, filtered_result, method, ...)
				-- 					end

				-- 					vim.lsp.handlers["textDocument/definition"](err, result, method, ...)
				-- 				end,
				-- },
			})

			vim.lsp.config("eslint", {
				capabilities = capabilities,
			})

			vim.lsp.enable("lua_ls")
			vim.lsp.enable("graphql")
			-- vim.lsp.enable("denols")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("eslint")
			-- LUA
			-- lspconfig.lua_ls.setup({
			-- 	capabilities = capabilities,
			-- 	settings = {
			-- 		Lua = {
			-- 			runtime = { version = "Lua 5.1" },
			-- 			diagnostics = {
			-- 				globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
			-- 			},
			-- 		},
			-- 	},
			-- })

			-- GRAPHQL
			-- lspconfig.graphql.setup({
			-- 	capabilities = capabilities,
			-- 	filetypes = { "typescript", "typescriptreact", "typescript.tsx", "graphql" },
			-- })

			-- -- Typescript
			-- lspconfig.ts_ls.setup({
			-- 	capabilities = capabilities,
			-- 	filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
			-- 	-- 			-- only for react
			-- 	-- 			-- remove quickfix popup for go-to-definition()
			-- 	-- 			handlers = {
			-- 	-- 				["textDocument/definition"] = function(err, result, method, ...)
			-- 	-- 					if vim.tbl_islist(result) and #result > 1 then
			-- 	-- 						local filtered_result = filter(result, filterReactDTS)
			-- 	-- 						return vim.lsp.handlers["textDocument/definition"](err, filtered_result, method, ...)
			-- 	-- 					end

			-- 	-- 					vim.lsp.handlers["textDocument/definition"](err, result, method, ...)
			-- 	-- 				end,
			-- 	-- },
			-- })

			-- -- Eslint
			-- lspconfig.eslint.setup({
			-- 	capabilities = capabilities,
			-- })
		end,
	},
	-- { "hrsh7th/cmp-nvim-lsp" },
	-- { "hrsh7th/cmp-buffer" },
	-- { "hrsh7th/cmp-path" },
	-- { "hrsh7th/cmp-cmdline" },
	-- { "onsails/lspkind-nvim" },
	-- {
	-- 	"L3MON4D3/LuaSnip",
	-- 	-- follow latest release.
	-- 	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- 	-- install jsregexp (optional!).
	-- 	build = "make install_jsregexp",
	-- },
	-- { "saadparwaiz1/cmp_luasnip" },
	-- {
	-- 	"hrsh7th/nvim-cmp",
	-- 	config = function(_)
	-- 		local cmp = require("cmp")
	-- 		local lspkind = require("lspkind")
	-- 		local nvim_lsp = require("lspconfig")
	-- 		local luasnip = require("luasnip")
	-- 		local has_words_before = function()
	-- 			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	-- 			return col ~= 0
	-- 				and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	-- 		end

	-- 		cmp.setup({
	-- 			formatting = {
	-- 				-- fancy icons
	-- 				format = lspkind.cmp_format({
	-- 					mode = "symbol_text",
	-- 					maxwidth = 50,
	-- 					menu = {
	-- 						buffer = "[Buffer]",
	-- 						nvim_lsp = "[LSP]",
	-- 						luasnip = "[LuaSnip]",
	-- 						nvim_lua = "[Lua]",
	-- 						latex_symbols = "[Latex]",
	-- 					},
	-- 				}),
	-- 			},
	-- 			snippet = {
	-- 				-- REQUIRED - you must specify a snippet engine
	-- 				expand = function(args)
	-- 					luasnip.lsp_expand(args.body)
	-- 				end,
	-- 			},
	-- 			mapping = {
	-- 				["<C-u>"] = cmp.mapping.scroll_docs(-4),
	-- 				["<C-d>"] = cmp.mapping.scroll_docs(4),
	-- 				["<C-Space>"] = cmp.mapping.complete(),
	-- 				["<C-n>"] = cmp.mapping(function(fallback)
	-- 					if cmp.visible() then
	-- 						cmp.select_next_item()
	-- 					elseif luasnip.expand_or_jumpable() then
	-- 						luasnip.expand_or_jump()
	-- 					elseif has_words_before() then
	-- 						cmp.complete()
	-- 					else
	-- 						fallback()
	-- 					end
	-- 				end, { "i", "s" }),
	-- 				["<C-p>"] = cmp.mapping(function(fallback)
	-- 					if cmp.visible() then
	-- 						cmp.select_prev_item()
	-- 					elseif luasnip.jumpable(-1) then
	-- 						luasnip.jump(-1)
	-- 					else
	-- 						fallback()
	-- 					end
	-- 				end, { "i", "s" }),
	-- 			},
	-- 			sources = cmp.config.sources({
	-- 				{ name = "nvim_lsp" },
	-- 				-- For luasnip users.
	-- 				{ name = "luasnip" },
	-- 			}, {
	-- 				{ name = "buffer" },
	-- 			}),
	-- 		})

	-- 		-- Setup lspconfig. // DOCS OFFICIAL
	-- 		local capabilities =
	-- 			require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

	-- 		-- https://github.com/typescript-language-server/typescript-language-server/issues/216
	-- 		-- Stuff to remove quickfix list for "go-to-definition" in react project
	-- 		local function filter(arr, fn)
	-- 			if type(arr) ~= "table" then
	-- 				return arr
	-- 			end

	-- 			local filtered = {}
	-- 			for k, v in pairs(arr) do
	-- 				if fn(v, k, arr) then
	-- 					table.insert(filtered, v)
	-- 				end
	-- 			end

	-- 			return filtered
	-- 		end

	-- 		local function filterReactDTS(value)
	-- 			return string.match(value.uri, "%.d.ts") == nil
	-- 		end

	-- 		nvim_lsp.ts_ls.setup({
	-- 			capabilities = capabilities,
	-- 			filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
	-- 			-- only for react
	-- 			-- remove quickfix popup for go-to-definition()
	-- 			handlers = {
	-- 				["textDocument/definition"] = function(err, result, method, ...)
	-- 					if vim.tbl_islist(result) and #result > 1 then
	-- 						local filtered_result = filter(result, filterReactDTS)
	-- 						return vim.lsp.handlers["textDocument/definition"](err, filtered_result, method, ...)
	-- 					end

	-- 					vim.lsp.handlers["textDocument/definition"](err, result, method, ...)
	-- 				end,
	-- 			},
	-- 		})

	-- 		nvim_lsp.graphql.setup({
	-- 			capabilities = capabilities,
	-- 			filetypes = { "typescript", "typescriptreact", "typescript.tsx", "graphql" },
	-- 		})

	-- 		nvim_lsp.pyright.setup({
	-- 			capabilities = capabilities,
	-- 			cmd = { "pyright-langserver", "--stdio" },
	-- 			filetypes = { "python" },
	-- 			analysis = {
	-- 				extraPaths = { "~/Library/Caches/pypoetry/virtualenvs/ai-models-8Kf3JvvO-py3.11/bin/python" },
	-- 			},
	-- 		})

	-- 		nvim_lsp.eslint.setup({})

	-- 		nvim_lsp.lua_ls.setup({
	-- 			capabilities = capabilities,
	-- 			settings = {
	-- 				Lua = {
	-- 					runtime = { version = "Lua 5.1" },
	-- 					diagnostics = {
	-- 						globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
	-- 					},
	-- 				},
	-- 			},
	-- 		})

	-- 		nvim_lsp.diagnosticls.setup({
	-- 			capabilities = capabilities,
	-- 			filetypes = {
	-- 				"javascript",
	-- 				"javascriptreact",
	-- 				"json",
	-- 				"typescript",
	-- 				"typescriptreact",
	-- 				"css",
	-- 				"less",
	-- 				"scss",
	-- 				"markdown",
	-- 				"pandoc",
	-- 				"lua",
	-- 			},
	-- 			virtual_lines = true,
	-- 			init_options = {
	-- 				virtual_lines = true,
	-- 				-- linters = {
	-- 				--   eslint = {
	-- 				--     command = 'eslint',
	-- 				--     rootPatterns = { '.git' },
	-- 				--     debounce = 100,
	-- 				--     -- args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
	-- 				--     args = { '--format', 'json', '%filepath' },
	-- 				--     sourceName = 'eslint',
	-- 				--     parseJson = {
	-- 				--       errorsRoot = '[0].messages',
	-- 				--       line = 'line',
	-- 				--       column = 'column',
	-- 				--       endLine = 'endLine',
	-- 				--       endColumn = 'endColumn',
	-- 				--       message = '[eslint] ${message} [${ruleId}]',
	-- 				--       security = 'severity'
	-- 				--     },
	-- 				--     securities = {
	-- 				--       [2] = 'error',
	-- 				--       [1] = 'warning'
	-- 				--     }
	-- 				--   },
	-- 				-- },
	-- 				-- filetypes = {
	-- 				--   javascript = 'eslint',
	-- 				--   javascriptreact = 'eslint',
	-- 				--   typescript = 'eslint',
	-- 				--   typescriptreact = 'eslint',
	-- 				-- },
	-- 				formatters = {
	-- 					-- eslint = {
	-- 					--   command = 'eslint',
	-- 					--   args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
	-- 					--   rootPatterns = { '.git' },
	-- 					-- },
	-- 					prettier = {
	-- 						command = "prettier",
	-- 						args = { "--stdin-filepath", "%filename" },
	-- 					},
	-- 				},
	-- 				formatFiletypes = {
	-- 					css = "prettier",
	-- 					-- javascript = 'eslint',
	-- 					-- javascriptreact = 'eslint',
	-- 					javascript = "prettier",
	-- 					javascriptreact = "prettier",
	-- 					scss = "prettier",
	-- 					less = "prettier",
	-- 					-- typescript = 'eslint',
	-- 					-- typescriptreact = 'eslint',
	-- 					typescript = "prettier",
	-- 					typescriptreact = "prettier",
	-- 					json = "prettier",
	-- 					markdown = "prettier",
	-- 					lua = "stylua",
	-- 				},
	-- 			},
	-- 		})

	-- 		-- icon
	-- 		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	-- 			--  vim.diagnostic.on_publish_diagnostics, {
	-- 			vim.lsp.diagnostic.on_publish_diagnostics,
	-- 			{
	-- 				underline = true,
	-- 				-- This sets the spacing and the prefix, obviously.
	-- 				virtual_text = {
	-- 					spacing = 4,
	-- 					prefix = "",
	-- 				},
	-- 			}
	-- 		)

	-- 		local snippets_paths = function()
	-- 			local plugins = { "friendly-snippets" }
	-- 			local paths = {}
	-- 			local path
	-- 			local root_path = vim.env.HOME .. "/.vim/plugged/"
	-- 			for _, plug in ipairs(plugins) do
	-- 				path = root_path .. plug
	-- 				if vim.fn.isdirectory(path) ~= 0 then
	-- 					table.insert(paths, path)
	-- 				end
	-- 			end
	-- 			return paths
	-- 		end

	-- 		require("luasnip.loaders.from_vscode").lazy_load({
	-- 			paths = snippets_paths(),
	-- 			include = nil, -- Load all languages
	-- 			exclude = {},
	-- 		})
	-- 	end,
	-- },
}
