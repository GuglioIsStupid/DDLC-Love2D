local splash = state()
local curSplash = 1

function splash:enter()
    self.logo = love.graphics.newImage("images/bg/splash.png")
    self.alpha = 0
    self.timer = 0
    curSplash = 1

    self.events = {
        ["0.5"] = function()
            self.alpha = Ease.linear(self.timer - 0.5, 0, 1, 0.5)
        end,
        ["2.75"] = function()
            self.alpha = Ease.linear(self.timer - 2.75, 1, -1, 0.5)
        end,
        ["3.25"] = function()
            curSplash = 2
            self.alpha = Ease.linear(self.timer - 3.25, 0, 1, 0.5)
        end,
        ["6.45"] = function()
            self.alpha = Ease.linear(self.timer - 7, 1, -1, 0.5)
        end,
        ["7.25"] = function()
            state.switch(mainMenu)
        end
    }
end

function splash:update(dt)
    self.timer = self.timer + dt

    if self.timer > 0.5 and self.timer < 2.75 then
        self.events["0.5"]()
    elseif self.timer > 2.75 and self.timer < 3.25 then
        self.events["2.75"]()
    elseif self.timer > 3.25 and self.timer < 6 then
        self.events["3.25"]()
    elseif self.timer > 6.45 and self.timer < 7.25 then
        self.events["6.45"]()
    elseif self.timer > 7.25 then
        self.events["7.25"]()
    end
end

function splash:draw()
    love.graphics.setBackgroundColor(1,1,1)

    if curSplash == 1 then
        love.graphics.setColor(1,1,1,self.alpha)
        love.graphics.draw(splash.logo)
    elseif curSplash == 2 then
        love.graphics.setColor(0,0,0,self.alpha)
        love.graphics.printf("This game is not suitable for children\nor those who are easily disturbed.", 0, love.graphics.getHeight() / 2 - 50, love.graphics.getWidth(), "center")
    end
end

function splash:exit()
    self.logo = nil
    self.alpha = nil
    self.timer = nil
end

return splash