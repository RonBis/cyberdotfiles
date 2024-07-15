local awful = require("awful")
local gears = require("gears")
local naughty = require("naughty")
local wibox = require("wibox")

local dconf = require("util.helper.dconf")

wallpaper_grid = wibox.widget {
    layout          = wibox.layout.grid,
    homogeneous     = true,
    forced_num_cols = 4,
    spacing         = 15,
}

wallpaper_switcher = awful.popup {
    widget       = wallpaper_grid,
    border_color = "#ababab",
    border_width = 1.5,
    ontop        = true,
    placement    = awful.placement.centered,
    shape        = gears.shape.rounded_rect,
    visible      = false,
}

-- set wallpaper
-- gears.wallpaper.maximised()

wallpaper_switcher:connect_signal("property::visible", function(c)
    if (not c.visible) then
        wallpaper_grid:reset()
    else
        -- fetch wallpapers and append to wallpaper_grid
        local wps = dconf.list_wallpapers()
        for _, wp in pairs(wps) do
            wallpaper_grid:add(
                wibox.widget {
                    key           = "mywp",
                    widget        = wibox.widget.imagebox,
                    image         = wp,
                    resize        = true,
                    forced_height = 120,
                    forced_width  = 160,
                }
            )
        end
    end
end)

return wallpaper_switcher
