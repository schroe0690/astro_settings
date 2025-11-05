-- Comment.nvim plugin configuration
---@type LazySpec
return {
  {
    "numToStr/Comment.nvim",
    -- load on keys so it's available when using the comment mappings
    keys = { "gc", "gb", "gcc", "gbc" },
    config = function()
      require("Comment").setup({
        -- sensible defaults
        padding = true,
        sticky = true,
        toggler = {
          line = "gcc",
          block = "gbc",
        },
        opleader = {
          line = "gc",
          block = "gb",
        },
      })
    end,
  },
}
