-- Make love2d colours work with the 0-255 format (byte) instead of the 0-1 format (channel)

-- make a backup
local _setColor = love.graphics.setColor
local _setBackgroundColor = love.graphics.setBackgroundColor
local _clear = love.graphics.clear


-- Extra functions
function math.round(x)
    return math.floor(x + 0.5)
end

local function toByte(x)
    return math.round(x * 255)
end

local function toChannel(x)
    return x / 255
end

function love.graphics.setColor(r, g, b, a)
    if type(r) == "table" then
        local t = r
        r = toChannel(t[1])
        g = toChannel(t[2])
        b = toChannel(t[3])
        a = t[4]
    end

    if not g then
        g = r
        b = r
        a = 1
    elseif not b then
        b = r
        a = g
        g = r
    elseif not a then
        a = 1
    end

    _setColor(r, g, b, a)
end

function love.graphics.setBackgroundColor(r, g, b, a)
    if type(r) == "table" then
        local t = r
        r = toChannel(t[1])
        g = toChannel(t[2])
        b = toChannel(t[3])
        a = t[4]
    end

    if not g then
        g = r
        b = r
        a = 1
    elseif not b then
        b = r
        a = g
        g = r
    elseif not a then
        a = 1
    end

    _setBackgroundColor(r, g, b, a)
end

function love.graphics.clear(r, g, b, a, clearstencil, cleardepth)
    if type(r) == "table" then
        local t = r
        r = toChannel(t[1])
        g = toChannel(t[2])
        b = toChannel(t[3])
        a = t[4]
    end

    if not g then
        g = r
        b = r
        a = 1
    elseif not b then
        b = r
        a = g
        g = r
    elseif not a then
        a = 1
    end

    _clear(r, g, b, a, clearstencil, cleardepth)
end
