function dbdown
    pkill -f "ssh -fN tunnel-"
    echo "🛑 All database tunnels closed."
end
