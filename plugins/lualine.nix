{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        iconsEnabled = false;
        always_show_tabline = false;
        theme = "moonfly";
        globalstatus = false;
        component_separators = {
          left = "";
          right = "";
        };
      };
      sections = {
        lualine_a = [""];
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
            path = 3;
          }
          ''require('grapple').name_or_index()''
        ];

        lualine_x = ["encoding"];
        lualine_y = [""];
        lualine_z = [""];
      };
      tabline = {
        lualine_a = [
          {
            __unkeyed = "tabs";
            mode = 1;
            tab_max_length = 60;
            max_length = { __raw = /*lua*/"function() return vim.o.columns end";};
          }
        ];
      };
    };
  };
}
