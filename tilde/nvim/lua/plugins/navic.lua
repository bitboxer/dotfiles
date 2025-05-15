return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- dont show the winbar for some filetypes
    opts.options.disabled_filetypes.winbar = { "dashboard", "lazy", "alpha" }
    -- remove navic from the statusline
    local navic = table.remove(opts.sections.lualine_c)
    -- add it to the winbar instead
    opts.winbar = { lualine_c = { navic } }
  end,
}
