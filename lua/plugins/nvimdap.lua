return {
  {"mfussenegger/nvim-dap"},
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = {"mfussenegger/nvim-dap"},
    config = function(_, opts)
      require("dap-go").setup(opts)
    end,
  },
  { "nvim-neotest/nvim-nio", dependencies = {"mfussenegger/nvim-dap"}},
  { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
}
