let
  utils = import ../../utils;
in {
  plugins.telescope = {
    enable = true;
    settings = {
      defaults = {
        file_ignore_patterns = [
          "^.git/"
          "node_modules/"
        ];
        vimgrep_arguments = [
          "rg"
          "--no-heading"
          "--with-filename"
          "--line-number"
          "--column"
          "--smart-case"
          "--hidden"
        ];
        mappings = {
          i = {
            # "<c-c>".__raw = ["<esc>" {type = "command";}];
            "<esc>".__raw = "require('telescope.actions').close";
          };
          n = {
            "<esc>".__raw = "require('telescope.actions').close";
          };
        };
      };
    };
  };
  extraConfigLua = ''
    -- Will return top level git directory, if one does not exist it will return current buffer directory
    local function get_search_dir()
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

    function GitSearch()
      require('telescope.builtin').find_files { cwd = get_search_dir() }
    end

    function GrepSearch()
      require('telescope.builtin').live_grep { cwd = get_search_dir() }
    end

    function GrepStringSearch()
      require('telescope.builtin').grep_string { cwd = get_search_dir() }
    end
  '';
  keymaps = utils.defaultMap [
    {
      key = "<leader>s";
      action = ":lua GitSearch()<cr>";
      mode = "n";
      desc = "search git directory, showing untracked files";
    }
    {
      key = "<leader>g";
      action = ":lua GrepSearch()<cr>";
      mode = "n";
      desc = "live grep search";
    }
    {
      key = "<leader>tr";
      action = "<cmd>Telescope resume<cr>";
      mode = "n";
      desc = "resume previous telescope session";
    }
    {
      key = "<leader>cf";
      action = "<cmd>cclose<cr><cmd>Telescope quickfix<cr>";
      mode = "n";
    }
    {
      key = "<leader>of";
      action = "<cmd>Telescope oldfiles<cr>";
      mode = "n";
    }
    {
      key = "<leader>fg";
      action = ":lua GrepStringSearch()<cr>";
      mode = "n";
    }
  ];
}
