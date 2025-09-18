local enabled = vim.g.settings.wakatime and vim.g.settings.wakatime.enabled

return {
    "wakatime/vim-wakatime",
    lazy = false,
    enabled = enabled,
}
