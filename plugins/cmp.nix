{
  plugins = {
    vim-dadbod-completion.enable = true;
    cmp-cmdline.enable = true;
    lspkind.enable = true;
    notify.enable = true;
    noice = {
      enable = true;
    };
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
            priority = 1000;
          }
          {
            name = "nvim_lua";
            priority = 1000;
          }
          {name = "path";}
          {name = "buffer";}
          {
            name = "luasnip";
            priority = 750;
          }
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
    cmp.setup({
       snippet = {
         expand = function(args)
           require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
         end
      }
    })

    cmp.setup.filetype({ "sql" }, {
      sources = {
        { name = 'vim-dadbod-completion' },
        { name = 'buffer' }
      }
    })
    local cmp = require("cmp")
    local types = require("cmp.types")

    local function deprioritize_snippet(entry1, entry2)
      if entry1:get_kind() == types.lsp.CompletionItemKind.Snippet then return false end
      if entry2:get_kind() == types.lsp.CompletionItemKind.Snippet then return true end
    end

    cmp.setup({
      -- your config
      sorting = {
        priority_weight = 2,
        comparators = {
          deprioritize_snippet,
          -- the rest of the comparators are pretty much the defaults
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.scopes,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.locality,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
    })
  '';
}
