{ pkgs, inputs, ... }: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "nvim-surround";
      src = inputs.surround;
    })
  ];

  extraConfigLua = ''
    require('nvim-surround').setup()
  '';
}
