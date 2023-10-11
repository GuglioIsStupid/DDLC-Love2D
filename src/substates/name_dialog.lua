local dialog = state()

function dialog:enter()
    self.bg = love.graphics.newImage("gui/overlay/confirm.png")
    self.frame = love.graphics.newImage("gui/frame.png")
    self.okDialog = TextButton("OK", function()
        state.killSubstate(self.name)
    end)
    self.okDialog.x = love.graphics.getWidth() / 2 - self.okDialog.width / 2 - 20
    self.okDialog.y = love.graphics.getHeight() / 2 - self.okDialog.height / 2 + 57
    self.name = "asdasd"
    self.blinkerAlpha = 0
    self.blinkerColor = {190/255,93/255,158/255}
    self.enterName = Text("Please enter your name")
    self.enterName.x = love.graphics.getWidth() / 2 - self.enterName.width / 2 - 150
    self.enterName.y = love.graphics.getHeight() / 2 - self.enterName.height / 2 - 75
    self.enterName.inner = {0,0,0}
    self.enterName.font = mainFont
    self.enterName.thickness = 0
    self.nameText = Text("")
    self.nameText.align = "center"
    self.nameText.x = love.graphics.getWidth() / 2 - self.nameText.width / 2 - 640
    self.nameText.y = love.graphics.getHeight() / 2 - self.nameText.height / 2 - 10
    self.nameText.thickness = 1.5
    self.blinkerText = Text("")
    self.blinkerText.x = love.graphics.getWidth() / 2 - self.blinkerText.width / 2 - 640
    self.blinkerText.y = love.graphics.getHeight() / 2 - self.blinkerText.height / 2 - 13
    self.blinkerText.thickness = 1
    self.blinkerText.outer = {190/255,93/255,158/255}
    self.blinkerText.font = love.graphics.newFont(24)
    self.blinkerText.text = "|"
    self.blinkerText.align = "center"
end

function dialog:update(dt)
    self.okDialog:update(dt)

    self.blinkerAlpha = math.sin(love.timer.getTime() * 8) / 2 + 0.5 -- needs to blink quicker

    self.nameText.text = self.name
    self.blinkerText.text = {{0,0,0,0}, self.name, {self.blinkerColor[1], self.blinkerColor[2], self.blinkerColor[3], self.blinkerAlpha}, "|"}
end

function dialog:mousepressed(x, y, button)
    if button == 1 then
        if self.okDialog.hover and self.name ~= "" then
            self.okDialog.action()
            selectSound:clone():play()
        end
    end
end

function dialog:textinput(text)
    -- has to be an alpabetical character, no symbols or numbers
    if text:match("%a") and #self.name < 12 then
        self.name = self.name .. text
    end
end

function dialog:keypressed(key)
    if key == "backspace" then
        self.name = self.name:sub(1, #self.name - 1)
    end
end

function dialog:draw()
    love.graphics.setColor(1,1,1)
    love.graphics.draw(self.bg, 0, 0)
    -- draw self.frame in center of screen
    -- draw text in center of frame
    
    --love.graphics.draw(self.frame, love.graphics.getWidth() / 2 - self.frame:getWidth() / 2, love.graphics.getHeight() / 2 - self.frame:getHeight() / 2, 0, 0.55, 1)\\
    love.graphics.draw(self.frame,
        (love.graphics.getWidth() / 2 - (self.frame:getWidth() * 0.6)/ 2),
        (love.graphics.getHeight() / 2 - self.frame:getHeight() / 2),
        0,
        0.6,
        1.065
    )
    
    self.enterName:draw()
    self.okDialog:draw()
    self.nameText:draw()
    self.blinkerText:draw()

    -- blinker is a line that blinks at the end of the name
    love.graphics.setColor(self.blinkerColor[1], self.blinkerColor[2], self.blinkerColor[3], self.blinkerAlpha)
end

function dialog:exit()
    self.bg:release()
    self.bg = nil
    self.frame:release()
    self.frame = nil
    self.okDialog = nil
    self.name = nil
    self.blinkerAlpha = nil
    self.blinkerColor = nil
    self.enterName = nil
    self.nameText = nil
    self.blinkerText = nil
end

return dialog