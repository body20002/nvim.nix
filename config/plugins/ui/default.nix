{
  imports = [
    ./lualine.nix
    ./nvim-tree.nix
  ];

  plugins = {
    bufferline = {
      enable = true;
      settings.options.mode = "buffers";
    };

    fugitive.enable = true;
    indent-blankline.enable = true;
    web-devicons.enable = true;
    markview.enable = true;
    markdown-preview.enable = true;
  };
}
