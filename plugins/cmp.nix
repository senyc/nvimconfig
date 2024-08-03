{
  plugins = {
    cmp-cmdline.enable = true;
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
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
          max_view_entries = 30;
        };
      };
    };
  };
  extraConfigLua = ''
    local cmp = require'cmp'

      cmp.setup.cmdline({'/', "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })
  '';
}
