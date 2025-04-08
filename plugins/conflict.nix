{
  plugins.git-conflict.enable = true;
  extraConfigLua = ''
    require('git-conflict').setup()
  '';
}
