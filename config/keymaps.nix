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
      action = ":lua RenameCurrentFile()<cr>";
      key = "<leader>rn";
      desc = "rename current file";
    }
    {
      action = ":lua DeleteCurrentFile()<cr>";
      key = "<leader>rd";
      desc = "Remove current buffer and associated file";
    }
    {
      action = ":lua CreateNote('~/projects/notes/')<cr>";
      key = "<leader>ncp";
      desc = "Create new note in project notes (all user to enter file name";
    }
    {
      action = ":lua CreateNote('~/work/notes/')<cr>";
      key = "<leader>ncw";
      desc = "Create new note in work notes (all user to enter file name";
    }
    {
      action = ":lua AppendTodo()<cr>";
      key = "<leader>tc";
      desc = "Todo create";
    }
    {
      action = '':set nohlsearch | %s/\s\+$//e<cr>'';
      key = "<leader>wc";
      desc = "Whitespace clear";
    }
  ];
}
