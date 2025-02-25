{
  plugins.harpoon.enable = true;
  keymaps = [
    {
      key = ''<Leader>ha'';
      action = '':lua require("harpoon.mark").add_file()<CR>'';
    }
    {
      key = ''<Leader>hh'';
      action = '':lua require("harpoon.ui").toggle_quick_menu()<CR>'';
    }
    {
      key = ''<M-Tab>'';
      action = '':lua require("harpoon.ui").nav_next() <CR>'';
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      key = ''<M-S-Tab>'';
      action = '':lua require("harpoon.ui").nav_prev() <CR>'';
      options = {
        noremap = true;
        silent = true;
      };
    }
  ];
}
