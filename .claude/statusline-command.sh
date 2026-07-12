#!/bin/sh
# Claude Code status line — Powerlevel10k-inspired segments:
# user @ host  cwd  git branch  repo  model  ctx used%/remaining%  PR

input=$(cat)

# Heat-map an integer percentage to an ANSI colour escape:
#   <50 green, 50-74 yellow, 75-89 red, >=90 bold red.
heat_color() {
  if [ "$1" -ge 90 ]; then printf '\033[1;31m'
  elif [ "$1" -ge 75 ]; then printf '\033[31m'
  elif [ "$1" -ge 50 ]; then printf '\033[33m'
  else printf '\033[32m'
  fi
}

user=$(whoami)
host=$(hostname -s)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
[ -z "$cwd" ] && cwd=$(pwd)

# Shorten home directory to ~
cwd_display=$(echo "$cwd" | sed "s|^$HOME|~|")

# Git branch (skip optional locks to avoid stalls)
branch=$(git -C "$cwd" --no-optional-locks branch --show-current 2>/dev/null)

# GitHub repo (owner/name) when available
repo=$(echo "$input" | jq -r '.workspace.repo | if . then .owner + "/" + .name else empty end')

# Model display name
model=$(echo "$input" | jq -r '.model.display_name // empty')

# Plan usage: 5-hour rolling session limit + 7-day limit (the "/usage" numbers)
sess5h=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
sess7d=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')

# Context window: used % (pre-calculated by Claude Code)
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Open PR for current branch
pr=$(echo "$input" | jq -r '.pr.number // empty')
pr_state=$(echo "$input" | jq -r '.pr.review_state // "open"')

# Build status line with ANSI colors
# user@host in cyan, cwd in blue, branch in magenta, repo in dim white,
# model in green, context in yellow/red, PR in bold yellow
printf '\033[36m%s@%s\033[0m' "$user" "$host"
printf '  \033[34m%s\033[0m' "$cwd_display"

if [ -n "$branch" ]; then
  printf '  \033[35m%s\033[0m' "$branch"
fi

if [ -n "$repo" ]; then
  printf '  \033[2m%s\033[0m' "$repo"
fi

if [ -n "$model" ]; then
  printf '  \033[32m%s\033[0m' "$model"
fi

# Plan/session usage segment: 5-hour window heat-mapped, 7-day dimmed alongside.
if [ -n "$sess5h" ]; then
  s5=${sess5h%.*}
  printf "  %bsess:%d%%\033[0m" "$(heat_color "$s5")" "$s5"
  if [ -n "$sess7d" ]; then
    printf '  \033[2m7d:%d%%\033[0m' "${sess7d%.*}"
  fi
fi

# Context usage segment: show used% heat-mapped (green<50, yellow 50-74,
# red 75-89, bold red >=90).
if [ -n "$used" ]; then
  ctx_int=${used%.*}
  printf "  %bctx:%d%% used\033[0m" "$(heat_color "$ctx_int")" "$ctx_int"
fi

if [ -n "$pr" ]; then
  printf '  \033[1;33mPR #%s (%s)\033[0m' "$pr" "$pr_state"
fi

printf '\n'
