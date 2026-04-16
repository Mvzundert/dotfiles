function dbup
    # Find all hosts starting with 'tunnel-' in your tunnels file
    set -l tunnel_hosts (grep -i "^Host tunnel-" ~/.ssh/conf.d/tunnels | awk '{print $2}')

    for host in $tunnel_hosts
        if not pgrep -f "ssh -fN $host" > /dev/null
            ssh -fN $host
            echo "🚀 $host is now UP"
        else
            echo "🔗 $host was already running"
        end
    end
end

function dbdown
    pkill -f "ssh -fN tunnel-"
    echo "🛑 All database tunnels closed."
end
