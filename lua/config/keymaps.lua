vim.keymap.set("n", "-", "<cmd> Oil --float<CR>", { desc = "Open Parent Directory in Oil" })
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "gl", function()
	vim.diagnostic.open_float()
end, { desc = "Open Diagnostics" })
vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({
		lsp_format = "fallback",
	})
end, { desc = "Format current file" })
vim.keymap.set("n", "<leader>tt", "<cmd> NvimTreeToggle<CR>", { desc = "Toggle Nvim-Tree" })
