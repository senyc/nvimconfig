{
  plugins.treesitter = {
    enable = true;
    nixvimInjections = true;
    folding = false;
    settings = {
      highlight = {
        enable = true;
      };
      indent = {
        enable = true;
      };
    };
  };
}
