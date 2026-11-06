function whereami --description "Display a themed message about the current system"
    set -l msg
    if test (uname) = "Darwin"
        set msg "🍎 You are on the MacBook. Shiny, isn't it?"
    else if test -f /etc/arch-release
        set msg "🏔️ You are on the Arch Desktop. Living on the edge!"
    else
        set msg "🌌 I'm not sure where we are, but the shell is nice."
    end

    if command -q lolcat
        echo "$msg" | lolcat
    else
        echo "$msg"
    end
end
