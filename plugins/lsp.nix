{pkgs, ...}: {
  plugins.lsp = {
    enable = true;

    keymaps = {
      diagnostic = {
        "<leader>dn" = "goto_next";
        "<leader>dp" = "goto_prev";
        "<leader>dq" = "setqflist";
        "<leader>do" = "open_float";
      };
      lspBuf = {
        "K" = "hover";
        "gd" = "definition";
        "gD" = "implementation";
        "<leader>fs" = "workspace_symbol";
        "<leader>rs" = "rename";
        "<leader>a" = "code_action";
        "gr" = "references";
        "<leader>=" = "format";
      };
    };

    servers = {
      terraformls.enable = true;
      bashls.enable = true;
      clangd.enable = true;
      cssls.enable = true;
      gopls.enable = true;
      solargraph.enable = true;
      lua-ls = {
        enable = true;
        extraOptions = {
          settings = {
            Lua = {
              format = {
                enable = true;
              };
              diagnostics = {
                globals = ["vim" "spec"];
              };
              runtime = {
                version = "LuaJIT";
                special = {
                  spec = "require";
                };
              };
              telemetry = {
                enable = false;
              };
            };
          };
        };
      };
      nil-ls = {
        enable = true;
        extraOptions = {
          settings = {
            nil = {
              formatting = {
                command = ["alejandra"];
              };
              nix = {
                flake = {
                  autoArchive = true;
                  autoEvalInputs = false;
                };
              };
            };
          };
        };
      };
      pyright.enable = true;
      tailwindcss.enable = true;
      tsserver.enable = true;
      yamlls.enable = true;
    };
  };

  extraPackages = with pkgs; [
    alejandra
    nodePackages.prettier
  ];

  extraConfigLua = ''
    for type, icon in pairs({
      Error = '>>',
      Warn = '->',
      Hint = '>-',
      Info = '--'
    }) do
      local name = 'DiagnosticSign' .. type
      local mapping = { text = icon, texthl = name, numhl = "" }
      vim.fn.sign_define(name, mapping)
    end
  '';
}
