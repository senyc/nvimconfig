{pkgs, ...}: let
  utils = import ../utils.nix;
in {
  extraPlugins = [];
  plugins = {
    dap-go = {
      enable = true;
      settings = {
        delve.path = "${pkgs.delve}/bin/dlv";
      };
    };

    dap-python = {
      enable = true;
    };

    dap-virtual-text = {
      enable = true;
    };

    dap-ui = {
      enable = true;
    };

    dap = {
      enable = true;
      adapters.servers = {
        "pwa-node" = {
          host = "localhost";
          port = "\${port}";
          executable = {
            command = "${pkgs.vscode-js-debug}/bin/js-debug";
            args = ["\${port}"];
          };
        };
        "pwa-chrome" = {
          host = "localhost";
          port = "\${port}";
          executable = {
            command = "${pkgs.vscode-js-debug}/bin/js-debug";
            args = ["\${port}"];
          };
        };
      };
      luaConfig.pre = ''
        local dap = require "dap"
        local ui = require "dapui"
        dap.listeners.before.attach.dapui_config = function()
          ui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
          ui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
          ui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
          ui.close()
        end

        for _, language in ipairs({ "typescript", "typescriptreact"}) do
            if not dap.configurations[language] then
              dap.configurations[language] = {
                -- Server-side / Node.js
                {
                  name = "Node: Launch (npm run dev:debug)",
                  type = "pwa-node",
                  request = "launch",
                  cwd = vim.fn.getcwd(),
                  runtimeExecutable = "npm",
                  args = { "run", "dev:debug" },
                  sourceMaps = true,
                  console = "integratedTerminal",
                  skipFiles = { "<node_internals>/**", "**/node_modules/**" },
                  resolveSourceMapLocations = { "''${workspaceFolder}/**", "!**/node_modules/**" },
                  killBehavior = "forceful",
                },
                {
                  name = "Node: Attach",
                  type = "pwa-node",
                  request = "attach",
                  processId = require("dap.utils").pick_process,
                  cwd = vim.fn.getcwd(),
                  sourceMaps = true,
                  skipFiles = { "<node_internals>/**", "**/node_modules/**" },
                  killBehavior = "forceful",
                },
                {
                  name = "Node: Attach (Server Components - port 9230)",
                  type = "pwa-node",
                  request = "attach",
                  -- This will start two servers one on 9229 (for Frontend), the other for server 9230
                  port = 9230,
                  cwd = vim.fn.getcwd(),
                  runtimeExecutable = "npm",
                  args = { "run", "dev:debug" },
                  sourceMaps = true,
                  skipFiles = { "<node_internals>/**", "**/node_modules/**" },
                  resolveSourceMapLocations = { "''${workspaceFolder}/**", "!**/node_modules/**" },
                  killBehavior = "forceful",
                },
                -- Frontend / Browser
                {
                  name = "Chrome: Launch (localhost:3000)",
                  type = "pwa-chrome",
                  request = "launch",
                  url = "http://localhost:3000",
                  webRoot = vim.fn.getcwd(),
                  sourceMaps = true,
                  skipFiles = { "<node_internals>/**", "**/node_modules/**" },
                  killBehavior = "forceful",
                },
                {
                  name = "Chrome: Launch (localhost:5173)",
                  type = "pwa-chrome",
                  request = "launch",
                  url = "http://localhost:5173",
                  webRoot = vim.fn.getcwd(),
                  sourceMaps = true,
                  skipFiles = { "<node_internals>/**", "**/node_modules/**" },
                  killBehavior = "forceful",
                },
              }
            end
          end
      '';
    };
  };

  keymaps = utils.defaultMap [
    {
      key = "<leader>?";
      action = ":lua require('dapui').eval(nil, {enter = true})<cr>";
      desc = "Toggle breakpoint";
    }
    {
      key = "<leader>b";
      action = ":lua require('dap').toggle_breakpoint()<cr>";
      desc = "Toggle breakpoint";
    }
    {
      key = "<leader>deb";
      action = ":lua require('dap').set_exception_breakpoints()<cr>";
      desc = "Toggle exception breakpoint";
    }
    {
      key = "<leader>drc";
      action = ":lua require('dap').run_to_cursor()<cr>";
      desc = "Debugger run to cursor";
    }
    {
      key = "<leader>dc";
      action = ":lua require('dap').continue()<cr>";
      desc = "debugger continue";
    }
    {
      key = "<leader>di";
      action = ":lua require('dap').step_into({askForTargets = true})<cr>";
    }
    {
      key = "<leader>duo";
      action = ":lua require('dapui').open()<cr>";
      desc = "dap ui open";
    }
    {
      key = "<leader>duc";
      action = ":lua require('dapui').close()<cr>";
      desc = "dap ui close";
    }
    {
      key = "<leader>do";
      action = ":lua require('dap').step_over()<cr>";
    }
    {
      key = "<leader>dx";
      action = ":lua require('dap').step_out()<cr>";
    }
    {
      key = "<leader>db";
      action = ":lua require('dap').step_back()<cr>";
    }
    {
      key = "<leader>ca";
      action = ":lua require('dap').clear_breakpoints()<cr>";
      desc = "Clear all breakpoints";
    }
    {
      key = "<leader>dr";
      action = ":lua require('dap').restart()<cr>";
      desc = "Debugger restart";
    }
  ];
}
