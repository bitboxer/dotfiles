return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      picker = {
        formatters = {
          file = {
            filename_first = true,
            truncate = 80,
          },
        },
      },
    },
  },
}
