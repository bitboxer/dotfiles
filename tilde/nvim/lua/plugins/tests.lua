return {
  --- Configure neotest
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = { "neotest-jest", "neotest-vitest", "neotest-elixir" },
    },
    requires = { "haydenmeade/neotest-jest", "jfpedroza/neotest-elixir" },
  },
  {
    "haydenmeade/neotest-jest",
    "jfpedroza/neotest-elixir",
  },
}
