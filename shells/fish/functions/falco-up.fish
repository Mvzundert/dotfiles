function falco-up --description "Deploy or upgrade Falco in the kind cluster via Helm"
    # WARNING: Falco's modern eBPF driver requires CAP_BPF / CAP_SYS_ADMIN in the
    # initial user namespace. It will NOT work in a rootless Podman kind cluster.
    # Use this helper only if you recreate the cluster with rootful Podman/Docker.
    if not type -q helm
        echo "helm not found in PATH" >&2
        return 1
    end

    helm repo add falcosecurity https://falcosecurity.github.io/charts
    helm repo update falcosecurity
    helm upgrade --install falco falcosecurity/falco \
        --namespace falco \
        --create-namespace \
        --set driver.kind=modern_ebpf \
        --set collectors.containerEngine=containerd \
        --set collectors.kubernetes.enabled=true \
        --set tty=true \
        $argv
end
