local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
  },
  event = { "InsertEnter", "CmdlineEnter" },
}

M.config = function()
  local cmp = require("cmp")
  require("luasnip.loaders.from_vscode").lazy_load()
  local kinds = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "M",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
  }
  cmp.setup({
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    formatting = {
      fields = { "abbr", "menu", "kind" },
      format = function(_, vim_item)
        vim_item.kind = " " .. kinds[vim_item.kind] .. " "
        return vim_item
      end,
      expandable_indicator = false,
    },
    completion = {
      completeopt = "menu,menuone,noinsert",
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<C-b>"] = function()
        for _ = 1, 5 do
          cmp.select_prev_item()
        end
      end,
      ["<C-f>"] = function()
        for _ = 1, 5 do
          cmp.select_next_item()
        end
      end,
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<Tab>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
    }),
  })
  -- Cmdline Completion
  -- cmp.setup.cmdline(":", {
  -- 	mapping = cmp.mapping.preset.cmdline(),
  -- 	sources = cmp.config.sources({
  -- 		{ name = "path" },
  -- 	}, {
  -- 		{ name = "cmdline" },
  -- 	}),
  -- 	matching = { disallow_symbol_nonprefix_matching = false },
  -- })
end

return M
