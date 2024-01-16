local ch0 = {}

function ch0:updateDialogue(cl)
    if cl == 1 then
        stopMusic(2)
        scene("residential_day", "dissolve_scene_full")
        playMusic("t2", 2)
        if stopDialogue then return end
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
        show("sayori", "4p", {zorder = 2, at = "l11"})
        say("s", "Haaahhh...haaahhh...")
    elseif cl == 9 then
        say("s", "I overslept again!")
    elseif cl == 10 then
        say("s", "But I caught you this time!")
    elseif cl == 11 then
        say("mc", "Maybe, but only because I decided to stop and wait for you.")
    elseif cl == 12 then
        show("sayori", "5c", {zorder = 0, at = "s11"})
        say("s", "Eeehhhhh, you say that like you were thinking about ignoring me!")
    elseif cl == 13 then
        say("s", "That's mean, [player]!")
    elseif cl == 13 then
        say("mc", "Well, if people stare at you for acting weird, then I don't want them to think we're a couple or something.")
    elseif cl == 14 then
        show("sayori", "1a", {zorder = 2, at = "t11"})
        say("s", "Fine, fine.")
    elseif cl == 15 then
        say("s", "But you did wait for me, after all.")
    elseif cl == 16 then
        say("s", "I guess you don't have it in you to be mean, even if you want to~")
    elseif cl == 17 then
        say("mc", "Whatever you say, Sayori...")
    elseif cl == 18 then
        show("sayori", "1q", {zorder = 1, at = "t11"})
        say("s", "Ehehe~")
    elseif cl == 19 then
        show("sayori", "1q", {zorder = 0, at = "thide", moveCallback = function() 
                hide("sayori") 
                say("", "We cross the street together and make our way to school.") 
        end})
    elseif cl == 20 then
        say("", "As we draw near, the streets become increasingly speckled with other students making their daily commute.")
    elseif cl == 21 then
        show("sayori", "3a", {zorder = 2, at = "t11"})
        say("s", "By the way, [player]...")
    elseif cl == 22 then
        say("s", "Have you decided on a club to join yet?")
    elseif cl == 23 then
        say("mc", "A club?")
    elseif cl == 24 then
        say("mc", "I told you already, I'm really not interested in joining any clubs.")
    elseif cl == 25 then
        say("mc", "I haven't been looking, either.")
    elseif cl == 26 then
        show("sayori", "4h", {zorder = 0, at = "s11"})
        say("s", "Eeeehhh? That's not true!")
    elseif cl == 27 then
        say("s", "You told me you would join a club this year!")
    elseif cl == 28 then
        say("mc", "Did I...?")
    elseif cl == 29 then
        say("", "I'm sure it's possible that I did, in one of our many conversations where I dismissively go along with whatever she's going on about.")
    elseif cl == 30 then
        say("", "Sayori likes to worry a little too much about me, when I'm perfectly content just getting by on the average while spending my free time on games and anime.")
    elseif cl == 31 then
        show("sayori", "4j", {zorder = 2, at = "t11"})
        say("s", "Uh-huh!")
    elseif cl == 32 then
        say("s", "I was talking about how I'm worried that you won't learn how to socialize or have any skills before college.")
    elseif cl == 33 then
        say("s", "Your happiness is really important to me, you know!")
    elseif cl == 34 then
        say("s", "And I know you're happy now, but I'd die at the thought of you becoming a NEET in a few years because you're not used to the real world.")
    elseif cl == 35 then
        show("sayori", "4g", {zorder = 2, at = "s11"})
        say("s", "You trust me, right?")
    elseif cl == 36 then
        say("s", "Don't make me keep worrying about you...")
    elseif cl == 37 then
        say("mc", "Alright, alright.")
    elseif cl == 38 then
        say("mc", "I'll look at a few clubs if it makes you happy.")
    elseif cl == 39 then
        say("mc", "No promises, though.")
    elseif cl == 40 then
        show("sayori", "1h", {zorder = 0, at = "s11"})
        say("s", "Will you at least promise me you'll try a little?")
    elseif cl == 41 then
        say("mc", "Yeah, I guess I'll promise you that.")
    elseif cl == 42 then
        show("sayori", "4r", {zorder = 2, at = "t11"})
        say("s", "Yay!")
    elseif cl == 43 then
        say("", "Why do I let myself get lectured by such a carefree girl?")
    elseif cl == 44 then
        say("", "More than that, I'm surprised I even let myself relent to her.")
    elseif cl == 45 then
        say("", "I guess seeing her worry so much about me makes me want to ease her mind at least a little bit, even if she does exaggerate everything inside of her head.")
    elseif cl == 46 then
        scene("class_day", "wipeleft_scene") -- TODO: make this work.
        say("", "The school day is as ordinary as ever, and it's over before I know it.")
    elseif cl == 47 then
        say("", "After I pack up my things, I stare blankly at the wall, looking for an ounce of motivation.")
    elseif cl == 48 then
        say("mc", "Clubs...")
    elseif cl == 49 then
        say("", "Sayori wants me to check out some clubs.")
    elseif cl == 50 then
        say("", "I guess I have no choice but to start with the anime club.")
    elseif cl == 51 then
        show("sayori", "1b", {zorder = 2, at = "t11"})
        say("s", "Hellooo?")
    elseif cl == 52 then
        say("mc", "Sayori...?")
    elseif cl == 53 then
        say("", "Sayori must have come into the classroom while I was spacing out.")
    elseif cl == 54 then
        say("", "I look around and realize that I'm the only one left in the classroom.")
    elseif cl == 55 then
        show("sayori", "1b", {zorder = 2, at = "t11"})
        say("s", "I thought I'd catch you coming out of the classroom, but I saw you just sitting here and spacing out, so I came in.")
    elseif cl == 56 then
        say("s", "Honestly, you're even worse than me sometimes... I'm impressed!")
    elseif cl == 57 then
        say("mc", "You don't need to wait up for me if it's going to make you late to your own club.")
    elseif cl == 58 then
        show("sayori", "1y", {zorder = 2, at = "t11"})
        say("s", "Well, I thought you might need some encouragement, so I thought, you know...")
    elseif cl == 59 then
        say("mc", "Know what?")
    elseif cl == 60 then
        show("sayori", "1a", {zorder = 2, at = "t11"})
        say("s", "Well, that you could come to my club!")
    elseif cl == 61 then
        say("mc", "Sayori...")
    elseif cl == 62 then
        say("s", "Yeah??")
    elseif cl == 63 then
        say("mc", "...There is no way I'm going to your club.")
    elseif cl == 64 then
        show("sayori", "5d", {zorder = 2, at = "s11"})
        say("s", "Eeeehhh?! Meanie!")
    elseif cl == 65 then
        say("", "Sayori is vice president of the Literature Club.")
    elseif cl == 66 then
        say("", "Not that I was ever aware that she had any interest in literature.")
    elseif cl == 67 then
        say("", "In fact, I'm 99% sure she only did it because she thought it would be fun to help start a new club.")
    elseif cl == 68 then    
        say("", "Since she was the first one to show interest after the one who proposed the club, she inherited the title \"Vice President\".")
    elseif cl == 69 then
        say("", "That said, my interest in literature is guaranteed to be even less.")
    elseif cl == 70 then
        say("mc", "Yeah, I'm going to the anime club.")
    elseif cl == 71 then
        show("sayori", "1g", {zorder = 2, at = "t11"})
        say("s", "C'mon, please?")
    elseif cl == 72 then
        say("mc", "Why do you care so much, anyway?")
    elseif cl == 73 then
        show("sayori", "5b", {zorder = 2, at = "t11"})
        say("s", "Well...")
    elseif cl == 74 then
        say("s", "I kinda told the club yesterday I would bring in a new member...")
    elseif cl == 75 then
        say("s", "And Natsuki made cupcakes and everything...")
    elseif cl == 76 then
        say("s", "Ehehe...")
    elseif cl == 77 then
        say("mc", "Don't make promises you can't keep!")
    elseif cl == 78 then
        say("", "I can't tell if Sayori is really that much of an airhead, or if she's so cunning as to have planned all of this out.")
    elseif cl == 79 then
        say("", "I let out a long sigh.")
    elseif cl == 80 then
        say("mc", "Fine, I'll stop by for a cupcake, okay?")
    elseif cl == 81 then
        show("sayori", "4r", {zorder = 2, at = "t11"})
        say("s", "Yes! Let's go~!")
    elseif cl == 82 then
        stopMusic(2, function() mousepressedDialogue(0, 0, 1) end)
        scene("corridor", "wipeleft_scene")
    elseif cl == 83 then
        say("", "And thus, today marks the day I sold my soul for a cupcake.")
    elseif cl == 84 then
        say("", "I dejectedly follow Sayori across the school and upstairs, a section of the school I rarely visit, being generally used for third-year classes and activities.")
    elseif cl == 85 then
        say("", "Sayori, full of energy, swings open the classroom door.")
    elseif cl == 86 then
        scene("club_day", "wipeleft")
        playMusic("t3", 0)
        show("sayori", "4a", {zorder = 2, at = "l41"})
        say("s", "Everyone! The new member is here~!")
    elseif cl == 87 then
        say("mc", "I told you, don't call me a \"new member--\"")
    elseif cl == 88 then
        say("", "Eh? I glance around the room.")
    end
end

return ch0