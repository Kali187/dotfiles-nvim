return {
  "goolord/alpha-nvim",
  opts = function(_, opts) -- override the options using lazy.nvim
    opts.section.header.val = { -- change the header section value
      "▐▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▌",
      "▐  db   dD  .d8b.  db      d888888b       db .d888b. d88888D  ▌",
      "▐  88 ,8P' d8' `8b 88        `88'        o88 88   8D VP  d8'  ▌",
      "▐  88,8P   88ooo88 88         88          88 `VoooY'    d8'   ▌",
      "▐  88`8b   88~~~88 88         88          88 .d~~~b.   d8'    ▌",
      "▐  88 `88. 88   88 88booo.   .88.         88 88   8D  d8'     ▌",
      "▐  YP   YD YP   YP Y88888P Y888888P       VP `Y888P' d8'      ▌",
      "▐▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▌",
    }

    opts.section.buttons.val = {
      opts.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
      opts.button("f", "  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
      opts.button("p", "  > Projects", ":ProjectMgr<CR>"),
      opts.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
      opts.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
      opts.button("q", "  > Quit NVIM", ":qa<CR>"),
    }
  end,
}
