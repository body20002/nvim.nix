{
  pkgs,
  inputs,
  ...
}: {
  plugins.leap = {
    enable = true;
    addDefaultMappings = true;
  };

  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "Flit";
      src = inputs.flit;
    })
  ];

  extraConfigLua = ''
    require('flit').setup {
      keys = { f = 'f', F = 'F', t = 't', T = 'T' },
      labeled_modes = "nx",
    }
  '';
}
