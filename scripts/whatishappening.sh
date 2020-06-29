#!/bin/sh

# script to replace the status bar, using dunst(ify). info is put into a
# friendly bulletin format and sent to the user when they ask for it by calling
# the script with a hotkey, and dismissing it with esc. will need to be
# modified if you want to use it, as its currently tailored towards me.

# hello and datetime
hellodate="\
> hello $(whoami), its $(date '+%l:%M%p' | sed 's/ //g') on $(date '+%A, %B %d').
"

# cpu and mem
mem="$(free --mega | awk 'FNR == 2 {print $3; exit}')"
cpu="$(echo `top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`%)"
memcpu="
> ${cpu} of your cpu is in use, as well as ${mem}mb of memory.
"

# weather
n=0
while IFS= read -r line
do
  if [ $n -eq 0 ]; then
    temp="$(echo $line | sed 's/+//g')"
  elif [ $n -eq 1 ]; then
    cond="$(echo $line | tr '[:upper:]' '[:lower:]' | sed 's/shower/showers/g')"
  elif [ $n -eq 2 ]; then
    wind=$line
  elif [ $n -eq 3 ]; then
    sunrise="$(echo $line | sed 's/.\{3\}$//; s/^0*//')"
  elif [ $n -eq 4 ]; then
    sunset="$(echo $line | sed 's/.\{3\}$//; s/^0*//')"
  fi
  n=$((n+1))
done < ~/scripts/whatishappening/weather
weather="
> its ${temp} in plymouth, with ${cond} and winds of ${wind}. \
the sun will rise at ${sunrise}, and set at ${sunset}.
"

# uptime
uptime="
> this computer has been on for
$(uptime -p | sed 's/up //g; s/,/ and/g').
"

# music
mpcstate="$(mpc | awk 'FNR == 2 {print $1}')"
if [ $mpcstate = '[playing]' ]; then
  artist="$(ncmpcpp --current-song '%a')"
  song="$(ncmpcpp --current-song '%t')"
  music="
> you're listening to '${song}' by ${artist}.
"
else
  music=""
fi

# battery
batperc="$(acpi | sed 's/,//g; s/\%//g' | awk '{print $4}')"
if [ $batperc -le 85 ]; then
  batstate="$(acpi | sed 's/,//g' | awk '{print $3}' | tr '[:upper:]' '[:lower:]')"
  battery="
> the battery is at ${batperc}% and ${batstate}.
  "
else
  battery=""
fi 

# taskwarrior
task="$(task minimal | awk 'END{print $1}')"
if [ $task -gt 0 ]; then
  if [ $task -eq 1 ]; then
    taskcount="
> there is ${task} task to do.
    "
  else
    taskcount="
> there are ${task} tasks to do.
  "
    fi
else
  taskcount=""
fi

# send everything to dunst (as code 221 so it replace itself)
dunstify -r 221 "\
${hellodate}\
${taskcount}\
${music}\
${weather}\
${battery}\
${uptime}\
${memcpu}\
"
