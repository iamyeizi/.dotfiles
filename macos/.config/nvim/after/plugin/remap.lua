-- Telescope
--
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Search Git Files" })
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > "), find_command = { "rg", "--hidden", "-g" } })
end)
vim.keymap.set("n", "<leader>sf", function()
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
vim.keymap.set("v", "K", ":m '<-1<CR>gv=gv")

-- Page down and center screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- Page up and center screen
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Ctrol+C to Escape key in INSERT Mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Joins the current line with the line below it,
-- while preserving the cursor position using marks
vim.keymap.set("n", "J", "mzJz")
