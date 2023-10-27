require("cmp").config.sources({
  { name = "nvim_lsp" },
  { name = "luasnip" },
  { name = "omni" },
  { name = "buffer", keyword_length = 3 },
  {
    name = "spell",
    keyword_length = 5,
    option = {
      keep_all_entries = false,
      enable_in_context = function()
        return true
      end,
    },
  },
})
