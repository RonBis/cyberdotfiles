local command = {
    get_volume = {
        cmd = function() return "wpctl get-volume @DEFAULT_AUDIO_SINK@" end,
        ouput_formatter = function(stdout)
            local volume = 0.00
            local muted = false
            local c = 1
            for s in string.gmatch(string.sub(stdout, 0, -2), "%S+") do
                if c == 2 then
                    ---@diagnostic disable-next-line: cast-local-type
                    volume = tonumber(s)
                elseif c == 3 then
                    muted = s == "[MUTED]"
                end
                c = c + 1
            end
            return volume, muted
        end
    },
    increase_volume = function(factor) return "wpctl set-volume @DEFAULT_AUDIO_SINK@ " .. (factor and tostring(factor) or "0.02+") end,
    decrease_volume = function(factor) return "wpctl set-volume @DEFAULT_AUDIO_SINK@ " .. (factor and tostring(factor) or "0.02-") end,
    toggle_mute = function() return "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle" end,

    get_brightness = function() return "brightnessctl get" end,
    increase_brightness = function(factor) return "brightnessctl set " .. (factor and tostring(factor) or "+12.75") end,
    decrease_brightness = function(factor) return "brightnessctl set " .. (factor and tostring(factor) or "12.75-") end,

    -- Where did I get these commands? I'm glad you asked.
    -- Open terminal and enter "man playerctl"
    media_play = function() return "playerctl play" end,
    media_pause = function() return "playerctl pause" end,
    media_toggle_play = function() return "playerctl play-pause" end,
    media_play_next = function() return "playerctl next" end,
    media_play_previous = function() return "playerctl previous" end,
}
return command
