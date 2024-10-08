local wibox     = require("wibox")
local theme     = require("theme")
local gears     = require("gears")
local icons     = require("themes.cyberpunk.icons")
local animation = require("themes.cyberpunk.animation")
local logger    = require("util.logger")

local function foreground_white(svg_path)
    return gears.color.recolor_image(svg_path, theme.fg_focus)
end

local forced_height = theme.wibar_height - 15.5

local volume_bar = {}

volume_bar.widget = wibox.widget {
    widget = wibox.container.margin,
    left = 8,
    right = 10,
    {
        widget = wibox.container.place,
        valign = "center",
        {
            layout = wibox.layout.fixed.horizontal,
            spacing = 8,
            {
                widget = wibox.widget.imagebox,
                id = "icon",
                image = foreground_white(icons.sound.low),
                forced_width = forced_height,
                forced_height = forced_height,
            },
            {
                widget = wibox.container.place,
                halign = "center",
                {
                    widget = wibox.widget.progressbar,
                    id = "progressbar",
                    value = 1,
                    max_value = 0,
                    background_color = theme.fg_focus .. "aa",
                    shape = gears.shape.rounded_rect,
                    forced_width = 10,
                    forced_height = 4,
                },
            }
        }
    }
}

local audio_icons = {
    icons.sound.mute,
    icons.sound.low,
    icons.sound.mid,
    icons.sound.high,
    icons.sound.maxed
}

function volume_bar.widget:set_icon(volume, muted)
    -- logger.write(tostring(volume).." "..tostring(muted))
    local icon = get_audiolevel_from_volume(volume, muted)
    -- logger.write(icon)
    self:get_children_by_id("icon")[1].image = foreground_white(audio_icons[icon])
end

-- {{{ Animations
volume_bar.anims = {
    volume_up = function(from, to)
        if to == nil then to = from + 2 end
        local anim = animation.base(0, 0.007)
        anim.pos = from
        anim:subscribe(function(pos)
            volume_bar.widget:get_children_by_id("progressbar")[1].forced_width = pos
        end)
        anim.target = to
    end,
    volume_down = function(from, to)
        if to == nil then to = from + 2 end
        local anim = animation.base(0, 0.007)
        anim.pos = from
        anim:subscribe(function(pos)
            volume_bar.widget:get_children_by_id("progressbar")[1].forced_width = pos
        end)
        anim.target = to
    end
}
-- }}}

return volume_bar
