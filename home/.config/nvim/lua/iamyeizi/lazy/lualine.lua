return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                icons_enabled = true,
                component_separators = "|",
                section_separators = "",
            },
            sections = {
                lualine_c = { { "filename", path = 3 } },
            },
        },
    },
}

