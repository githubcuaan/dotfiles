local state = require("dnhfan.plugins.configs.opencode.status_extmark.state")
local extmarks = require("dnhfan.plugins.configs.opencode.status_extmark.extmarks")

local M = {}

function M.setup()
  -- Listen to session status events
  vim.api.nvim_create_autocmd("User", {
    pattern = {
      "OpencodeEvent:session.status",
      "OpencodeEvent:server.connected",
    },
    callback = function(args)
      local event = args.data.event
      vim.schedule(function()
        if event.type == "server.connected" then
          state.data.session_status = "idle"
        elseif event.type == "session.status" and event.properties then
          state.data.session_status = event.properties.status.type
        end

        local s = state.data
        if not s.bufnr then
          return
        end

        if s.session_status == "idle" or s.session_status == nil then
          extmarks.clear()
        elseif s.session_status == "error" then
          extmarks.place("opencode: error", nil, "OpencodeStatusError", nil)
        elseif s.session_status == "busy" then
          local tool_label = s.tool and state.TOOL_LABELS[s.tool]
          local above = tool_label and ("opencode: " .. tool_label) or "󰗀 opencode: thinking..."
          extmarks.place(above, "session busy", "OpencodeStatusTool", "OpencodeStatusPending")
        end
      end)
    end,
    desc = "OpenCode status extmark: session status",
  })

  -- Listen to message.part.updated for tool info
  vim.api.nvim_create_autocmd("User", {
    pattern = "OpencodeEvent:message.part.updated",
    callback = function(args)
      local event = args.data.event
      local part = event.properties and event.properties.part
      if part and part.type == "tool" and part.state then
        vim.schedule(function()
          if part.state.status == "running" or part.state.status == "pending" then
            state.data.tool = part.tool
          elseif part.state.status == "completed" or part.state.status == "error" then
            -- Keep the tool label visible until session goes idle
            state.data.tool = part.tool
          end

          -- Update display if session is busy
          if state.data.session_status == "busy" and state.data.bufnr then
            local tool_label = state.data.tool and state.TOOL_LABELS[state.data.tool]
            local above = tool_label and ("opencode: " .. tool_label) or "󰗀 opencode: thinking..."
            extmarks.place(above, "session busy", "OpencodeStatusTool", "OpencodeStatusPending")
          end
        end)
      end
    end,
    desc = "OpenCode status extmark: tool events",
  })

  -- Clean up on server dispose
  vim.api.nvim_create_autocmd("User", {
    pattern = "OpencodeEvent:server.instance.disposed",
    callback = function()
      vim.schedule(function()
        extmarks.clear()
        state.data.tool = nil
        state.data.session_status = nil
      end)
    end,
    desc = "OpenCode status extmark: server dispose",
  })

  -- Clean up when buffer is deleted
  vim.api.nvim_create_autocmd("BufDelete", {
    callback = function(args)
      if args.buf == state.data.bufnr then
        extmarks.clear()
        state.data.bufnr = nil
        state.data.tool = nil
      end
    end,
    desc = "OpenCode status extmark: buffer cleanup",
  })
end

return M
