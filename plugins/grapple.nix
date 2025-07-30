let
  utils = import ../utils.nix;
in
  {
    pkgs,
    lib,
    ...
  }: {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "grapple";
        src = pkgs.fetchFromGitHub {
          owner = "cbochs";
          repo = "grapple.nvim";
          rev = "7aedc261b05a6c030397c4bc26416efbe746ebf1";
          hash = "sha256-apWKHEhXjFdS8xnSX0PoiOMzR+RVuYHFLV9sUl/HhTE=";
        };
      })
    ];
    extraConfigLua = ''
      require 'grapple'.setup {
        -- Grappled files, do not persist between git branches
       scope = 'git',
        statusline = {
          icon = "",
        }
      }
    '';
    keymaps =
      utils.defaultMap [
        {
          key = "<leader>a";
          action = "<cmd>Grapple toggle<cr>";
          desc = "Toggle adding file to grapple";
        }
        {
          key = "<c-h>";
          action = "<cmd>Grapple toggle_tags<cr>";
          desc = "toggle grapple display";
          mode = ["i" "n"];
        }
        {
          key = "<c-e>";
          action = "<cmd>Grapple select index=1<cr>";
          desc = "Select index 1";
          mode = ["i" "n"];
        }
        {
          key = "<c-t>";
          action = "<cmd>Grapple select index=2<cr>";
          desc = "Select index 2";
          mode = ["i" "n"];
        }
        {
          key = "<c-p>";
          action = "<cmd>Grapple select index=3<cr>";
          desc = "Select index 3";
        }
        {
          key = "<c-n>";
          action = "<cmd>Grapple select index=4<cr>";
          desc = "Select index 4";
        }
      ]
      ++ map (num: {
        key = "<leader>${toString num}";
        action = "<cmd>Grapple select index=${toString num}<cr>";
      })
      (lib.range 5 9);
  }
