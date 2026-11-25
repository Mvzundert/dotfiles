# Kubernetes convenience aliases
alias kube='kubectl'
alias kg='kubectl get'
alias kn='kubectl get nodes'
alias kp='kubectl get pods'
alias kpa='kubectl get pods --all-namespaces'

# kind clusters and Kubernetes contexts
alias kind-ls='kind-rootless get clusters'
alias kcontexts='kubectl config get-contexts'
alias kcurrent='kubectl config current-context'
alias kuse='kubectl config use-context'
