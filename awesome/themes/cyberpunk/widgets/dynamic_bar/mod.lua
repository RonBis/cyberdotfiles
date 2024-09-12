local awful          = require("awful")
local gears          = require("gears")
local wibox          = require("wibox")
local rubato         = require("rubato")
local tasklist_theme = require("themes.cyberpunk.widgets.tasklist").theme
local volume_bar     = require("themes.cyberpunk.widgets.dynamic_bar.volume_bar")
local animation      = require("themes.cyberpunk.animation")
local theme          = require("theme")


local Content = {
    Tasklist = 1,
    VolumeBar = 2,
    BrightnessBar = 3,
}

local dynamic_bar_anim = {
    ---animate width
    ---@param from number
    ---@param to number
    width = function(anime_bar, from, to)
        local anim = animation.base(nil, 0, 0.4)
        anim.pos = from
        anim:subscribe(function(pos)
            anime_bar.forced_width = pos
        end)
        anim.target = to
    end,
    opacity = function(anime_bar, from, to)
        local anim = animation.base(rubato.quadratic, 0, 0.2)
        anim.pos = from
        anim:subscribe(function(pos)
            anime_bar.opacity = pos
        end)
        anim.target = to
    end
}


--- All dynamic_bar widgets must have an uniquely identifiable `_dynamic_bar_id` (used for internal state management).
--- See volume_bar.widget for reference.
function dynamic_bar(tasklist)
    -- Setup Widgets
    local anime_bar = wibox.widget {
        widget        = wibox.container.background,
        bg            = tasklist_theme.bg,
        forced_height = theme.wibar_height
    }
    local bar = wibox.widget {
        -- anime_bar,
        tasklist,
        layout = wibox.layout.stack
    }

    -- State Management
    local state = {
        -- dynamic content stack
        dynamic_content = List.new(), -- Initialize
        set_dynamic_content = function(self, widget, content)
            if self.dynamic_content == content then
                return --skip setting new content
            end
            List.pushright(self.dynamic_content, content)
            self.animate_next = true
            bar:set(1, widget)
        end,
        animate_next = false
    }

    -- Initialize Dynamic Bar State
    List.pushright(state.dynamic_content, Content.Tasklist)

    -- noice animations!!! (TODO)
    -- steps:
    -- 1. quickly animate opacity of tasklist to zero
    -- 2. change width of anime_bar
    -- 3. show dynamic_bar_content
    function bar:before_draw_children(_, _, w, _)
        if state.animate_next then
            -- step 1
            dynamic_bar_anim.opacity(state.dynamic_content[state.dynamic_content.last - 1], 1, 0)
            -- logger.write("before => " .. tostring(bar._w) .. " after => " .. tostring(w))
            dynamic_bar_anim.width(anime_bar, bar._w, w)
            -- dynamic_bar_anim.opacity(tasklist, 0, 1)
        end
        bar._w = w
    end

    function bar:after_draw_children(_, _, _, _)
        state.animate_next = false
    end

    -- bar:connect_signal("widget::layout_changed", function(x)
    --     for key, value in pairs(x) do
    --         logger.write("\t"..key.." - "..tostring(value))
    --     end
    -- end)

    local reset_dynamic_bar_timeout_timer = gears.timer {
        timeout = 2,
        single_shot = true,
        callback = function()
            state:set_dynamic_content(tasklist, Content.Tasklist)
        end
    }

    -- {{{ Handle signals
    -- Brightness control
    awesome.connect_signal("brightness::decrease", function()
        Logger.write(tasklist._dynamic_bar_id)
        awful.spawn("brightnessctl set 12.75-")
    end)

    awesome.connect_signal("brightness::increase", function()
        awful.spawn("brightnessctl set +12.75")
    end)

    -- Volume control
    awesome.connect_signal("volume::decrease", function()
        if AudioState.volume == 0 then
            state:set_dynamic_content(volume_bar.widget, Content.VolumeBar)
            reset_dynamic_bar_timeout_timer:again()
            return
        end
        AudioState.decrease_volume(function()
            volume_bar.widget:set_icon(AudioState.volume, AudioState.muted)
            state:set_dynamic_content(volume_bar.widget, Content.VolumeBar)

            -- volume_level = volume_level - 2
            volume_bar.anim.volume_down(AudioState.volume, AudioState.volume - 2)

            reset_dynamic_bar_timeout_timer:again()
        end)
    end)

    awesome.connect_signal("volume::increase", function()
        if AudioState.volume >= 98 then
            state:set_dynamic_content(volume_bar.widget, Content.VolumeBar)
            reset_dynamic_bar_timeout_timer:again()
            return
        end
        AudioState.increase_volume(function()
            volume_bar.widget:set_icon(AudioState.volume, AudioState.muted)
            state:set_dynamic_content(volume_bar.widget, Content.VolumeBar)

            -- volume_level = volume_level + 2
            volume_bar.anim.volume_up(AudioState.volume - 2, AudioState.volume)

            reset_dynamic_bar_timeout_timer:again()
        end)
    end)

    awesome.connect_signal("volume::togglemute", function()
        AudioState.toggle_mute(function()
            volume_bar.widget:set_icon(AudioState.volume, AudioState.muted)
            state:set_dynamic_content(volume_bar.widget, Content.VolumeBar)
            reset_dynamic_bar_timeout_timer:again()
        end)
    end)
    -- }}}

    return bar
end

return dynamic_bar
