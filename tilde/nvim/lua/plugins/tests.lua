return {
  --- Configure neotest
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = { "neotest-jest", "neotest-elixir" },
    },
    requires = { "haydenmeade/neotest-jest", "jfpedroza/neotest-elixir" },
  },
  {
    "haydenmeade/neotest-jest",
    "jfpedroza/neotest-elixir",
  },
}
