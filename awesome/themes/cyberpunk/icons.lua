local icons = {}

local gfs = require("gears.filesystem")

---@type string
local icon_dir = gfs.get_configuration_dir() .. "icons/"

-- sound
icons.sound = {
    mute  = icon_dir .. "sound/streamline:volume-mute-solid.svg",
    low   = icon_dir .. "sound/streamline:volume-level-off-solid.svg",
    mid   = icon_dir .. "sound/streamline:volume-level-low-solid.svg",
    high  = icon_dir .. "sound/streamline:volume-level-high-solid.svg",
    maxed = icon_dir .. "sound/streamline:annoncement-megaphone-solid.svg"
}

-- brightness
icons.brightness = {
    low   = icon_dir .. "brightness/streamline:brightness-1-solid.svg",
    mid   = icon_dir .. "brightness/streamline:brightness-2-solid.svg",
    high  = icon_dir .. "brightness/streamline:brightness-3-solid.svg",
    maxed = icon_dir .. "brightness/streamline:brightness-max.svg",
}

return icons
