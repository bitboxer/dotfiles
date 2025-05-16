return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- dont show the winbar for some filetypes
    opts.options.disabled_filetypes.winbar = { "dashboard", "lazy", "alpha" }
    -- remove navic from the statusline
    local navic = table.remove(opts.sections.lualine_c)
    -- add it to the winbar instead
    opts.winbar = { lualine_b = { "filename" }, lualine_c = { navic } }
    opts.inactive_winbar = { lualine_b = { "filename" } }
  end,
}
