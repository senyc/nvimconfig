let
  utils = import ../utils.nix;
in {
  globals.mapleader = " ";

  keymaps = utils.defaultMap [
    {
      action = "<c-d>zz";
      key = "<c-d>";
      desc = "center screen on <c-d>";
    }
    {
      action = "<c-u>zz";
      key = "<c-u>";
      desc = "center screen on <c-u>";
    }
    {
      action = ":cnext<cr>zz";
      key = "<c-j>";
      desc = "navigates to next quickfix item, centering the screen";
    }
    {
      action = "<cmd>cprev<cr>zz";
      key = "<c-k>";
      desc = "navigates to previous quickfix item, centering the screen";
    }
    {
      action = "<cmd>cclose<cr>";
      key = "<leader>cc";
      desc = "quickfix close";
    }
    {
      action = "<cmd>copen<cr>";
      key = "<leader>co";
      desc = "quickfix open";
    }
    {
      action = '':set nohlsearch | %s/\s\+$//e<cr>'';
      key = "<leader>wc";
      desc = "Whitespace clear";
    }
  ];
}
