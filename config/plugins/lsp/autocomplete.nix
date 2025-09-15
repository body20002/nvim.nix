{lib, ...}: {
  plugins = {
    friendly-snippets.enable = true;
    blink-compat.enable = true;
    blink-cmp = {
      enable = true;
      settings = {
        enabled = lib.nixvim.mkRaw ''
          function()
            return not vim.tbl_contains({ "NvimTree" "DressingInput" }, vim.bo.filetype)
              and vim.bo.buftype ~= "prompt"
              and vim.b.completion ~= false
          end
        '';
        keymap = {
          preset = "none";
          "<C-space>" = ["show" "show_documentation" "hide_documentation"];
          "<C-e>" = ["hide" "fallback"];
          "<Tab>" = [
            {
              __raw = ''
                function(_)
                  if require('minuet.virtualtext').action.is_visible() then
                    vim.defer_fn(require('minuet.virtualtext').action.accept, 30)
                    return true
                  end
                end
              '';
            }
            "select_next"
            "snippet_forward"
            "fallback"
          ];
          "<S-Tab>" = ["select_prev" "snippet_backward" "fallback"];
          "<Up>" = ["select_prev" "fallback"];
          "<Down>" = ["select_next" "fallback"];
          "<CR>" = ["select_and_accept" "fallback"];
          # "<Space>" = ["accept" "fallback"];
          # not sure about those
          # "(" = ["accept" "fallback"];
          # ")" = ["accept" "fallback"];
        };
        appearance.use_nvim_cmp_as_default = true;
        signature.enabled = false;
        sources = {
          default = [
            "lsp"
            "path"
            "snippets"
            "codeium"
            "minuet"
            "avante_commands"
            "avante_mentions"
            "avante_files"
          ];
          providers = {
            codeium = {
              name = "Codeium";
              module = "codeium.blink";
              score_offset = 8;
              enabled = true;
              async = true;
              timeout_ms = 10000; # 10 secs;
            };
            avante_commands = {
              name = "avante_commands";
              module = "blink.compat.source";
              score_offset = 90;
              opts = {};
            };
            avante_files = {
              name = "avante_commands";
              module = "blink.compat.source";
              score_offset = 100;
              opts = {};
            };
            avante_mentions = {
              name = "avante_mentions";
              module = "blink.compat.source";
              score_offset = 1000;
              opts = {};
            };
            minuet = {
              name = "minuet";
              module = "minuet.blink";
              score_offset = 8;
              enabled = true;
              async = true;
              timeout_ms = 10000; # 10 secs;
            };
          };
        };
        completion = {
          ghost_text = {
            enabled = true;
            show_with_selection = true;
            show_without_selection = false;
          };
          menu.auto_show = {
            __raw = ''function(ctx) return ctx.mode ~= 'cmdline' end'';
          };
          trigger = {
            show_on_keyword = true;
            show_on_trigger_character = true;
            show_on_accept_on_trigger_character = true;
          };
          list.selection = {
            preselect = true;
            auto_insert = false;
          };
        };
      };
    };
  };
}
