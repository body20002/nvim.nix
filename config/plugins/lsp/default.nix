{ ... }: {
  imports = [
    ./coq.nix
    ./lintting.nix
  ];

  plugins = {
    lsp = {
      enable = true;
      keymaps.lspBuf = {
        gD = "references";
        gd = "definition";
        gi = "implementation";
        gt = "type_definition";
        K = "hover";
        "<leader>k" = "signature_help";
        "<leader>F" = "format";
      };
      servers = {
        bashls.enable = true;
        clangd.enable = true;
        cssls.enable = true;
        docker-compose-language-service.enable = true;
        dockerls.enable = true;
        emmet-ls.enable = true;
        eslint.enable = true;
        gopls.enable = true;
        htmx.enable = true;
        jsonls.enable = true;
        kotlin-language-server.enable = true;
        lua-ls.enable = true;
        nginx-language-server.enable = true;
        nil-ls.enable = true;
        prismals.enable = true;
        pyright = {
          enable = true;
          settings = {
            typeCheckingMode = "strict";
            disableOrganizeImports = false;
            analysis = {
              useLibraryCodeForTypes = true;
              autoSearchPaths = true;
              autoImportCompletions = true;
            };
          };
        };
        ruff.enable = true;
        ruff-lsp.enable = true;
        rust-analyzer = {
          enable = true;
          installRustc = false;
          installCargo = false;
        };
        sqls.enable = true;
        tailwindcss.enable = true;
        templ.enable = true;
        tsserver.enable = true;
        typos-lsp.enable = true;
        yamlls.enable = true;
      };
    };
    lsp-format = {
      enable = true;
    };
    lspsaga = {
      enable = true;
    };
  };

  plugins.none-ls = {
    enable = true;
    enableLspFormat = true;
    sources = {
      code_actions = {
        refactoring.enable = true;
        statix.enable = true;
      };
      diagnostics = {
        actionlint.enable = true;
        alex.enable = true;
        cmake_lint.enable = true;
        codespell.enable = true;
        commitlint.enable = true;
        deadnix.enable = true;
        dotenv_linter.enable = true;
        markdownlint.enable = true;
        statix.enable = true;
      };

      formatting = {
        black.enable = true;
        codespell.enable = true;
        gofmt.enable = true;
        isort.enable = true;
        just.enable = true;
        ktlint.enable = true;
        leptosfmt.enable = true;
        markdownlint.enable = true;
        nixpkgs_fmt.enable = true;
        pg_format.enable = true;
        prettierd.enable = true;
        rustywind.enable = true;
        xmllint.enable = true;
      };
    };
  };

  keymaps = [

    { key = "<leader>ca"; action = "<cmd>Lspsaga code_action<CR>"; options = { silent = true; noremap = true; }; mode = "v"; }
    { key = "<leader>ca"; action = "<cmd>Lspsaga code_action<CR>"; options = { silent = true; noremap = true; }; mode = "n"; }

    { key = "<leader>e"; action = "<cmd>Lspsaga show_line_diagnostics<CR>"; options = { silent = true; noremap = true; }; mode = "n"; }
    { key = "<Leader>["; action = "<cmd>Lspsaga diagnostic_jump_prev<CR>"; options = { noremap = true; silent = true; }; mode = "n"; }
    { key = "<Leader>]"; action = "<cmd>Lspsaga diagnostic_jump_next<CR>"; options = { noremap = true; silent = true; }; mode = "n"; }

    { key = "<Leader>T"; action = "<cmd>Lspsaga open_floaterm<CR>"; options = { silent = true; }; mode = "n"; }
    { key = "<Leader>T"; action = "[[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]]"; options = { silent = true; }; mode = "t"; }

    { key = "gr"; action = "<cmd>Lspsaga rename<CR>"; options = { silent = true; noremap = true; }; mode = "n"; }
    { key = "gh"; action = "<cmd>Lspsaga lsp_finder<CR>"; options = { silent = true; noremap = true; }; mode = "n"; }
    { key = "<Leader>gd"; action = "<cmd>Lspsaga peek_definition<CR>"; options = { silent = true; }; mode = "n"; }
  ];
}
