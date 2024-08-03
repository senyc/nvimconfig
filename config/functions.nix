{
  extraConfigLua = ''
    function RenameCurrentFile()
      local filename = vim.api.nvim_buf_get_name(0)
      local basename = filename:match('^.+/(.+)$')

      vim.ui.input({ prompt = 'replace ' .. basename .. ' with: ', default = basename }, function(input)
        -- Test for <C-c>
        if input ~= nil and not input:find "\3" and not input:find "\x03" then
          local newname = basename:gsub(basename, input)
          vim.cmd('file ' .. newname)
          vim.cmd.w()
          vim.cmd('silent !rm ' .. filename)
        end
      end)
    end

    function DeleteCurrentFile()
      local filename = vim.api.nvim_buf_get_name(0)
      local basename = filename:match('^.+/(.+)$')

      vim.ui.input({ prompt = 'delete ' .. basename .. '? ' }, function(input)
        -- Test for <C-c>
        if input == nil or input:find "\3" or input:find "\x03" then
          return
        end
        if input:lower():sub(1, 1) == 'y' then
          vim.cmd.w()
          vim.cmd('silent !rm ' .. '"' .. filename .. '"')
          vim.cmd.bdelete()
        end
      end)
    end
  '';
}
