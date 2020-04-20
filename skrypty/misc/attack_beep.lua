misc["attack_beep"] = misc["attack_beep"] or { ["mode"] = 1 }

function misc.attack_beep:set_attack_level(mode)
    if mode ~= 0 and mode ~= 1 and mode ~= 2 then
        error("Wrong input")
    end

    if mode == 0 then
        scripts:print_log("Ok, nie beepuje")
    elseif mode == 1 then
        scripts:print_log("Ok, beepuje wrogow")
    else
        scripts:print_log("Ok, beepuje wszystkich")
    end

    misc.attack_beep["mode"] = mode
end

function misc.attack_beep:process_attack(who)
    local lowered_who = nil

    if table.size(string.split(who, " ")) == 1 then
        lowered_who = who
    else
        lowered_who = string.lower(who)
    end

    if misc.attack_beep["mode"] == 1 then
        if scripts.people.enemy_suffix[lowered_who] == "" or scripts.people.enemy_suffix[lowered_who] then
            raiseEvent("playBeep")
            raiseEvent("miscAttackBeepModeOne")
        end
    elseif misc.attack_beep["mode"] == 2 then
        raiseEvent("playBeep")
        raiseEvent("miscAttackBeepModeTwo")
    end
end

function alias_func_skrypty_misc_attack_beep_set_level()
    misc.attack_beep:set_attack_level(tonumber(matches[2]))
end
