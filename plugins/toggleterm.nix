let
  utils = import ../utils.nix;
in {
  plugins.toggleterm = {
    enable = true;
  };

  keymaps = utils.defaultMap [
    {
      action = "<cmd>1ToggleTerm direction=float<cr>";
      key = "<a-t>";
      desc = "Launch floating toggleterm instance";
      mode = ["n" "i"];
    }
    {
      action = "<cmd>2TermExec cmd='git log -p %' direction=float name='git history'<cr>";
      key = "<leader>td";
      desc = "Get log patches of the current file";
      mode = "n";
    }
  ];
  extraConfigLua = ''
    -- Sets terminal keybinds
    function _G.set_terminal_keymaps()
      local opts = {noremap = true, silent = true}
      vim.api.nvim_buf_set_keymap(0, 't', '<c-/>', [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<a-t>', "<cmd>close<cr>", opts)
    end

    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
  '';
}
