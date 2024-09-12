local awful = require("awful")
local command = require("services.command")

-- Global Media Player State
MediaPlayerState = {}

function MediaPlayerState.play()
    awful.spawn.easy_async(command.media_play(), function() end)
end

function MediaPlayerState.pause()
    awful.spawn.easy_async(command.media_pause(), function() end)
end

function MediaPlayerState.toggle_play()
    awful.spawn.easy_async(command.media_toggle_play(), function() end)
end

function MediaPlayerState.play_previous()
    awful.spawn.easy_async(command.media_play_previous(), function() end)
end

function MediaPlayerState.play_next()
    awful.spawn.easy_async(command.media_play_next(), function() end)
end
