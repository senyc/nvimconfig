{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        iconsEnabled = false;
        component_separators = {
          left = "";
          right = "";
        };
      };
      sections = {
        lualine_a = [''GitProjectdir()''];
        lualine_b = ["branch"];
        lualine_c = [
          {
            __unkeyed = "filename";
            padding = {
              right = 0;
              left = 1;
            };
            path = 4;
          }
          ''require('grapple').name_or_index()''
        ];

        lualine_x = ["encoding"];
        lualine_y = ["progress"];
        lualine_z = ["location"];
      };
    };
  };
}
