local awful      = require("awful")
local gears      = require("gears")
local wibox      = require("wibox")
local logger     = require("util.logger")
local icons      = require("themes.cyberpunk.icons")
local volume_bar = require("themes.cyberpunk.widgets.dynamic_bar.volume_bar")

require("services.audio")

function dynamic_bar(tasklist)
    local bar = wibox.widget {
        id = "tasklist",
        tasklist,
        layout = wibox.layout.stack
    }

    local reset_dynamic_bar_timeout_timer = gears.timer {
        timeout = 1,
        single_shot = true,
        callback = function()
            bar:set(1, tasklist)
            logger.write("dynamic bar reset")
        end
    }

    -- {{{ Handle signals
    -- Brightness control
    awesome.connect_signal("brightness::decrease", function()
        awful.spawn("brightnessctl set 12.75-")
    end)

    awesome.connect_signal("brightness::increase", function()
        awful.spawn("brightnessctl set +12.75")
    end)

    -- Audio volume control
    -- local volume_level = AudioState.volume

    awesome.connect_signal("volume::decrease", function()
        if AudioState.volume == 0 then
            bar:set(1, volume_bar.widget)
            reset_dynamic_bar_timeout_timer:again()
            return
        end
        AudioState.decrease_volume(function()
            volume_bar.widget:set_icon(AudioState.volume, AudioState.muted)
            bar:set(1, volume_bar.widget)

            -- volume_level = volume_level - 2
            volume_bar.anims.volume_down(AudioState.volume, AudioState.volume - 2)

            reset_dynamic_bar_timeout_timer:again()
        end)
    end)

    awesome.connect_signal("volume::increase", function()
        if AudioState.volume >= 100 then
            bar:set(1, volume_bar.widget)
            reset_dynamic_bar_timeout_timer:again()
            return
        end
        AudioState.increase_volume(function()
            volume_bar.widget:set_icon(AudioState.volume, AudioState.muted)
            bar:set(1, volume_bar.widget)

            -- volume_level = volume_level + 2
            volume_bar.anims.volume_up(AudioState.volume - 2, AudioState.volume)

            reset_dynamic_bar_timeout_timer:again()
        end)
    end)

    awesome.connect_signal("volume::togglemute", function()
        AudioState.toggle_mute(function()
            volume_bar.widget:set_icon(AudioState.volume, AudioState.muted)
            bar:set(1, volume_bar.widget)
            reset_dynamic_bar_timeout_timer:again()
        end)
    end)
    -- }}}

    return bar
end

return dynamic_bar
