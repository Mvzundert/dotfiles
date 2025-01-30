#!/bin/bash

# Fetch PRs and Issues
prs=$(gh pr list --limit 10 --json title,number,state,author --template '{{range .}}{{.number}}\t{{.title}}\t{{.state}}\t{{.author.login}}\n{{end}}')
issues=$(gh issue list --limit 10 --json title,number,state,author --template '{{range .}}{{.number}}\t{{.title}}\t{{.state}}\t{{.author.login}}\n{{end}}')

# Display PRs and Issues in a table format
echo -e "Pull Requests:\n"
echo -e "$prs" | column -t -s $'\t'
echo -e "\nIssues:\n"
echo -e "$issues" | column -t -s $'\t'

# Keep the script running to prevent the popup from closing immediately
echo -e "\nPress q to exit"
read -n 1 -s -r -p ""
