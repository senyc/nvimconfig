{
  defaultMap = map (v:
    with v;
      {
        mode = v.mode or "n";
        options = {
          noremap = v.options.noremap or true;
          silent = v.options.silent or true;
          desc = v.desc or "";
        };
      }
      // {inherit action key;});
}
