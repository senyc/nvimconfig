let
  utils = import ../utils.nix;
in {
  plugins.toggleterm = {
    enable = true;
  };

  keymaps = utils.defaultMap [
    {
      action = ":ToggleTerm direction=float<cr>";
      key = "<leader>to";
      desc = "Launch floating toggleterm instance";
    }
  ];
}
