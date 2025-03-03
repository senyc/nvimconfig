let
  utils = import ../utils.nix;
in {
  plugins = {
    oil.enable = true;
  };
  keymaps = utils.defaultMap [
    {
      action = "<cmd>Oil<cr>";
      key = "<leader>fe";
      desc = "Starts file explorer (oil)";
    }
  ];
}
