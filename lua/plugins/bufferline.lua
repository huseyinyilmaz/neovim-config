return {
  "akinsho/bufferline.nvim",
  prority = 9999,
  config = function()
    require('bufferline').setup({
      options = {
        numbers = "ordinal",
        max_name_length = 40,
        max_prefix_length = 40, -- prefix used when a buffer is de-duplicated
        truncate_names = false,
      }
    })
  end,
}
