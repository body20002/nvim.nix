_: {
  plugins.lualine = {
    enable = true;
    theme = "gruvbox-material";
    globalstatus = true;
    iconsEnabled = true;
    componentSeparators = { left = "|"; right = "|"; };
    sectionSeparators = { left = ""; right = ""; };
    disabledFiletypes = {
      statusline = [ "NvimTree" "packer" ];
    };
    alwaysDivideMiddle = true;

  };
}
