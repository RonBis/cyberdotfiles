local wibox = require("wibox")
local cairo = require("lgi").cairo
local gears = require("gears")

local function glowtext(text, font, normal_color, glow_color)
    local textbox = wibox.widget.textbox()
    textbox.font = font
    textbox.markup = string.format('<span color="%s">%s</span>', normal_color, text)

    local glowing_text = wibox.widget {
        {
            textbox,
            widget = wibox.container.background
        },
        widget = wibox.container.background,
        shape = gears.shape.rectangle,
    }

    function glowing_text.draw(self, context, cr, width, height)
        -- Draw the glow
        cr:set_operator(cairo.Operator.OVER)
        cr:set_source(gears.color(glow_color))
        
        for i = 1, 5 do
            cr:move_to(i, height/2)
            cr:show_text(text)
            cr:move_to(-i, height/2)
            cr:show_text(text)
            cr:move_to(0, height/2 + i)
            cr:show_text(text)
            cr:move_to(0, height/2 - i)
            cr:show_text(text)
        end

        -- Draw the main text
        -- cr:set_source(gears.color(normal_color))
        -- cr:move_to(0, height/2)
        -- cr:show_text(text)
    end

    return glowing_text
end

return glowtext
