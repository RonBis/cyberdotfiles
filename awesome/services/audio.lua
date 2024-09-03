local awful      = require("awful")
local command    = require("services.command")
local logger     = require("util.logger")

local AudioLevel = {
    Muted = 1,
    Low = 2,
    Mid = 3,
    High = 4,
    Maxed = 5,
}

---@param volume number
---@param muted boolean
function get_audiolevel_from_volume(volume, muted)
    if muted then
        return AudioLevel.Muted
    elseif volume >= 0 and volume < 20 then
        return AudioLevel.Low
    elseif volume >= 20 and volume < 50 then
        return AudioLevel.Mid
    elseif volume >= 50 and volume < 80 then
        return AudioLevel.High
    elseif volume >= 80 and volume < 100 then
        return AudioLevel.Maxed
    end
end

-- Global Audio State
AudioState = {
    muted = false,
    volume = 0,
    level = AudioLevel.Low,
    last_updated = 0,
}

---@param blocking boolean
---@param callback function?
function AudioState.sync(blocking, callback)
    local job = function(stdout)
        local volume, muted = command.get_volume.ouput_formatter(stdout)
        AudioState.muted = muted
        AudioState.volume = volume * 100
        -- AudioState.last_updated = os.time()

        logger.write(tostring(AudioState.volume))

        if callback then
            callback()
        end
    end

    if blocking then
        awful.spawn.with_shell(command.get_volume.cmd(), function(stdout)
            job(stdout)
        end)
    else
        awful.spawn.easy_async_with_shell(command.get_volume.cmd(), function(stdout)
            job(stdout)
        end)
    end
end

---@param callback function?
function AudioState.toggle_mute(callback)
    awful.spawn.easy_async(command.toggle_mute(), function()
        AudioState.sync(false, callback)
    end)
end

---@param callback function?
function AudioState.increase_volume(callback)
    awful.spawn.easy_async(command.increase_volume(), function()
        AudioState.sync(false, callback)
    end)
end

---@param callback function?
function AudioState.decrease_volume(callback)
    awful.spawn.easy_async(command.decrease_volume(), function()
        AudioState.sync(false, callback)
    end)
end
