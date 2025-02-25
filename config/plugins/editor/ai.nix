{pkgs, ...}: {
  extraPlugins = [pkgs.vimPlugins.minuet-ai-nvim];
  extraConfigLua = ''
    require('minuet').setup {
      provider = 'openai_fim_compatible',
      n_completions = 5, -- recommend for local model for resource saving
      -- I recommend beginning with a small context window size and incrementally
      -- expanding it, depending on your local computing power. A context window
      -- of 512, serves as an good starting point to estimate your computing
      -- power. Once you have a reliable estimate of your local computing power,
      -- you should adjust the context window to a larger value.
      context_window = 8192,
      throttle = 1500,
      debounce = 500,
      virtualtext = {
        auto_trigger_ft = {"*"},
        auto_trigger_ignore_ft = {"NvimTree"},
        keymap = {
          next= "<C-]>";
          prev= "<C-[>";
        };
      },
      add_single_line_entry = false,
      provider_options = {
        openai_fim_compatible = {
          api_key = 'TERM',
          name = 'qwen2.5-coder',
          end_point = 'http://localhost:11434/v1/completions',
          model = 'qwen2.5-coder:3b-base',
          optional = {
            max_tokens = 1024,
            top_p = 0.9,
          },
        },
      },
    }
  '';

  plugins = {
    avante = {
      enable = true;
      settings = {
        provider = "llama33";
        vendors = {
          llama33 = {
            __inherited_from = "openai";
            api_key_name = "cmd:cat /run/secrets/api-keys/groq";
            endpoint = "https://api.groq.com/openai/v1/";
            model = "llama-3.3-70b-versatile";
            max_tokens = 8192;
          };
        };
      };
    };
  };
}
