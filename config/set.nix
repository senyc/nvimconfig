{
  opts = {
    spell = true;
    spelllang = "en_us";

    number = true;
    relativenumber = true;
    cursorline = true;

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
    showmode = false;
    cursorlineopt = "number";
    wrap = false;
    conceallevel = 0;
    grepprg = ''rg --hidden --iglob '!**/.git/**' --vimgrep'';
    virtualedit = "block";
    statusline = ''%<%f %{v:lua.GetStatusLineGitInformation()} %h%m%r%=%-14.(%l,%c%V%) %P'';
  };

  globals = {
    netrw_bufsettings = ''noma nomod nu bl nowrap ro'';
    netrw_preview = 1;
    netrw_sizestyle = "H";
    netrw_liststyle = "3";
    netrw_list_hide = ''\.\./,\./,\.git/,__pycache__/'';
    netrw_banner = 0;
  };
  clipboard.providers.wl-copy.enable = true;
}