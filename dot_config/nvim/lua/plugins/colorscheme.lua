return {
  {
    "folke/tokyonight.nvim",
    opts = {
        style = "moon",
        terminal_colors = true,
        comments = { italic = true },
        keywords = { italic = true },
        code_style = {
          comments = "italic",
          keywords = "bold",
          functions = "bold",
        },
        on_highlights = function(hl, c)
          hl.Visual = {
            bg = c.orange,
            fg = c.bg,
            bold = true,
          }

          hl.VisualNOS = {
            bg = c.orange,
            fg = c.bg,
          }
        end
    },
  },
}

-- return {
--   {
--     "navarasu/onedark.nvim",
--     priority = 1000,
--     config = function()
--       vim.opt.termguicolors = true
--
--       require("onedark").setup({
--         style = "darker",
--         transparent = false,
--         term_colors = true,
--
--         code_style = {
--           comments = "italic",
--           keywords = "bold",
--           functions = "bold",
--         },
--
--         colors = {
--           bg0 = "#1e222a",
--         },
--
--         highlights = {
--           CursorLine = { bg = "#2a2f3a" },
--           Visual = { bg = "#3e4452" },
--         },
--       })
--
--       require("onedark").load()
--     end,
--   },
-- }
