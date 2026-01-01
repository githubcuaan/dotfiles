return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async", -- Phải có thằng này mới chạy được
    -- Tùy chọn: nvim-treesitter để nhận diện code chuẩn hơn
    "nvim-treesitter/nvim-treesitter",
  },
  event = "BufRead", -- Load khi mở file cho nhẹ

  config = function()
    -- Tắt folding mặc định của nvim đi để ufo nó lo
    vim.o.foldcolumn = "0" -- Hiện cột fold bên trái
    vim.o.foldlevel = 99 -- Mở tất cả code khi mới vào file
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    -- use Neovim nightly branch
    vim.opt.fillchars = {
      eob = " ", -- Bỏ dấu ~ ở cuối file
      fold = " ", -- Bỏ dấu chấm/gạch ở dòng fold (Quan trọng để ẩn số)
      foldopen = "", -- Icon mở
      foldsep = " ", -- Cột ngăn cách
      foldclose = "", -- Icon đóng
      -- this only have in neovim nightly
      -- foldinner = " ",
    }
    -- Config phím tắt
    local keymap = vim.keymap.set
    keymap("n", "zR", require("ufo").openAllFolds)
    keymap("n", "zM", require("ufo").closeAllFolds)

    local handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}

      local suffix = (" ⋯  %d lines "):format(endLnum - lnum)
      local padding = " "

      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0

      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, { chunkText, hlGroup })
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          -- If truncate() may less than 2nd argument, need padding
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
      -- table.insert(newVirtText, { suffix, "MoreMsg" })
      -- table.insert(newVirtText, { suffix, "Comment" })
      -- table.insert(newVirtText, { suffix, "Folded" })
      table.insert(newVirtText, { padding, "" })
      table.insert(newVirtText, { suffix, "Visual" })
      return newVirtText
    end

    -- Setup basic
    require("ufo").setup({
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
      -- Kích hoạt cái hàm làm đẹp ở trên
      fold_virt_text_handler = handler,
    })
  end,
}
