{ pkgs, inputs, ... }: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "Decisive";
      src = inputs.decisive;
    })
  ];

  keymaps = [
    {
      key = "<leader>cca";
      action = ":lua require('decisive').align_csv({})<cr>";
      options = { silent = true; };
    }
    {
      key = "<leader>ccA";
      action = ":lua require('decisive').align_csv_clear({})<cr>";
      options = { silent = true; };
    }
    {
      key = "[c";
      action = ":lua require('decisive').align_csv_prev_col()<cr>";
      options = { silent = true; };
    }
    {
      key = "]c";
      action = ":lua require('decisive').align_csv_next_col()<cr>";
      options = { silent = true; };
    }
  ];
}
