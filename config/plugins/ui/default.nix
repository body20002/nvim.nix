{ ... }: {
  imports = [
    ./lualine.nix
    ./nvim-tree.nix
  ];

  plugins = {
    bufferline = {
      enable = true;
      mode = "buffers";
    };

    fugitive.enable = true;
    glow.enable = true;
    indent-blankline.enable = true;
  };
}
