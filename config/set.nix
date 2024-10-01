{
  opts = {
    number = true;
    relativenumber = true;
    cursorline = true;
    cursorlineopt = "number";
    signcolumn = "yes:1";

    autoindent = true;
    expandtab = true;
    wrap = false;

    spell = true;

    tabstop = 2;
    softtabstop = 2;
    shiftwidth = 2;

    smartcase = true;
    incsearch = true;
    scrolloff = 10;

    confirm = true;
    completeopt = ["menuone" "noselect" "noinsert"];

    swapfile = false;
    history = 10000;
    undofile = true;
  };

  globals = {
    netrw_bufsettings = "nu ro";
  };
}
