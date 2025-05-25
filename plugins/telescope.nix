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
          file_ignore_patterns = [
            "^.git/"
            "node_modules/"
            "dist/"
            ".next/"
            ".direnv/"
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
              "<m-f>".__raw = "require('telescope.actions').close";
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
        key = "<m-f>";
        action = ":lua require('telescope.builtin').find_files({ no_ignore = true, hidden = true, show_untracked = true })<cr>";
        desc = "Find file";
      }
      {
        key = "<leader>fh";
        action = ":lua require('telescope.builtin').help_tags()<cr>";
        desc = "Find help";
      }
      {
        key = "<leader>fk";
        action = ":lua require('telescope.builtin').keymaps()<cr>";
        desc = "Find keymaps";
      }
      {
        key = "<leader>fr";
        action = "<cmd>Telescope resume<cr>";
        desc = "Find resume";
      }
      {
        key = "<leader>fw";
        action = ":lua require('telescope.builtin').grep_string({hidden = true })<cr>";
        desc = "Find word";
      }
    ];

    # Add telescope optional dependencies
    extraPackages = with pkgs; [
      fzf
      ripgrep
      fd
    ];

    extraConfigLua = ''
      local directory_picker = function(name, cmd)
        require("telescope.pickers").new({}, require('telescope.themes').get_dropdown({
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
        })):find()
      end

      local conf = require("telescope.config").values
      local finders = require "telescope.finders"
      local make_entry = require "telescope.make_entry"
      local pickers = require "telescope.pickers"

      local flatten = vim.tbl_flatten

      -- Totally stolen from tj devries
      local multi_grep = function(opts)
        opts = opts or {}
        opts.cwd = opts.cwd and vim.fn.expand(opts.cwd) or vim.loop.cwd()
        opts.shortcuts = opts.shortcuts
          or {
            ["l"] = "*.lua",
            ["g"] = "*.go",
          }
        opts.pattern = opts.pattern or "%s"

        local custom_grep = finders.new_async_job {
          command_generator = function(prompt)
            if not prompt or prompt == "" then
              return nil
            end

            local prompt_split = vim.split(prompt, "  ")

            local args = { "rg" }
            if prompt_split[1] then
              table.insert(args, "-e")
              table.insert(args, prompt_split[1])
            end

            if prompt_split[2] then
              table.insert(args, "-g")

              local pattern
              if opts.shortcuts[prompt_split[2]] then
                pattern = opts.shortcuts[prompt_split[2]]
              else
                pattern = prompt_split[2]
              end

              table.insert(args, string.format(opts.pattern, pattern))
            end

            return flatten {
              args,
              { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
            }
          end,
          entry_maker = make_entry.gen_from_vimgrep(opts),
          cwd = opts.cwd,
        }

        return pickers
          .new(opts, {
            debounce = 100,
            prompt_title = "Live Grep (with shortcuts)",
            finder = custom_grep,
            previewer = conf.grep_previewer(opts),
            sorter = require("telescope.sorters").empty(),
          }):find()
      end

      vim.keymap.set("n", "<leader>g", multi_grep)

      vim.keymap.set("n", "<leader>fp", function()
        local command = ""
        -- Environment specific environment command that won't show personal projects in project search if on work host
        if os.getenv("HIDE_PERSONAL_PROJECTS") then
          command = {vim.o.shell, "-c", [[find ~/w ~/w/archive -mindepth 1 -maxdepth 1 -type d -path ~/w/archive -prune -o -print | sed 's|]] .. vim.fn.expand("$HOME") .. "|~|'"}
        else
          command = {vim.o.shell, "-c", [[find ~/p ~/p/archive ~/w ~/w/archive -mindepth 1 -maxdepth 1 -type d \( -path ~/w/archive -o -path ~/p/archive \) -prune -o -print | sed 's|]] .. vim.fn.expand("$HOME") .. "|~|'"}
        end
        directory_picker("Find Projects", command)
      end)
    '';
  }
