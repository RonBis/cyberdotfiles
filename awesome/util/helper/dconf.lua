local mod = {}

local json = require("json")
local lfs = require("lfs")

dconf_path = "/home/roni/.config/awesome/dconf.json"

-- returns a table
function read_config()
    local file = io.open(dconf_path)
    if (not file) then
        return
    end
    return json.decode(file:read("a"))
end

function write_config(json_conf)
    local file = io.open(dconf_path)
    if (not file) then
        return
    end
    file:write(json.encode(json_conf))
end

-- wallpaper
function mod.get_wallpaper()
    return read_config()["wallpaper"]
end

function mod.set_wallpaper(path)
    local conf = read_config()
    conf["wallpaper"] = path
    write_config(conf)
end

function mod.list_wallpapers()
    local dir = read_config()["wallpaper_dir"]
    local wallpapers = {}
    for file in lfs.dir(dir) do
        if file ~= "." and file ~= ".." then
            table.insert(wallpapers, dir .. file)
        end
    end
    return wallpapers
end

return mod
