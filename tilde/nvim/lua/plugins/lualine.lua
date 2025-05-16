return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  enabled = true,
  opts = function(_, opts)
    opts.sections.lualine_c[4] = { "filename", path = 1 }
  end,
}
