return {
  "ibhagwan/fzf-lua",
  dependencies = { "echasnovski/mini.icons" },
  opts = {},
  keys = {
    { 
      "<leader>ff", 
      function() require('fzf-lua').files() end, 
      desc = "Fuzzy find files in project directory" 
    },
    {
      "<leader>fg",
      function() require('fzf-lua').live_grep() end,
      desc = "Find by grepping project directory"
    },
    {
      "<leader>fb",
      function() require('fzf-lua').git_branches() end,
      desc = "Find git branches in project directory"
    },
    {
      "<leader>fa",
      function() require('fzf-lua').builtin() end,
      desc = "Show all fzf builtin finders"
    },
    {
      "<leader>fw",
      function() require('fzf-lua').grep_cword() end,
      desc = "Find current word"
    },
    {
      "<leader>fW",
      function() require('fzf-lua').grep_cWORD() end,
      desc = "Find current WORD" 
    },
    {
      "<leader>/",
      function() require('fzf-lua').lgrep_curbuf() end,
      desc = "[/] Live grep current buffer" 
    },
  }
}
