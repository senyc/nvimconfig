{
  extraConfigLua = ''
    local set = vim.opt_local

    -- Set local settings for terminal buffers
    vim.api.nvim_create_autocmd("TermOpen", {
      group = vim.api.nvim_create_augroup("custom-term-open", {}),
      callback = function()
        set.number = false
        set.relativenumber = false
        set.scrolloff = 0
        vim.bo.filetype = "terminal"
        vim.opt.spell = false
      end,
    })

    vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

    -- Open a terminal at the bottom of the screen with a fixed height.
    vim.keymap.set("n", "<m-t>", function()
      vim.cmd.new()
      vim.cmd.wincmd "J"
      vim.api.nvim_win_set_height(0, 12)
      vim.wo.winfixheight = true
      vim.cmd.term()
      vim.cmd.startinsert()
    end)

    -- Open a terminal in a new tab.
    vim.keymap.set("n", "<m-n>", function()
      vim.cmd.new()
      vim.cmd.wincmd "T"
      vim.cmd.term()
      vim.cmd.startinsert()
    end)
  '';
}
