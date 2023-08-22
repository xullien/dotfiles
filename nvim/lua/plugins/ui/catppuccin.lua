-- colorscheme
"catppuccin/nvim",
name = "catppuccin",
priority = 1000,
return function()
    require("catppuccin").setup({
        name = "catppuccin",
        priority = 1000,
    })
end
