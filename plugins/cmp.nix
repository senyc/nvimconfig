{
  plugins = {
    cmp-cmdline.enable = true;
    lspkind.enable = true;
    luasnip.enable = true;
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        mapping = {
          __raw = ''
            cmp.mapping.preset.insert({
              ['<tab>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
              ["<CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Insert }),
            })
          '';
        };
        sources = [
          {
            name = "nvim_lsp";
            priority = 101;
          }
          {
            name = "luasnip";
            priority = 100;
          }
          {name = "nvim_lua";}
          {name = "path";}
          {name = "buffer";}
        ];
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
          max_view_entries = 30;
        };
      };
    };
  };
  extraConfigLua = ''
    cmp.setup({
       snippet = {
         expand = function(args)
           require('luasnip').lsp_expand(args.body) -- For `luasnip` users.

         end
      }
    })
  '';
}
