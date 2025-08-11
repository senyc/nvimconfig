{
  plugins.mini = {
    mockDevIcons = true;
    modules = {
      # nvim-surround is just better
      # surround = {
      #   search_method = "cover_or_next";
      # };
      # ai = {
      #   search_method = "cover_or_next";
      # };
      icons = {};
      trailspace = {};
      splitjoin = {};
    };
    enable = true;
  };
  # keymaps = utils.defaultMap [
  #   {
  #     key = "cst";
  #     action = "srtt";
  #     desc = "change surrounding tag";
  #   }
  #   {
  #     key = "csf";
  #     action = "srff";
  #     desc = "change surrounding function";
  #   }
  # ];
}
