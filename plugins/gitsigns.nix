let
  utils = import ../utils.nix;
in {
  plugins.gitsigns = {
    enable = true;
    settings = {
      signs = {
        add.text = "│";
        change.text = "│";
        delete.text = "_";
        topdelete.text = "‾";
        changedelete.text = "~";
        untracked.text = "┆";
      };
      signcolumn = true;
      numhl = false;
      linehl = false;
      word_diff = false;
      watch_gitdir = {
        follow_files = true;
      };
      attach_to_untracked = true;
      current_line_blame = true;
      current_line_blame_formatter = ''(<abbrev_sha>) <author> • <author_time:%m/%d/%Y> • <summary>'';
      current_line_blame_opts = {
        virt_text = true;
        virt_text_pos = "eol";
        delay = 10;
        virt_text_priority = 10001;
        ignore_whitespace = false;
      };
      sign_priority = 6;
      max_file_length = 40000;
      preview_config = {
        border = "single";
        style = "minimal";
        relative = "cursor";
        row = 0;
        col = 1;
      };
    };
  };

  keymaps = utils.defaultMap [
    {
      key = "]g";
      action = "<cmd>Gitsigns next_hunk<cr>";
      desc = "go to next change hunk in file";
    }
    {
      key = "[g";
      action = "<cmd>Gitsigns prev_hunk<cr>";
      desc = "go to prev change hunk in file";
    }
    {
      key = "<leader>tb";
      action = "<cmd>Gitsigns toggle_current_line_blame<cr>";
      desc = "Toggle line blame";
    }
  ];
}
