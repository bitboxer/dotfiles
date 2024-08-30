return {
  --- Configure neotest
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = { "neotest-jest", "neotest-vitest", "neotest-elixir" },
    },
    requires = { "haydenmeade/neotest-jest", "marilari88/neotest-vitest", "jfpedroza/neotest-elixir" },
  },
  {
    "haydenmeade/neotest-jest",
    "marilari88/neotest-vitest",
    "jfpedroza/neotest-elixir",
  },
}
