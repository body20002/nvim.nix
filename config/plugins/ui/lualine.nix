_: {
  plugins.lualine = {
    enable = true;
    theme = "gruvbox-material";
    globalstatus = true;
    iconsEnabled = true;
    componentSeparators = { left = "|"; right = "|"; };
    sectionSeparators = { left = ""; right = ""; };
    disabledFiletypes = {
      statusline = [ "NvimTree" "packer" ];
    };
    alwaysDivideMiddle = true;

    sections = {
      lualine_a = [ "mode" ];
      lualine_b = [
        "branch"
        "diff"
        {
          name = "diagnostics";
          extraConfig = {
            sources = [ "nvim_lsp" "coc" ];
            update_in_insert = true;
            always_visible = true;
          };
        }
      ];

      lualine_c = [
        {
          name = "filename";
          extraConfig = {
            file_status = true;
            path = 1;
          };
        }
      ];
      lualine_x = [
        {
          name = ''vim.fn["codeium#GetStatusString"]()'';
          fmt = ''
            function(str)
              local trimmed = str:match("^%s*(.-)%s*$")
              if trimmed == "OFF" then return "󱚡 " end
              if trimmed == "ON" then return "󰚩 " end
              if trimmed == "*" then return "󱚣 " end
              return "󰚩  " .. trimmed
            end
          '';
        }
        "filetype"
      ];
      lualine_y = [ "%p%%" "location" ];
      lualine_z = null;
    };
    inactiveSections = {
      lualine_a = null;
      lualine_b = null;
      lualine_c = [
        {
          name = "filename";
          extraConfig = {
            file_status = true;
            path = 1;
          };
        }
      ];
      lualine_x = [
        "filetype"
      ];
      lualine_y = [ "%p%%" "location" ];
      lualine_z = null;
    };
  };
}
