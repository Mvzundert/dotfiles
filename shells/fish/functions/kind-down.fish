function kind-down --description "Delete a rootless Podman kind cluster"
    kind-rootless delete cluster $argv
end
