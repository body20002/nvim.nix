{ ... }: {
  imports = [
    ./comments.nix
    ./leap.nix
    ./harpoon.nix
    ./telescope.nix
    ./treesitter.nix
    ./csv.nix
  ];

  plugins = {
    hardtime.enable = true;
    nvim-autopairs.enable = true;
    nvim-colorizer.enable = true;
    todo-comments.enable = true;
    undotree.enable = true;
    wilder.enable = true;
  };
}
