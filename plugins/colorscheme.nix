{
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
    };
  };
  extraConfigLua = ''
    -- These make the numbers much easier to see. Source:
    -- https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/palettes/mocha.lua
    vim.cmd 'hi LineNr guifg=#a6adc8'
  '';
}
