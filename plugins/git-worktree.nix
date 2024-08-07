let
  utils = import ../utils.nix;
in
  {pkgs, ...}: {
    extraPlugins = [
      # This is using a random fork of https://github.com/ThePrimeagen/git-worktree.nvim
      #  There is a very high chance that we will have to pivot if it becomes stale
      (pkgs.vimUtils.buildVimPlugin {
        name = "git-worktree.nvim";
        src = pkgs.fetchFromGitHub {
          owner = "awerebea";
          repo = "git-worktree.nvim";
          rev = "a3917d0b7ca32e7faeed410cd6b0c572bf6384ac";
          hash = "sha256-CC9+h1i+l9TbE60LABZnwjkHy94VGQ7Hqd5jVHEW+mw=";
        };
      })
    ];
    extraConfigLua = ''
      require("git-worktree").setup()
      require('telescope').load_extension('git_worktree')
    '';
    keymaps = utils.defaultMap [
      {
        key = "<leader>ws";
        action = "<cmd>Telescope git_worktree git_worktree<cr>";
        desc = "Select git worktrees";
      }
      {
        key = "<leader>wc";
        action = "<cmd>Telescope git_worktree create_git_worktree<cr>";
        desc = "create git worktrees";
      }
    ];
  }
