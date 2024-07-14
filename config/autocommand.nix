{
  autoCmd = [
    {
      command = "set formatoptions-=cro";
      event = "FileType";
      pattern = "*";
    }
    {
      command = "set cinkeys-=0#";
      event = "FileType";
      pattern = "*";
    }
    {
      command = "set indentkeys-=0#";
      event = "FileType";
      pattern = "*";
    }
    {
      callback.__raw = ''
        function()
          vim.keymap.set('n', '<leader>=', ':w<cr>:silent !prettier --single-quote --jsx-single-quote --write %<cr>', {buffer = true, silent = true})
        end
      '';
      event = [
        "BufEnter"
        "BufWinEnter"
      ];
      pattern = [
        "*.tsx"
        "*.ts"
      ];
    }
    {
      callback.__raw = ''
        function()
          vim.keymap.set('n', '<leader>=', ':w<cr>:silent !rubyfmt -i %<cr>', {buffer = true, silent = true})
        end
      '';
      event = [
        "BufEnter"
        "BufWinEnter"
      ];
      pattern = [
        "*.rb"
      ];
    }
  ];
}
