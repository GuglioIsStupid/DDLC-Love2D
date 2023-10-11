local ch0 = {}

function ch0:updateDialogue(cl)
    --print("ch0:updateDialogue("..cl..")")
    if cl == 1 then
        sayers["s"] = "???"
        say("s", "Heeeeeeeyyy!!")
    elseif cl == 2 then
        say("", "I see an annoying girl running toward me from the distance, waving her arms in the air like she's totally oblivious to any attention she might draw to herself.")
    elseif cl == 3 then
        say("", "That girl is Sayori, my neighbor and good friend since we were children.")
    elseif cl == 4 then
        say("", "You know, the kind of friend you'd never see yourself making today, but it just kind of works out because you've known each other for so long?")
    elseif cl == 5 then
        say("", "We used to walk to school together on days like this, but starting around high school she would oversleep more and more frequently, and I would get tired of waiting up.")
    elseif cl == 6 then
        say("", "But if she's going to chase after me like this, I almost feel better off running away.")
    elseif cl == 7 then
        say("", "However, I just sigh and idle in front of the crosswalk and let Sayori catch up to me.")
    elseif cl == 8 then
        sayers["s"] = "Sayori"
        show("sayori", "4p", {zorder = 2, at = "t11"})
        say("s", "Haaahhh...haaahhh...")
    elseif cl == 9 then
        say("s", "I overslept again!")
    elseif cl == 10 then
        say("s", "But I caught you this time!")
    elseif cl == 11 then
        say("mc", "Maybe, but only because I decided to stop and wait for you.")
    end
end

return ch0