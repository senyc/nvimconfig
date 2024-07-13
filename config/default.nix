{
  # Import all your configuration modules here
  imports = [
    ./set.nix
    ./keymaps.nix
    ./plugins/catppuccin.nix
    ./plugins/gitsigns.nix
    ./plugins/treesitter.nix
    ./highlight.nix

    ./diagnostic.nix
    ./functions.nix
    ./autocommand.nix

    ./plugins/cmp.nix
    ./plugins/comment.nix
    ./plugins/lsp.nix
    ./plugins/nvim-surround.nix
    ./plugins/telescope.nix
  ];
}
