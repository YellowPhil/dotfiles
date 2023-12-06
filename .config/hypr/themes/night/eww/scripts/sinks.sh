#!/bin/bash

readarray -t sinks <<< "$(pamixer --list-sinks | grep -oE '"[^"]+"' | tr -d '"' | awk 'NR % 3 == 0')"

activeSink="$(pamixer --list-sinks | awk '/Running/ {print substr($0, index($0, $4))}')"

readarray -t switchSinks <<< "$(pactl list short sinks | awk '{print $2}')"

echo '(box :orientation "v" :space-evenly false :spacing 20'

for index in "${!sinks[@]}"; do
  sink="${sinks[index]}"
  echo '
    (eventbox 
      :cursor "pointer" 
      :width 10 
      :class "sink" 
      :style {'$activeSink' == "'$sink'" ? "background-color: #BB9AF7;" : ""}
      :onclick "pactl set-default-sink '${switchSinks[index]}'"
      (label
        :text "'$sink'"
        :xalign 0
        :wrap true
      )
    )
  '
done
echo ")"
