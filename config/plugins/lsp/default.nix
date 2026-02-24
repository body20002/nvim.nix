{
  imports = [
    ./lintting.nix
    ./autocomplete.nix
  ];

  lsp = {
    keymaps = [
      {
        key = "gD";
        lspBufAction = "references";
      }
      {
        key = "gd";
        lspBufAction = "definition";
      }
      {
        key = "gi";
        lspBufAction = "implementation";
      }
      {
        key = "gt";
        lspBufAction = "type_definition";
      }
      {
        key = "K";
        lspBufAction = "hover";
      }
      {
        key = "<leader>k";
        lspBufAction = "signature_help";
      }
      {
        key = "<leader>F";
        lspBufAction = "format";
      }
      {
        key = "<leader>ca";
        action = "<cmd>Lspsaga code_action<CR>";
        mode = "v";
      }
      {
        key = "<leader>ca";
        action = "<cmd>Lspsaga code_action<CR>";
        mode = "n";
      }
      {
        key = "<leader>e";
        action = "<cmd>Lspsaga show_line_diagnostics<CR>";
        mode = "n";
      }
      {
        key = "<Leader>[";
        action = "<cmd>Lspsaga diagnostic_jump_prev<CR>";
        mode = "n";
      }
      {
        key = "<Leader>]";
        action = "<cmd>Lspsaga diagnostic_jump_next<CR>";
        mode = "n";
      }
      {
        key = "gr";
        action = "<cmd>Lspsaga rename<CR>";
        mode = "n";
      }
      {
        key = "gh";
        action = "<cmd>Lspsaga lsp_finder<CR>";
        mode = "n";
      }
      {
        key = "<Leader>gd";
        action = "<cmd>Lspsaga peek_definition<CR>";
        mode = "n";
      }
    ];
    servers = {
      "*" = {
        config = {
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
        config = {
          filetypes = ["md" "markdown"];
        };
      };
      nixd.enable = true;
      ty.enable = true;
      ruff.enable = true;
      rust_analyzer = {
        enable = true;
        config = {
          installRustc = false;
          installCargo = false;
          settings = {
            cargo = {
              features = "all";
            };
            procMacro = {
              ignored = {
                leptos_macro = [
                  "component"
                  "server"
                ];
              };
            };
          };
        };
      };
      statix.enable = true;
      tailwindcss.enable = true;
      ts_ls.enable = true;
      yamlls.enable = true;

      # PHP
      intelephense.enable = true;
      laravel_ls.enable = true;
      phpactor.enable = true;
      phan.enable = true;
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
          leptosfmt.enable = true;
        };
      };
    };
  };
}
