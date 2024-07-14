{
  defaultMap = map (v:
    with v;
      {
        options = {
          noremap = true;
          silent = true;
          desc =
            if v ? desc
            then desc
            else "";
        };
      }
      // {inherit action key mode;});
}
