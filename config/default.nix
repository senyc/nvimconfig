{
  vimAlias = true;
  viAlias = true;

  imports = [
    ./set.nix
    ./keymaps.nix
    ./functions.nix

    ./diagnostic.nix

    ./autocommand.nix
    ../plugins/colorizer.nix
    ../plugins/undotree.nix

    ../plugins/lsp.nix
    ../plugins/actions-preview.nix
    ../plugins/zen.nix
    ../plugins/illuminate.nix
    ../plugins/lualine.nix
    ../plugins/blink.nix
    ../plugins/treesitter.nix
    ../plugins/dap.nix
    ../plugins/colorscheme.nix
    ../plugins/grapple.nix
    ../plugins/gitsigns.nix
    ../plugins/nvim-surround.nix
    ../plugins/oil.nix
    ../plugins/neotest.nix
    ../plugins/mini.nix
    ../plugins/telescope.nix
    ../plugins/direnv.nix
    ../plugins/dadbod.nix
    ../plugins/context.nix
    ../plugins/conflict.nix
    ../plugins/project-todo.nix
  ];
}
