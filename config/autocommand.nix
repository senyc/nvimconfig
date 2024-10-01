{
  autoCmd = [
    {
      command = ''setl formatoptions-=cro'';
      event = "FileType";
      pattern = "*";
      desc = "Do not continue comments on next line in normal or insert mode";
    }
    {
      command = ''setl comments+=b:-\ [\ ],b:-\ [x],b:-,b:* | setl formatoptions+=ro | setl conceallevel=2'';
      event = "FileType";
      pattern = "markdown";
      desc = "Sets markdown lists and tasks to contine on enter";
    }
    {
      command = ''setl tabstop=4 | setl shiftwidth=4 | setl softtabstop=4'';
      event = "FileType";
      pattern = [
        "markdown"
        "sh"
        "toml"
        "gitconfig"
        "go"
        "bash"
      ];
      desc = "Sets identation to 4 spaces";
    }

    {
      command = ''setl noexpandtab'';
      event = "FileType";
      pattern = "go";
      desc = "Tabs will not be converted to spaces";
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
