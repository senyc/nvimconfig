let
  utils = import ../utils.nix;
in {
  plugins = {
    oil = {
      enable = true;
      settings = {
        keymaps = {
          "<a-f>" = "actions.close";
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
      action = "<cmd>Oil<cr>";
      key = "<a-f>";
      desc = "Toggles file explorer (oil)";
    }
  ];
}
