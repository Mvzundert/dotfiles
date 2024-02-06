alias art='run_laravel_artisan'
alias artg="art list | ack"
alias artr="art route:list"
alias artrg="art route:list | ack"
alias artmr="art migrate:fresh"
alias artmrs="art migrate:refresh --seed"
# Do building magic of project with actual dependency checks
alias build="build_project_assets"
# Do watching magic of project with actual dependency checks
alias watch="watch_project_assets"
# Get all translations from app and resourses
alias arttg="art translations:find && art translations:import"
# Clean all translations
alias arttc="art translations:clean"
# Export translations
alias artte="art translations:export"
# Start the queue worker once
alias artqw="art queue:work --once"
# Do all the IDE helper stuff
alias artide=" art ide-helper:models && art ide-helper:meta && art ide-helper:generate"

# -------------------------------------------------------------------
# Artisan when using Sail
# -------------------------------------------------------------------
alias sail="[ -f sail ] && bash sail || bash vendor/bin/sail"
alias sart="sail artisan"
alias sdcu="sail up -d"
alias sdcs="sail stop"
alias sdcd="sail up"

# -------------------------------------------------------------------
# Artisan shortcuts when using Sail
# -------------------------------------------------------------------
alias sartg="sart list | ack"
alias sartr="sart route:list"
alias sartrg="sart route:list | ack"
alias sartmr="sart migrate:refresh"
alias sartmrs="sart migrate:refresh --seed"
alias sartqw="sart queue:work --once"

# -------------------------------------------------------------------
# Composer when using sail
# -------------------------------------------------------------------
alias sci="sail composer install"
alias scu="sail composer update"
alias scr="sail composer require"

# -------------------------------------------------------------------
# NPM when using sail
# -------------------------------------------------------------------
alias sni="sail npm install"
alias snu="sail npm update"
alias snt="sail npm run test"
alias snw="sail npm run watch"
alias snb="sail npm run build"
alias snd="sail npm run dev"
