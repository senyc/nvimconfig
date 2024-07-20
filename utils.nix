{
  defaultMap = map (v:
    with v;
      {
        mode = v.mode or "n";
        options = {
          noremap = true;
          silent = true;
          desc = v.desc or "";
        };
      }
      // {inherit action key;});
}
