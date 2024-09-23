{pkgs, ...}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "nvim-web-devicons";
      src = pkgs.fetchFromGitHub {
        owner = "nvim-tree";
        repo = "nvim-web-devicons";
        rev = "master";
        hash = "sha256-9jof2xfh8Ett7KtXqPnWMh60bPQSM1mfWQv2QeD/zYY=";
      };
    })
  ];
  extraConfigLua = ''
    require('nvim-web-devicons').setup()
  '';
}
