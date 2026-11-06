# === Use bat for man pages if available, otherwise fall back to less ===
if command -q bat
    set -gx MANPAGER "bat -plman"
else
    set -gx MANPAGER less
end
