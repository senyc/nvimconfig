let
  utils = import ../utils.nix;
in {
  plugins.trouble.enable = true;
  keymaps = utils.defaultMap [
    {
      action = "<cmd>Trouble diagnostics toggle<cr>";
      key = "<leader>xd";
      desc = "Trouble diagnostic toggle";
    }
  ];
}
