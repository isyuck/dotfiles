#! /bin/sh

# sends a critical notification using notify-send, 
# if battery is less than 20%, and still discharging

bat=`acpi -b | grep -P -o '[0-9]+(?=%)'`
chg=`acpi -b | awk '{print $3}'`
if [ $bat -le 20 ] && [ "$chg" = "Discharging," ]
then
  notify-send -u critical "! battery is at ${bat}% !"
fi
