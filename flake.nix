{
  description = "NeoVim With Nix";
  inputs = {
    systems.url = "github:nix-systems/x86_64-linux";
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
    surround = {
      url = "https://github.com/kylechui/nvim-surround";
      flake = false;
    };
  };
  outputs = {
    systems,
    nixpkgs,
    nixvim,
    ...
  } @ inputs: let
    eachSystem = func: let
      systemsList = import systems;
      perSystem = system:
        nixpkgs.lib.mapAttrs
        (_: attrValue: {${system} = attrValue;})
        (func system);
    in
      nixpkgs.lib.foldl nixpkgs.lib.recursiveUpdate {} (map perSystem systemsList);
  in
    eachSystem (system: let
      nixvimLib = nixvim.lib.${system};
      nixvim' = nixvim.legacyPackages.${system};
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      nixvimModule = {
        inherit pkgs;
        module = import ./config {themes.gruvbox.enable = true;};
        extraSpecialArgs = {
          inherit inputs;
        };
      };
      nvim = nixvim'.makeNixvimWithModule nixvimModule;
    in {
      formatter = pkgs.alejandra;
      packages.default = nvim;
      checks.default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
    });
}
