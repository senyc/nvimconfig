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
       scope = 'git',
        statusline = {
          icon = "",
        }
      }
    '';
    keymaps =
      utils.defaultMap [
        {
          key = "<leader>h";
          action = "<cmd>Grapple toggle<cr>";
          desc = "Toggle adding file to grapple";
        }
        {
          key = "<c-h>";
          action = "<cmd>Grapple toggle_tags<cr>";
          desc = "toggle grapple display";
          mode = ["i" "n"];
        }
      ]
      ++ map (num: {
        key = "<leader>${toString num}";
        action = "<cmd>Grapple select index=${toString num}<cr>";
      })
      (lib.range 1 5);
  }
