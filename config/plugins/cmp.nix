{pkgs, ...}: {
  plugins = {
    luasnip = {
      enable = true;
      extraConfig = {
        enable_autosnippets = true;
        store_selection_keys = "<Tab>";
      };
      fromVscode = [
        {
          lazyLoad = true;
          paths = "${pkgs.vimPlugins.friendly-snippets}";
        }
      ];
    };
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        experimental = {
          ghost_text = true;
        };
        mapping = {
          __raw = ''
            cmp.mapping.preset.insert({
              ['<tab>'] = cmp.mapping.confirm({select = true}),
              ['<CR>'] = cmp.mapping.confirm({ select = false }),
            })
          '';
        };
        sources = [
          {name = "nvim_lsp";}
          {name = "nvim_lua";}
          {name = "path";}
          {name = "luasnip";}
          {name = "buffer";}
        ];
        snippet = {
          expand = "function(args) require('luasnip').lsp_expand(args.body) end";
        };
        window = {
          completion = {
            border = "rounded";
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None";
          };
          documentation = {
            border = "rounded";
          };
        };
        performance = {
          debounce = 60;
          fetching_timeout = 200;
          max_view_entries = 30;
        };
      };
    };
  };
  extraConfigLua = ''
    local cmp = require'cmp'

      cmp.setup.cmdline({'/', "?" }, {
        sources = {
          { name = 'buffer' }
        }
      })

      cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
          { name = 'path' }
          }, {
          { name = 'cmdline',
            option = {
              ignore_cmds = { 'Man', '!', 'write', 'buffer' }
            }
          }
        }),
      })
  '';
}
