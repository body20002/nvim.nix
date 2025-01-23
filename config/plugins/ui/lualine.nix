{
  plugins.lualine = {
    enable = true;
    settings = {
      inactive_sections = {
        lualine_a = null;
        lualine_b = null;
        lualine_c = [
          {
            __unkeyed-1 = "filename";
            file_status = true;
            path = 1;
          }
        ];
        lualine_x = null;
        lualine_y = [
          "filetype"
        ];
        lualine_z = ["%p%%" "location"];
      };
      sections = {
        lualine_a = ["mode"];
        lualine_b = [
          "branch"
          "diff"
          {
            __unkeyed-1 = "diagnostics";
            sources = ["nvim_lsp" "coc"];
            update_in_insert = true;
            always_visible = true;
          }
        ];
        lualine_c = [
          {
            __unkeyed-1 = "filename";
            file_status = true;
            path = 1;
          }
        ];
        lualine_x = [
          {
            __unkeyed-1 = ''vim.fn["codeium#GetStatusString"]()'';
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
        ];
        lualine_y = ["filetype"];
        lualine_z = ["%p%%" "location"];
      };
      options = {
        always_divide_middle = true;
        component_separators = {
          left = "|";
          right = "|";
        };
        disabled_filetypes = {
          statusline = ["NvimTree"];
        };
        globalstatus = true;
        icons_enabled = true;
        section_separators = {
          left = "";
          right = "";
        };
        theme = "gruvbox-material";
      };
    };
  };
}
