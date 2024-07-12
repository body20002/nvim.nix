{...}: {
  imports = [
    ./comments.nix
    ./leap.nix
    ./harpoon.nix
    ./telescope.nix
    ./treesitter.nix
  ];

  plugins.undotree.enable = true;
  plugins.nvim-autopairs.enable = true;
  plugins.nvim-colorizer.enable  = true;
  plugins.todo-comments.enable = true;
}
