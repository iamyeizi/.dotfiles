function SetTheme(color)
	color = color or "tokyonight-night"
	vim.cmd.colorscheme(color)

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

return {

    {
        -- "rose-pine/neovim",
        -- name = "rose-pine",
        "folke/tokyonight.nvim",
        name = "tokyonight-night",
        config = function()
            -- require('rose-pine').setup({
            require('tokyonight').setup({
                -- disable_background = true,
                styles = {
                    italic = false,
                },
            })

            vim.cmd("colorscheme tokyonight-night")

            SetTheme()
        end
    },


}
