{
  plugins.lualine = {
    enable = true;
    theme = "catppuccin";
    iconsEnabled = true;
    componentSeparators = {
      left = "";
      right = "";
    };
    sections = {
      lualine_a = ["mode"];
      lualine_b = ["branch"];
      lualine_c = ["filename" "require('grapple').name_or_index()"];

      lualine_x = ["encoding"];
      lualine_y = ["progress"];
      lualine_z = ["location"];
    };
  };
}
