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
          hash = "sha256-0hNsxzR0WX3BgZzDleYxyJxYQxL4LQdKuWl8VcPkuSM=";
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
