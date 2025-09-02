function _zoxide_chpwd_hook
    if test -f ./.php-version
        set -l target_version (cat .php-version)

        switchphp -q "$target_version"
    end
end
