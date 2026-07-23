#!/bin/bash
# Claude Code status line (3 lines)
#
# Line 1: directory (📁, faded bright-yellow badge) + git branch (🌿, faded
#         bright-red badge) — colors converted from ~/.bash_profile PS1.
# Line 2: model name, context-window size & reasoning effort (🤖, faded
#         bright-blue badge), e.g. "Fable 5[1m] (high)" — the bracketed size
#         comes from `context_window.context_window_size` (1000000 → "1m",
#         200000 → "200k"; whole millions use "m", otherwise "k"), omitted
#         if absent — + context-window usage (🧠, cyan, plain bar), e.g.
#         "▓▓▓░░░░░░░ 32%".
# Line 3: rate-limit usage (magenta, plain bar; no "5h"/"7d" text labels —
#         the 🕔/📅 emoji alone identify each bar), each with a reset
#         countdown in hours+minutes, e.g. "🕔 ▓▓▓░░░░░░░ 30% (3h 12m)  📅
#         ▓░░░░░░░░░ 12% (52h 30m)". The 7d countdown is kept in
#         hours+minutes rather than switching to days+hours, for a
#         consistent unit with the 5h badge. Reset time is computed from
#         `rate_limits.*.resets_at` (Unix epoch) minus `date +%s`, and is
#         omitted gracefully if resets_at is absent or already past.
#
# Badge styles:
# - "Faded badge" style (directory, git branch, model/effort): the
#   original PS1's bright ANSI background hues (bright yellow #ffff55,
#   bright red #ff5555, bright blue #5555ff), alpha-blended ~40% toward an
#   assumed dark terminal background (~#1e1e1e), using truecolor
#   \e[48;2;R;G;Bm since the 8/16-color palette can't express this. White
#   (\e[97m) foreground text is used instead of black, since these blended
#   backgrounds are dark.
#   NOTE: this blend assumes a DARK terminal theme. If the terminal is
#   actually light-themed, blending toward #1e1e1e will look wrong (the
#   badges will appear as dark, muddy boxes rather than "faded" ones) —
#   flag this if that turns out to be the case.
# - "Plain bar" style (context-window & rate-limit bars): no background box
#   — just a foreground color on the default terminal background, for
#   readability of the progress bars specifically.
#
# Context-window & rate-limit percentages are rendered as plain Unicode
# block-character bars (no nerd-font glyphs) via the bar_str() helper, with
# the numeric percentage kept alongside for precision: filled cells & the
# percentage in color, empty cells dim. These badges are a curated
# equivalent of the `/usage` command, sourced from the JSON passed on
# stdin, and each degrades gracefully (omitted) when its underlying data
# isn't present.

# Renders a percentage as a 10-cell Unicode block bar plus the numeric value,
# e.g. "▓▓▓░░░░░░░ 32%". Uses plain block characters (no nerd-font glyphs).
# No background color is used (readability); filled cells & the percentage
# label are drawn in the given ANSI foreground color code, empty cells are
# dim, and everything runs on the default terminal background.
bar_str() {
  awk -v p="$1" -v c="$2" 'BEGIN {
    n = 10;
    f = int((p / 100) * n + 0.5);
    if (f > n) f = n;
    if (f < 0) f = 0;
    filled = ""; for (i = 0; i < f; i++) filled = filled "▓";
    empty = ""; for (i = f; i < n; i++) empty = empty "░";
    printf "\033[0;%sm%s\033[2m%s\033[0m\033[0;%sm %.0f%%\033[0m", c, filled, empty, c, p;
  }'
}

# Renders "resets_at" (Unix epoch seconds) as " (Xh Ym)" time-remaining-until-
# reset, always in hours+minutes (even past 24h, e.g. "(52h 30m)") for a
# consistent unit across the 5h and 7d badges. Omits gracefully (prints
# nothing) if resets_at is empty or already in the past.
time_remaining() {
  local resets_at="$1"
  [ -z "$resets_at" ] && return
  awk -v r="$resets_at" -v now="$(date +%s)" 'BEGIN {
    remaining = r - now;
    if (remaining <= 0) { exit }
    h = int(remaining / 3600);
    m = int((remaining % 3600) / 60);
    printf " (%dh %dm)", h, m;
  }'
}

input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir')
dir=${cwd/#$HOME/\~}

git_info=""
if git -C "$cwd" --no-optional-locks rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null || git -C "$cwd" --no-optional-locks rev-parse --short HEAD 2>/dev/null)
  dirty=""
  [ -n "$(git -C "$cwd" --no-optional-locks status --porcelain 2>/dev/null)" ] && dirty="*"
  git_info="${branch}${dirty}"
fi

ctx_used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
ctx_info=""
[ -n "$ctx_used" ] && ctx_info="🧠 $(bar_str "$ctx_used" 36)"

model_name=$(echo "$input" | jq -r '.model.display_name // empty')
effort=$(echo "$input" | jq -r '.effort.level // empty')
ctx_size=$(echo "$input" | jq -r '.context_window.context_window_size // empty')
ctx_size_str=""
if [ -n "$ctx_size" ]; then
  ctx_size_str=$(awk -v n="$ctx_size" 'BEGIN {
    if (n % 1000000 == 0) { printf "%dm", n / 1000000 }
    else { printf "%dk", n / 1000 }
  }')
fi
model_info="$model_name"
if [ -n "$model_info" ] && [ -n "$ctx_size_str" ]; then
  model_info="${model_info}[${ctx_size_str}]"
fi
if [ -n "$model_info" ] && [ -n "$effort" ]; then
  model_info="${model_info} (${effort})"
fi

five=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
week=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
five_resets=$(echo "$input" | jq -r '.rate_limits.five_hour.resets_at // empty')
week_resets=$(echo "$input" | jq -r '.rate_limits.seven_day.resets_at // empty')
usage_info=""
if [ -n "$five" ]; then
  usage_info="🕔 $(bar_str "$five" 35)$(time_remaining "$five_resets")"
fi
if [ -n "$week" ]; then
  [ -n "$usage_info" ] && usage_info="${usage_info}  "
  usage_info="${usage_info}📅 $(bar_str "$week" 35)$(time_remaining "$week_resets")"
fi

# Line 1: directory (faded bright-yellow badge) + git branch (faded bright-red badge)
printf "\033[97;48;2;96;96;44m📁 %s \033[0m" "$dir"
if [ -n "$git_info" ]; then
  printf " \033[97;48;2;96;44;44m🌿 %s \033[0m" "$git_info"
fi
printf "\n"

# Line 2: model/effort (faded bright-blue badge) + context window usage (cyan, plain bar)
line2_sep=""
if [ -n "$model_info" ]; then
  printf "\033[97;48;2;44;44;96m🤖 %s \033[0m" "$model_info"
  line2_sep=" "
fi
if [ -n "$ctx_info" ]; then
  printf "%s%s" "$line2_sep" "$ctx_info"
fi
printf "\n"

# Line 3: rate-limit usage, 5h session / 7d weekly (magenta, plain bar)
if [ -n "$usage_info" ]; then
  printf "%s" "$usage_info"
fi
printf "\n"
