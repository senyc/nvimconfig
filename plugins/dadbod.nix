{
  plugins = {
    vim-dadbod.enable = true;
    vim-dadbod-ui.enable = true;
    vim-dadbod-completion.enable = true;
  };
  # autoCmd = [
  #   {
  #     command =
  #       /*
  #       vim
  #       */
  #       ''autocmd BufWinEnter * if &filetype == 'dbui' | setlocal number relativenumber | endif'';
  #     event = "BufWinEnter";
  #     pattern = "*";
  #     desc = "Add line numbers to dbui";
  #   }
  # ];
}
