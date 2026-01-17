{pkgs, ...}: let
  utils = import ../utils.nix;
in {
  extraPlugins = [];
  plugins = {
    dap-virtual-text = {
      enable = true;
      settings = {
        all_frames = true;
        all_references = true;
      };
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
        for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
            if not dap.configurations[language] then
              dap.configurations[language] = {
                {
                  name = "Launch (npm run dev:debug)",
                  type = "pwa-node",
                  request = "launch",
                  cwd = vim.fn.getcwd(),
                  runtimeExecutable = "npm",
                  args = { "run", "dev:debug" },
                  sourceMaps = true,
                  console = "integratedTerminal",
                  skipFiles = { "<node_internals>/**", "**/node_modules/**" },
                  resolveSourceMapLocations = { "''${workspaceFolder}/**", "!**/node_modules/**" },
                },
              }
            end
          end
      '';
    };
  };

  keymaps = utils.defaultMap [
    # this may not work
    {
      key = "<leader>?";
      action = ":lua require('dapui').eval(nil, {enter = true})<cr>";
      desc = "Toggle breakpoint";
    }
    {
      key = "<leader>bt";
      action = ":lua require('dap').toggle_breakpoint()<cr>";
      desc = "Toggle breakpoint";
    }
    {
      key = "<leader>bcr";
      action = ":lua require('dap').run_to_cursor()<cr>";
      desc = "Run to cursor";
    }
    {
      key = "<leader>bn";
      action = ":lua require('dap').continue()<cr>";
      desc = "Breakpoint next";
    }
    {
      key = "<leader>bi";
      action = ":lua require('dap').step_into()<cr>";
      desc = "Breakpoint into";
    }
    {
      key = "<leader>bo";
      action = ":lua require('dap').step_over()<cr>";
      desc = "Breakpoint next";
    }
    {
      key = "<leader>bx";
      action = ":lua require('dap').step_out()<cr>";
      desc = "Breakpoint out";
    }
    {
      key = "<leader>bb";
      action = ":lua require('dap').step_back()<cr>";
      desc = "Breakpoint back";
    }
    {
      key = "<leader>bca";
      action = ":lua require('dap').clear_breakpoints()<cr>";
      desc = "Breakpoint back";
    }
    {
      key = "<leader>br";
      action = ":lua require('dap').restart()<cr>";
      desc = "Breakpoint restart";
    }
  ];
}
