#!/bin/bash
# Stop hook: ding when the mock interviewer finishes a turn.
# Only fires for Claude sessions rooted at this project (not build sessions in app/)
# and only while some Session is unfinished.
project_dir="$(cd "$(dirname "$0")/../.." && pwd)"
cwd="$(grep -o '"cwd": *"[^"]*"' | head -1 | cut -d'"' -f4)"

[ "$cwd" = "$project_dir" ] || exit 0
grep -lqE '^status: (active|paused|break)' "$project_dir"/sessions/*/state.md 2>/dev/null || exit 0

sound="$(ls "$project_dir"/media/*.mp3 2>/dev/null | head -1)"
[ -n "$sound" ] || sound=/System/Library/Sounds/Glass.aiff
afplay "$sound" >/dev/null 2>&1 &
exit 0
