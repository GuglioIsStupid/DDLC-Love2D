local _newImage = love.graphics.newImage
local _draw = love.graphics.draw
local _newFont = love.graphics.newFont
local _newSource = love.audio.newSource
local _audioPlay = love.audio.play

local randStrChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_-"

function string.randomize(chars, len)
    local str = ""
    for i = 1, len do
        str = str .. chars:sub(love.math.random(1, #chars), love.math.random(1, #chars))
    end
    return str
end

love.audio.playing = {}

function love.graphics.newImage(path)
    return _newImage("assets/" .. path)
end

function love.graphics.newScrollingImage(path, vx, vy, amtX, amtY)
    local image = _newImage("assets/" .. path)
    return {
        x = 0,
        y = 0,
        ox = 0,
        oy = 0,
        vx = vx,
        vy = vy,
        image = image,
        scale = 1,
        amtX = amtX or 1,
        amtY = amtY or 1,

        update = function(self, dt)
            self.ox = self.ox + self.vx * dt
            self.oy = self.oy + self.vy * dt

            if self.oy < -self.image:getHeight() * self.scale then
                self.oy = 0
            elseif self.oy > self.image:getHeight() * self.scale then
                self.oy = 0
            end

            if self.ox < -self.image:getWidth() * self.scale then
                self.ox = 0
            elseif self.ox > self.image:getWidth() * self.scale then
                self.ox = 0
            end
        end,

        draw = function(self)
            love.graphics.setColor(1,1,1)
            for x = 1, self.amtX do
                for y = 1, self.amtY do
                    local x = self.x + (x - 1) * self.image:getWidth() * self.scale + self.ox
                    local y = self.y + (y - 1) * self.image:getHeight() * self.scale + self.oy

                    love.graphics.draw(self.image, x, y, 0, self.scale, self.scale)
                end
            end
        end
    }
end

function love.graphics.draw(image, x, y, r, sx, sy, ox, oy, kx, ky)
    local x, y, r, sx, sy, ox, oy, kx, ky = x or 0, y or 0, r or 0, sx or 1, sy or 1, ox or 0, oy or 0, kx or 0, ky or 0
    if type(image) == "table" then
        image:update(love.timer.getDelta())
        love.graphics.push()
            love.graphics.translate(x or 0, y or 0)
            love.graphics.rotate(r or 0)
            love.graphics.scale(sx or 1, sy or 1)
            love.graphics.translate(-x or 0, -y or 0)
            love.graphics.translate(ox or 0, oy or 0)
            love.graphics.shear(kx or 0, ky or 0)
            love.graphics.translate(-ox or 0, -oy or 0)
            image:draw()
        love.graphics.pop()
        return
    end

    _draw(image, x, y, r, sx, sy, ox, oy, kx, ky)
end

function love.graphics.newFont(path, size)
    return type(path) == "string" and _newFont("assets/" .. path, size) or _newFont(path)
end

function love.audio.newSource(path, type)
    return _newSource("assets/" .. path, type)
end

function love.audio.play(source, callback, id, removeOnStop)
    -- generate random id if none is provided
    local id = id or string.randomize(randStrChars, 16)
    love.audio.playing[id] = {
        id = id,
        source = source,

        -- if callback is a function, set it to it, else if its a true boolean, set it to the same id's callback, else set it to nil
        callback = type(callback) == "function" and callback or 
        type(callback) == "boolean" and love.audio.playing[id].callback or nil,

        playing = true,
        removeOnStop = removeOnStop or false,
        time = 0,
    }
    _audioPlay(source)
    return source
end

function love.audio.update(dt)
    for id, v in pairs(love.audio.playing) do
        v.time = v.time + 1000 * dt
        if not v.source:isPlaying() then
            v.time = 0
            if v.callback then
                v.callback(v.source)
            end
            v.playing = false
            if v.removeOnStop then
                table.remove(love.audio.playing, v.id)
            end
        end
    end
end