{
  plugins = {
    coq-nvim = {
      enable = true;
      installArtifacts = true;
      settings = {
        auto_start = "shut-up";

        clients = {
          third_party.enabled = true;
          registers.enabled = false;
          buffers.enabled = false;
          tmux.enabled = false;
        };

        display = {
          icons = {mode = "long";};
          preview = {resolve_timeout = 10;};
        };

        match = {max_results = 50;};
        limits.completion_manual_timeout = 5;
        keymap = {
          recommended = false;
          jump_to_mark = "<C-n>";
        };
      };
    };

    coq-thirdparty = {
      enable = true;
      sources = [
        {
          src = "codeium";
          short_name = "COD";
        }
      ];
    };

    windsurf-nvim.enable = true;
  };
}
