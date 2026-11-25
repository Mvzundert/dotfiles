function kind-rootless --description "Run kind through rootless Podman with delegated cgroups"
    env KIND_EXPERIMENTAL_PROVIDER=podman \
        systemd-run --scope --user -p Delegate=yes \
        kind $argv
end
