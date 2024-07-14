{
  plugins.illuminate = {
    enable = true;
    providers = [
      "lsp"
      "treesitter"
    ];
    filetypesDenylist = [
      "Outline"
      "netrw"
      "TelescopePrompt"
    ];
    underCursor = false;
    delay = 50;
    minCountToHighlight = 1;
  };
}
