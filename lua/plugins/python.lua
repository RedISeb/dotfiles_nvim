return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "ty" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = { enabled = false },
        ty = {},
      },
    },
  },
}
