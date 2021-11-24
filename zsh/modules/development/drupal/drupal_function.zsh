# -------------------------------------------------------------------
# Checks if drush is installed in vendor folder or if we should use global one.
# -------------------------------------------------------------------
function get_drush_install() {
    if [ -f vendor/drush/drush/drush ]; then
        echo './vendor/drush/drush/drush'
    else
        echo 'drush'
    fi
}
