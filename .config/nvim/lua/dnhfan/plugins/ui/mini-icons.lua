return {
  "echasnovski/mini.icons",
  lazy = true,
  opts = {
    file = {
      [".keep"]               = { glyph = "󰊢", hl = "MiniIconsGrey" },
      ["devcontainer.json"]   = { glyph = "", hl = "MiniIconsAzure" },

      -- Khai báo Docker ở đây
      ["Dockerfile"]          = { glyph = "", hl = "MiniIconsBlue" },
      ["docker-compose.yml"]  = { glyph = "", hl = "MiniIconsBlue" },
      ["docker-compose.yaml"] = { glyph = "", hl = "MiniIconsBlue" },

      ["yarn.lock"]           = { glyph = "", hl = "MiniIconsBlue" },

      [".env"]                = { glyph = "", hl = "MiniIconsYellow" },

      -- Icon con thỏ cho file config
      ["rabbitmq.conf"]       = { glyph = "", hl = "MiniIconsOrange" },
      ["rabbitmq-env.conf"]   = { glyph = "", hl = "MiniIconsOrange" },
      ["enabled_plugins"]     = { glyph = "", hl = "MiniIconsOrange" }, -- File plugin của RabbitMQ
    },
    filetype = {
      dotenv = { glyph = "", hl = "MiniIconsYellow" },
    },
    extension = {
      ["sh"]      = { glyph = "", hl = "MiniIconsGrey" },
      ["bash"]    = { glyph = "", hl = "MiniIconsGreen" },
      ["zsh"]     = { glyph = "", hl = "MiniIconsGreen" },

      ["command"] = { glyph = "", hl = "MiniIconsGrey" },
    },

  },
  init = function()
    package.preload["nvim-web-devicons"] = function()
      -- Dòng này giúp mini.icons "giả dạng" thành nvim-web-devicons
      -- để các plugin khác không bị gãy.
      require("mini.icons").mock_nvim_web_devicons()
      return package.loaded["nvim-web-devicons"]
    end
  end,
}
