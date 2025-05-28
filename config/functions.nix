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
  '';
}
