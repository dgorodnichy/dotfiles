local M = {}

function M.copy_relative_path()
  local path = vim.fn.expand('%:p:.')
  vim.fn.setreg("+", path)
  vim.notify("📄 Copied path: " .. path, vim.log.levels.INFO)
end

return M
