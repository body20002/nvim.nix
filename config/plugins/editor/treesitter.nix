{config, ...}: {
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
      # Only the parsers we actually use, instead of nixvim's default (all ~328).
      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
        bash
        c
        cpp
        c_sharp
        css
        csv
        diff
        dockerfile
        gdscript
        gitcommit
        gitignore
        go
        gomod
        html
        javascript
        json
        kotlin
        lua
        markdown
        markdown_inline
        nix
        php
        prisma
        python
        regex
        rust
        sql
        svelte
        tsx
        typescript
        vim
        vimdoc
        vue
        xml
        yaml
      ];
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
