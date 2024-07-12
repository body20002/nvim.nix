{ ... }: {
  globals.mapleader = " ";
  clipboard = {
    providers.wl-copy.enable = true;
    register = "unnamedplus";
  };
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
    completeopt = [ "menu" "menuone" "preview" ];
    conceallevel = 2;
    concealcursor = "";
    # -- updatetime = 100;
    #
    # -- Backup -- I have power issues :/;
    backup = true;
    swapfile = true;
    # undodir = ''os.getenv("HOME") .. "/.cache/undodir"'';
    undofile = true;

    # -- arabic support;
    encoding = "utf-8";
    termbidi = true;
  };
}
