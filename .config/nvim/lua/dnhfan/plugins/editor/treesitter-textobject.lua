return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  init = function()
    -- Tắt map mặc định để tránh xung đột, vì mình sẽ tự map thủ công bên dưới
    vim.g.no_plugin_maps = true
  end,
  config = function()
    -- 1. Setup options cơ bản (Option cho behavior)
    require("nvim-treesitter-textobjects").setup({
      select = {
        lookahead = true,
        selection_modes = {
          ['@parameter.outer'] = 'v', -- charwise
          ['@function.outer'] = 'V',  -- linewise
          -- ['@class.outer'] = '<c-v>', -- blockwise
        },
        include_surrounding_whitespace = false,
      },
      move = {
        -- whether to set jumps in the jumplist
        set_jumps = true,
      },
    })

    -- Import các module cần thiết
    local select = require("nvim-treesitter-textobjects.select")
    local swap = require("nvim-treesitter-textobjects.swap")
    local move = require("nvim-treesitter-textobjects.move")
    local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

    -- Hàm helper để viết keymap cho gọn
    local function map(mode, key, func, desc)
      vim.keymap.set(mode, key, func, { desc = desc, silent = true })
    end

    -- ========================================================================
    -- 2. SELECT TEXTOBJECTS (Chọn vùng) - Mode: x (visual), o (operator pending)
    -- ========================================================================

    -- Assignment (Phép gán: =)
    map({ "x", "o" }, "a=", function() select.select_textobject("@assignment.outer", "textobjects") end,
      "[Text Object]: Select outer assignment")
    map({ "x", "o" }, "i=", function() select.select_textobject("@assignment.inner", "textobjects") end,
      "[Text Object]: Select inner assignment")
    map({ "x", "o" }, "l=", function() select.select_textobject("@assignment.lhs", "textobjects") end,
      "[Text Object]: Select LHS assignment")
    map({ "x", "o" }, "r=", function() select.select_textobject("@assignment.rhs", "textobjects") end,
      "[Text Object]: Select RHS assignment")

    -- Property (Object key-value: :)
    map({ "x", "o" }, "a:", function() select.select_textobject("@property.outer", "textobjects") end,
      "[Text Object]: Select outer property")
    map({ "x", "o" }, "i:", function() select.select_textobject("@property.inner", "textobjects") end,
      "[Text Object]: Select inner property")
    map({ "x", "o" }, "l:", function() select.select_textobject("@property.lhs", "textobjects") end,
      "[Text Object]: Select LHS property")
    map({ "x", "o" }, "r:", function() select.select_textobject("@property.rhs", "textobjects") end,
      "[Text Object]: Select RHS property")

    -- Parameter / Argument (aa, ia)
    map({ "x", "o" }, "aa", function() select.select_textobject("@parameter.outer", "textobjects") end,
      "[Text Object]: Select outer argument")
    map({ "x", "o" }, "ia", function() select.select_textobject("@parameter.inner", "textobjects") end,
      "[Text Object]: Select inner argument")

    -- Conditional (ai, ii)
    map({ "x", "o" }, "ai", function() select.select_textobject("@conditional.outer", "textobjects") end,
      "[Text Object]: Select outer conditional")
    map({ "x", "o" }, "ii", function() select.select_textobject("@conditional.inner", "textobjects") end,
      "[Text Object]: Select inner conditional")

    -- Loop (al, il)
    map({ "x", "o" }, "al", function() select.select_textobject("@loop.outer", "textobjects") end,
      "[Text Object]: Select outer loop")
    map({ "x", "o" }, "il", function() select.select_textobject("@loop.inner", "textobjects") end,
      "[Text Object]: Select inner loop")

    -- Function Call (af, if)
    map({ "x", "o" }, "af", function() select.select_textobject("@call.outer", "textobjects") end,
      "[Text Object]: Select outer function call")
    map({ "x", "o" }, "if", function() select.select_textobject("@call.inner", "textobjects") end,
      "[Text Object]: Select inner function call")

    -- Function Definition (am, im)
    map({ "x", "o" }, "am", function() select.select_textobject("@function.outer", "textobjects") end,
      "[Text Object]: Select outer function def")
    map({ "x", "o" }, "im", function() select.select_textobject("@function.inner", "textobjects") end,
      "[Text Object]: Select inner function def")

    -- Class (ac, ic)
    map({ "x", "o" }, "ac", function() select.select_textobject("@class.outer", "textobjects") end,
      "[Text Object]: Select outer class")
    map({ "x", "o" }, "ic", function() select.select_textobject("@class.inner", "textobjects") end,
      "[Text Object]: Select inner class")

    -- ========================================================================
    -- 3. SWAP (Hoán đổi vị trí) - Mode: n (normal)
    -- ========================================================================

    -- Swap Next
    map("n", "<leader>na", function() swap.swap_next("@parameter.inner") end, "[Text Object]: Swap next argument")
    map("n", "<leader>nm", function() swap.swap_next("@function.outer") end, "[Text Object]: Swap next function")
    map("n", "<leader>n:", function() swap.swap_next("@property.outer") end, "[Text Object]: Swap next property")

    -- Swap Previous
    map("n", "<leader>pa", function() swap.swap_previous("@parameter.inner") end, "[Text Object]: Swap prev argument")
    map("n", "<leader>pm", function() swap.swap_previous("@function.outer") end, "[Text Object]: Swap prev function")
    map("n", "<leader>p:", function() swap.swap_previous("@property.outer") end, "[Text Object]: Swap prev property")

    -- ========================================================================
    -- 4. MOVE (Di chuyển)
    -- ========================================================================

    -- --- Function (Hàm) ---
    -- ]m : Đi tới đầu hàm tiếp theo
    map({ "n", "x", "o" }, "]m", function()
      move.goto_next_start("@function.outer")
    end, "[Text Object]: Next function start")

    -- ]M : Đi tới cuối hàm tiếp theo
    map({ "n", "x", "o" }, "]M", function()
      move.goto_next_end("@function.outer")
    end, "[Text Object]: Next function end")

    -- [m : Lùi lại đầu hàm trước đó
    map({ "n", "x", "o" }, "[m", function()
      move.goto_previous_start("@function.outer")
    end, "[Text Object]: Prev function start")

    -- [M : Lùi lại cuối hàm trước đó
    map({ "n", "x", "o" }, "[M", function()
      move.goto_previous_end("@function.outer")
    end, "[Text Object]: Prev function end")


    -- --- Class (Lớp) ---
    -- ]] : Đi tới đầu class tiếp theo
    map({ "n", "x", "o" }, "]]", function()
      move.goto_next_start("@class.outer")
    end, "[Text Object]: Next class start")

    -- ][ : Đi tới cuối class tiếp theo
    map({ "n", "x", "o" }, "][", function()
      move.goto_next_end("@class.outer")
    end, "[Text Object]: Next class end")

    -- [[ : Lùi lại đầu class trước đó
    map({ "n", "x", "o" }, "[[", function()
      move.goto_previous_start("@class.outer")
    end, "[Text Object]: Prev class start")

    -- [] : Lùi lại cuối class trước đó
    map({ "n", "x", "o" }, "[]", function()
      move.goto_previous_end("@class.outer")
    end, "[Text Object]: Prev class end")


    -- --- Loop (Vòng lặp) ---
    map({ "n", "x", "o" }, "]l", function()
      move.goto_next_start("@loop.outer")
    end, "[Text Object]: Next loop start")
    map({ "n", "x", "o" }, "[l", function()
      move.goto_previous_start("@loop.outer")
    end, "[Text Object]: Prev loop start")


    -- --- Conditional (If/Else) ---
    map({ "n", "x", "o" }, "]i", function()
      move.goto_next_start("@conditional.outer")
    end, "[Text Object]: Next conditional start")
    map({ "n", "x", "o" }, "[i", function()
      move.goto_previous_start("@conditional.outer")
    end, "[Text Object]: Prev conditional start")


    -- --- Scope (Phạm vi) & Fold ---
    map({ "n", "x", "o" }, "]s", function()
      move.goto_next_start("@local.scope")
    end, "[Text Object]: Next scope")
    map({ "n", "x", "o" }, "]z", function()
      move.goto_next_start("@fold")
    end, "[Text Object]: Next fold")

    -- ========================================================================
    -- 5. REPEAT (Lặp lại)
    -- ========================================================================

    -- ; sẽ luôn đi tới (Forward), , sẽ luôn đi lùi (Backward)
    -- Bất kể lệnh trước đó là ]m hay [m
    map({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next, "[Text Object]: Repeat last move (next)")
    map({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous, "[Text Object]: Repeat last move (prev)")

    -- Nếu ông muốn ; lặp lại theo hướng cũ (Vim way) thì mở comment 2 dòng dưới, đóng 2 dòng trên
    -- map({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
    -- map({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

    -- Làm cho f, F, t, T cũng lặp lại được bằng ; và ,
    -- LƯU Ý: Phải dùng `builtin_..._expr` và `{ expr = true }` mới đúng chuẩn Doc
    vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr,
      { expr = true, desc = "[Text Object]: Find char forward" })
    vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr,
      { expr = true, desc = "[Text Object]: Find char backward" })
    vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr,
      { expr = true, desc = "[Text Object]: Until char forward" })
    vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr,
      { expr = true, desc = "[Text Object]: Until char backward" })
  end,
}
