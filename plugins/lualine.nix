{
  plugins.lualine = {
    enable = true;
    theme = "catppuccin";
    iconsEnabled = true;
    sections = {
      lualine_a = ["mode"];
      lualine_b = ["branch"];
      lualine_c = ["filename"];

      lualine_x = ["encoding"];
      lualine_y = ["progress"];
      lualine_z = ["location"];
    };
  };
}
