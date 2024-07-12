{
  description = "NeoVim With Nix";
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";

    # plugins
    decisive = {
      # for CSV
      url = "github:emmanueltouzery/decisive.nvim";
      flake = false;
    };
    flit = {
      url = "github:ggandor/flit.nvim";
      flake = false;
    };
  };
  outputs = { self, flake-utils, nixpkgs, nixvim, ... } @inputs:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
          nixvimLib = nixvim.lib.${system};
          nixvim' = nixvim.legacyPackages.${system};
          nixvimModule = {
            inherit pkgs;
            module = import ./config { themes.gruvbox.enable = true; };
            extraSpecialArgs = {
              inherit inputs;
            };
          };
          nvim = nixvim'.makeNixvimWithModule nixvimModule;
        in
        {
          packages.default = nvim;
        }
      );
}
