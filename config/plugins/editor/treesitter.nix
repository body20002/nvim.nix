_: {
  plugins.ts-autotag.enable=true;

  plugins.treesitter = {
    enable = true;
    folding = true;
    settings = {
      incremental_selection.enable = true;
      autotag = {
        enable = true;
        enable_rename = true;
        filetypes = [
          "html"
          "javascript"
          "typescript"
          "javascriptreact"
          "typescriptreact"
          "svelte"
          "vue"
          "tsx"
          "jsx"
          "xml"
          "markdown"
          "handlebars"
          "hbs"
        ];
      };
      sync_install = false;
      highlight.enable = true;
      indent.enable = true;
      autoinstall = true;
    };
  };
}
