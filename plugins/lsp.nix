{pkgs, ...}: {
  # Allow lsp client to distinguish helm manifests
  plugins.helm.enable = true;
  plugins.lsp = {
    enable = true;

    keymaps = {
      diagnostic = {
        "<leader>dq" = "setqflist";
      };

      lspBuf = {
        "gd" = "definition";
        "gD" = "declaration";
        # gr - get reference
        "grf" = "format";
        "grt" = "type_definition";
        "grI" = "incoming_calls";
      };
    };

    servers = {
      emmet_language_server.enable = true;
      volar.enable = true;
      terraformls.enable = true;
      bashls.enable = true;
      clangd.enable = true;
      cssls.enable = true;
      gopls.enable = true;
      solargraph.enable = true;
      lua_ls = {
        enable = true;
        extraOptions = {
          settings = {
            Lua = {
              format = {
                enable = true;
              };
              diagnostics = {
                globals = ["vim" "assert" "spec"];
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
      nil_ls = {
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
      ts_ls.enable = true;
      helm_ls = {
        enable = true;
        settings = {
          yamlls = {
            enabled = false;
          };
        };
      };
      # Turns into a wall of red w/ helm charts
      yamlls.enable = true;
    };
  };

  extraPackages = with pkgs; [
    alejandra
    nodePackages.prettier
    black
  ];

  extraConfigLua = ''
    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })
    require 'lspconfig.ui.windows'.default_options.border = 'rounded'
  '';
}
