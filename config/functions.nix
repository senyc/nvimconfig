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

    function CreateNote(directory)
      vim.ui.input({ prompt = 'Create note in ' .. directory .. ':', default=directory }, function(input)
        -- Test for <C-c>
        if input == nil or input:find "\3" or input:find "\x03" then
          return
        end
          vim.cmd('edit ' ..  input)
      end)
    end

    function AppendTodo(directory)
      vim.ui.input({ prompt = 'New todo: ', }, function(input)
        -- Test for <C-c>
        if input == nil or input:find "\3" or input:find "\x03" then
          return
        end
          -- Append new todo to notes
          vim.cmd('silent !echo "- [ ] ' .. input .. '" >> ~/projects/notes/todos.md')
      end)
    end
  '';
}
