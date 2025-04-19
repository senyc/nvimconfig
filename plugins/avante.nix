{
  plugins.avante = {
    enable = true;
    settings = {
      provider = "openai-gpt-4o-mini";
    };
  };
  extraConfigLuaPost = ''
    require('avante').setup({
      openai = {
        model = "gpt-4o",
      },
      provider = "openai-gpt-4o-mini",
      vendors = {
        ["openai-gpt-4o-mini"] = {
          __inherited_from = "openai",
          model = "gpt-4.1-mini",
        }
      }
    })
  '';
}
