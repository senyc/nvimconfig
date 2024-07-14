{
  plugins = {
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
              ['<C-n>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                      cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                      luasnip.expand_or_jump()
                    else
                      fallback()
                    end
                  end, { 'i', 's' }),
              ['<C-p>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                  luasnip.jump(-1)
                else
                  fallback()
                end
              end, { 'i', 's' }),
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
