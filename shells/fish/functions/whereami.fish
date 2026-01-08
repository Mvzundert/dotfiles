function whereami
    if test (uname) = "Darwin"
        echo "🍎 You are on the MacBook. Shiny, isn't it?" | lolcat
    else if test -f /etc/arch-release
        echo "🏔️ You are on the Arch Desktop. Living on the edge!" | lolcat
    else
        echo "🌌 I'm not sure where we are, but the shell is nice." | lolcat
    end
end
