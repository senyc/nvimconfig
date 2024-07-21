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
      lualine_b = ["branch" "diff"];
      lualine_c = [
        {
          name = "filename";
          extraConfig = {
            padding = {
              right = 0;
              left = 1;
            };
            path = 4;
          };
        }
        # ''"󰛢" .. require('grapple').name_or_index()''
         ''require('grapple').name_or_index()''
      ];

      lualine_x = ["encoding"];
      lualine_y = ["progress"];
      lualine_z = ["location"];
    };
  };
}
