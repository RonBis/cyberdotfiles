local rubato = require("rubato")

local animation = {}

animation.type = {
    SLIDE_IN = 0,
    SLIDE_OUT = 1,
}

function animation.base(easing, intro, duration, outro)
    return rubato.timed {
        -- pos = nil, note: should be provided by you
        rate = 144, -- your FPS choice
        easing = easing or rubato.linear,
        intro = intro or 0.2,
        duration = duration or 0.4,
        awestore_compat = true,
        -- subscribed = nil, note: should be provided by you
    }
end

function animation.with(wibox, animation_type)
    local base = animation.base()

    if animation_type == 0 then
        base.pos = -100
        base.subscribed = function (pos)
            wibox.x = pos
            wibox.opacity = (pos + 100) / 100
        end
    elseif animation_type == 1 then
        base.pos = 0
        base.subscribed = function (pos)
            wibox.x = pos - 100
            wibox.opacity = pos / 100
        end
    end

    return base
end

function animation:animate(animation_fn)
    animation_fn.target = 1
end

return animation

-- -- Slide-in animation
-- local slide_in = rubato.timed {
--     pos = -100,
--     rate = 60,
--     easing = rubato.quadratic,
--     intro = 0.2,
--     duration = 0.4,
--     awestore_compat = true,
--     subscribed = function(pos)
--         mywibox.x = pos
--         mywibox.opacity = (pos + 100) / 100
--     end
-- }

-- -- Slide-out animation
-- local slide_out = rubato.timed {
--     pos = 0,
--     rate = 60,
--     easing = rubato.quadratic,
--     intro = 0.2,
--     duration = 0.4,
--     awestore_compat = true,
--     subscribed = function(pos)
--         mywibox.x = pos - 100
--         mywibox.opacity = pos / 100
--     end
-- }
