{
  diagnostics = {
    virtual_lines = true;
    signs = {
      # Goes: error, warn, hint, info
      text = [
        ">>"
        "->"
        ">-"
        "--"
      ];
    };
    underline = true;
    severity_sort = true;
    float = {
      focusable = true;
      style = "minimal";
      border = "rounded";
      source = "always";
      header = "";
      prefix = "";
      suffix = "";
    };
  };
}
