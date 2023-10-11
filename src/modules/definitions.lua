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

outfits.sayori["4p"] = {
    love.graphics.newImage("images/sayori/2l.png"), -- left
    love.graphics.newImage("images/sayori/2r.png"), -- right
    love.graphics.newImage("images/sayori/p.png"), -- head
}

charsOnScreen = {}

function show(who, outfit, settings)
    if not who then return end
    if not outfit then return end
    local settings = settings or {} -- zorder and at
    local zorder = settings.zorder or 0
    local at = settings.at or "t11"

    local offsetX = outfits[who][outfit][3]:getWidth() / 2

    table.insert(charsOnScreen, {
        who = who,
        outfit = outfits[who][outfit],
        zorder = zorder,
        at = at,
        x = 0,
        y = 200,
        scale = 1,
        offsetX = offsetX,
        offsetY = 0
    })

    table.sort(charsOnScreen, function(a, b)
        return a.zorder < b.zorder
    end)
end