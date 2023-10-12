-- somewhat from my other vn thing, https://github.com/GuglioIsStupid/LOVE-VN/blob/master/lovevn/text.lua
local curLine = 1
local speed = 100
local text = nil
local sayer = nil
local curChar = 1
local curCharacter = ""
local NewText = ""
local finished = false

local nameBox, dialogueBox = nil, nil

function initDialoge()
    curLine = 1
    speed = 100
    nameBox = love.graphics.newImage("gui/namebox.png")
    dialogueBox = love.graphics.newImage("gui/textbox.png")
    sayer = DialogueText("", nameBox:getWidth() + -6)
    sayer.outer = {190/255,93/255,158/255}
    sayer.align = "center"
    sayer.x = 214
    sayer.y = 484
    text = DialogueText("", dialogueBox:getWidth() + -30)
    text.font = mainFont
    text.x = 218
    text.y = 535
    text.thickness = 1.25
    curChar = 1
    curCharacter = ""
end

function say(sayer_, dialogue, outfit) -- say line
    sayer.text = sayers[sayer_] or sayer_
    NewText = dialogue

    curChar = 1
    curCharacter = ""

    speed = 100

    if settings.dialogueSpeed == 1 then
        curChar = #text
    end

    text.text = ""

    if sayer.text ~= "" then
        NewText = '"' .. NewText .. '"'
    end
    if sayer.text == "mc" then
        sayer.text = persistent.playername
    end


    if outfit then
        local who = sayer.text:lower()
        show(who, outfit)
    end
end

function updateDialogue(dt)
    if curChar < #NewText then
        curChar = curChar + dt * (speed * settings.dialogueSpeed)
    else
        curChar = #NewText
    end

    curCharacter = NewText:sub(curChar, curChar)

    if curCharacter == "{" then
        if not NewText:find("}") then return end
        local endPos = NewText:find("}", curChar)
        local speedChange = NewText:sub(curChar, endPos)
        NewText:gsub(speedChange, "")
        speedChange = speedChange:gsub("{", ""):gsub("}", ""):gsub("speed=", "")
        speed = tonumber(speedChange)
    end
        

    if curChar >= #NewText then
        curChar = #NewText
    end

    text.text = NewText:sub(1, curChar)
end

function mousepressedDialogue(x, y, button)
    if button == 1 then
        if curChar < #NewText then
            curChar = #NewText
        elseif not finished then
            curChar = 1
            curLine = curLine + 1
            state.updateDialogue(curLine)
        else
            -- set curChar to #text
            curChar = #NewText
        end
    end
end

function drawDialogue() -- left aligned text (printf for limit!)
    if stopDialogue then return end
    love.graphics.setColor(1,1,1)
    if sayer.text ~= "" then love.graphics.draw(nameBox, 210, 480) end
    love.graphics.draw(dialogueBox, 200, 519)
    sayer:draw()
    text:draw()
end
