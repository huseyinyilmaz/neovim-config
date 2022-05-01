local M = {}
M.require = function (module_str)
  local status_ok, module = pcall(require, module_str)
  if not status_ok then
    local file_name = vim.api.nvim_buf_get_name(0)
    vim.notify('Error on loading ' .. module_str .. '. File name: ' .. file_name, 'error')
	  return
  else
    return module
  end
end
return M

