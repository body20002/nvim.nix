_: let
  options = {
    noremap = true;
    silent = true;
  };
in {
  plugins.ts-context-commentstring.enable = true;

  plugins.comment = {
    enable = true;
    settings = {
      pre_hook = ''
        require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
      '';
    };
  };

  keymaps = [
    {
      inherit options;
      key = "<C-_>";
      action = ''<CMD>lua require("Comment.api").toggle.linewise.current()<CR>'';
    }
    {
      inherit options;
      key = "<C-_>";
      action = ''<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>'';
      mode = "x";
    }
    {
      inherit options;
      key = "<C-_>";
      action = ''<CMD>lua require("Comment.api").toggle.linewise.current()<CR>'';
      mode = "i";
    }
    {
      inherit options;
      key = "<C-/>";
      action = ''<CMD>lua require("Comment.api").toggle.linewise.current()<CR>'';
    }
    {
      inherit options;
      key = "<C-/>";
      action = ''<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>'';
      mode = "x";
    }
    {
      inherit options;
      key = "<C-/>";
      action = ''<CMD>lua require("Comment.api").toggle.linewise.current()<CR>'';
      mode = "i";
    }
  ];
}
