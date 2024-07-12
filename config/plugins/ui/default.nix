{ ... }: {
  imports = [
    ./lualine.nix
    ./nvim-tree.nix
  ];

  plugins.bufferline = {
    enable = true;
    mode = "buffers";
  };

  plugins.fugitive.enable = true;
  plugins.glow.enable = true;
  plugins.indent-blankline.enable = true;
}
