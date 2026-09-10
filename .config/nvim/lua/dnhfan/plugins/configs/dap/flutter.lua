local dap = require("dap")

-- NOTE: Flutter/Dart DAP adapter
-- flutter-tools.nvim manages the Dart Analysis Server,
-- but for debugging we register a DAP adapter that uses Flutter's VM service.

dap.adapters.dart = {
  type = "executable",
  command = "/home/andev/tools/flutter/bin/dart",
  args = { "debug_adapter" },
}

dap.configurations.dart = {
  {
    type = "dart",
    request = "launch",
    name = "Flutter",
    dartSdkPath = "/home/andev/tools/flutter/bin/cache/dart-sdk",
    flutterSdkPath = "/home/andev/tools/flutter",
    program = "${workspaceFolder}/lib/main.dart",
    cwd = "${workspaceFolder}",
    toolArgs = { "-d", "${flutterDeviceId}" },
    sendLogsToClient = true,
    terminateDebuggee = true,
  },
  {
    type = "dart",
    request = "launch",
    name = "Flutter (no Debug)",
    dartSdkPath = "/home/andev/tools/flutter/bin/cache/dart-sdk",
    flutterSdkPath = "/home/andev/tools/flutter",
    program = "${workspaceFolder}/lib/main.dart",
    cwd = "${workspaceFolder}",
    toolArgs = { "-d", "${flutterDeviceId}", "--no-debug" },
    sendLogsToClient = true,
    terminateDebuggee = true,
  },
  {
    type = "dart",
    request = "launch",
    name = "Flutter (profile)",
    dartSdkPath = "/home/andev/tools/flutter/bin/cache/dart-sdk",
    flutterSdkPath = "/home/andev/tools/flutter",
    program = "${workspaceFolder}/lib/main.dart",
    cwd = "${workspaceFolder}",
    toolArgs = { "-d", "${flutterDeviceId}", "--profile" },
    sendLogsToClient = true,
    terminateDebuggee = true,
  },
}
