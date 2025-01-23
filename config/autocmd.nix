{...}: {
  autoGroups = {
    groff.clear = true;
    highlightYank.clear = true;
    centerScreen.clear = true;
    openMediaFiles.clear = true;
    saveFolds.clear = true;
  };

  autoCmd = [
    {
      event = ["BufWritePost"];
      command = "silent !pdfroff -ms % -e -t -p > %:r.pdf";
      pattern = "*.ms";
      group = "groff";
    }
    {
      event = ["TextYankPost"];
      callback = {
        __raw = ''
          function()
              vim.highlight.on_yank({higroup = "Visual", timeout = 300})
            end
        '';
        group = "highlightYank";
      };
    }
    {
      event = ["InsertEnter"];
      command = "norm zz";
      pattern = "*";
      group = "centerScreen";
    }
    {
      event = ["BufReadPost"];
      pattern = "*.pdf";
      callback = {
        __raw = ''
          function()
            local command
            if pcall(os.getenv, "PDFVIWER") then
              command = os.getenv("PDFVIWER")
            else
              command = os.getenv("BROWSER")
            end
            vim.fn.jobstart(string.format("%s '%s'", command, vim.fn.expand("%")), {detach = true})
            vim.api.nvim_buf_delete(0, {})
          end
        '';
      };
      group = "openMediaFiles";
    }
    {
      event = ["BufReadPost"];
      pattern = ["*.png" "*.webp" "*.jpg" "*.jpeg" "*.mp4"];
      callback = {
        __raw = ''
          function()
            local command = os.getenv("BROWSER")
            vim.fn.jobstart(string.format("%s '%s'", command, vim.fn.expand("%")), {detach = true})
            vim.api.nvim_buf_delete(0, {})
          end
        '';
      };
      group = "openMediaFiles";
    }
    {
      event = ["BufWritePost"];
      pattern = "?*";
      command = "silent mkview";
      group = "saveFolds";
    }
    {
      event = ["BufReadPost"];
      pattern = "?*";
      command = "silent! loadview";
      group = "saveFolds";
    }
  ];
}
