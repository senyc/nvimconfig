{
  plugins = {
    luasnip = {
      enable = true;
    };
    cmp-cmdline.enable = true;
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          {name = "nvim_lsp";}
          {name = "nvim_lua";}
          {name = "path";}
          {name = "buffer";}
          {name = "luasnip";}
        ];
        mapping = {
          "<cr>" = "cmp.mapping.confirm({ select = false })";
          "<tab>" = "cmp.mapping.confirm({ select = true })";
        };
      };
    };
  };

  extraConfigLua = ''
    local cmp = require 'cmp'
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
          { name = 'path' }
        },
        {
          {
            name = 'cmdline',
            option = {
              ignore_cmds = { 'Man', '!', 'write', 'buffer' }
            }
          }
        })
    })
  '';
}
