let
  utils = import ../utils.nix;
in {
  plugins = {
    oil = {
      enable = true;
      settings = {
        keymaps = {
          "<leader>fe" = "actions.close";
        };
        view_options.show_hidden = true;
        float = {
          max_height = {
            __raw = "0.6";
          };
          max_width = {
            __raw = "0.6";
          };
        };
      };
    };
  };
  keymaps = utils.defaultMap [
    {
      action = ":lua require('oil').open_float()<cr>";
      key = "<leader>fe";
      desc = "Starts file explorer (oil)";
    }
  ];
}
