let
  utils = import ../utils.nix;
in
  {pkgs, ...}: {
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
            "dist/"
          ];
          vimgrep_arguments = [
            "rg"
            "--no-heading"
            "--with-filename"
            "--line-number"
            "--column"
            "--smart-case"
            # Display dot and gitignored files
            "--hidden"
            "--no-ignore"
          ];
          mappings = {
            i = {
              "<esc>".__raw = "require('telescope.actions').close";
            };
            n = {
              "<esc>".__raw = "require('telescope.actions').close";
            };
          };
        };
      };
    };
    keymaps = utils.defaultMap [
      {
        key = "<leader>s";
        action = ":lua require('telescope.builtin').git_files { hidden = true, show_untracked = true }<cr>";
        desc = "search git directory, showing untracked files";
      }
      {
        key = "<leader>g";
        action = ":lua require('telescope.builtin').live_grep { cwd = GetSearchDir(), hidden = true }<cr>";
        desc = "live grep search";
      }
      {
        key = "<leader>cf";
        action = "<cmd>cclose<cr><cmd>Telescope quickfix<cr>";
      }
      {
        key = "<leader>of";
        action = "<cmd>Telescope oldfiles<cr>";
      }
      {
        key = "<leader>fg";
        action = ":lua require('telescope.builtin').grep_string { cwd = GetSearchDir(), hidden = true }<cr>";
      }
    ];

    # Add telescope optional dependencies
    extraPackages = with pkgs; [
      ripgrep
      fd
    ];
  }
