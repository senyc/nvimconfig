let
  utils = import ../utils.nix;
in {
  plugins.mini = {
    mockDevIcons = true;
    modules = {
      icons = {};
      trailspace = {};
      splitjoin = {};
      pick = {};
    };
    enable = true;
  };
  keymaps = utils.defaultMap [
    {
      action = "<cmd>Pick files<cr>";
      key = "<leader>f";
      desc = "Opens up file picker (mini)";
    }
    {
      action = "<cmd>Pick grep_live<cr>";
      key = "<leader>g";
      desc = "Opens up live grep (mini)";
    }
    {
      action = "<cmd>Pick resume<cr>";
      key = "<leader>r";
      desc = "Resumes mini picker";
    }
    {
      action = "<cmd>Pick help<cr>";
      key = "<leader>sh";
      desc = "Opens up help picker (mini)";
    }
  ];
}
