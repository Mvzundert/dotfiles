function search_abbr_alias
    set choice (echo -e "Abbreviations\nAliases\nFunctions" | fzf --prompt="Select: " --height=10 --border --reverse)

    switch $choice
        case "Abbreviations"
            abbr --show | fzf --height=15 --border --reverse
        case "Aliases"
            alias | fzf --height=15 --border --reverse
        case "Functions"
            functions | fzf --height=15 --border --reverse
    end
end

