# Status Extmark — Luồng hoạt động

## 1. Khởi tạo (server.lua:29)

```
server.lua
  └─ require("...status_extmark").setup()
       ├─ init.lua:M.setup()
       │    ├─ Đặt 4 highlight groups (Pending, Tool, Error, Done)
       │    ├─ hooks.setup()      → monkey-patch opencode.ask
       │    └─ autocmds.setup()   → đăng ký 4 event listeners
       │
       └─ state.lua
            ├─ NS = namespace "opencode_status"
            ├─ data = { bufnr, first_line, last_line, tool, session_status, extmarks }
            └─ TOOL_LABELS = map tool name → tiếng Việt
```

## 2. User gửi prompt với @this (hooks.lua)

```
User nhấn <leader>ca → opencode.ask("@this: ")
                          │
                          ▼
              hooks.lua: opencode.ask (wrapped)
              │
              ├─ Bước 1: Chụp vị trí code
              │   ├─ Nếu đang visual mode → feedkeys <esc>, đọc marks < > → first_line, last_line
              │   └─ Nếu normal mode → dùng cursor line
              │
              ├─ Bước 2: Gọi original_ask(default) → mở prompt input
              │
              └─ Bước 3: Nếu prompt chứa "@this"
                  └─ vim.schedule() →
                       └─ Cập nhật state.data → bufnr, first_line, last_line, tool=nil
                          (CHƯA đặt extmark — chờ session thực sự busy)
```

## 3. Server phản hồi → Autocmds nhận event

```
┌─────────────────────────────────────────────────────────────┐
│  Event: session.status                                      │
│  autocmds.lua:8-39                                          │
│                                                             │
│  server.connected → state.session_status = "idle"           │
│  session.status   → state.session_status = type             │
│                       ("busy" | "idle" | "error")           │
│                                                             │
│  Sau đó, nếu có tracked buffer (state.data.bufnr):         │
│    idle  → extmarks.clear()                                 │
│    error → extmarks.place("opencode: error", "OpencodeStatusError") │
│    busy  → extmarks.place("thinking.../tool label", "OpencodeStatusTool") │
├─────────────────────────────────────────────────────────────┤
│  Event: message.part.updated                                │
│  autocmds.lua:42-66                                         │
│                                                             │
│  part.type == "tool" →                                      │
│    state.tool = part.tool (Read, Bash, Edit...)             │
│    Nếu session busy → extmarks.place(tool_label)            │
├─────────────────────────────────────────────────────────────┤
│  Event: server.instance.disposed                            │
│  autocmds.lua:69-79                                         │
│                                                             │
│  extmarks.clear()                                           │
│  state = { tool=nil, session_status=nil }                   │
├─────────────────────────────────────────────────────────────┤
│  Event: BufDelete                                           │
│  autocmds.lua:82-91                                         │
│                                                             │
│  Nếu buffer bị xóa = buffer đang track → cleanup            │
└─────────────────────────────────────────────────────────────┘
```

## 4. Logic hiển thị (inline trong autocmds.lua)

```
session.status callback:
  │
  ├─ bufnr == nil       → return (chưa track buffer nào)
  ├─ session == idle    → extmarks.clear()
  ├─ session == error   → extmarks.place("opencode: error", "OpencodeStatusError")
  └─ session == busy    →
       ├─ tool = "Read"    → above = "opencode: reading"
       ├─ tool = "Bash"    → above = "opencode: running shell"
       ├─ tool = nil       → above = "󰗀 opencode: thinking..."
       └─ extmarks.place(above, "session busy", "OpencodeStatusTool", "OpencodeStatusPending")

message.part.updated callback:
  │
  └─ Nếu session busy + có tracked buffer →
       ├─ tool = "Read"    → above = "opencode: reading"
       ├─ tool = "Bash"    → above = "opencode: running shell"
       ├─ tool = nil       → above = "󰗀 opencode: thinking..."
       └─ extmarks.place(above, "session busy", "OpencodeStatusTool", "OpencodeStatusPending")
```

## 5. Vẽ extmark (extmarks.lua)

```
extmarks.place(above_text, below_text, above_hl, below_hl)
  │
  ├─ clear() → xóa extmark trước đó (tránh trùng)
  │
  ├─ Above: nvim_buf_set_extmark()
  │   ├─ Vị trí: first_line - 1, cột 0
  │   ├─ virt_lines = { {"  opencode: reading", Tool}, {"", Normal} }
  │   └─ virt_lines_above = true
  │
  └─ Below: nvim_buf_set_extmark()
      ├─ Vị trí: last_line - 1, cột cuối dòng
      ├─ virt_text = { {"  session busy", Pending} }
      └─ virt_text_pos = "eol"
```

## Kết quả hiển thị trong buffer

```
  󰗀 opencode: reading           ← virt_lines (dòng ảo trên)
                                  ← dòng trống
function hello()                 ← first_line
  print("world")                 ← last_line
end                               ← virt_text inline "session busy"
```

## Tóm tắt bằng flowchart

```
User ──<leader>ca>──→ hooks.capture()
                          │
                    original_ask() → mở prompt
                          │
                    ┌─────┴─────┐
                    │   Server  │
                    └─────┬─────┘
                          │
               ┌──────────┼──────────┐
               ▼          ▼          ▼
        session.status  tool.*  server.disposed
               │          │          │
               ▼          ▼          ▼
         autocmds.lua  autocmds.lua  autocmds.lua
               │          │          │
               ▼          ▼          ▼
          state.data ← cập nhật ──→ extmarks.place() / extmarks.clear()
                                          │
                                          ▼
                                  Neovim buffer UI
```

## Cấu trúc module

```
status_extmark/
├── init.lua        — Public API: M.setup()
├── state.lua       — Namespace, state table, TOOL_LABELS
├── extmarks.lua    — M.clear(), M.place()
├── autocmds.lua    — Event listeners + inline display logic
└── hooks.lua       — Monkey-patch opencode.ask
```
