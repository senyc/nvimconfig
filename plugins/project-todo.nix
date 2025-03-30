let
  utils = import ../utils.nix;
in
  {pkgs, ...}: {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "project-todo.nvim";
        src = pkgs.fetchFromGitHub {
          owner = "senyc";
          repo = "project-todo.nvim";
          rev = "main";
          hash = "sha256-J5gJXxZtLnwtZMNPt+kx/poI5Zy/APmpX0cgbkh+s2Y=";
        };
      })
    ];
    keymaps = utils.defaultMap [
      {
        action = "<cmd>ProjectTodo<cr>";
        key = "<leader>to";
        desc = "open project-todo";
      }
    ];
  }
