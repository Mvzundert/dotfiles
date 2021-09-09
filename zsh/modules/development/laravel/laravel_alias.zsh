alias art='run_laravel_artisan'
alias artg="art list | grep"
alias artr="art route:list"
alias artrg="art route:list | grep"
alias artmr="art migrate:refresh"
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