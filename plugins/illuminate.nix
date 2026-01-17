{
  plugins.illuminate = {
    enable = true;
    settings = {
      providers = [
        "lsp"
        "treesitter"
      ];
      filetypesDenylist = [
        "Outline"
        "TelescopePrompt"
      ];
      underCursor = true;
      delay = 50;
      minCountToHighlight = 1;
    };
  };
}
