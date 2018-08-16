#!/bin/sh

sed -i.default "s/^;zend_extension=/zend_extension=/" /usr/local/etc/php/7.1/conf.d/ext-xdebug.ini

launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.php71.plist
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.php71.plist

sudo brew services restart php71

echo "xdebug enabled"
