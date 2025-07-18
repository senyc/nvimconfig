{
  vimAlias = true;
  viAlias = true;

  imports = [
    ./set.nix
    ./keymaps.nix

    ./diagnostic.nix

    ./autocommand.nix
    ../plugins/colorscheme.nix
    ../plugins/colorizer.nix
    ../plugins/undotree.nix

    ../plugins/lsp.nix
    ../plugins/zen.nix
    # ../plugins/term.nix
    ../plugins/grapple.nix
    ../plugins/illuminate.nix
    ../plugins/lualine.nix
    ../plugins/cmp.nix
    # for the =p motions
    ../plugins/unimpaired.nix
    ../plugins/treesitter.nix
    ../plugins/telescope.nix
    ../plugins/gitsigns.nix
    ../plugins/nvim-surround.nix
    ../plugins/oil.nix
    ../plugins/mini.nix
    ../plugins/direnv.nix
    # ../plugins/avante.nix
    ../plugins/dadbod.nix
    ../plugins/context.nix
    ../plugins/conflict.nix
    ../plugins/project-todo.nix
  ];
}
