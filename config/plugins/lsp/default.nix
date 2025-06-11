{
  imports = [
    ./lintting.nix
    ./autocomplete.nix
  ];

  lsp = {
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
      "*" = {
        settings = {
          capabilities = {
            textDocument = {
              semanticTokens = {
                multilineTokenSupport = true;
              };
            };
          };
          root_markers = [
            ".git"
          ];
        };
      };
      bashls.enable = true;
      biome.enable = true;
      clangd.enable = true;
      docker_compose_language_service.enable = true;
      dockerls.enable = true;
      gopls.enable = true;
      kotlin_language_server.enable = true;
      lua_ls.enable = true;
      marksman = {
        enable = true;
        settings = {
          filetypes = ["md" "markdown"];
        };
      };
      nixd.enable = true;
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
      rust_analyzer = {
        enable = true;
        installRustc = false;
        installCargo = false;
      };
      statix.enable = true;
      tailwindcss.enable = true;
      ts_ls.enable = true;
      yamlls.enable = true;
    };
  };

  plugins = {
    lspconfig.enable = true;
    # lsp = {
    #   enable = true;
    #   keymaps.lspBuf = {
    #     gD = "references";
    #     gd = "definition";
    #     gi = "implementation";
    #     gt = "type_definition";
    #     K = "hover";
    #     "<leader>k" = "signature_help";
    #     "<leader>F" = "format";
    #   };
    # };
    # lsp-format.enable = true;
    lsp-lines.enable = true;
    lspsaga = {
      enable = true;
    };
    none-ls = {
      enable = true;
      sources = {
        code_actions = {
          gitsigns.enable = true;
        };
        diagnostics = {
          actionlint.enable = true;
          codespell.enable = true;
        };
        formatting = {
          alejandra.enable = true;
          xmllint.enable = true;
        };
      };
    };
  };

  keymaps = [
    {
      key = "<leader>ca";
      action = "<cmd>Lspsaga code_action<CR>";
      options = {
        silent = true;
        noremap = true;
      };
      mode = "v";
    }
    {
      key = "<leader>ca";
      action = "<cmd>Lspsaga code_action<CR>";
      options = {
        silent = true;
        noremap = true;
      };
      mode = "n";
    }

    {
      key = "<leader>e";
      action = "<cmd>Lspsaga show_line_diagnostics<CR>";
      options = {
        silent = true;
        noremap = true;
      };
      mode = "n";
    }
    {
      key = "<Leader>[";
      action = "<cmd>Lspsaga diagnostic_jump_prev<CR>";
      options = {
        noremap = true;
        silent = true;
      };
      mode = "n";
    }
    {
      key = "<Leader>]";
      action = "<cmd>Lspsaga diagnostic_jump_next<CR>";
      options = {
        noremap = true;
        silent = true;
      };
      mode = "n";
    }

    {
      key = "gr";
      action = "<cmd>Lspsaga rename<CR>";
      options = {
        silent = true;
        noremap = true;
      };
      mode = "n";
    }
    {
      key = "gh";
      action = "<cmd>Lspsaga lsp_finder<CR>";
      options = {
        silent = true;
        noremap = true;
      };
      mode = "n";
    }
    {
      key = "<Leader>gd";
      action = "<cmd>Lspsaga peek_definition<CR>";
      options = {silent = true;};
      mode = "n";
    }
  ];
}
