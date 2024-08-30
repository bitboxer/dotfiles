return {
  --- Configure neotest
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = { "neotest-jest" },
    },
    requires = { "haydenmeade/neotest-jest", "marilari88/neotest-vitest" },
  },
  {
    "haydenmeade/neotest-jest",
    "marilari88/neotest-vitest",
  },
}
