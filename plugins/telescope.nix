let
  utils = import ../utils.nix;
in
  {pkgs, ...}: {
    plugins.web-devicons.enable = true;
    plugins.telescope = {
      enable = true;
      extensions = {
        fzf-native = {
          enable = true;
        };
      };
      settings = {
        defaults = {
          layout_config = {
            horizontal = {
              prompt_position = "top";
            };
          };
          sorting_strategy = "ascending";
          file_ignore_patterns = [
            "^.git/"
            "node_modules/"
            "dist/"
            ".next/"
            "package%-lock.json"
          ];
          vimgrep_arguments = [
            "rg"
            "--no-heading"
            "--line-number"
            "--vimgrep"
            "--column"
            "--smart-case"
            # Display dot and gitignored files
            "--hidden"
            "--no-ignore"
          ];
          mappings = {
            i = {
              "<esc>".__raw = "require('telescope.actions').close";
              # To quickly toggle telescope for file search if applicable
              "<c-f>".__raw = "require('telescope.actions').close";
            };
            n = {
              "<esc>".__raw = "require('telescope.actions').close";
            };
          };
        };
      };
    };
    keymaps = utils.defaultMap [
      {
        key = "<c-f>";
        action = ":lua require('telescope.builtin').find_files { no_ignore = true, hidden = true, show_untracked = true }<cr>";
        desc = "Find file";
      }
      {
        key = "<leader>fg";
        action = ":lua require('telescope.builtin').live_grep {hidden = true }<cr>";
        desc = "Find grep";
      }
      {
        key = "<leader>fr";
        action = "<cmd>Telescope resume<cr>";
        desc = "Find resume";
      }
      {
        key = "<leader>fw";
        action = ":lua require('telescope.builtin').grep_string {hidden = true }<cr>";
        desc = "Find word";
      }
    ];

    # Add telescope optional dependencies
    extraPackages = with pkgs; [
      ripgrep
      fd
    ];

    extraConfigLua = ''
      local directory_picker = function(name, cmd)
        require("telescope.pickers").new({}, {
          prompt_title = name,
          finder = require("telescope.finders").new_table({
            results = require("telescope.utils").get_os_command_output(cmd),
          }),
          previewer = require("telescope.previewers").vim_buffer_cat.new({}),
          sorter = require("telescope.sorters").get_fzy_sorter(),
          attach_mappings = function(prompt_bufnr)
            require("telescope.actions.set").select:replace(function(_)
              local entry = require('telescope.actions.state').get_selected_entry()
              require('telescope.actions').close(prompt_bufnr)
              local dir = require("telescope.from_entry").path(entry)
              vim.api.nvim_set_current_dir(dir)
            end)
            return true
          end,
        }):find()
      end

      vim.keymap.set("n", "<leader>fp", function()
        local command = ""
        -- Environment specific environment command that won't show personal projects in project search if on work host
        if os.getenv("HIDE_PERSONAL_PROJECTS") then
          command = {vim.o.shell, "-c", "find ~/work -mindepth 1 -maxdepth 1 -type d | sed 's|" .. vim.fn.expand("$HOME") .. "|~|'"}
        else
          command = {vim.o.shell, "-c", "find ~/projects ~/work -mindepth 1 -maxdepth 1 -type d | sed 's|" .. vim.fn.expand("$HOME") .. "|~|'"}
        end
        directory_picker("Find Projects", command)
      end)
    '';
  }
