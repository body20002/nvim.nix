{ ... }: {
  config.colorschemes.gruvbox = {
    enable = true;
    settings = {
      transparent_mode = true;
      overrides = {
        NvimTreeNormal.bg = "#32302f";
        NvimTreeEndOfBuffer.fg = "#32302f";
        EndOfBuffer.fg = "#32302f";
        NonText.fg = "#5a524c";
      };
    };
  };
}
