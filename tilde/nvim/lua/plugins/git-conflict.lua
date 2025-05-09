local wk = require("which-key")

wk.add({
  { "<leader>h", group = "+git conflicts" },
})

return {
  "akinsho/git-conflict.nvim",
  lazy = false,
  opts = {
    defaults = {
      ["<leader>h"] = { name = "+group name" },
    },
    default_mappings = {
      ours = "<leader>ho",
      theirs = "<leader>ht",
      none = "<leader>h0",
      both = "<leader>hb",
      next = "]x",
      prev = "[x",
    },
  },
  keys = {
    {
      "<leader>gx",
      "<cmd>GitConflictListQf<cr>",
      desc = "List Conflicts",
    },
    {
      "<leader>gr",
      "<cmd>GitConflictRefresh<cr>",
      desc = "Refresh Conflicts",
    },
  },
}
