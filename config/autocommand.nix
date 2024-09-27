{
  autoCmd = [
    {
      command = ''setl formatoptions-=cro'';
      event = "FileType";
      pattern = "*";
      desc = "Do not continue comments on next line in normal or insert mode";
    }
    {
      command = ''setl comments=b:-\ [\ ],b:-\ [x],b:-,b:* | setl formatoptions+=r'';
      event = "FileType";
      pattern = "markdown";
      desc = "Sets markdown lists and tasks to contine on enter";
    }
    {
      callback.__raw = ''
        function()
          vim.keymap.set('n', '<leader>ff', ':w<cr>:silent !prettier --write %<cr>', {buffer = true, silent = true})
        end
      '';
      event = "FileType";
      pattern = [
        "typescript"
        "typescriptreact"
        "javascript"
        "javascriptreact"
      ];
    }
  ];
}
