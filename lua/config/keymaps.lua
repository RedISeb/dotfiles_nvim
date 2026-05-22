-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("n", "<leader>nf", function()
  local filename = vim.fn.input("New file: ")
  if filename ~= "" then
    vim.cmd("edit " .. filename)
  end
end, { desc = "New file" })
