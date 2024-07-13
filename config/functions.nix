{
  extraConfigLua = ''
    function GetSearchDir()
      local handler = io.popen 'git rev-parse --show-toplevel 2>/dev/null'
      if not handler then
        return require('telescope.utils').buffer_dir()
      end
      local result = handler:read('*l')
      if not result then
        return require('telescope.utils').buffer_dir()
      end
      return result
    end

    function GetStatusLineGitInformation()
      local gitdir = GetSearchDir():match("[\\/]([^\\/]+)$")

      local handler = io.popen 'git branch --show-current 2>/dev/null'
      if not handler then
        return "n/a"
      end
      local result = handler:read('*l')
      if not result then
        return gitdir
      end
      return gitdir .. "/" .. result
    end
  '';
}
