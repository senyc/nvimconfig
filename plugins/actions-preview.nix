let
  utils = import ../utils.nix;
in {
  plugins.actions-preview = {
    enable = true;
  };
  keymaps = utils.defaultMap [
    {
      # Overwrite default actions
      key = "gra";
      action = ":lua require('actions-preview').code_actions() <cr>";
      desc = "Actions preview";
    }
  ];
}
