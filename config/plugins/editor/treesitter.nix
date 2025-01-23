{
  plugins = {
    ts-autotag = {
      enable = true;
      settings = {
        opts = {
          enable_rename = true;
        };
        filetypes = [
          "dockerfile"
          "handlebars"
          "hbs"
          "html"
          "javascript"
          "javascriptreact"
          "jsx"
          "markdown"
          "prisma"
          "svelte"
          "tsx"
          "typescript"
          "typescriptreact"
          "vue"
          "xml"
        ];
      };
    };
    treesitter-textobjects = {
      enable = true;
    };
    treesitter = {
      enable = true;
      settings = {
        incremental_selection.enable = true;
        sync_install = false;
        highlight.enable = true;
        indent.enable = true;
        autoinstall = true;
      };
    };
  };
}
