return {
    "tpope/vim-fugitive",
    config = function()
        -- Git Status
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

        local Fugitive = vim.api.nvim_create_augroup("Fugitive", {})

        local autocmd = vim.api.nvim_create_autocmd
        autocmd("BufWinEnter", {
            group = Fugitive,
            pattern = "*",
            callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                -- Git Push
                local bufnr = vim.api.nvim_get_current_buf()
                local opts = { buffer = bufnr, remap = false }
                vim.keymap.set("n", "<leader>p", function()
                    vim.cmd.Git('push')
                end, opts)

                -- NOTE: Should use when collaborating with others on the same branch
                -- Git Pull Rebase
                vim.keymap.set("n", "<leader>P", function()
                    vim.cmd.Git({ 'pull', '--rebase' })
                end, opts)

                -- NOTE: It allows me to easily set the branch i am pushing and any tracking
                -- needed if i did not set the branch up correctly
                -- Git Push set origin
                vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
            end,
        })

        -- Left diff
        vim.keymap.set("n", "gf", "<cmd>diffget //2<CR>")
        -- Right diff
        vim.keymap.set("n", "gj", "<cmd>diffget //3<CR>")
    end
}
