local game = state()

function game:enter()
    player = persistent.playername
    initDialoge()
    self:updateDialogue(1)
end

function game:updateDialogue(cl)
    if chapter == 0 then
        ch0:updateDialogue(cl)
    end
end

function game:update(dt)
    updateDialogue(dt)
end

function game:mousepressed(x, y, button)
    mousepressedDialogue(x, y, button)
end

function game:draw()
    love.graphics.setColor(1,1,1)
    -- scale to 1280x720
    if bg then 
        love.graphics.setColor(1,1,1, bgAlpha)
        love.graphics.draw(bg, 0, 0, 0, 1280 / bg:getWidth(), 720 / bg:getHeight()) 
    end
    if bgTransition then 
        love.graphics.setColor(1,1,1, bgTransitionAlpha)
        love.graphics.draw(bgTransition, 0, 0, 0, 1280 / bgTransition:getWidth(), 720 / bgTransition:getHeight()) 
    end
    love.graphics.setColor(1,1,1)
    for name, character in pairs(charsOnScreen) do
        for j = 1, #character.outfit do
            local outfit = character.outfit[j]
            if outfit then
                love.graphics.setColor(1,1,1, character.alpha)
                love.graphics.draw(outfit, character.x, character.y, 0, character.scale, character.scale, character.offsetX, character.offsetY)
                love.graphics.setColor(1,1,1)
            end
        end
        
    end
    drawDialogue()
end

return game