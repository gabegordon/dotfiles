#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar
# Bar is the name set in the polybar config, so if you change it, you have to change it here too.
#MONITOR=DP-2-2 polybar top &
MONITOR=eDP-1 polybar top &
#MONITOR=DP-2-1 polybar top &

echo "Bars launched..."
