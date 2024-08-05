{
  extraConfigLua = ''
    function RenameCurrentFile()
      local filename = vim.api.nvim_buf_get_name(0)
      local shortened_file = filename:gsub(os.getenv('HOME'), '~')
      vim.ui.input({ prompt = 'rename ' .. shortened_file:gsub('.*/',"" ) .. ' to: ', default = shortened_file }, function(input)
        -- Test for <C-c>
        if input ~= nil and not input:find "\3" and not input:find "\x03" then
          vim.cmd('saveas ' .. input)
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
