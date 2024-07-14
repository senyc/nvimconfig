let
  utils = import ../../utils.nix;
in {
  plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native = {
        enable = true;
      };
    };
    settings = {
      defaults = {
        layout_config = {
          horizontal = {
            prompt_position = "top";
          };
        };
        sorting_strategy = "ascending";
        file_ignore_patterns = [
          "^.git/"
          "node_modules/"
        ];
        vimgrep_arguments = [
          "rg"
          "--no-heading"
          "--with-filename"
          "--line-number"
          "--column"
          "--smart-case"
          "--hidden"
        ];
        mappings = {
          i = {
            # "<c-c>".__raw = ["<esc>" {type = "command";}];
            "<esc>".__raw = "require('telescope.actions').close";
          };
          n = {
            "<esc>".__raw = "require('telescope.actions').close";
          };
        };
      };
    };
  };
  extraConfigLua = ''
    -- Will return top level git directory, if one does not exist it will return current buffer directory
    function GitSearch()
      require('telescope.builtin').find_files { cwd = GetSearchDir() }
    end

    function GrepSearch()
      require('telescope.builtin').live_grep { cwd = GetSearchDir() }
    end

    function GrepStringSearch()
      require('telescope.builtin').grep_string { cwd = GetSearchDir() }
    end

    -- require("telescope").setup{
    --   pickers = {
    --     colorscheme = {
    --       enable_preview = true
    --     }
    --   }
    -- }

  '';
  keymaps = utils.defaultMap [
    {
      key = "<leader>s";
      action = ":lua GitSearch()<cr>";
      mode = "n";
      desc = "search git directory, showing untracked files";
    }
    {
      key = "<leader>g";
      action = ":lua GrepSearch()<cr>";
      mode = "n";
      desc = "live grep search";
    }
    {
      key = "<leader>tr";
      action = "<cmd>Telescope resume<cr>";
      mode = "n";
      desc = "resume previous telescope session";
    }
    {
      key = "<leader>cf";
      action = "<cmd>cclose<cr><cmd>Telescope quickfix<cr>";
      mode = "n";
    }
    {
      key = "<leader>of";
      action = "<cmd>Telescope oldfiles<cr>";
      mode = "n";
    }
    {
      key = "<leader>fg";
      action = ":lua GrepStringSearch()<cr>";
      mode = "n";
    }
  ];
}
