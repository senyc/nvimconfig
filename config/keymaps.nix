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
      action = "nzzzv";
      key = "n";
      desc = "center screen on going to next search result ";
    }
    {
      action = "Nzzzv";
      key = "N";
      desc = "center screen on going to previous search result ";
    }
    {
      action = "o<esc>";
      key = "go";
      desc = "add new line below cursor";
    }
    {
      action = "O<esc>";
      key = "gO";
      desc = "add new line above cursor";
    }
    {
      action = ''"+y'';
      key = "<leader>y";
      mode = ["n" "v"];
      desc = "copy to system clipboard";
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
      desc = "navigates to next quickfix item, centering the screen";
    }
    {
      action = "<cmd>cprev<cr>zz";
      key = "<leader>,";
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
      action = "<cmd>Ex<cr>";
      key = "<leader>fe";
      desc = "Starts file explorer (netrw)";
    }
    {
      # C-w register contains word under cursor
      action = '':%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>'';
      key = "<leader>rw";
      desc = "Replace word in current buffer";
    }
  ];
}
