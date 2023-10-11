local game = state()

function game:enter()
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
    for i, character in ipairs(charsOnScreen) do
        --[[ for j = 1, #character.outfit do
            local outfit = character.outfit[j]
            if outfit then
                love.graphics.draw(outfit, character.x, character.y, 0, character.scale, character.scale, character.offsetX, character.offsetY)
            end
        end ]]
        love.graphics.draw(character.outfit[1], 300, 300)
    end
    drawDialogue()
end

return game