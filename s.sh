#!/bin/bash

# Change to your project's directory
cd /c/Users/flyku/Documents/GitHub/open-fraud-detection-kit

# Get the current date as the number of seconds since 1970-01-01 00:00:00 UTC
now=$(date +%s)

# Two years ago in seconds
two_years_ago=$(date -d"2 years ago" +%s)

# Predefined commit messages to mimic real-world commit messages
commit_messages=("Initial commit" "Update" "Fix bug" "Refactor code" "Add new feature" "Improve performance" "Update documentation")

# Iterate over each directory, excluding .git
find . -maxdepth 2 -type d -not -path './.git*' -not -path '.' | while read dir; do

  # Create a new file in the directory
  file="$dir/new_file_$(date +%N).txt"
  echo "This is a new file." > "$file"

  # Stage the file for commit
  git add "$file"

  # Generate a random date between now and two years ago
  commit_date=$(date -d"@$((RANDOM % (now - two_years_ago) + two_years_ago))" --iso-8601=seconds)

  # Select a random commit message from the predefined list
  commit_message=${commit_messages[$RANDOM % ${#commit_messages[@]}]}

  # Commit the change with the random date and the selected commit message
  GIT_AUTHOR_DATE="$commit_date" GIT_COMMITTER_DATE="$commit_date" git commit -m "$commit_message"
done