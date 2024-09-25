{
  extraConfigLua = ''
    function GitProjectdir()
      local handler
      handler = io.popen 'git rev-parse --git-common-dir 2>/dev/null'
      local git_common_dir = handler:read('*l')
      handler:close()

      -- If current directory is not a worktree then return directory name containing .git file
      if git_common_dir ~= '.git' then
        return git_common_dir:gsub(".*/", "")
      end

      handler = io.popen 'git rev-parse --show-toplevel 2>/dev/null'
      local git_top_level = handler:read('*l')
      handler:close()
      if not git_top_level then
        return "n/a"
      end
        return git_top_level:gsub(".*/", "")

    end

    function RenameCurrentFile()
      local filename = vim.api.nvim_buf_get_name(0)
      local shortened_file = filename:gsub(os.getenv('HOME'), '~')
      vim.ui.input({ prompt = 'rename ' .. shortened_file:gsub('.*/',"" ) .. ' to: ', default = shortened_file }, function(input)
        -- Test for <C-c>
        if input ~= nil and not input:find "\3" and not input:find "\x03" then
          vim.cmd('saveas ' .. input)
          -- Remove old file
          vim.cmd('silent !rm ' .. '"' .. filename .. '"')
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
