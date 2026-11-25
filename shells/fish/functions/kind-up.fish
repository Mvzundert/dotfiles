function kind-up --description "Create a rootless Podman kind cluster"
    kind-rootless create cluster $argv
end
