local Ease = {}
Ease.__index = Ease

-- easings
local function linear(t, b, c, d)
    local d = d or 1
    t = t / d
    return c * t + b
end

local function cubicIn(t, b, c, d)
    local d = d or 1
    t = t / d
    return c * t * t * t + b
end

local function cubicOut(t, b, c, d)
    local d = d or 1
    t = t / d - 1
    return c * (t * t * t + 1) + b
end

local function cubicInOut(t, b, c, d)
    local d = d or 1
    t = t / d * 2
    if t < 1 then
        return c / 2 * t * t * t + b
    else
        t = t - 2
        return c / 2 * (t * t * t + 2) + b
    end
end

Ease.linear = linear
Ease.cubicIn = cubicIn
Ease.cubicOut = cubicOut
Ease.cubicInOut = cubicInOut

return Ease