{
  plugins = {
    leap = {
      enable = true;
      settings = {
        vim_opts = {
          "go.ignorecase" = false;
        };
      };
    };
    flit = {
      enable = true;
      settings = {
        keys = {
          f = "f";
          F = "F";
          t = "t";
          T = "T";
        };
        labeled_modes = "nx";
      };
    };
  };
}
