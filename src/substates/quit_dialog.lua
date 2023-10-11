local dialog = state()

function dialog:enter()
    self.bg = love.graphics.newImage("gui/overlay/confirm.png")
    self.frame = love.graphics.newImage("gui/frame.png")
    self.yesDialog = TextButton("Yes", function()
        __canQuit = true
        love.event.quit()
    end)
    self.areYouSureText = Text("Are you sure you want to\n\t\t\t\t quit?")
    self.areYouSureText.x = love.graphics.getWidth() / 2 - self.areYouSureText.width / 2 - 150
    self.areYouSureText.y = love.graphics.getHeight() / 2 - self.areYouSureText.height / 2 - 75
    self.areYouSureText.inner = {0,0,0}
    self.areYouSureText.font = mainFont
    self.areYouSureText.thickness = 0

    self.yesDialog.x = love.graphics.getWidth() / 2 - self.yesDialog.width / 2 - 85
    self.yesDialog.y = love.graphics.getHeight() / 2 - self.yesDialog.height / 2 + 57

    self.noDialog = TextButton("No", function()
        state.killSubstate()
    end)

    self.noDialog.x = love.graphics.getWidth() / 2 - self.noDialog.width / 2 + 50
    self.noDialog.y = love.graphics.getHeight() / 2 - self.noDialog.height / 2 + 57
end

function dialog:update(dt)
    self.yesDialog:update(dt)
    self.noDialog:update(dt)
end

function dialog:mousepressed(x, y, button)
    if button == 1 then
        if self.yesDialog.hover and self.name ~= "" then
            self.yesDialog.action()
            selectSound:clone():play()
        end
        if self.noDialog.hover and self.name ~= "" then
            self.noDialog.action()
            selectSound:clone():play()
        end
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
    
    self.areYouSureText:draw()
    self.yesDialog:draw()
    self.noDialog:draw()
end

function dialog:exit()
    self.bg:release()
    self.bg = nil
    self.frame:release()
    self.frame = nil
    self.okDialog = nil
end

return dialog