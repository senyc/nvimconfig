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
      action = "<c-d>zz";
      key = "<c-d>";
      desc = "center screen on <c-d>";
    }
    {
      action = "<cmd>cclose<cr>";
      key = "<leader>cc";
      desc = "quickfix close";
    }
    {
      action = "<cmd>cnext<cr>";
      key = "<C-j>";
      desc = "quickfix next";
    }
    {
      action = "<cmd>cprev<cr>";
      key = "<C-k>";
      desc = "quickfix prev";
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
