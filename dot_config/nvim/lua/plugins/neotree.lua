return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      mappings = {
        ["<Tab>"] = function()
          if vim.bo.ft == "neo-tree" then
            vim.cmd("wincmd w")
          end
        end,
        ["<S-Tab>"] = "prev_source",
        ["<C-Tab>"] = "next_source",
      },
    },
    filesystem = {
      follow_current_file = {
        enabled = true,
      },
    },
  },
}