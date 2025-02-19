function extract
    if test (count $argv) -ne 1
        echo "Usage: extract <file>"
        return 1
    end

    set -l file $argv[1]

    if not test -f "$file"
        echo "Error: '$file' does not exist!"
        return 1
    end

    switch $file
        case '*.tar.gz' '*.tgz'
            tar -xvzf "$file"
        case '*.tar.bz2' '*.tbz2'
            tar -xvjf "$file"
        case '*.tar.xz' '*.txz'
            tar -xvJf "$file"
        case '*.tar'
            tar -xvf "$file"
        case '*.zip'
            unzip "$file"
        case '*.rar'
            unrar x "$file"
        case '*.7z'
            7z x "$file"
        case '*.gz'
            gunzip "$file"
        case '*.bz2'
            bunzip2 "$file"
        case '*.xz'
            unxz "$file"
        case '*.zst'
            unzstd "$file"
        case '*'
            echo "Error: Unsupported file format!"
            return 1
    end

    echo "Extraction complete!"
end
