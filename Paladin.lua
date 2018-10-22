function LevelUP1 (event, player) --If the player levelup
                if player:GetClass() == 2 then --If the player class is Paladin
                if (player:GetLevel() == 1) then --If the player level 1
                player:LearnSpell(465) -- Devotion Aura
                elseif (player:GetLevel() == 4) then --If the player level 4
		player:LearnSpell(19740) --Blessing of Might (Rank 1)
                player:LearnSpell(20271) --Judgement of Light.
                elseif (player:GetLevel() == 6) then --If the player level 6
                player:LearnSpell(639) --Holy Light
                player:LearnSpell(498) --Divine Protection
		player:LearnSpell(3127) --Parry
                elseif (player:GetLevel() == 8) then --If the player level 8
                player:LearnSpell(1152) --Purify
                player:LearnSpell(853) --Hammer Of Justice
                elseif (player:GetLevel() == 10) then --If the player level 10
                player:LearnSpell(633) --Lay On Hand
                player:LearnSpell(10290) --Devotion Aura
                player:LearnSpell(1022) --Hand Of Protection
                elseif (player:GetLevel() == 12) then --If the player level 12
                player:LearnSpell(19834) --Blessing Of Might
                player:LearnSpell(53408) --Judgment Of Wisdom
                elseif (player:GetLevel() == 14) then --If the player level 14
                player:LearnSpell(19742) --Belesing Of Wisdom
                player:LearnSpell(31789) --Righteous Defence
				player:LearnSpell(647) --Holy Light
				player:LearnSpell(7328) --redemp
                elseif (player:GetLevel() == 16) then --If the player level 16
                player:LearnSpell(62124) --Hand Of Reckoning
                player:LearnSpell(25780) --Righteous Fury
                player:LearnSpell(7294) --Ret Aura
                elseif (player:GetLevel() == 18) then --If the player level 18
                player:LearnSpell(1044) --Hand Of Freedom
                elseif (player:GetLevel() == 20) then --If the player level 20
                player:LearnSpell(26573) --Consectration
                player:LearnSpell(879) --exorcism
                player:LearnSpell(19750) --Flash Of Light
                player:LearnSpell(5502) --Send Undead
                player:LearnSpell(13819) --Mount
				player:LearnSpell(20217) --Belessing Of King
				player:LearnSpell(643) --Def Aura
                elseif (player:GetLevel() == 22) then --If the player level 22
                player:LearnSpell(19746) --Conser Aura
                player:LearnSpell(1026) --Holy Light
				player:LearnSpell(20164) --Seal Of Jus
				player:LearnSpell(19835) --Belessing Of Might
                elseif (player:GetLevel() == 24) then --If the player level 24
                player:LearnSpell(19850) --Belessing of Wisdom
                player:LearnSpell(10326) --Turn Evil
				player:LearnSpell(10322) --res
                player:LearnSpell(5588) --hammer Of just
                player:LearnSpell(5599) --Hand Of Protection
                elseif (player:GetLevel() == 26) then --If the player level 26
                player:LearnSpell(19939) --Flash Of Light
                player:LearnSpell(1038) --hand Of Salvation
				player:LearnSpell(10298) --Ret Aura
                elseif (player:GetLevel() == 28) then --If the player level 28
                player:LearnSpell(5614) --exoricism
                player:LearnSpell(19876) --Shadow res Aura
				player:LearnSpell(53407) --Judge Justic
                elseif (player:GetLevel() == 30) then --If the player level 30
		player:LearnSpell(20116) --Conser
                player:LearnSpell(1042) --Holy Light
                player:LearnSpell(2800) --lay On Hand
                player:LearnSpell(20165) --Seal Of light
                player:LearnSpell(10291) --Devotion Aura
				player:LearnSpell(19752) --Divine Intervention
                elseif (player:GetLevel() == 32) then --If the player level 32
                player:LearnSpell(19888) --Frost res Aura
                player:LearnSpell(19836) --Blessing of Might
                elseif (player:GetLevel() == 34) then --If the player level 34
                player:LearnSpell(19852) --Blessing Of Wisdom
                player:LearnSpell(19940) --Flash Of light
				player:LearnSpell(642) --Devin Shild
                elseif (player:GetLevel() == 36) then --If the player level 36
                player:LearnSpell(5615) --exor
				player:LearnSpell(19891) --Fire Res aura
				player:LearnSpell(10299) --Ret Aura
				player:LearnSpell(10324) --res
                elseif (player:GetLevel() == 38) then --If the player level 38
                player:LearnSpell(3472) --Holy Light
                player:LearnSpell(20166) --Seal Of wisdom
                player:LearnSpell(10278) --Hand Of protection
                elseif (player:GetLevel() == 40) then --If the player level 40
				player:LearnSpell(33391) --Riding
				player:LearnSpell(750) --Plate Mail
				player:LearnSpell(23214) --Mount
                player:LearnSpell(20922) --Conser
                player:LearnSpell(1032) --Dev Aura
                player:LearnSpell(5589) --hammer Of jus
                player:LearnSpell(19895) --Shadow Res Aura
                elseif (player:GetLevel() == 42) then --If the player level 42
                player:LearnSpell(4987) --Cleans
				player:LearnSpell(19941) --Flash of Light
				player:LearnSpell(19837) --Blessing Of Might
                elseif (player:GetLevel() == 44) then --If the player level 44
                player:LearnSpell(19853) --Blessing Of Wisdom
                player:LearnSpell(10312) --exoricism
				player:LearnSpell(19897) --Frost Res Aura
				player:LearnSpell(24275) --Hammer Of Wrath
                elseif (player:GetLevel() == 46) then --If the player level 46
                player:LearnSpell(10300) --ret Aura
                player:LearnSpell(6940) --sacrfice
				player:LearnSpell(10328) --Holy Light
                elseif (player:GetLevel() == 48) then --If the player level 48
                player:LearnSpell(19899) --Fire Res Aura
				player:LearnSpell(20772) --res
                elseif (player:GetLevel() == 50) then --If the player level 50
                player:LearnSpell(20923) --COns
                player:LearnSpell(19942) --Flash Of Light
                player:LearnSpell(2812) --Holy Wrath
				player:LearnSpell(10310) --Lay of Hand
				player:LearnSpell(10292) --dev Aura
                elseif (player:GetLevel() == 52) then --If the player level 52
                player:LearnSpell(10313) --Battle Shout level 6
				player:LearnSpell(19896) --Shadow Res Aura
				player:LearnSpell(19838) --Blessing Of Might
				player:LearnSpell(25782) --Greather Blessing Of Might
				player:LearnSpell(24274) --Hammer Of Wrath
                elseif (player:GetLevel() == 54) then --If the player level 54
                player:LearnSpell(19854) --Blessing Of wisdom
				player:LearnSpell(25894) --
				player:LearnSpell(10329) --Holy Light
                player:LearnSpell(10308) --hammer Of Just
                elseif (player:GetLevel() == 56) then --If the player level 56
                player:LearnSpell(19898) --Frost res Aura
                player:LearnSpell(10301) --ret Aura
                elseif (player:GetLevel() == 58) then --If the player level 58
                player:LearnSpell(19943) --Flash Of Light
                elseif (player:GetLevel() == 60) then --If the player level 60
				player:LearnSpell(34090) --Riding
                player:LearnSpell(25290) --
                player:LearnSpell(20924) --
                player:LearnSpell(10314) --
                player:LearnSpell(25918) --
                player:LearnSpell(25292) --
                player:LearnSpell(10318) --Holy Wrath
				player:LearnSpell(10293) --Dev Aura
				player:LearnSpell(19900) --Fire res Aura
				player:LearnSpell(25898) --
				player:LearnSpell(25291) --
				player:LearnSpell(25916) --
				player:LearnSpell(24239) --Hammer Of Wrath
				player:LearnSpell(20773) --Res
                elseif (player:GetLevel() == 62) then --If the player level 62
				player:LearnSpell(27135) --Holy Light
                player:LearnSpell(32223) --Crusadar Aura
                elseif (player:GetLevel() == 63) then --If the player level 63
                player:LearnSpell(27151) --Shadow Res Aura
                elseif (player:GetLevel() == 64) then --If the player level 64
                player:LearnSpell(31801) --Seal Of Vengens
                elseif (player:GetLevel() == 65) then --If the player level 65
                player:LearnSpell(27142) --Blessing Of Wisdom
				player:LearnSpell(27143) --
                elseif (player:GetLevel() == 66) then --If the player level 66
                player:LearnSpell(27137) --Flash Of Light
                player:LearnSpell(27150) --Ret Aura
                elseif (player:GetLevel() == 68) then --If the player level 68
                player:LearnSpell(27138) --exoricism
                player:LearnSpell(27152) --Frost Res Aura
                player:LearnSpell(27180) --Hammer of Wrath
                elseif (player:GetLevel() == 69) then --If the player level 69
                player:LearnSpell(27139) --HOly Wrath
                player:LearnSpell(27154) --Lay On hands
                elseif (player:GetLevel() == 70) then --If the player level 70
                player:LearnSpell(27173) --Consertration
                player:LearnSpell(27136) --Holy light
                player:LearnSpell(27149) --Dev Aura
                player:LearnSpell(27153) --Fire Res Aura 
                player:LearnSpell(31884) --Avenging Wrath
				player:LearnSpell(27140) --Blessing Of might
				player:LearnSpell(27141) --
                elseif (player:GetLevel() == 71) then --If the player level 71
                player:LearnSpell(48935) --Blessing Of Wisdom
				player:LearnSpell(48937) --
                player:LearnSpell(54428) --Divine Plea
                elseif (player:GetLevel() == 72) then --If the player level 72
                player:LearnSpell(48816) --Holy Wrath
				player:LearnSpell(48949) --Res
                elseif (player:GetLevel() == 73) then --If the player level 73
                player:LearnSpell(48800) --Exoric
                player:LearnSpell(48931) --Blessing Of Might
				player:LearnSpell(48933) --
                elseif (player:GetLevel() == 74) then --If the player level 74
                player:LearnSpell(48784) --Flash Of Light
                player:LearnSpell(48941) --Dev Aura
				player:LearnSpell(48805) --Hammer Of Wrath
                elseif (player:GetLevel() == 75) then --If the player level 75
                player:LearnSpell(48818) --Conser
                player:LearnSpell(53600) --Shield Of right
				player:LearnSpell(48781) --Holy Light
                elseif (player:GetLevel() == 76) then --If the player level 76
                player:LearnSpell(48943) --Shadow Res Aura
                player:LearnSpell(54043) --Ret Aura
                elseif (player:GetLevel() == 77) then --If the player level 77
				player:LearnSpell(54197) --Riding
                player:LearnSpell(48936) --Blessing Of Wisdom
				player:LearnSpell(48938) --
				player:LearnSpell(48945) --Frost Res Aura
                elseif (player:GetLevel() == 78) then --If the player level 78
                player:LearnSpell(48817) --holy Wrath
                player:LearnSpell(48788) --Lay On Hand
				player:LearnSpell(48947) --Fire Res Aura
                elseif (player:GetLevel() == 79) then --If the player level 79
                player:LearnSpell(48801) --exoricism
                player:LearnSpell(48785) --Flash Of Light
				player:LearnSpell(48942) --Dev Aura
				player:LearnSpell(48932) --Blessing Of Might
				player:LearnSpell(48934) --
				player:LearnSpell(48950) --Ress
                elseif (player:GetLevel() == 80) then --If the player level 80
                player:LearnSpell(48819) --Conser
                player:LearnSpell(48782) --Holy Light
                player:LearnSpell(53601) --Sacred Shild
                player:LearnSpell(61411) --Shild Of Right
                player:LearnSpell(48806) --Hammer Of Wrath
end
end
end
 
RegisterPlayerEvent(13, LevelUP1) --Last call LUA directly the internal parameters