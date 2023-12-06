#!/bin/bash

# function remove_leading_zeros() {
#     local value=$1
#     echo $((10#$value))
# }

# function time_to_seconds() {
#     local time_str=$1
#     local hours=${time_str%%:*}
#     time_str=${time_str#*:}
#     local minutes=${time_str%%:*}
#     local seconds=${time_str##*:}
#     hours=$(remove_leading_zeros "$hours")
#     minutes=$(remove_leading_zeros "$minutes")
#     seconds=$(remove_leading_zeros "$seconds")
#     echo $((hours * 3600 + minutes * 60 + seconds))
# }

# duration=$(playerctl metadata --format "{{duration(mpris:length)}}")

# atPosition=$(playerctl metadata --format "{{duration(position)}}")

# song_duration_seconds=$(time_to_seconds $duration)

# current_position_seconds=$(time_to_seconds $atPosition)

# percentage=0

# if [[ $song_duration_seconds -ne 0 ]]; then
#     percentage=$(( ($current_position_seconds * 100) / $song_duration_seconds ))
# fi

# echo $percentage

pp=$(playerctl --list-all)
echo '(box
      :class "music"
      :orientation "h"
      :space-evenly false
      :halign "center"
      :spacing 20'
for i in $pp; do
    music=$(playerctl --player=$i metadata --format "{{artist}} - {{title}}")
    playerStatus=$(playerctl --player=$i status)
    picture=$(curl -s $(playerctl metadata mpris:artUrl) --output ~/.config/eww/thumbnail$i.jpg && echo "thumbnail$i.jpg")
    echo '
      (box
        :class "thumbnail"
        :style `background-image: url("'$picture'");`
      )
      (box
        :orientation "v"
        :style "min-width: 5em"
        (label :wrap true :text "'$music'")
        (box
          :class "buttons"
          (eventbox
            :cursor "pointer"
            :onclick "playerctl --player='$i' previous"
            :class "music-btn"
            (label :text "󰙤")
          )
          (eventbox
            :cursor "pointer"
            :onclick "playerctl --player='$i' play-pause"
            :class "music-btn"
            (label :text {
              "'$playerStatus'" == "Playing" ? "󰏦" : "󰐍"
            })
          )
          (eventbox
            :cursor "pointer"
            :onclick "playerctl --player='$i' next"
            :class "music-btn"
            (label :text "󰙢")
          )
        )
      )'
done
echo ')'
