--- @class Settings
--- @field wakatime WakatimeConfig|nil

--- @class WakatimeConfig
--- @field enabled boolean|nil

---@return Settings|nil
local function load_settings()
    local success, settings = pcall(require, "settings")
    if success then
        return settings
    else
        return nil
    end
end

local settings = load_settings() or {}

vim.g.settings = settings

require("johannfh")
