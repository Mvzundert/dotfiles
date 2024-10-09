## Rails
alias rc='rails console'
alias rs='rails server'
alias rg='rails generate'

# Rails db
alias rd='rails db'
alias rdm='rails db:migrate'
alias rds='rails db:seed'
alias rdc='rails db:create'
alias rdd='rails db:drop'
alias rdsb='rails db:setup'
alias rdt='rails db:test:prepare'
alias rdtm='rails db:test:migrate'

## Kamal
alias kamal='docker run -it --rm -v "${PWD}:/workdir" -v "/run/host-services/ssh-auth.sock:/run/host-services/ssh-auth.sock" -e SSH_AUTH_SOCK="/run/host-services/ssh-auth.sock" -v "$HOME/.ssh:/root/.ssh" -v /var/run/docker.sock:/var/run/docker.sock ghcr.io/basecamp/kamal:latest'
