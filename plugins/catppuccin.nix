{
  colorschemes = {
    catppuccin = {
      enable = true;
      settings = {
        background = {
          light = "macchiato";
          dark = "mocha";
        };
        flavour = "macchiato"; # "latte", "mocha", "frappe", "macchiato" or raw lua code
        no_bold = false;
        no_italic = true;
        no_underline = false;
        transparent_background = true;
        integrations = {
          cmp = true;
          gitsigns = true;
          illuminate = true;
          treesitter = true;
          telescope = true;
          native_lsp = {
            enabled = true;
            inlay_hints = {
              background = true;
            };
          };
        };
      };
    };
  };
}
