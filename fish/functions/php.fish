function switchphp
    # Check the operating system type
    if test (uname) = "Linux"
        # Linux-specific logic
        if test -f /usr/bin/php
            sudo rm /usr/bin/php
        end
        sudo ln -s /usr/bin/php$argv /usr/bin/php

    else if string match -q "Darwin" (uname)
        # macOS-specific logic
        brew unlink php
        brew link --force --overwrite php@$argv
    end
end
