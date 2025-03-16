{
  vimAlias = true;
  viAlias = true;
  imports = [
    ./set.nix
    ./keymaps.nix

    ./diagnostic.nix

    ./autocommand.nix
    ./functions.nix

    ../plugins/lsp.nix
    ../plugins/undotree.nix
    ../plugins/toggleterm.nix
    ../plugins/zen.nix
    ../plugins/grapple.nix
    ../plugins/illuminate.nix
    ../plugins/lualine.nix
    ../plugins/cmp.nix
    ../plugins/unimpaired.nix
    ../plugins/treesitter.nix
    ../plugins/telescope.nix
    ../plugins/gitsigns.nix
    ../plugins/nvim-surround.nix
    ../plugins/oil.nix
    ../plugins/mini.nix
    # ../plugins/gh-nvim.nix
    ../plugins/direnv.nix
    ../plugins/codecompanion.nix
  ];
}
