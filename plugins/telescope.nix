let
  utils = import ../utils.nix;
in
  {pkgs, ...}: {
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
          ];
          vimgrep_arguments = [
            "rg"
            "--no-heading"
            "--with-filename"
            "--line-number"
            "--column"
            "--smart-case"
            # Display dot and gitignored files
            "--hidden"
            "--no-ignore"
          ];
          mappings = {
            i = {
              "<esc>".__raw = "require('telescope.actions').close";
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
        key = "<leader>s";
        action = ":lua require('telescope.builtin').git_files { hidden = true, show_untracked = true }<cr>";
        desc = "search git directory, showing untracked files";
      }
      {
        key = "<leader>g";
        action = ":lua require('telescope.builtin').live_grep {hidden = true }<cr>";
        desc = "live grep search";
      }
      {
        key = "<leader>cf";
        action = "<cmd>cclose<cr><cmd>Telescope quickfix<cr>";
      }
      {
        key = "<leader>of";
        action = "<cmd>Telescope oldfiles<cr>";
      }
      {
        key = "<leader>tr";
        action = "<cmd>Telescope resume<cr>";
      }
      {
        key = "<leader>tb";
        action = "<cmd>Telescope buffers<cr>";
      }
      {
        key = "<leader>th";
        action = "<cmd>Telescope help_tags<cr>";
      }
      {
        key = "<leader>fg";
        action = ":lua require('telescope.builtin').grep_string {hidden = true }<cr>";
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
          sorter = require("telescope.sorters").get_fuzzy_file(),
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

      vim.keymap.set("n", "<leader>fd", function()
        local command = {vim.o.shell, "-c", "find ~/projects ~/work -mindepth 1 -maxdepth 1 -type d | sed 's|" .. vim.fn.expand("$HOME") .. "|~|'"}
        directory_picker("Project Search", command)
      end)
    '';
  }
