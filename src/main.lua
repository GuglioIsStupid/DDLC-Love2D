__canQuit = false
function love.load()
    state = require "modules.state"
    Ease = require "modules.Ease"
    Timer = require "lib.Timer"
    require "modules.loveOverrides"
    require "modules.helpers"
    require "modules.persistent"
    loadPersistent()
    require "modules.definitions"
    require "modules.dialogue"
    settings = require "modules.settings"
    --require "modules.TrueColour"

    mainFont = love.graphics.newFont("fonts/gui/Aller_Rg.ttf", 24)
    nameFont = love.graphics.newFont("fonts/gui/RifficFree-Bold.ttf", 24)
    love.graphics.setFont(mainFont)

    -- States
    splashScreen = require "states.splash"
    mainMenu = require "states.mainMenu"
    gameState = require "states.game"

    -- scripts
    ch0 = require "scripts.script-ch0" -- chapter 0

    chapter = 0

    -- Substates
    nameDialog = require "substates.name_dialog"
    quitDialog = require "substates.quit_dialog"

    bgm = love.audio.newSource("audio/bgm/1.ogg", "stream")
    hoverSound = love.audio.newSource("audio/gui/sfx/hover.ogg", "static")
    selectSound = love.audio.newSource("audio/gui/sfx/select.ogg", "static")
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

function love.mousepressed(x, y, button)
    state.mousepressed(x, y, button)
end

function love.keypressed(key)
    state.keypressed(key)
end

function love.textinput(text)
    state.textinput(text)
end

function love.resize(w, h)
end

function love.draw()
    state.draw()

    -- print debug info
    love.graphics.setColor(0,0,0)
    love.graphics.print("FPS: " .. love.timer.getFPS() ..
        "\nDraws: " .. love.graphics.getStats().drawcalls ..
        "\nMemory: " .. math.floor(collectgarbage("count")) .. "KB" ..
        "\nGraphics Memory (MB): " .. math.floor(love.graphics.getStats().texturememory / 1024 / 1024), 0, 0, 0, 0.5, 0.5
    )

end

function love.quit()
    savePersistent()
    
    if __canQuit then
        return false
    else
        state.substate(quitDialog)
        return true
    end
end