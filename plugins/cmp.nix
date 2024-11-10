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
          {
            name = "nvim_lsp";
            priority = 100;
          }
          {
            name = "luasnip";
            priority = 101;
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
}
