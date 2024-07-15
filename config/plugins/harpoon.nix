{pkgs, ...}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "harpoon2";
      src = pkgs.fetchFromGitHub {
        owner = "ThePrimeagen";
        repo = "harpoon";
        rev = "0378a6c428a0bed6a2781d459d7943843f374bce";
        hash = "sha256-FZQH38E02HuRPIPAog/nWM55FuBxKp8AyrEldFkoLYk=";
      };
    })
  ];
  extraConfigLua = ''
    local harpoon = require("harpoon")
    harpoon:setup()

    -- Mark new file in harpoon
    vim.keymap.set("n", "<leader>m", function() harpoon:list():add() end )

    -- List file marks
    vim.keymap.set("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    -- <leader>h refers to all harpoon commands
    -- Go to one of the first four files marks
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<leader>hs", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<leader>hd", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<leader>hf", function() harpoon:list():select(4) end)

    --
    vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end)
  '';
}
