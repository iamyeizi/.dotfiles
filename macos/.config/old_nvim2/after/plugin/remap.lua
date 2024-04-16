-- Telescope
--
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Search Git Files" })
vim.keymap.set("n", "<leader>pw", function()
	local word = vim.fn.expand("<cword>")
	builtin.grep_string({ search = word })
end)
vim.keymap.set("n", "<leader>pW", function()
	local word = vim.fn.expand("<cWORD>")
	builtin.grep_string({ search = word })
end)
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({
		search = vim.fn.input("Grep > "),
	})
end)
vim.keymap.set("n", "<leader>pf", function()
	builtin.find_files({ find_command = { "rg", "--files", "--hidden", "-g", "!.git" } })
end)

-- Invoke Netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Tmux Sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Moves to the next item in the quickfix list
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- Moves to the previous item in the quickfix list
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Moves to the next item in the location list
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- Moves to the previous item in the location list
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Move current line or block one line down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- Move current line or block two line up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Page down and center screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- Page up and center screen
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Ctrol+C to Escape key in INSERT Mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Joins the current line with the line below it,
-- while preserving the cursor position using marks
vim.keymap.set("n", "J", "mzJz")

-- Center screen while finding highlight
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Delete without save prev string
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Use SEG to rename all ocurrences of current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Clean Quickfix
vim.keymap.set("n", "Qc", "<cmd>cexpr []<CR>")

-- Toggle Quickfix
vim.keymap.set("n", "q", function()
	local qf_exists = false
	for _, win in pairs(vim.fn.getwininfo()) do
		if win["quickfix"] == 1 then
			qf_exists = true
		end
	end
	if qf_exists == true then
		vim.cmd("cclose")
		return
	end
	if not vim.tbl_isempty(vim.fn.getqflist()) then
		vim.cmd("copen")
	end
end)

-- Toggle Diagnostics
vim.g.diagnostics_visible = true
function _G.toggle_diagnostics()
	if vim.g.diagnostics_visible then
		vim.g.diagnostics_visible = false
		vim.diagnostic.disable()
	else
		vim.g.diagnostics_visible = true
		vim.diagnostic.enable()
	end
end
vim.keymap.set("n", "<leader>t", ":call v:lua.toggle_diagnostics()<CR>", { silent = true, noremap = true })
