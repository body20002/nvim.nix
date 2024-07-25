_: {
  plugins.ts-autotag.enable = true;

  plugins.treesitter = {
    enable = true;
    folding = true;
    settings = {
      incremental_selection.enable = true;
      autotag = {
        enable = true;
        enable_rename = true;
        filetypes = [
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
      sync_install = false;
      highlight.enable = true;
      indent.enable = true;
      autoinstall = true;
    };
  };
}
