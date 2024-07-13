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
    underCursor = true;
    delay = 50;
  };
}
