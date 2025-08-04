{pkgs, ...}: {
  plugins = {
    minuet = {
      enable = true;
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
        enable_cmp_source = true;
        workspace_root = {
          use_lsp = true;
        };
        key_bindings = {
          next = "<C-]>";
          prev = "<C-[>";
        };
      };
    };
    avante = {
      enable = true;
      settings = {
        provider = "kimi";
        providers = {
          kimi = {
            __inherited_from = "openai";
            api_key_name = "cmd:cat /run/secrets/api-keys/groq";
            endpoint = "https://api.groq.com/openai/v1/";
            model = "moonshotai/kimi-k2-instruct";
            max_tokens = 4096;
          };
          openrouter-qwen = {
            __inherited_from = "openai";
            endpoint = "https://openrouter.ai/api/v1";
            api_key_name = "cmd:cat /run/secrets/api-keys/openrouter";
            model = "qwen/qwen3-coder:free";
          };
          openrouter-horizon = {
            __inherited_from = "openai";
            endpoint = "https://openrouter.ai/api/v1";
            api_key_name = "cmd:cat /run/secrets/api-keys/openrouter";
            model = "openrouter/horizon-beta";
          };
          openrouter-glm = {
            __inherited_from = "openai";
            endpoint = "https://openrouter.ai/api/v1";
            api_key_name = "cmd:cat /run/secrets/api-keys/openrouter";
            model = "z-ai/glm-4.5-air:free";
          };
        };
      };
    };
  };
}
