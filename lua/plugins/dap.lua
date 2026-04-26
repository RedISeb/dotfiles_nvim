return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{ "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
			"mfussenegger/nvim-dap-python",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup()

			dap.listeners.after.event_initialized["dapui_config"] = dapui.open
			dap.listeners.before.event_terminated["dapui_config"] = dapui.close
			dap.listeners.before.event_exited["dapui_config"] = dapui.close

			-- Python
			require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")

			-- Keymaps
			local map = function(keys, func, desc)
				vim.keymap.set("n", keys, func, { desc = "Debug: " .. desc })
			end

			map("<leader>dc", dap.continue, "Continue")
			map("<leader>di", dap.step_into, "Step Into")
			map("<leader>dn", dap.step_over, "Step Over")
			map("<leader>do", dap.step_out, "Step Out")
			map("<leader>db", dap.toggle_breakpoint, "Toggle Breakpoint")
			map("<leader>dB", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, "Conditional Breakpoint")
			map("<leader>dr", dap.repl.open, "Open REPL")
			map("<leader>du", dapui.toggle, "Toggle UI")
			map("<leader>dx", dap.terminate, "Terminate")
		end,
	},
}
