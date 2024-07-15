local wibox              = require("wibox")
local gears              = require("gears")

local tasklist           = {}

tasklist.theme           = {
    bg = "#141414",
    shape = gears.shape.rounded_bar,
}

tasklist.items           = {
    theme  = {
        bg_normal = tasklist.theme.bg,
        bg_focus  = "#dfdfdf",
        shape     = tasklist.theme.shape,
    },
    layout = {
        spacing = 25,
        layout  = wibox.layout.flex.horizontal
    }
}

tasklist.widget_template = {
    widget = wibox.container.margin,
    margins = 1.5,
    {
        widget = wibox.container.background,
        id     = "background_role",
        {
            widget  = wibox.container.margin,
            margins = 3,
            {
                widget = wibox.widget.imagebox,
                id     = "icon_role",
            },
        },
    },
}

return tasklist
