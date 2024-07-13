{
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "macchiato";
      show_end_of_buffer = false;
      dim_inactive = {
        enabled = false;
        shade = "dark";
        percentage = 0.15;
      };
      no_italic = true;
      no_underline = true;
      term_colors = true;
      integrations = {
        treesitter = true;
        cmp = true;
        telescope.enabled = true;
        gitsigns = true;
        illuminate = {
          enabled = true;
          lsp = true;
        };
        native_lsp = {
          enabled = true;
          inlay_hints = {
            background = true;
          };
        };
      };
    };
  };
}
