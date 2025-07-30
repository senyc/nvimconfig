{
  plugins = {
    vim-dadbod-completion.enable = true;
    lspkind.enable = true;
    friendly-snippets = {
      enable = true;
    };
    luasnip = {
      enable = true;
      settings = {
        enable_autosnippets = true;
      };
      fromLua = [
        {
          paths = ./snippets;
        }
      ];
    };
    blink-cmp = {
      enable = true;
      setupLspCapabilities = true;
      settings = {
        keymap = {
          preset = "super-tab";
        };
        snippets = {
          preset = "luasnip";
        };
        signature = {
          enabled = true;
        };

        sources = {
          default = [
            "lsp"
            "path"
            "buffer"
            "cmdline"
            "snippets"
            "dadbod"
          ];
          per_filetype = {
            sql = ["snippets" "dadbod" "buffer"];
          };
          providers = {
            lsp.score_offset = 4;
            dadbod = {
              name = "Dadbod";
              module = "vim_dadbod_completion.blink";
            };
          };
        };
        completion = {
          menu = {
            border = "none";
            draw = {
              gap = 1;
              treesitter = ["lsp"];
              columns = [
                {
                  __unkeyed-1 = "label";
                }
                {
                  __unkeyed-1 = "kind_icon";
                  __unkeyed-2 = "kind";
                  gap = 1;
                }
              ];
            };
          };
          trigger = {
            show_in_snippet = false;
          };
          documentation = {
            auto_show = true;
            window = {
              border = "single";
            };
          };
          accept = {
            auto_brackets = {
              enabled = true;
            };
          };
        };
      };
    };
  };
}
