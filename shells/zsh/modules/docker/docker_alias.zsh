alias dockers='open -a Docker'
alias dcrm='docker rm $(docker ps -a -q)'
alias dcirm='docker rmi $(docker images -q)'
alias dcw='docker compose exec workspace bash'
alias dcs='docker compose stop'
alias dcu='docker compose up -d'
alias dcuv='docker compose up'
alias dcb='docker compose build'
alias dcrn='docker exec -it crb_dock_nginx bash -c "nginx -s reload"'

# -------------------------------------------------------------------
# LazyDocker alias
# -------------------------------------------------------------------
alias ldoc='lazydocker'
