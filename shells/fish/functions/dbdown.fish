function dbdown --description "Close all database SSH tunnels"
    pkill -f "ssh -fN tunnel-"
    echo "🛑 All database tunnels closed."
end
