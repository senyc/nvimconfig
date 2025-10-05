let
  utils = import ../utils.nix;
in {
  plugins = {
    oil = {
      enable = true;
      settings = {
        skip_confirm_for_simple_edits = true;
        lsp_file_method.autosave_changes = true;
        lsp_file_method.enable = true;
        keymaps = {
          "<leader>e" = "actions.close";
        };
        view_options.show_hidden = true;
        win_options = {
          winbar = "%{v:lua.OilBar()}";
        };
      };
    };
  };
  keymaps = utils.defaultMap [
    {
      action = "<cmd>Oil<cr>";
      key = "<leader>e";
      desc = "Toggles file explorer (oil)";
    }
  ];

  extraConfigLuaPre = ''
    OilBar = function()
      local path = vim.fn.expand("%")
      path = path:gsub("oil://", "")

      return "  " .. vim.fn.fnamemodify(path, ":.") end
  '';
}
