return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-ui-select.nvim" },
        -- Useful for getting pretty icons, but requires a Nerd Font.
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },

    config = function()
        require('telescope').setup({
			defaults = {
                mappings = {
                    i = {
                        ["<C-d>b"] = require("telescope.actions").delete_buffer,
                    },
                },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
            },
        })

        pcall(require("telescope").load_extension, "ui-select")

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>pw', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>pW', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
        vim.keymap.set("n", "<leader>sk", builtin.keymaps, {})
        vim.keymap.set("n", "<leader>lg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader><leader>", builtin.buffers, {})
    end
}

