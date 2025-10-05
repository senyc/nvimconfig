{
  autoCmd = [
    {
      command = /*vim*/''setl formatoptions-=cro | setl indentkeys-=: | setl indentkeys-=<:>'';
      event = "FileType";
      pattern = "*";
      desc = "Do not continue comments on next line in normal or insert mode";
    }
    {
      command = /*vim*/''setl indentkeys-=: | setl indentkeys-=<:>'';
      event = "FileType";
      pattern = "*";
      desc = "Do not indent line on ':', behaviour meant to help out with c programming, but useless in many modern languages";
    }
    {
      command = /*vim*/''setl comments=b:-\ [\ ],b:-\ [x],b:-,b:* | setl formatoptions+=ro | setl conceallevel=2 | setl wrap'';
      event = "FileType";
      pattern = "markdown";
      desc = "Sets markdown lists and tasks to continue on enter, also sets wrap and conceals markdown characters";
    }
    {
      command = /*vim*/''setl tabstop=4 | setl shiftwidth=4 | setl softtabstop=4'';
      event = "FileType";
      pattern = [
        "markdown"
        "sh"
        "toml"
        "gitconfig"
        "go"
        "sql"
        "bash"
      ];
      desc = "Sets indentation to 4 spaces";
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
          -- grs like grf (format) but for the secondary formatter
          vim.keymap.set('n', 'grs', ':w<cr>:silent !prettier --write "%"<cr>', {buffer = true, silent = true})
        end
      '';
      event = "FileType";
      pattern = [
        "typescript"
        "typescriptreact"
        "javascript"
        "javascriptreact"
        "vue"
        "json"
      ];
      desc = "Adds prettier formatter keybind for supported filetypes";
    }
    {
      callback.__raw = ''
        function()
          -- grs like grf (format) but for the secondary formatter
          vim.keymap.set('n', 'grs', ':w<cr>:silent !black "%"<cr>', {buffer = true, silent = true})
        end
      '';
      event = "FileType";
      pattern = [
        "python"
      ];
      desc = "Adds black formatter keybind for python files";
    }
  ];
}
