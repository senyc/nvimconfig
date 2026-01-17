{
  opts = {
    number = true;
    relativenumber = true;

    cursorline = true;
    cursorlineopt = "number";
    signcolumn = "yes:1";
    colorcolumn = "120";
    termguicolors = true;

    expandtab = true;
    wrap = false;

    spell = true;

    tabstop = 2;
    softtabstop = 2;
    shiftwidth = 2;

    smartcase = true;
    incsearch = true;

    scrolloff = 10;
    inccommand = "split";
    splitright = true;

    swapfile = false;
    history = 10000;
    undofile = true;
    undodir.__raw = "vim.fs.normalize('~/.vim/undodir')";
  };

  # on :W default to :w
  extraConfigLua = ''
    vim.cmd("cabbrev W w")
    vim.cmd("cabbrev Wa wa")
  '';
}
