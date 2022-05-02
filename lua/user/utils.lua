local M = {}

function M.trimWhitespace()
  local buffer_index = 0
  local start_index = 0
  local end_index = vim.api.nvim_buf_line_count(0)

  local content = vim.api.nvim_buf_get_lines(buffer_index, start_index, end_index, false)
  local new_content = {}
  for _, line in ipairs(content) do
    -- Remove lines from the end of current line.
    local new_line = string.gsub(line, "%s+$", "")
    table.insert(new_content, new_line)
  end
  vim.api.nvim_buf_set_lines(buffer_index, start_index, end_index, false, new_content)
end

local function setupVimCommands()
  vim.cmd [[
    command! TrimWhiteSpace lua require'user.utils'.trimWhitespace()
  ]]
end

function M.setup()
  setupVimCommands()
end

M.setup()

return M
