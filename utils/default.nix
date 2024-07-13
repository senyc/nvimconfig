{
  defaultMap = builtins.map (v:
    with v;
      {
        options = {
          noremap = true;
          desc =
            if v ? desc
            then desc
            else "";
        };
      }
      // {inherit action key mode;});
}
