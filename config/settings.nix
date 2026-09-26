{
  # Drop Neovim's Ruby/Python/Perl host providers (Perl was already off).
  withRuby = false;
  withPython3 = false;
  withPerl = false;
  # Plugins that shell out to git use the system one; the none-ls gitsigns
  # code-action source still bundles git directly.
  dependencies.git.enable = false;

  diagnostic.settings = {
    virtual_lines = {
      only_current_line = true;
    };
  };
  globals.mapleader = " ";
  # Use Neovim's built-in OSC52 clipboard provider instead of bundling
  # wl-clipboard (and its xdg-utils/perl/glib/systemd chain). Re-enable
  # waylandSupport / clipboard.providers.wl-copy if your terminal lacks OSC52.
  waylandSupport = false;
  clipboard.register = "unnamedplus";
  opts = {
    relativenumber = true;
    number = true;

    # -- Tabs & Spaces;
    expandtab = true;
    tabstop = 2;
    softtabstop = 2;
    shiftwidth = 2;
    smartindent = true;
    autoindent = true;

    # -- Searching;
    ignorecase = true;
    smartcase = true;
    hlsearch = true;
    incsearch = true;

    # -- Column Settings;
    signcolumn = "yes";
    colorcolumn = "120";
    wrap = false;

    # -- Cursor Settings;
    cursorline = true;
    guicursor = "n-v-c-sm:block,ci-ve:ver25,r-cr-o:hor20,i:block-blinkoff1-blinkon1";

    # -- Window Settings;
    splitbelow = true;
    splitright = true;
    lazyredraw = true;
    showtabline = 2;

    # -- Spelling;
    spell = true;
    spelloptions = "camel";

    # -- Other;
    mouse = "a";
    showmode = false;
    termguicolors = true;
    hidden = true;
    formatoptions = "cjql";
    laststatus = 3;
    completeopt = ["menu" "menuone" "preview"];
    conceallevel = 2;
    concealcursor = "";
    # -- updatetime = 100;
    #
    # -- Auto-reload files changed on disk
    autoread = true;

    # -- Backup -- I have power issues :/;
    backup = true;
    backupcopy = "yes";
    swapfile = true;
    # undodir = ''os.getenv("HOME") .. "/.cache/undodir"'';
    undofile = true;

    # -- arabic support;
    encoding = "utf-8";
    termbidi = true;

    # -- local project overrides
    exrc = true;
  };
}
