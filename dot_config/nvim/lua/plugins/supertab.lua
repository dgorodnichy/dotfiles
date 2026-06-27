return {
  "hrsh7th/nvim-cmp",
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    -- 1. Отключаем ВСЕ автоматические триггеры автодополнения
    opts.completion = {
      autocomplete = false, -- Полностью отключает авто-показ
    }

    -- 2. Функция проверки, находится ли курсор внутри слова
    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local cmp = require("cmp")

    -- 3. Настраиваем только ручной вызов по Tab
    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif has_words_before() then
          cmp.complete() -- Ручной вызов автодополнения
        else
          fallback() -- Стандартное поведение Tab
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" }),
    })
  end,
}
