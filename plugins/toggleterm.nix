let
  utils = import ../utils.nix;
in {
  plugins.toggleterm = {
    enable = true;
  };

  keymaps = utils.defaultMap [
    {
      action = ":ToggleTerm direction=float<cr>";
      key = "<c-;>";
      desc = "Launch floating toggleterm instance";
    }
  ];
  extraConfigLua = ''
    -- Toggles (not kills) active terminal session
    function _G.set_terminal_keymaps()
      local opts = {noremap = true, silent = true}
      vim.api.nvim_buf_set_keymap(0, 't', '<c-;>', "<cmd>ToggleTermToggleAll<cr>", opts)
    end

    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
  '';
}
