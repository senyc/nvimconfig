let
  utils =
    import ../utils.nix;
in {
  plugins.undotree = {
    enable = true;
    settings = {
      SetFocusWhenToggle = true;
    };
  };
  keymaps = utils.defaultMap [
    {
      key = "<leader>u";
      action = "<cmd>UndotreeToggle<cr>";
      desc = "Toggle undotree";
    }
  ];
}
