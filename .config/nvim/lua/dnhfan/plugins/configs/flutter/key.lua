return {
  -- Run & Reload
  { "<leader>frr", "<cmd>FlutterRun<cr>",                       desc = "Flutter Run" },
  { "<leader>fRR", "<cmd>FlutterRestart<cr>",                   desc = "Flutter Restart" },
  { "<leader>frq", "<cmd>FlutterQuit<cr>",                      desc = "Flutter Quit" },

  -- Hot Reload / Hot Restart
  { "<leader>frh", "<cmd>FlutterReload<cr>",                    desc = "Flutter Hot Reload" },
  { "<leader>frH", "<cmd>FlutterHotRestart<cr>",                desc = "Flutter Hot Restart" },

  -- Devices & Emulators
  { "<leader>fd",  "<cmd>FlutterDevices<cr>",                   desc = "Flutter Devices" },
  { "<leader>fe",  "<cmd>FlutterEmulators<cr>",                 desc = "Flutter Emulators" },

  -- DevTools
  { "<leader>fD",  "<cmd>FlutterDevTools<cr>",                  desc = "Flutter DevTools" },
  { "<leader>fA",  "<cmd>FlutterDevToolsActivate<cr>",          desc = "Flutter DevTools Activate" },

  -- Outline & Widgets
  { "<leader>fo",  "<cmd>FlutterOutlineToggle<cr>",             desc = "Flutter Outline Toggle" },
  { "<leader>fO",  "<cmd>FlutterOutlineToggleUp<cr>",           desc = "Flutter Outline Up" },

  -- LSP
  { "<leader>fL",  "<cmd>FlutterLspRestart<cr>",                desc = "Flutter LSP Restart" },

  -- Pub
  { "<leader>fpu", "<cmd>FlutterPubGet<cr>",                    desc = "Flutter Pub Get" },
  { "<leader>fpU", "<cmd>FlutterPubUpgrade<cr>",                desc = "Flutter Pub Upgrade" },

  -- Copy
  { "<leader>fC",  "<cmd>FlutterCopyProfilerUrl<cr>",           desc = "Flutter Copy Profiler URL" },

  -- Test
  { "<leader>ft",  "<cmd>FlutterTest<cr>",                      desc = "Flutter Test" },
  { "<leader>fT",  "<cmd>FlutterTestRun<cr>",                   desc = "Flutter Test Run" },
}
