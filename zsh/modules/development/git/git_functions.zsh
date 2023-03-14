# -------------------------------------------------------------------
# Update githooks from template dir
# -------------------------------------------------------------------
function git_update_hooks() {
    if ! [[ -d "$(pwd)/.git" ]]; then
        echo -e "\033[31mHalt:\033[0m .git directory not found"
        return 0
    fi

    if ! [[ -d "${HOME}/.git-template/template/hooks" ]]; then
        echo -e "\033[31mHalt:\033[0m .git-templates directory not found"
        return 0
    fi

    cp "${HOME}"/.git-template/template/hooks/* ./.git/hooks/
}

# ------------------------------------------------------------------
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

# -------------------------------------------------------------------
# Update Git committer by mailmap
# -------------------------------------------------------------------
function git_update_committer_by_mailmap() {
    if ! [[ -d "$(pwd)/.git" ]]; then
        echo "Halt: .git folder not found"
        return 0
    fi

    if [[ $# -eq 0 ]]; then
        echo "Halt: no mail map given"
        return 0
    fi

    read "?Are you sure you want to update all committer info with mail map content? "

    mail_map=$1
    origin=$(git remote get-url origin)
    branch=$(git_current_branch)

    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo # Whitespace
        git stash

        echo -e "\nList of current committers"
        git shortlog -s -n -c -e

        echo -e "\nUpdating committers with mailmap: $mail_map"
        git filter-repo --mailmap "$mail_map" --force

        echo -e "\nAdding origin: $origin"
        git remote add origin "$origin"

        echo -e "\nPushing to branch: $branch"
        git push -u origin "$branch" --force

        echo -e "\nList of current committers"
        git shortlog -s -n -c -e

        echo # Whitespace
        git stash pop
    fi
}
