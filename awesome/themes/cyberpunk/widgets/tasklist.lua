local wibox              = require("wibox")
local gears              = require("gears")
local cairo              = require("lgi").cairo

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

fallback_tasklist_icon   = "/usr/share/icons/Adwaita/scalable/mimetypes/application-x-executable.svg"

tasklist.widget_template = {
    widget = wibox.container.margin,
    margins = 1.5,
    {
        widget = wibox.container.background,
        id     = "background_role",
        {
            widget  = wibox.container.margin,
            margins = 4,
            {
                widget = wibox.widget.imagebox,
                id     = "icon_role",
            },
        },
    },
    create_callback = function(self, c, index, objects) --luacheck: no unused args
        if c and c.valid and not c.icon then
            local s = gears.surface(fallback_tasklist_icon)
            local img = cairo.ImageSurface.create(cairo.Format.ARGB32, s:get_width(), s:get_height())
            local cr = cairo.Context(img)
            cr:set_source_surface(s, 0, 0)
            cr:paint()
            c.icon = img._native
        end
    end
}

return tasklist
