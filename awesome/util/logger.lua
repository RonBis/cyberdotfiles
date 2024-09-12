Logger = {}

local gfs = require("gears.filesystem")

---@param s string | table
function Logger.write(s)
    local file = io.open(gfs.get_configuration_dir() .. "awesome-debug.log", "a+")
    if file == nil then
        return
    end

    if (type(s) == "table") then
        file:write("-- " .. tostring(s) .. " --\n")
        for key, value in pairs(s) do
            file:write(key .. value .. "\n")
        end
    else
        file:write(tostring(s) .. "\n")
    end
    file:close()
end
