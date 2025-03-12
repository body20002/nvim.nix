{pkgs, ...}: {
  extraPlugins = [pkgs.vimPlugins.minuet-ai-nvim];
  extraConfigLua = ''
    require('minuet').setup {
      provider = 'openai_fim_compatible',
      n_completions = 3,
      context_window = 8192,
      throttle = 800,
      debounce = 300,
      virtualtext = {
        auto_trigger_ft = {"*"},
        auto_trigger_ignore_ft = {"NvimTree", "DressingInput"},
        keymap = {
          next= "<C-]>";
          prev= "<C-[>";
        };
      },
      notify=false,
      add_single_line_entry = false,
      provider_options = {
        openai_fim_compatible = {
          api_key = 'TERM',
          name = 'qwen2.5-coder',
          end_point = 'http://localhost:11434/v1/completions',
          model = 'qwen2.5-coder:3b-base',
          optional = {
            max_tokens = 256,
            top_p = 0.9,
            stop = { '<|endoftext|>' },
          },
        },
      },
    }
  '';

  plugins = {
    avante = {
      enable = true;
      settings = {
        provider = "qwq";
        vendors = {
          qwq = {
            __inherited_from = "openai";
            api_key_name = "cmd:cat /run/secrets/api-keys/groq";
            endpoint = "https://api.groq.com/openai/v1/";
            model = "qwen-qwq-32b";
            max_tokens = 8192;
            temperature=0.6;
          };
          "qwen2.5-coder" = {
            __inherited_from = "openai";
            api_key_name = "";
            endpoint = "http://127.0.0.1:11434/v1";
            model = "qwen2.5-coder:3b";
            max_tokens = 8192;
          };
        };
      };
    };
  };
}
