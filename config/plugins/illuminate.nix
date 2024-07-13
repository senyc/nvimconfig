{
  plugins.illuminate = {
    enable = true;
    providers = [
      "lsp"
      "treesitter"
      "regex"
    ];
    filetypesDenylist = [
      "netrw"
      "TelescopePrompt"
    ];
    underCursor = true;
    minCountToHighlight = 1;
    delay = 50;
  };
}
