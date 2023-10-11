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

function mainMenu:enter()
    self.fadeWhite = 1
    self.timer = 0

    self.menuBG = love.graphics.newScrollingImage("gui/scrollingBG.png", -33.33, -33.33, 8, 10)
    self.menuBG.scale = 1.35

    self.y_menu = {image=love.graphics.newImage("gui/menu_art_y.png"), x = 0, y = 0, scale=0.6,ox=450,oy=15} -- menu_art_move(0.54, 600, 0.60)
    self.n_menu = {image=love.graphics.newImage("gui/menu_art_n.png"), x = 0, y = 0, scale=0.58,ox=630,oy=85} -- menu_art_move(0.58, 750, 0.58)
    self.s_menu = {image=love.graphics.newImage("gui/menu_art_s.png"), x = 0, y = 0, scale=0.68,ox=360,oy=130} -- menu_art_move(0.68, 510, 0.68)
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

    self.textButtons = {
        TextButton("New Game", function()
            if not persistent.playername then state.substate(nameDialog) end
        end),
        TextButton("Load Game", function()
            state.switch(splashScreen)
        end),
        TextButton("Settings", function()
            state.switch(splashScreen)
        end),
        TextButton("Help", function()
            state.switch(splashScreen)
        end),
        TextButton("Quit", function()
            love.event.quit()
        end)
    }

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
end

function mainMenu:update(dt)
    self.timer = self.timer + dt
    self.fadeWhite = math.max(self.fadeWhite - 0.65 * dt, 0)
    for i, v in ipairs(self.particles) do
        v:update(dt)
    end
    for i, v in ipairs(self.textButtons) do
        v:update(dt)
    end
end

function mainMenu:mousepressed(x, y, button)
    if button == 1 then
        for i, v in ipairs(self.textButtons) do
            if v.hover then
                v.action()
                selectSound:clone():play()
            end
        end
    end
end

function mainMenu:substateReturn(name)
    persistent.playername = name
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

    for i = 1, #self.textButtons do
        local v = self.textButtons[i]
        v.x = 75 + self.menu_nav.x
        v.y = 400 + (i - 1) * 40
        v:draw()
    end

    for i, v in ipairs(self.particles) do
        v:draw()
    end
end

function mainMenu:exit()
    self.fadeWhite = nil
    self.menuBG.image:release()
    self.menuBG = nil
    self.y_menu.image:release()
    self.y_menu = nil
    self.n_menu.image:release()
    self.n_menu = nil
    self.s_menu.image:release()
    self.s_menu = nil
    self.m_menu.image:release()
    self.m_menu = nil
    self.menu_nav.image:release()
    self.menu_nav = nil
    self.menu_logo.image:release()
    self.menu_logo = nil
    self.particles = nil
    self.particleImg:release()
    self.particleImg = nil
    self.textButtons = nil
end

return mainMenu