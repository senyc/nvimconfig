let
  utils = import ../utils.nix;
in
  {pkgs, ...}: {
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
        icons = false,
          statusline = {
            icon = "",
          }
      }
    '';
    keymaps = utils.defaultMap [
      {
        key = "<c-e>";
        action = "<cmd>Grapple toggle<cr>";
      }
      {
        key = "<c-h>";
        action = "<cmd>Grapple toggle_tags<cr>";
      }
      {
        key = "<leader>1";
        action = "<cmd>Grapple select index=1<cr>";
      }
      {
        key = "<leader>2";
        action = "<cmd>Grapple select index=2<cr>";
      }
      {
        key = "<leader>3";
        action = "<cmd>Grapple select index=3<cr>";
      }
      {
        key = "<leader>4";
        action = "<cmd>Grapple select index=4<cr>";
      }
      {
        key = "<leader>5";
        action = "<cmd>Grapple select index=5<cr>";
      }
    ];
  }
