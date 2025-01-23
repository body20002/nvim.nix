{
  plugins.nvim-tree = {
    enable = true;
    disableNetrw = true;
    openOnSetup = true;
    reloadOnBufenter = true;
    respectBufCwd = true;
    extraOptions = {
      view = {
        adaptive_size = true;
        side = "left";
      };
      renderer = {
        group_empty = true;
        indent_markers = {
          enable = true;
          icons = {
            corner = "└ ";
            edge = "│ ";
            item = "│ ";
            none = "  ";
          };
        };
      };
      diagnostics = {
        enable = true;
        show_on_dirs = true;
        # -- icons = {hint = ""; info = ""; warning = ""; error = ""};
      };
      filters = {
        dotfiles = true;
        custom = [".*\\~" "build$" "gradle$" "gradlew" "node_modules"];
      };
      filesystem_watchers = {
        enable = true;
        debounce_delay = 50;
      };
    };
  };

  keymaps = [
    {
      action = ":NvimTreeToggle<CR>";
      key = "<C-\\>";
      options = {
        silent = true;
        noremap = true;
        desc = "Toggle NvimTree";
      };
    }
  ];
}
