#!/bin/bash -e

# NAME: gui-launcher

# Check whether the user is logged-in
while [ -z "$(pgrep bspwm -n -U $UID)" ]; do sleep 3; done

# Export the current desktop session environment variables
export $(xargs -0 -a "/proc/$(pgrep bspwm -n -U $UID)/environ")

# Execute the input command
nohup "$@" >/dev/null 2>&1 &

exit 0
