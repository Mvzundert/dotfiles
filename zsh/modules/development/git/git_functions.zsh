# -------------------------------------------------------------------
# Remove a file from gits history entirely
# -------------------------------------------------------------------
function git_history_remove() {
    if ! [[ -d "$(pwd)/.git" ]]; then
        echo "Halt: .git folder not found"

        return 0
    fi

    if [[ $# -eq 0 ]]; then
        echo "Halt: no target given"

        return 0
    else
        TARGET=$1
    fi

    read "?Are you sure you want to remove '$TARGET' from the git history? "

    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo # Whitespace

        git stash

        echo -e "\nRemoving '$TARGET' from history"
        git filter-branch --tree-filter 'rm -rf $FOLDER' --prune-empty HEAD

        echo -e "\nRemoving '$TARGET' references"
        git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d

        echo -e "\nStarting garbage collection"
        git gc --prune=all --aggressive

        echo # Whitespace

        git stash pop
    fi
}
