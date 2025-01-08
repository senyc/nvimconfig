{pkgs, ...}: let
  utils = import ../utils.nix;
in {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "litee.nvim";
      src = pkgs.fetchFromGitHub {
        owner = "ldelossa";
        repo = "litee.nvim";
        rev = "4efaf373322d9e71eaff31164abb393417cc6f6a";
        hash = "sha256-PUFPQA0LWXn2fjT8Cfy7SFX14hkbUH05mQF4enuxUo0=";
      };
    })
    # Use my fork of the repo (which uses ssh host of git not ghcli)
    (pkgs.vimUtils.buildVimPlugin {
      name = "gh.nvim";
      src = pkgs.fetchFromGitHub {
        owner = "ldelossa";
        repo = "gh.nvim";
        rev = "main";
        hash = "sha256-5MWv/TpJSJfPY3y2dC1f2T/9sP4wn0kZ0Sed5OOFM5c=";
      };
    })
  ];
  extraConfigLua = ''
    require('litee.lib').setup()
    require('litee.gh').setup({
      debug_logging = true,
      -- deprecated, around for compatability for now.
      jump_mode   = "invoking",
      -- remap the arrow keys to resize any litee.nvim windows.
      map_resize_keys = false,
      -- do not map any keys inside any gh.nvim buffers.
      disable_keymaps = false,
      -- the icon set to use.
      -- any custom icons to use.
      icon_set_custom = nil,
      -- whether to register the @username and #issue_number omnifunc completion
      -- in buffers which start with .git/
      git_buffer_completion = true,
      icon_set = "default",
      icon_set_custom = nil,
      -- defines keymaps in gh.nvim buffers.
      keymaps = {
          -- when inside a gh.nvim panel, this key will open a node if it has
          -- any futher functionality. for example, hitting <CR> on a commit node
          -- will open the commit's changed files in a new gh.nvim panel.
          open = "<CR>",
          -- when inside a gh.nvim panel, expand a collapsed node
          expand = "zo",
          -- when inside a gh.nvim panel, collpased and expanded node
          collapse = "zc",
          -- when cursor is over a "#1234" formatted issue or PR, open its details
          -- and comments in a new tab.
          goto_issue = "gd",
          -- show any details about a node, typically, this reveals commit messages
          -- and submitted review bodys.
          details = "d",
          -- inside a convo buffer, submit a comment
          submit_comment = "<C-s>",
          -- inside a convo buffer, when your cursor is ontop of a comment, open
          -- up a set of actions that can be performed.
          actions = "<C-a>",
          -- inside a thread convo buffer, resolve the thread.
          resolve_thread = "<C-r>",
          -- inside a gh.nvim panel, if possible, open the node's web URL in your
          -- browser. useful particularily for digging into external failed CI
          -- checks.
          goto_web = "gx"
      }
    })
  '';

  keymaps = utils.defaultMap [
    {
      action = "<cmd>GHOpenPR<cr>";
      key = "<leader>gpo";
      desc = "Github pr open";
    }
    {
      action = "<cmd>GHClosePR<cr>";
      key = "<leader>gpc";
      desc = "Github pr close";
    }
    {
      action = "<cmd>GHRefreshPr<cr>";
      key = "<leader>gpr";
      desc = "Github pr refresh";
    }
    {
      action = "<cmd>GHStartReview<cr>";
      key = "<leader>grs";
      desc = "Github review start";
    }
    {
      action = "<cmd>GHSubmitReview<cr>";
      key = "<leader>gre";
      desc = "Github review end";
    }
    {
      action = "<cmd>GHCloseReview<cr>";
      key = "<leader>grc";
      desc = "Github review close";
    }
    {
      action = "<cmd>GHDeleteReview<cr>";
      key = "<leader>grd";
      desc = "Github review delete";
    }
    {
      action = "<cmd>GHCreateThread<cr>";
      key = "<leader>gtc";
      desc = "Github thread create";
    }
    {
      action = "<cmd>GHNextThread<cr>";
      key = "<leader>gtn";
      desc = "Github thread next";
    }
    {
      action = "<cmd>GHToggleThread<cr>";
      key = "<leader>gtt";
      desc = "Github thread toggle";
    }
  ];
}
