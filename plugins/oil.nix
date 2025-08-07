let
  utils = import ../utils.nix;
in {
  plugins = {
    oil = {
      enable = true;
      settings = {
        skip_confirm_for_simple_edits = true;
        keymaps = {
          "<leader>e" = "actions.close";
          "<C-h>" = false;
          "<C-l>" = false;
          "<C-k>" = false;
          "<C-j>" = false;
        };
        view_options.show_hidden = true;
      };
    };
  };
  keymaps = utils.defaultMap [
    {
      action = "<cmd>Oil<cr>";
      key = "<leader>e";
      desc = "Toggles file explorer (oil)";
    }
  ];
}
