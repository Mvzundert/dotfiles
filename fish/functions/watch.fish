function watch
    set -l has_npm (test -f package.json; and echo true)
    set -l has_yarn (test -f yarn.lock; and echo true)
    set -l has_bun (test -f bun.lockb; and echo true)
    set -l has_deno (test -f deno.json -o -f deno.jsonc; and echo true)

    if test "$has_bun" = "true"
        echo "Using Bun to watch..."
        bun run dev
    else if test "$has_yarn" = "true"
        echo "Using Yarn to watch..."
        yarn run dev
    else if test "$has_npm" = "true"
        echo "Using NPM to watch..."
        npm run dev
    else if test "$has_deno" = "true"
        echo "Using Deno to watch..."
        deno task dev
    else
        echo "No package manager detected! Are you in a valid project?"
        return 1
    end
end
