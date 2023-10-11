local mainMenu = state()

local y_menu_timer, n_menu_timer, s_menu_timer, m_menu_timer
local y_menu_wait, n_menu_wait, s_menu_wait, m_menu_wait
local y_menu_timer2, n_menu_timer2, s_menu_timer2, m_menu_timer2

local function menu_art_move(art, z, x, z2)
    art.y = 0 + (1300 * z)
    art.x = (740 - x) * z * 0.5
    art.scale = z2 * 0.75
    Timer.after(0.75, function()
        Timer.tween(1.5, art, {x = 0, scale = z2}, "in-out-quad")
    end)
    Timer.tween(1.75, art, {y = 0}, "in-out-quad")
end

--[[
    transform menu_nav_move:
    subpixel True
    xoffset -500
    time 1.5
    easein_quint 1 xoffset 0
]]

local function menu_nav_move(menu_nav)
    menu_nav.x = -500
    Timer.after(1.5, function()
        Timer.tween(1.5, menu_nav, {x = 0}, "in-out-quint")
    end)
end

local function menu_logo_move(menu_logo)
    menu_logo.y = -450
    Timer.after(1.925, function()
        Timer.tween(1.5, menu_logo, {y = -30}, "in-bounce")
    end)
end

function particle_fadeout(particle)
    Timer.tween(1.5, particle, {alpha = 0}, "out-linear")
end

local function ParticleBurst(img, explodeTime, numParticles, particleTime, particleXSpeed, particleYSpeed)
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

function mainMenu:enter()
    self.fadeWhite = 1
    self.timer = 0

    self.menuBG = love.graphics.newScrollingImage("gui/scrollingBG.png", -33.33, -33.33, 8, 10)
    self.menuBG.scale = 1.35

    self.y_menu = {image=love.graphics.newImage("gui/menu_art_y.png"), x = 0, y = 0, scale=0.6,ox=450,oy=15} -- menu_art_move(0.54, 600, 0.60)
    self.n_menu = {image=love.graphics.newImage("gui/menu_art_n.png"), x = 0, y = 0, scale=0.58,ox=625,oy=85} -- menu_art_move(0.58, 750, 0.58)
    self.s_menu = {image=love.graphics.newImage("gui/menu_art_s.png"), x = 0, y = 0, scale=0.68,ox=360,oy=115} -- menu_art_move(0.68, 510, 0.68)
    self.m_menu = {image=love.graphics.newImage("gui/menu_art_m.png"), x = 0, y = 0, scale=1,ox=700,oy=100} -- menu_art_move(1.00, 1000, 1.00)

    self.y_menu.x, self.y_menu.y = (740 - 600) * 0.54 * 0.5, 0 + (1300 * 0.54)
    self.n_menu.x, self.n_menu.y = (740 - 750) * 0.58 * 0.5, 0 + (1300 * 0.58)
    self.s_menu.x, self.s_menu.y = (740 - 510) * 0.68 * 0.5, 0 + (1300 * 0.68)
    self.m_menu.x, self.m_menu.y = (740 - 1000) * 1.00 * 0.5, 0 + (1300 * 1.00)

    love.graphics.setBackgroundColor(0,0,0)
    self.particles = {}
    self.particleImg = love.graphics.newImage("gui/menu_particle.png")

    self.menu_nav = {image=love.graphics.newImage("gui/overlay/main_menu.png"), x = 0, y = 0, scale=1,ox=0,oy=0} -- menu_nav_move
    self.menu_nav.x = -500

    self.menu_logo = {image=love.graphics.newImage("gui/logo.png"), x = 65, y = -450, scale=0.6,ox=0,oy=0} -- menu_logo_move

    Timer.after(0.65, function()
        Timer.tween(2.5, self.menuBG, {y = -500}, "in-out-cubic")

        menu_art_move(self.y_menu, 0.54, 600, 0.60)
        menu_art_move(self.n_menu, 0.58, 750, 0.58)
        menu_art_move(self.s_menu, 0.68, 510, 0.68)
        menu_art_move(self.m_menu, 1.00, 1000, 1.00)

        menu_nav_move(self.menu_nav)
        menu_logo_move(self.menu_logo)

        Timer.after(2.481, function()
            for i = 1, 3 do
                local p = ParticleBurst(self.particleImg, 0, 40, 2.0, 3, 3)
                p.x = -80
                p.y = 10
                p.scale = 1.35
                table.insert(self.particles, p)
            end
        end)
    end)

    --[[
        image menu_particles:
    2.481
    xpos 224
    ypos 104
    ParticleBurst("gui/menu_particle.png", explodeTime=0, numParticles=40, particleTime=2.0, particleXSpeed=3, particleYSpeed=3).sm
    particle_fadeout
    ]] -- repeated 3 times

end

function mainMenu:update(dt)
    self.timer = self.timer + dt
    self.fadeWhite = math.max(self.fadeWhite - 0.75 * dt, 0)
    for i, v in ipairs(self.particles) do
        v:update(dt)
    end


    --[[ if self.timer > 0.65 and self.timer < 3.15 then
        --self.menuBG.y = Ease.cubicInOut(self.timer - 0.65, 0, -500, 2.5)
       
        -- no easing, just move them to their positions (+50)
        if y_menu_timer then Timer.cancel(y_menu_timer) end
        y_menu_timer = Timer.tween(0.5, self.y_menu, {x = 450 + 50})
        if n_menu_timer then Timer.cancel(n_menu_timer) end
        n_menu_timer = Timer.tween(0.5, self.n_menu, {x = 600 + 50})
        if s_menu_timer then Timer.cancel(s_menu_timer) end
        s_menu_timer = Timer.tween(0.5, self.s_menu, {x = 360 + 50})
        if m_menu_timer then Timer.cancel(m_menu_timer) end
        m_menu_timer = Timer.tween(0.5, self.m_menu, {x = 850 + 50})
    end ]]
end

function mainMenu:draw()
    love.graphics.draw(self.menuBG, 0, 0)
    love.graphics.setColor(1,1,1,self.fadeWhite)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    love.graphics.setColor(1,1,1)

    love.graphics.draw(self.y_menu.image, self.y_menu.x + self.y_menu.ox, self.y_menu.y + self.y_menu.oy, 0, self.y_menu.scale, self.y_menu.scale)
    love.graphics.draw(self.n_menu.image, self.n_menu.x + self.n_menu.ox, self.n_menu.y + self.n_menu.oy, 0, self.n_menu.scale, self.n_menu.scale)
    love.graphics.draw(self.s_menu.image, self.s_menu.x + self.s_menu.ox, self.s_menu.y + self.s_menu.oy, 0, self.s_menu.scale, self.s_menu.scale)
    love.graphics.draw(self.m_menu.image, self.m_menu.x + self.m_menu.ox, self.m_menu.y + self.m_menu.oy, 0, self.m_menu.scale, self.m_menu.scale)

    love.graphics.draw(self.menu_nav.image, self.menu_nav.x + self.menu_nav.ox, self.menu_nav.y + self.menu_nav.oy, 0, self.menu_nav.scale, self.menu_nav.scale)
    love.graphics.draw(self.menu_logo.image, self.menu_logo.x + self.menu_logo.ox, self.menu_logo.y + self.menu_logo.oy, 0, self.menu_logo.scale, self.menu_logo.scale)

    for i, v in ipairs(self.particles) do
        v:draw()
    end
end

function mainMenu:exit()
    self.fadeWhite = nil
    self.menuBG = nil
end

return mainMenu