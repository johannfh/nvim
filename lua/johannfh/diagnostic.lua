-- Configure Diagnostic Config
-- NOTE: This is necessary since Neovim >=0.11 to enable virtual text.
vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = false,
})

-- Used to toggle between:
-- * Virtual Text (default)
-- * Virtual Lines
local function toggle_diagnostic_display()
    local current_config = vim.diagnostic.config()

    ---@diagnostic disable-next-line: need-check-nil
    local vt = current_config.virtual_text

    ---@diagnostic disable-next-line: need-check-nil
    local vl = current_config.virtual_lines

    if vt == true and vl == false then
        vim.diagnostic.config({
            virtual_text = false,
            virtual_lines = true,
        })
        print("Diagnostic: Switched to `virtual_lines`")
    else
        vim.diagnostic.config({
            virtual_text = true,
            virtual_lines = false,
        })
        print("Diagnostic: Switched to `virtual_text`")
    end
end

local M = {}

M.toggle_diagnostic_display = toggle_diagnostic_display

return M
