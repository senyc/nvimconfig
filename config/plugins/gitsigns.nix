let
  utils = import ../../utils.nix;
in {
  plugins.gitsigns = {
    enable = true;
    settings = {
      current_line_blame = true;
      current_line_blame_formatter = ''<author> • <author_time:%m/%d/%Y> • <summary>'';
      current_line_blame_opts = {
        virt_text = true;
        virt_text_pos = "eol";
        delay = 10;
        virt_text_priority = 10001;
        ignore_whitespace = false;
      };
      sign_priority = 6;
    };
  };
  keymaps = utils.defaultMap [
    {
      key = "<leader>jn";
      action = "<cmd>Gitsigns next_hunk<cr>";
      mode = "n";
      desc = "go to next change hunk in file";
    }
    {
      key = "<leader>jp";
      action = "<cmd>Gitsigns prev_hunk<cr>";
      mode = "n";
      desc = "go to prev change hunk in file";
    }
  ];
}
