{
  plugins.luasnip = {
    enable = true;
  };

  plugins.cmp = {
    enable = true;
    autoEnableSources = true;
    settings = {
      sources = [
        {name = "nvim_lsp";}
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
}
