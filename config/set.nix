{
  opts = {
    number = true;
    relativenumber = true;
    tabstop = 2;
    softtabstop = 2;
    shiftwidth = 2;
    expandtab = true;
    smartindent = false;
    cindent = true;
    termguicolors = true;
    hlsearch = false;
    incsearch = true;
    ignorecase = true;
    smartcase = true;
    scrolloff = 8;
    signcolumn = "yes";
    updatetime = 50;
    autochdir = true;
    swapfile = false;
    backup = false;
    history = 10000;
    undofile = true;
    # undodir = os.getenv('HOME') .. '/.vim/undodir';
    showmode = false;
    cursorline = true;
    cursorlineopt = "number";
    wrap = false;
    conceallevel = 0;
    grepprg = ''rg --hidden --iglob '!**/.git/**' --vimgrep'';
    virtualedit = "block";
  };
}
