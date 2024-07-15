{
  # Import all your configuration modules here
  imports = [
    ./set.nix
    ./keymaps.nix
    ./autocommand.nix

    ./functions.nix
    ./highlight.nix
    ./diagnostic.nix
    ./filetype.nix

    ./plugins/catppuccin.nix
    ./plugins/lsp.nix
    ./plugins/harpoon.nix
    ./plugins/marks-nvim.nix
    ./plugins/illuminate.nix
    ./plugins/lualine.nix
    ./plugins/cmp.nix
    ./plugins/treesitter.nix
    ./plugins/telescope.nix
    ./plugins/gitsigns.nix
    ./plugins/comment.nix
    ./plugins/nvim-surround.nix
  ];
}
