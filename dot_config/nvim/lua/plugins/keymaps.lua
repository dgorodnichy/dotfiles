local path_utils = require("utils.path")

return {
  {
    "LazyVim/LazyVim",
    keys = {
      { "<leader>fp", path_utils.copy_relative_path, desc = "Copy relative file path" },
    },
  },
}

