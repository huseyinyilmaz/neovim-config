return {
  "sudo-tee/opencode.nvim",
  config = function()
    require("opencode").setup({
      ui = {
        zoom_width = 1, -- Zoom width as percentage of editor width

        questions = {
          use_vim_ui_select = true, -- If true, render questions/prompts with vim.ui.select instead of showing them inline in the output buffer.
        },
      },
    })
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        anti_conceal = { enabled = false },
        file_types = { "markdown", "opencode_output" },
      },
      ft = { "markdown", "Avante", "copilot-chat", "opencode_output" },
    },
    "folke/snacks.nvim",
  },
}
