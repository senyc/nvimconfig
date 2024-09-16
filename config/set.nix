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

    smartindent = false;
    cindent = true;

    smartcase = true;
    ignorecase = true;
    termguicolors = true;
    scrolloff = 8;
    signcolumn = "yes:1";
    updatetime = 50;

    completeopt = ["menuone" "noselect" "noinsert"]; # mostly just for cmp

    swapfile = false;
    backup = false;
    history = 10000;
    undofile = true;
    showmode = false;
    wrap = false;
    virtualedit = "block";

    spelloptions = "camel";
    spelllang = "en_us";
    spell = true;
  };

  globals = {
    # add line numbers
    netrw_bufsettings = "nu";
  };

  clipboard.providers.wl-copy.enable = true;
}
