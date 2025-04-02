{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        iconsEnabled = false;
        always_show_tabline = false;
        globalstatus = true;
        component_separators = {
          left = "";
          right = "";
        };
      };
      sections = {
        lualine_a = [''GitProjectdir()''];
        lualine_b = [
          "branch"
          "diff"
          {
            __unkeyed = "diagnostics";
            symbols = {
              error = "E";
              warn = "W";
              info = "I";
              hint = "H";
            };
          }
        ];
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
      tabline = {
        lualine_a = [
          {
            __unkeyed = "tabs";
            mode = 2;
            tab_max_length = 40;
            max_length = { __raw = "vim.o.columns";};
            path = 1;
          }
        ];
      };
    };
  };
}
