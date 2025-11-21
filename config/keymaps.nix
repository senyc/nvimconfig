let
  utils = import ../utils.nix;
in {
  globals.mapleader = " ";

  keymaps = utils.defaultMap [
    {
      action = "<c-d>zz";
      key = "<c-d>";
      desc = "center screen on <c-d>";
    }
    {
      action = "<c-d>zz";
      key = "<c-d>";
      desc = "center screen on <c-d>";
    }
    {
      action = "<cmd>cclose<cr>";
      key = "<leader>cc";
      desc = "quickfix close";
    }
    {
      action = "<cmd>cnext<cr>";
      key = "<C-j>";
      desc = "quickfix next";
    }
    {
      action = "<cmd>cprev<cr>";
      key = "<C-k>";
      desc = "quickfix prev";
    }
    {
      action = "<cmd>copen<cr>";
      key = "<leader>co";
      desc = "quickfix open";
    }
    {
      action = '':set nohlsearch | %s/\s\+$//e<cr>'';
      key = "<leader>wc";
      desc = "Whitespace clear";
    }
    {
      action = ''<cmd>lua local h = io.popen('git rev-parse --show-toplevel 2>/dev/null'); local root = h:read('*l'); h:close(); if root then local bufpath = vim.fn.expand('%:p'); local escaped = root:gsub("([%(%)%.%%%+%-%*%?%[%^%$])", "%%%1"); local rel = bufpath:gsub("^" .. escaped .. "/", ""); vim.fn.setreg('+', rel); print("Copied: " .. rel) else print("Not in git repo") end<cr>'';
      key = "<leader>cp";
      desc = "Copy current file path from project root";
    }
  ];
}
