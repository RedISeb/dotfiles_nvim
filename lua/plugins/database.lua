return {
  { "tpope/vim-dadbod", lazy = true },

  {
    "kristijanhusak/vim-dadbod-completion",
    ft = { "sql", "mysql", "plsql" },
  },

  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      "tpope/vim-dadbod",
      "kristijanhusak/vim-dadbod-completion",
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/dadbod_ui"
    end,
    keys = {
      { "<leader>Du", "<cmd>DBUIToggle<cr>", desc = "Toggle DBUI" },
      { "<leader>Da", "<cmd>DBUIAddConnection<cr>", desc = "Add Connection" },
      { "<leader>Df", "<cmd>DBUIFindBuffer<cr>", desc = "Find Buffer" },
      { "<leader>Dr", "<cmd>DBUIRenameBuffer<cr>", desc = "Rename Buffer" },
      { "<leader>Dq", "<cmd>DBUILastQueryInfo<cr>", desc = "Last Query Info" },
    },
  },

  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        per_filetype = {
          sql = { "dadbod", "buffer" },
          mysql = { "dadbod", "buffer" },
          plsql = { "dadbod", "buffer" },
        },
        providers = {
          dadbod = {
            name = "Dadbod",
            module = "vim_dadbod_completion.blink",
          },
        },
      },
    },
  },
}
