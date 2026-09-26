{pkgs, ...}: {
  # windsurf.nvim ships its own pinned codeium language server (1.20.9), so
  # opt out of nixvim's default codeium dependency to avoid a second copy
  # (pkgs.codeium 2.12.5, ~169M).
  dependencies.codeium.enable = false;

  # windsurf only uses util-linux for flock/setsid/script; the minimal build
  # keeps those and drops the rest of the suite.
  dependencies.util-linux.package = pkgs.util-linuxMinimal;

  plugins = {
    minuet = {
      enable = false;
      settings = {
        provider = "openai_fim_compatible";
        n_completions = 3;
        context_window = 8192;
        throttle = 800;
        debounce = 300;
        virtualtext = {
          auto_trigger_ft = ["*"];
          auto_trigger_ignore_ft = ["NvimTree" "DressingInput"];
          keymap = {
            next = "<C-]>";
            prev = "<C-[>";
          };
        };
        notify = false;
        add_single_line_entry = false;
        provider_options = {
          openai_fim_compatible = {
            api_key = "TERM";
            name = "qwen2.5-coder";
            end_point = "http://localhost:11434/v1/completions";
            model = "qwen2.5-coder:3b-base";
            optional = {
              max_tokens = 256;
              top_p = 0.9;
              stop = ["<|endoftext|>"];
            };
          };
        };
      };
    };
    windsurf-nvim = {
      enable = true;
      settings = {
        # blink-cmp uses codeium.blink directly; don't register an nvim-cmp source.
        enable_cmp_source = false;
        workspace_root = {
          use_lsp = true;
        };
        key_bindings = {
          next = "<C-]>";
          prev = "<C-[>";
        };
      };
    };
  };
}
