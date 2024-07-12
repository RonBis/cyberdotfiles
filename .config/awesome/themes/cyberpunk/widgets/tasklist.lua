local tasklist           = {}

local gears              = require("gears")
local wibox              = require("wibox")

tasklist.items           = {
    theme  = {
        bg_normal          = "#00000000",
        bg_focus           = "#00000000",
    },
    layout = {
        spacing = 25,
        layout  = wibox.layout.flex.horizontal
    }
}

tasklist.widget_template = {
    {
        widget  = wibox.container.margin,
        margins = 3,
        {
            widget = wibox.widget.imagebox,
            id     = "icon_role",
        },
    },
    widget = wibox.container.background,
    id     = "background_role",
}

return tasklist
