_: {

  plugins.telescope = {
    enable = true;
    keymaps = {
      "<Leader>ff" = "find_files";
      "<Leader>fb" = "buffers";
      "<Leader>fg" = "live_grep";
      "<Leader>fh" = "help_tags";
      "z=" = "spell_suggest";
      "<Leader>fk" = "keymaps";
      "<Leader>fvo" = "vim_options";
      "<Leader>fd" = "diagnostics";
      "<Leader>fcs" = "git_status";

    };

    extensions.fzf-native = {
      enable = true;
      settings = {
        fuzzy = true;
        override_generic_sorter = true;
        override_file_sorter = true;
        case_mode = "smart_case";
      };
    };
  };
}
