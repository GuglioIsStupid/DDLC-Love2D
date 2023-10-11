function love.load()
    state = require "modules.state"
    Ease = require "modules.Ease"
    Timer = require "lib.Timer"
    require "modules.loveOverrides"
    --require "modules.TrueColour"

    mainFont = love.graphics.newFont("fonts/gui/Aller_Rg.ttf", 24)
    love.graphics.setFont(mainFont)

    splashScreen = require "states.splash"
    mainMenu = require "states.mainMenu"

    bgm = love.audio.newSource("audio/bgm/1.ogg", "stream")
    love.audio.play(bgm, function(audio)
        audio:seek(22.073)
        love.audio.play(audio, true, "bgm", false)
    end, "bgm", false)

    if not love.filesystem.getInfo("characters") then
        love.filesystem.createDirectory("characters")
        -- copy assets/data/*.chr to characters/
        for i, v in ipairs(love.filesystem.getDirectoryItems("assets/data")) do
            if v:sub(-4) == ".chr" then
                love.filesystem.write("characters/" .. v, love.filesystem.read("assets/data/" .. v))
            end
        end
    end

    state.switch(mainMenu)
end

function love.update(dt)
    Timer.update(dt)
    love.audio.update(dt)
    state.update(dt)
end

function love.draw()
    state.draw()
end