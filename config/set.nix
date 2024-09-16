{
  opts = {
    number = true;
    relativenumber = true;
    cursorline = true;
    cursorlineopt = "number";

    tabstop = 2;
    softtabstop = 2;
    shiftwidth = 2;
    expandtab = true;

    cindent = true;

    smartcase = true;
    termguicolors = true;
    signcolumn = "yes:1";
    incsearch = true;
    scrolloff = 8;

    completeopt = ["menuone" "noselect" "noinsert"];

    swapfile = false;
    history = 10000;
    undofile = true;
    wrap = false;
    spell = true;
  };

  globals = {
    netrw_bufsettings = "nu";
  };

  clipboard.providers.wl-copy.enable = true;
}
