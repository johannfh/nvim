---All user settings, accessible via `vim.g.settings`.
---For defaults, refer to `lua/core/options.lua`.
---@class Settings
---@field wakatime WakatimeSettings
---
---Settings for the Wakatime plugin.
---@class WakatimeSettings
---@field enabled boolean

local function load_settings_override()
    local base_cfg_path = vim.fn.stdpath('config') .. "/.nvim-settings.lua"

    local success, settings = pcall(dofile, base_cfg_path)

    if success then
        return settings
    else
        return nil
    end
end

-- Load user settings override, if available
local settings_override = load_settings_override() or {}

-- Load default settings and merge with overrides, giving precedence to overrides
-- This ensures that any settings not specified in the override file will fall back to defaults,
-- preventing any possible nil access errors.
local default_settings = require("core.options")
local settings = vim.tbl_deep_extend("force", default_settings, settings_override)

---@type Settings
vim.g.settings = settings

require("johannfh")
