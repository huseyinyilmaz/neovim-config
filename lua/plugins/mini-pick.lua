return {
  "echasnovski/mini.pick",
  version = false,
  config = function()
    require("mini.pick").setup({
      mappings = {
        move_down = "<C-j>",
        move_up = "<C-k>",
      },
    })

    vim.api.nvim_create_user_command("PickOldfiles", function()
      local oldfiles = vim.tbl_filter(function(v)
        return v ~= ""
      end, vim.v.oldfiles)
      require("mini.pick").start({
        source = { items = oldfiles, name = "oldfiles" },
        actions = {
          default = function(item)
            vim.cmd("edit " .. item)
          end,
        },
      })
    end, {})

    vim.api.nvim_create_user_command("PickDiagnostics", function()
      local diag = vim.diagnostic.get(0)
      if #diag == 0 then
        diag = vim.diagnostic.get()
      end
      local items = vim.iter(diag):map(function(d)
        return string.format("%s:%d:%d: %s", vim.fn.bufname(d.bufnr), d.lnum + 1, d.col + 1, d.message)
      end):totable()
      require("mini.pick").start({
        source = { items = items, name = "diagnostics" },
        actions = {
          default = function(item)
            local parts = vim.split(item, ":")
            vim.cmd(string.format("edit +%s %s", parts[2], parts[1]))
          end,
        },
      })
    end, {})
  end,
}
