local import_utils = require('user.importutils')
local packer = import_utils.require('packer')
local treesitter_install = import_utils.require('nvim-treesitter.install')

local M = {}

function M.trimWhitespace()
  local buffer_index = 0
  local start_index = 0
  local end_index = vim.api.nvim_buf_line_count(0)
  -- Get all lines from current buffer
  local content = vim.api.nvim_buf_get_lines(buffer_index, start_index, end_index, false)
  local new_content = {}
  -- Remove white space from end of lines
  for _, line in ipairs(content) do
    -- Remove lines from the end of current line.
    local new_line = string.gsub(line, "%s+$", "")
    table.insert(new_content, new_line)
  end
  vim.api.nvim_buf_set_lines(buffer_index, start_index, end_index, false, new_content)
end

function M.updateDependencies()
  packer.update()
  local tsUpdateSync = treesitter_install.commands.TSUpdateSync['run<bang>']
  tsUpdateSync()
end

local function setupVimCommands()
  vim.cmd [[
    command! TrimWhiteSpace lua require'user.utils'.trimWhitespace()
    command! UpdateDependencies lua require'user.utils'.updateDependencies()
  ]]
end

function M.setup()
  setupVimCommands()
end

M.setup()

return M
