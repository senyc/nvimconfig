{pkgs, ...}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "vim-unimpaired";
      src = pkgs.fetchFromGitHub {
        owner = "tpope";
        repo = "vim-unimpaired";
        rev = "master";
        hash = "sha256-KUNmvI5+2yZuPTmtUiRPtkjzMxRaDh5gALsLz5VIaao=";
      };
    })
  ];
}
