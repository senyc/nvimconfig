let
  utils = import ../utils.nix;
in {
  plugins = {
    neotest = {
      enable = true;
      adapters = {
        plenary.enable = true;
        go.enable = true;
        vitest.enable = true;
        jest.enable = true;
        python.enable = true;
      };
    };
  };
  keymaps = utils.defaultMap [
    {
      key = "<leader>tr";
      action = "<cmd>Neotest run<cr>";
      desc = "Run tests in file";
    }
    {
      key = "<leader>to";
      action = "<cmd>Neotest summary<cr>";
      desc = "Open test summary";
    }
  ];
}
