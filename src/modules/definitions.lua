sayers = {
    s = "Sayori",
    y = "Yuri",
    m = "Monika",
    n = "Natsuki",

    mc = persistent.playername
}

local outfits = {
    sayori = {},
    yuri = {},
    monika = {},
    natsuki = {},
}

local bgs = {}
bgs["residential_day"] = love.graphics.newImage("images/bg/residential.png")
bgs["class_day"] = love.graphics.newImage("images/bg/class.png")
bg = nil

---------------- Sayori ----------------
s__1Left = love.graphics.newImage("images/sayori/1l.png")
s__1Right = love.graphics.newImage("images/sayori/1r.png")
s__2Left = s__1Left
s__2Right = love.graphics.newImage("images/sayori/2r.png")
s__3Left = love.graphics.newImage("images/sayori/2l.png")
s__3Right = s__1Right
s__4Left = s__3Left
s__4Right = s__2Right

s_5 = love.graphics.newImage("images/sayori/3a.png")
s_5a = love.graphics.newImage("images/sayori/3a.png")
s_5b = love.graphics.newImage("images/sayori/3b.png")
s_5c = love.graphics.newImage("images/sayori/3c.png")
s_5d = love.graphics.newImage("images/sayori/3d.png")

s__aHead = love.graphics.newImage("images/sayori/a.png")
s__bHead = love.graphics.newImage("images/sayori/b.png")
s__cHead = love.graphics.newImage("images/sayori/c.png")
s__dHead = love.graphics.newImage("images/sayori/d.png")
s__eHead = love.graphics.newImage("images/sayori/e.png")
s__fHead = love.graphics.newImage("images/sayori/f.png")
s__gHead = love.graphics.newImage("images/sayori/g.png")
s__hHead = love.graphics.newImage("images/sayori/h.png")
s__iHead = love.graphics.newImage("images/sayori/i.png")
s__jHead = love.graphics.newImage("images/sayori/j.png")
s__kHead = love.graphics.newImage("images/sayori/k.png")
s__lHead = love.graphics.newImage("images/sayori/l.png")
s__mHead = love.graphics.newImage("images/sayori/m.png")
s__nHead = love.graphics.newImage("images/sayori/n.png")
s__oHead = love.graphics.newImage("images/sayori/o.png")
s__pHead = love.graphics.newImage("images/sayori/p.png")
s__qHead = love.graphics.newImage("images/sayori/q.png")
s__rHead = love.graphics.newImage("images/sayori/r.png")
s__sHead = love.graphics.newImage("images/sayori/s.png")
s__tHead = love.graphics.newImage("images/sayori/t.png")
s__uHead = love.graphics.newImage("images/sayori/u.png")
s__vHead = love.graphics.newImage("images/sayori/v.png")
s__wHead = love.graphics.newImage("images/sayori/w.png")
s__xHead = love.graphics.newImage("images/sayori/x.png")
s__yHead = love.graphics.newImage("images/sayori/y.png")

outfits.sayori["1"] = {s__1Left,s__1Right,s__aHead}
outfits.sayori["1a"] = {s__1Left, s__1Right, s__aHead}
outfits.sayori["1b"] = {s__1Left, s__1Right, s__bHead}
outfits.sayori["1c"] = {s__1Left, s__1Right, s__cHead}
outfits.sayori["1d"] = {s__1Left, s__1Right, s__dHead}
outfits.sayori["1e"] = {s__1Left, s__1Right, s__eHead}
outfits.sayori["1f"] = {s__1Left, s__1Right, s__fHead}
outfits.sayori["1g"] = {s__1Left, s__1Right, s__gHead}
outfits.sayori["1h"] = {s__1Left, s__1Right, s__hHead}
outfits.sayori["1i"] = {s__1Left, s__1Right, s__iHead}
outfits.sayori["1j"] = {s__1Left, s__1Right, s__jHead}
outfits.sayori["1k"] = {s__1Left, s__1Right, s__kHead}
outfits.sayori["1l"] = {s__1Left, s__1Right, s__lHead}
outfits.sayori["1m"] = {s__1Left, s__1Right, s__mHead}
outfits.sayori["1n"] = {s__1Left, s__1Right, s__nHead}
outfits.sayori["1o"] = {s__1Left, s__1Right, s__oHead}
outfits.sayori["1p"] = {s__1Left, s__1Right, s__pHead}
outfits.sayori["1q"] = {s__1Left, s__1Right, s__qHead}
outfits.sayori["1r"] = {s__1Left, s__1Right, s__rHead}
outfits.sayori["1s"] = {s__1Left, s__1Right, s__sHead}
outfits.sayori["1t"] = {s__1Left, s__1Right, s__tHead}
outfits.sayori["1u"] = {s__1Left, s__1Right, s__uHead}
outfits.sayori["1v"] = {s__1Left, s__1Right, s__vHead}
outfits.sayori["1w"] = {s__1Left, s__1Right, s__wHead}
outfits.sayori["1x"] = {s__1Left, s__1Right, s__xHead}
outfits.sayori["1y"] = {s__1Left, s__1Right, s__yHead}

outfits.sayori["2"] = {s__2Left, s__2Right, s__aHead}
outfits.sayori["2a"] = {s__2Left, s__2Right, s__aHead}
outfits.sayori["2b"] = {s__2Left, s__2Right, s__bHead}
outfits.sayori["2c"] = {s__2Left, s__2Right, s__cHead}
outfits.sayori["2d"] = {s__2Left, s__2Right, s__dHead}
outfits.sayori["2e"] = {s__2Left, s__2Right, s__eHead}
outfits.sayori["2f"] = {s__2Left, s__2Right, s__fHead}
outfits.sayori["2g"] = {s__2Left, s__2Right, s__gHead}
outfits.sayori["2h"] = {s__2Left, s__2Right, s__hHead}
outfits.sayori["2i"] = {s__2Left, s__2Right, s__iHead}
outfits.sayori["2j"] = {s__2Left, s__2Right, s__jHead}
outfits.sayori["2k"] = {s__2Left, s__2Right, s__kHead}
outfits.sayori["2l"] = {s__2Left, s__2Right, s__lHead}
outfits.sayori["2m"] = {s__2Left, s__2Right, s__mHead}
outfits.sayori["2n"] = {s__2Left, s__2Right, s__nHead}
outfits.sayori["2o"] = {s__2Left, s__2Right, s__oHead}
outfits.sayori["2p"] = {s__2Left, s__2Right, s__pHead}

outfits.sayori["3"] = {s__3Left, s__3Right, s__aHead}
outfits.sayori["3a"] = {s__3Left, s__3Right, s__aHead}
outfits.sayori["3b"] = {s__3Left, s__3Right, s__bHead}
outfits.sayori["3c"] = {s__3Left, s__3Right, s__cHead}
outfits.sayori["3d"] = {s__3Left, s__3Right, s__dHead}
outfits.sayori["3e"] = {s__3Left, s__3Right, s__eHead}
outfits.sayori["3f"] = {s__3Left, s__3Right, s__fHead}
outfits.sayori["3g"] = {s__3Left, s__3Right, s__gHead}
outfits.sayori["3h"] = {s__3Left, s__3Right, s__hHead}
outfits.sayori["3i"] = {s__3Left, s__3Right, s__iHead}
outfits.sayori["3j"] = {s__3Left, s__3Right, s__jHead}
outfits.sayori["3k"] = {s__3Left, s__3Right, s__kHead}
outfits.sayori["3l"] = {s__3Left, s__3Right, s__lHead}
outfits.sayori["3m"] = {s__3Left, s__3Right, s__mHead}
outfits.sayori["3n"] = {s__3Left, s__3Right, s__nHead}
outfits.sayori["3o"] = {s__3Left, s__3Right, s__oHead}
outfits.sayori["3p"] = {s__3Left, s__3Right, s__pHead}
outfits.sayori["3q"] = {s__3Left, s__3Right, s__qHead}
outfits.sayori["3r"] = {s__3Left, s__3Right, s__rHead}
outfits.sayori["3s"] = {s__3Left, s__3Right, s__sHead}
outfits.sayori["3t"] = {s__3Left, s__3Right, s__tHead}
outfits.sayori["3u"] = {s__3Left, s__3Right, s__uHead}
outfits.sayori["3v"] = {s__3Left, s__3Right, s__vHead}
outfits.sayori["3w"] = {s__3Left, s__3Right, s__wHead}
outfits.sayori["3x"] = {s__3Left, s__3Right, s__xHead}
outfits.sayori["3y"] = {s__3Left, s__3Right, s__yHead}

outfits.sayori["4"] = {s__4Left, s__4Right, s__aHead}
outfits.sayori["4a"] = {s__4Left, s__4Right, s__aHead}
outfits.sayori["4b"] = {s__4Left, s__4Right, s__bHead}
outfits.sayori["4c"] = {s__4Left, s__4Right, s__cHead}
outfits.sayori["4d"] = {s__4Left, s__4Right, s__dHead}
outfits.sayori["4e"] = {s__4Left, s__4Right, s__eHead}
outfits.sayori["4f"] = {s__4Left, s__4Right, s__fHead}
outfits.sayori["4g"] = {s__4Left, s__4Right, s__gHead}
outfits.sayori["4h"] = {s__4Left, s__4Right, s__hHead}
outfits.sayori["4i"] = {s__4Left, s__4Right, s__iHead}
outfits.sayori["4j"] = {s__4Left, s__4Right, s__jHead}
outfits.sayori["4k"] = {s__4Left, s__4Right, s__kHead}
outfits.sayori["4l"] = {s__4Left, s__4Right, s__lHead}
outfits.sayori["4m"] = {s__4Left, s__4Right, s__mHead}
outfits.sayori["4n"] = {s__4Left, s__4Right, s__nHead}
outfits.sayori["4o"] = {s__4Left, s__4Right, s__oHead}
outfits.sayori["4p"] = {s__4Left, s__4Right, s__pHead}
outfits.sayori["4q"] = {s__4Left, s__4Right, s__qHead}
outfits.sayori["4r"] = {s__4Left, s__4Right, s__rHead}
outfits.sayori["4s"] = {s__4Left, s__4Right, s__sHead}
outfits.sayori["4t"] = {s__4Left, s__4Right, s__tHead}
outfits.sayori["4u"] = {s__4Left, s__4Right, s__uHead}
outfits.sayori["4v"] = {s__4Left, s__4Right, s__vHead}
outfits.sayori["4w"] = {s__4Left, s__4Right, s__wHead}
outfits.sayori["4x"] = {s__4Left, s__4Right, s__xHead}
outfits.sayori["4y"] = {s__4Left, s__4Right, s__yHead}

outfits.sayori["5"] = {s_5}
outfits.sayori["5a"] = {s_5a}
outfits.sayori["5b"] = {s_5b}
outfits.sayori["5c"] = {s_5c}
outfits.sayori["5d"] = {s_5d}

bgAlpha = 1
bgTransitionAlpha = 0

charsOnScreen = {}

local audio = {}
--[[
define audio.t6s = "<loop 43.572>bgm/6s.ogg"
define audio.t7 = "<loop 2.291>bgm/7.ogg"
define audio.t7a = "<loop 4.316 to 12.453>bgm/7.ogg"
define audio.t7g = "<loop 31.880>bgm/7g.ogg"
define audio.t8 = "<loop 9.938>bgm/8.ogg"
define audio.t9 = "<loop 3.172>bgm/9.ogg"
define audio.t9g = "<loop 1.532>bgm/9g.ogg"
define audio.t10 = "<loop 5.861>bgm/10.ogg"
define audio.t10y = "<loop 0>bgm/10-yuri.ogg"
define audio.td = "<loop 36.782>bgm/d.ogg"
--]]
audio.t1 = {audio = love.audio.newSource("audio/bgm/1.ogg", "stream"), loop = 22.073}
audio.t2 = {audio = love.audio.newSource("audio/bgm/2.ogg", "stream"), loop = 4.499}
audio.t2g = {audio = love.audio.newSource("audio/bgm/2g.ogg", "stream"), loop = 4.499}
audio.t2g2 = {audio = love.audio.newSource("audio/bgm/2.ogg", "stream"), loop = 4.499, from = 15.255}
audio.t2g3 = {audio = love.audio.newSource("audio/bgm/2g2.ogg", "stream"), loop = 4.492}
audio.t3 = {audio = love.audio.newSource("audio/bgm/3.ogg", "stream"), loop = 4.618}
audio.t3g = {audio = love.audio.newSource("audio/bgm/3g.ogg", "stream"), loop = 4.618, to = 15.255}
audio.t3g2 = {audio = love.audio.newSource("audio/bgm/3.ogg", "stream"), loop = 4.618, from = 15.255}
audio.t3g3 = {audio = love.audio.newSource("audio/bgm/3g2.ogg", "stream"), loop = 4.618}
audio.t3m = {audio = love.audio.newSource("audio/bgm/3.ogg", "stream"), loop = 4.618}
audio.t4 = {audio = love.audio.newSource("audio/bgm/4.ogg", "stream"), loop = 19.451}
audio.t4g = {audio = love.audio.newSource("audio/bgm/4g.ogg", "stream"), loop = 1.000}
audio.t5 = {audio = love.audio.newSource("audio/bgm/5.ogg", "stream"), loop = 4.444}
audio.t5b = {audio = love.audio.newSource("audio/bgm/5.ogg", "stream"), loop = 4.444}
audio.t5c = {audio = love.audio.newSource("audio/bgm/5.ogg", "stream"), loop = 4.444}
audio.t6 = {audio = love.audio.newSource("audio/bgm/6.ogg", "stream"), loop = 10.893}
audio.t6g = {audio = love.audio.newSource("audio/bgm/6g.ogg", "stream"), loop = 10.893}
audio.t6r = {audio = love.audio.newSource("audio/bgm/6g.ogg", "stream"), loop = 0}

local ats = {
    ["t11"] = function(width) -- middle
        return love.graphics.getWidth()/2, 0
    end,
    ["t21"] = function(width) -- left half
        return love.graphics.getWidth()/4, 0
    end,
    ["t22"] = function(width)
        return love.graphics.getWidth()/4*3, 0
    end,
    ["t31"] = function(width)
        return love.graphics.getWidth()/6, 0
    end,
    ["t32"] = function(width)
        return love.graphics.getWidth()/2, 0
    end,
    ["t31"] = function(width)
        return love.graphics.getWidth()/6*5, 0
    end,

    ["s11"] = function(width)
        return love.graphics.getWidth()/2, 30
    end,

    ["thide"] = function(width)
        return -width, 0
    end,

    -- instants
    ["i11"] = function(width)
        return love.graphics.getWidth()/2, 0
    end,
    ["i21"] = function(width)
        return love.graphics.getWidth()/4, 0
    end,
    ["i22"] = function(width)
        return love.graphics.getWidth()/4*3, 0
    end,
    ["i31"] = function(width)
        return love.graphics.getWidth()/6, 0
    end,
    ["i32"] = function(width)
        return love.graphics.getWidth()/2, 0
    end,
    ["i31"] = function(width)
        return love.graphics.getWidth()/6*5, 0
    end,

    ["ihide"] = function(width)
        return -width, 0
    end,

    -- fly in from left
    ["l11"] = function(width)
        return love.graphics.getWidth()/2, 0
    end,
    ["l21"] = function(width)
        return love.graphics.getWidth()/4, 0
    end,
    ["l22"] = function(width)
        return love.graphics.getWidth()/4*3, 0
    end,
    ["l31"] = function(width)
        return love.graphics.getWidth()/6, 0
    end,
    ["l32"] = function(width)
        return love.graphics.getWidth()/2, 0
    end,
    ["l31"] = function(width)
        return love.graphics.getWidth()/6*5, 0
    end,

    ["lhide"] = function(width)
        return -width, 0
    end,
}

function show(who, outfit, settings)
    if not who then return end
    local outfit = outfit or charsOnScreen[who].outfitName or "1"
    local settings = settings or {} -- zorder and at
    local zorder = settings.zorder or 0
    local at = settings.at or "t11"

    local curScale = 0.65
    local scale = 0.75

    local newX, newY = ats[at](outfits[who][outfit][1]:getWidth() * scale)
    newX = newX or 0
    newY = newY or 0
    local x = 0
    local alpha = 1
    if not charsOnScreen[who] then 
        alpha = 0 
        x = newX
    else
        x = charsOnScreen[who].x
        curScale = charsOnScreen[who].scale
        zorder = charsOnScreen[who].zorder
    end
    local hideFound = false
    -- is hide in settings.at?
    if at:find("hide") then
        hideFound = true
    end
    local isInstant = false -- starts with i
    if at:sub(1, 1) == "i" then
        isInstant = true
    end
    local isLeft = false -- starts with l
    if at:sub(1, 1) == "l" then
        isLeft = true
    end
    local y = outfits[who][outfit][1]:getHeight() * scale
    if charsOnScreen[who] then
        x = charsOnScreen[who].x
        y = charsOnScreen[who].y
    end
    charsOnScreen[who] = {
        who = who,
        outfit = outfits[who][outfit],
        outfitName = outfit,
        zorder = zorder,
        at = at,
        x = isLeft and -outfits[who][outfit][1]:getWidth() * scale or x,
        y = y,
        scale = curScale,
        -- no need to adjust position with scale changes
        offsetX = outfits[who][outfit][1]:getWidth()/2, 
        offsetY = outfits[who][outfit][1]:getHeight(),
        alpha = alpha
    }
    if not isInstant then
        Timer.tween(
            (hideFound and 0.25) or (isLeft and 0.25) or (0.125),
            charsOnScreen[who], 
            {
                alpha = 1, 
                scale = scale,
                x = newX,
            }, 
            "linear",
            function()
                if settings.callback then settings.callback() end
                charsOnScreen[who].x = newX
                charsOnScreen[who].y = newY + outfits[who][outfit][1]:getHeight() * scale
            end
        )
        Timer.tween(
            0.25,
            charsOnScreen[who],
            {
                y = newY + outfits[who][outfit][1]:getHeight() * scale
            },
            "out-quad"
        )
    else
        charsOnScreen[who].alpha = 1
        charsOnScreen[who].scale = scale
        charsOnScreen[who].x = newX
        charsOnScreen[who].y = newY + outfits[who][outfit][1]:getHeight() * scale
    end

    table.sort(charsOnScreen, function(a, b)
        return a.zorder < b.zorder
    end)
end

function hide(who)
    charsOnScreen[who] = nil
end

function Gradient(dir, ...)
    -- Check for direction
    local isHorizontal = true
    if dir == "vertical" then
        isHorizontal = false
    elseif dir ~= "horizontal" then
        error("bad argument #1 to 'gradient' (invalid value)", 2)
    end

    -- Check for colors
    local colorLen = select("#", ...)
    if colorLen < 2 then
        error("color list is less than two", 2)
    end

    -- Generate mesh
    local meshData = {}
    if isHorizontal then
        for i = 1, colorLen do
            local color = select(i, ...)
            local x = (i - 1) / (colorLen - 1)

            meshData[#meshData + 1] = {x, 1, x, 1, color[1], color[2], color[3], color[4] or (1)}
            meshData[#meshData + 1] = {x, 0, x, 0, color[1], color[2], color[3], color[4] or (1)}
        end
    else
        for i = 1, colorLen do
            local color = select(i, ...)
            local y = (i - 1) / (colorLen - 1)

            meshData[#meshData + 1] = {1, y, 1, y, color[1], color[2], color[3], color[4] or (1)}
            meshData[#meshData + 1] = {0, y, 0, y, color[1], color[2], color[3], color[4] or (1)}
        end
    end

    -- Resulting Mesh has 1x1 image size
    return love.graphics.newMesh(meshData, "strip", "static")
end

local function createWipeleftGradient()
    -- alpha 0 left, alpha 1 right
    --is love.graphics.getWidth()*2

    local meshData = {}
    for i = 1, 100 do
        local x = (i - 1) / (100 - 1)
        meshData[#meshData + 1] = {x, 0, x, 0, 0, 0, 0, 0}
        meshData[#meshData + 1] = {x, 1, x, 1, 0, 0, 0, 0}
    end
    return love.graphics.newMesh(meshData, "strip", "static")
end

stopDialogue = false

function scene(scene, transition)
    bgTransitionType = "transition"
    if transition == "dissolve_scene_full" then
        stopDialogue = true
        bgTransition = bgs[scene]
        bgTransitionAlpha = 0
        bgTransitionAsset = nil
        Timer.after(1, function()
            Timer.tween(
                1,
                _G,
                {bgTransitionAlpha = 1},
                "linear",
                function()
                    bg = bgs[scene]
                    bgTransition = nil
                    stopDialogue = false
                    print("done")
                    mousepressedDialogue(20, 20, 1)
                end
            )
        end)
    --[[ elseif transition == "wipeleft_scene" then
        stopDialogue = true
        bgTransition = bgs[scene]
        bgTransitionX = 0
        bgTransitionY = 0
        bgTransitionAsset = createWipeleftGradient()
        Timer.after(1, function()
            Timer.tween(
                1,
                _G,
                {bgTransitionX = -love.graphics.getWidth()},
                "linear",
                function()
                    bg = bgs[scene]
                    bgTransition = nil
                    stopDialogue = false
                    print("done")
                    mousepressedDialogue(20, 20, 1)
                end
            )
        end) ]]
    else
        bg = bgs[scene]
    end
end

function stopMusic(time, callback)
    Timer.tween(
        time,
        _G,
        {bgmVolume = 0},
        "linear",
        function()
            bgm:stop()
            if callback then callback() end
        end
    )
end

function playMusic(music, delay, callback)
    bgmVolume = 1
    Timer.after(delay or 0, function()
        local bgm = audio[music]
        love.audio.play(bgm.audio, function(audio)
            audio:seek(bgm.loop)
            love.audio.play(audio, true, "bgm", false)
        end, "bgm", false)
    end)
end