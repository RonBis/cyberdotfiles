local logger = {}

function logger.write(s)
    file = io.open("/home/roni/.config/awesome/awesome-debug.log", "a+")
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

return logger
