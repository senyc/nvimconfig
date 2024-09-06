{
  opts = {
    number = true;
    relativenumber = true;
    cursorline = true;

    tabstop = 2;
    softtabstop = 2;
    shiftwidth = 2;
    expandtab = true;

    smartindent = false;
    cindent = true;

    smartcase = true;
    ignorecase = true;

    termguicolors = true;
    hlsearch = false;
    incsearch = true;
    scrolloff = 8;
    signcolumn = "yes";
    updatetime = 50;

    completeopt = ["menuone" "noselect" "noinsert"]; # mostly just for cmp

    swapfile = false;
    backup = false;
    history = 10000;
    undofile = true;
    showmode = false;
    cursorlineopt = "number";
    wrap = false;
    conceallevel = 0;
    grepprg = ''rg --hidden --smart-case --no-ignore --iglob '!**/.git/**' --vimgrep'';
    virtualedit = "block";

    spelloptions = "camel";
    spelllang = "en_us";
    spell = true;
  };

  globals = {
    # add line numbers
    netrw_bufsettings = "nu";
    # On preview (p) open vertically
    netrw_preview = 1;
    netrw_sizestyle = "H";
    netrw_list_hide = ''\.\./,\./,\.git/,__pycache__/'';
  };

  clipboard.providers.wl-copy.enable = true;
}
