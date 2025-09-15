{
  plugins.nvim-tree = {
    enable = true;
    openOnSetup = true;
    settings = {
      reload_on_bufenter = true;
      respect_buf_cwd = true;
      disable_netrw = true;
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
        dotfiles = false;
        custom = [ ".*\\~" ".envrc" ".direnv" "dist" "build$" "gradle$" "gradlew" "node_modules"];
        exclude = [".env" ".env.*"];
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
