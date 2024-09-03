local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

-- Function to create a centered promptbox
function centered_prompt(args)
    args = args or {}
    local prompt = args.prompt or "Run: "
    local promptbox = awful.widget.prompt()

    local popup = awful.popup {
        widget = {
            {
                {
                    promptbox,
                    layout = wibox.layout.fixed.horizontal
                },
                margins = 10,
                widget = wibox.container.margin
            },
            forced_width = 400, -- Adjust as needed
            forced_height = 50, -- Adjust as needed
            widget = wibox.container.background
        },
        border_color = beautiful.border_focus,
        border_width = 2,
        placement = awful.placement.centered,
        shape = gears.shape.rounded_rect,
        visible = false,
        ontop = true
    }

    popup.visible = true
    awful.prompt.run {
        prompt = prompt,
        textbox = promptbox.widget,
        exe_callback = function(input)
            if not input or #input == 0 then return end
            awful.spawn(input)
        end,
        done_callback = function()
            popup.visible = false
        end
    }
end

return centered_prompt
