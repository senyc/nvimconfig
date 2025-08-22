{
  plugins = {
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
          "<C-k>" = [
            "snippet_forward"
            "fallback"
          ];
          "<C-j>" = [
            "snippet_backward"
            "fallback"
          ];
        };
        snippets = {
          preset = "luasnip";
        };
        signature = {
          enabled = false;
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
            sql = ["dadbod" "snippets" "buffer"];
          };
          providers = {
            lsp.score_offset = 4;
            dadbod = {
              name = "Dadbod";
              module = "vim_dadbod_completion.blink";
            };
          };
        };

        fuzzy = {
          sorts = [
            {
              __raw = ''
                function(a, b)
                  -- Only compare LSP sources
                  if a.source_name ~= 'LSP' or b.source_name ~= 'LSP' then
                    return nil -- Let default sorting handle non-LSP sources
                  end

                  -- Get client names safely
                  local client_a = vim.lsp.get_client_by_id(a.client_id)
                  local client_b = vim.lsp.get_client_by_id(b.client_id)

                  if not client_a or not client_b then
                    return nil
                  end

                  local name_a = client_a.name
                  local name_b = client_b.name

                  -- De-prioritize emmet_language_server (return true if 'a' should come first)
                  if name_a == 'emmet_language_server' and name_b ~= 'emmet_language_server' then
                    return false
                  elseif name_a ~= 'emmet_language_server' and name_b == 'emmet_language_server' then
                    return true
                  end
                end
              '';
            }
            "score"
            "sort_text"
          ];
        };

        completion = {
          menu = {
            border = "rounded";
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
            show_in_snippet = true;
          };
          documentation = {
            auto_show = true;
            window = {
              border = "rounded";
            };
          };
          accept = {
            auto_brackets = {
              enabled = false;
            };
          };
        };
      };
    };
  };
}
