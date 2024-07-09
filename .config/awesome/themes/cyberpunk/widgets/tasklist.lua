local tasklist           = {}

local gears              = require("gears")
local wibox              = require("wibox")

tasklist.theme           = {
    bg_normal = "#000000",
    -- fg_normal = "##909090",
    bg_focus  = "#700d0d",
    -- fg_focus  = "#ffffff",
    shape     = gears.shape.rounded_bar,
    tasklist_shape_border_width = 2,
}

tasklist.layout          = {
    spacing = 7,
    layout  = wibox.layout.flex.horizontal
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
