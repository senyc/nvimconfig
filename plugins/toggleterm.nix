let
  utils = import ../utils.nix;
in {
  plugins.toggleterm = {
    enable = true;
  };

  keymaps = utils.defaultMap [
    {
      action = "<cmd>2ToggleTerm name=Ephemeral direction=float<cr>";
      key = "<c-/>";
      desc = "Launch floating ephemeral toggleterm instance";
      mode = ["n" "i"];
    }
    {
      action = "<cmd>lua persistent_terminal_toggle()<cr>";
      key = "<a-t>";
      desc = "Launch floating persistent toggleterm instance";
      mode = ["n" "i"];
    }
  ];
  extraConfigLua = ''
      local Terminal = require 'toggleterm.terminal'.Terminal
      local persistent_term = Terminal:new({name= "Persistent", direction= "float", float_opts = { border = "double"} })
    function _G.persistent_terminal_toggle()
        persistent_term:toggle()
    end

    -- Toggles (not kills) active terminal session
    function _G.set_terminal_keymaps()
      local opts = {noremap = true, silent = true}
      vim.api.nvim_buf_set_keymap(0, 't', '<c-/>', "<cmd>close<cr>", opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<a-t>', "<cmd>lua persistent_terminal_toggle()<cr>", opts)
    end

    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
  '';
}
