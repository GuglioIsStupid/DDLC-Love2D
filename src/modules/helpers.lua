function ParticleBurst(img, explodeTime, numParticles, particleTime, particleXSpeed, particleYSpeed)
    local particle = {}
    particle.image = img
    particle.x, particle.y = 0, 0
    particle.scale = 1
    particle.alpha = 1
    particle.particles = {}
    particle.explodeTime = explodeTime
    particle.numParticles = numParticles
    particle.particleTime = particleTime
    particle.particleXSpeed = particleXSpeed
    particle.particleYSpeed = particleYSpeed
    particle.update = function(self, dt)
        if self.explodeTime > 0 then
            self.explodeTime = self.explodeTime - dt
        else
            for i = 1, self.numParticles do
                local p = {}
                p.x = 224
                p.y = 104
                -- circular explosion based off particleXSpeed and particleYSpeed
                local angle = love.math.random() * math.pi * 2
                local speed = love.math.random() * math.sqrt(self.particleXSpeed^2 + self.particleYSpeed^2)
                p.vx = math.cos(angle) * speed
                p.vy = math.sin(angle) * speed
                p.timer = 0
                table.insert(self.particles, p)
                self.numParticles = self.numParticles - 1
            end
            self.explodeTime = -1
        end

        for i, v in ipairs(self.particles) do
            v.x = v.x + v.vx 
            v.y = v.y + v.vy 
            v.timer = v.timer + dt
            if v.timer > self.particleTime then
                table.remove(self.particles, i)
            end
        end
    end
    particle.draw = function(self)
        for i, v in ipairs(self.particles) do
            love.graphics.push()
                love.graphics.scale(self.scale)
                love.graphics.translate(self.x, self.y)
                love.graphics.setColor(1,1,1,self.alpha)
                love.graphics.draw(self.image, v.x, v.y)
                love.graphics.setColor(1,1,1)
            love.graphics.pop()
        end
    end

    particle_fadeout(particle)
    return particle
end

function TextButton(text, action)
    local button = {}
    button.x, button.y = 0, 0
    button.text = text
    button.action = action
    button.hover = false
    button.idleInner = {1,1,1}
    button.idleOuter = {190/255,93/255,158/255}
    button.hoverInner = {1,1,1}
    button.hoverOuter = {1,170/255,204/255}
    button.width = 0
    button.height = 0
    button.font = nameFont
    button.hoverSound = hoverSound
    button.playedHoverSound = false
    button.thickness = 3
    
    button.update = function(self, dt)
        self.width = self.font:getWidth(self.text) * 1.15
        self.height = self.font:getHeight() * 1.15
        local mx, my = love.mouse.getPosition()
        if mx > self.x and mx < self.x + self.width and my > self.y and my < self.y + self.height then
            self.hover = true
            if not self.playedHoverSound then
                self.hoverSound:clone():play()
                self.playedHoverSound = true
            end
        else
            self.hover = false
            self.playedHoverSound = false
        end
    end

    button.draw = function(self)
        local lastFont = love.graphics.getFont()
        love.graphics.setFont(self.font)
        for i = -self.thickness, self.thickness do
            for j = -self.thickness, self.thickness do
                love.graphics.setColor(self.hover and self.hoverOuter or self.idleOuter)
                love.graphics.print(self.text, self.x + i, self.y + j, 0, 1.15, 1.15)
            end
        end

        love.graphics.setColor(self.hover and self.hoverInner or self.idleInner)
        love.graphics.print(self.text, self.x, self.y, 0, 1.15, 1.15)

        love.graphics.setColor(1,1,1)
        love.graphics.setFont(lastFont)
    end

    return button
end

function Text(text)
    local t = {}
    t.x, t.y = 0, 0
    t.text = text
    t.inner = {1,1,1}
    t.outer = {0,0,0}
    t.width = 0
    t.height = 0
    t.font = nameFont
    t.thickness = 3

    t.update = function(self, dt)
        self.width = self.font:getWidth(self.text) * 1.15
        self.height = self.font:getHeight() * 1.15
    end

    t.draw = function(self)
        if self.text == "" then return end
        local lastFont = love.graphics.getFont()
        love.graphics.setFont(self.font)
        if self.thickness > 0 then
            for i = -self.thickness, self.thickness do
                for j = -self.thickness, self.thickness do
                    love.graphics.setColor(self.outer)
                    if not self.align then
                        love.graphics.print(self.text, self.x + i, self.y + j, 0, 1.15, 1.15)
                    else
                        love.graphics.printf(self.text, self.x + i, self.y + j, love.graphics.getWidth(), self.align)
                    end
                end
            end
        end
        love.graphics.setColor(self.inner)
        if not self.align then
            love.graphics.print(self.text, self.x, self.y, 0, 1.15, 1.15)
        else
            love.graphics.printf(self.text, self.x, self.y, love.graphics.getWidth(), self.align)
        end

        love.graphics.setColor(1,1,1)
        love.graphics.setFont(lastFont)
    end

    return t
end

-- DialogueText, has value for limit (same code as Text), if limit is 0, then set to default (love.graphics.getWidth())
function DialogueText(text, limit)
    local t = {}
    t.x, t.y = 0, 0
    t.text = text
    t.inner = {1,1,1}
    t.outer = {0,0,0}
    t.width = 0
    t.height = 0
    t.font = nameFont
    t.thickness = 3
    t.limit = limit or love.graphics.getWidth()
    t.align = "left"

    t.update = function(self, dt)
        self.width = self.font:getWidth(self.text) * 1.15
        self.height = self.font:getHeight() * 1.15
    end

    t.draw = function(self)
        if self.text == "" then return end
        local lastFont = love.graphics.getFont()
        love.graphics.setFont(self.font)
        if self.thickness > 0 then
            for i = -self.thickness, self.thickness do
                for j = -self.thickness, self.thickness do
                    love.graphics.setColor(self.outer)
                    love.graphics.printf(self.text, self.x + i, self.y + j, self.limit, t.align)
                end
            end
        end
        love.graphics.setColor(self.inner)
        love.graphics.printf(self.text, self.x, self.y, self.limit, t.align)

        love.graphics.setColor(1,1,1)
        love.graphics.setFont(lastFont)
    end

    return t
end

function Gradient(dir, ...)
    -- Check for direction
    local isHorizontal = true
    if dir == "vertical" then
        isHorizontal = false
    elseif dir ~= "horizontal" then
        error("bad argument #1 to 'gradient' (invalid value)", 2)
    end

    -- Check for colors
    local colorLen = select("#", ...)
    if colorLen < 2 then
        error("color list is less than two", 2)
    end

    -- Generate mesh
    local meshData = {}
    if isHorizontal then
        for i = 1, colorLen do
            local color = select(i, ...)
            local x = (i - 1) / (colorLen - 1)

            meshData[#meshData + 1] = {x, 1, x, 1, color[1], color[2], color[3], color[4] or (1)}
            meshData[#meshData + 1] = {x, 0, x, 0, color[1], color[2], color[3], color[4] or (1)}
        end
    else
        for i = 1, colorLen do
            local color = select(i, ...)
            local y = (i - 1) / (colorLen - 1)

            meshData[#meshData + 1] = {1, y, 1, y, color[1], color[2], color[3], color[4] or (1)}
            meshData[#meshData + 1] = {0, y, 0, y, color[1], color[2], color[3], color[4] or (1)}
        end
    end

    -- Resulting Mesh has 1x1 image size
    return love.graphics.newMesh(meshData, "strip", "static")
end

function savePersistent()
    persistent.sname = sayers["s"]
    persistent.mname = sayers["m"]
    persistent.nname = sayers["n"]
    persistent.yname = sayers["y"]

    local persistentString = ""

    for k, v in pairs(persistent) do
        persistentString = persistentString .. k .. "=" .. tostring(v) .. "\n"
    end

    love.filesystem.write("persistent", persistentString)

    print("Saved persistent data.")

    return true
end

function loadPersistent()
    if not love.filesystem.getInfo("persistent") then
        print("No persistent data found.")
        return false
    end

    local persistentString = love.filesystem.read("persistent")

    for line in persistentString:gmatch("[^\r\n]+") do
        local key, value = line:match("([^=]+)=([^=]+)")
        if value == "true" then
            persistent[key] = true
        elseif value == "false" then
            persistent[key] = false
        else
            persistent[key] = value
        end
    end

    print("Loaded persistent data.")

    return true
end