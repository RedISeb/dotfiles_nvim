return {
  {
    "esensar/nvim-dev-container",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = { "DevcontainerStart", "DevcontainerAttach", "DevcontainerStop", "DevcontainerBuild", "DevcontainerLogs" },
    opts = {},
    keys = {
      { "<leader>cds", "<cmd>DevcontainerStart<cr>", desc = "Devcontainer Start" },
      { "<leader>cda", "<cmd>DevcontainerAttach<cr>", desc = "Devcontainer Attach" },
      { "<leader>cdx", "<cmd>DevcontainerStop<cr>", desc = "Devcontainer Stop" },
      { "<leader>cdb", "<cmd>DevcontainerBuild<cr>", desc = "Devcontainer Build" },
      { "<leader>cdl", "<cmd>DevcontainerLogs<cr>", desc = "Devcontainer Logs" },
    },
  },
}
