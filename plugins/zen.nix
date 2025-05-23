{
  plugins.zen-mode = {
    enable = true;
  };
  # plugins.twilight.enable = true;
  extraConfigLua = ''
    require('zen-mode').setup({
      window = {
        backdrop = .6
      },
      plugins = {
        gitsigns = {enabled = true},
        twilight = {enabled = false},
        alacritty = {
          enabled = true,
          font = 15
        }
      },
      on_open = function(win)
        -- Clears cmd text
        vim.cmd 'echo ""'
        -- Toggles line blame
        require 'gitsigns'.toggle_current_line_blame(false)
      end,
      on_close = function()
        require 'gitsigns'.toggle_current_line_blame(true)
      end
    })
     vim.keymap.set('n', '<leader>zm', function()
      -- Calling this here because in the callback the current line blame stays
      require 'gitsigns'.toggle_current_line_blame(false)
      require('zen-mode').toggle()
    end)
  '';
}
