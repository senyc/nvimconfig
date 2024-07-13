let
  utils = import ../utils;
in {
  globals.mapleader = " ";

  keymaps = utils.defaultMap [
    {
      action = "<c-d>zz";
      key = "<c-d>";
      mode = "n";
      desc = "center screen on <c-d>";
    }
    {
      action = "<c-u>zz";
      key = "<c-u>";
      mode = "n";
      desc = "center screen on <c-u>";
    }
    {
      action = "nzzzv";
      key = "n";
      mode = "n";
      desc = "center screen on going to next search result ";
    }
    {
      action = "Nzzzv";
      key = "N";
      mode = "n";
      desc = "center screen on going to previous search result ";
    }
    {
      action = "o<esc>";
      key = "go";
      mode = "n";
      desc = "add new line below cursor";
    }
    {
      action = "O<esc>";
      key = "gO";
      mode = "n";
      desc = "add new line above cursor";
    }
    {
      action = "a<cr><esc>";
      key = "<c-j>";
      mode = "n";
      desc = "add inverse mapping for J (pulls line from below to current line)";
    }
    {
      action = ''"+y$'';
      key = "<leader>Y";
      mode = ["n" "v"];
      desc = "copy rest of the line to system clipboard";
    }
    {
      action = ''"+P'';
      key = "<leader>P";
      mode = ["n" "v"];
      desc = ''pastes system clipboard over selected, not updating " buffer'';
    }
    {
      action = ''"+p'';
      key = "<leader>p";
      mode = ["n" "v"];
      desc = "pastes system clipboard";
    }
    {
      action = ''"+d'';
      key = "<leader>d";
      mode = ["n" "v"];
      desc = "cuts selected into system clipboard";
    }
    {
      action = ''"_d'';
      key = "<leader>x";
      mode = ["n" "v"];
      desc = "deletes to the null buffer";
    }
    {
      action = ":cnext<cr>zz";
      key = "<leader>;";
      mode = "n";
      desc = "navigates to next quickfix item, centering the screen";
    }
    {
      action = ":cprev<cr>zz";
      key = "<leader>,";
      mode = "n";
      desc = "navigates to previous quickfix item, centering the screen";
    }
    {
      action = ":cclose<cr>";
      key = "<leader>cc";
      mode = "n";
      desc = "quickfix close";
    }
    {
      action = ":copen<cr>";
      key = "<leader>co";
      mode = "n";
      desc = "quickfix open";
    }
  ];
}
