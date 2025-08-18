#!/usr/bin/env sh

MONITORS_NUM=$(aerospace list-monitors | wc -l | xargs printf '%d')

#!/usr/bin/env sh
set -eu

# One-time event registration
sketchybar --add event aerospace_workspace_change

RED=0xffed8796

MONITORS_NUM=$(aerospace list-monitors | wc -l)

if [ "$MONITORS_NUM" -eq 1 ]; then
  aerospace list-workspaces --monitor 1 | while IFS= read -r sid; do
    sketchybar --add item "space.$sid" left \
      --subscribe "space.$sid" aerospace_workspace_change \
      --set "space.$sid" \
        icon="$sid" \
        icon.padding_left=22 \
        icon.padding_right=22 \
        label.padding_right=33 \
        icon.highlight_color="$RED" \
        background.color=0x44ffffff \
        background.corner_radius=5 \
        background.height=30 \
        background.drawing=off \
        label.font="sketchybar-app-font:Regular:16.0" \
        label.background.height=30 \
        label.background.drawing=on \
        label.background.color=0xff494d64 \
        label.background.corner_radius=9 \
        label.drawing=off \
      click_script="aerospace workspace $sid" \
      script="$CONFIG_DIR/plugins/aerospacer.sh $sid" \
      display=1
  done
else
  aerospace list-workspaces --monitor 1 | while IFS= read -r sid; do
    sketchybar --add item "space.$sid" left \
      --subscribe "space.$sid" aerospace_workspace_change \
      --set "space.$sid" \
        icon="$sid" \
        icon.padding_left=22 \
        icon.padding_right=22 \
        label.padding_right=33 \
        icon.highlight_color="$RED" \
        background.color=0x44ffffff \
        background.corner_radius=5 \
        background.height=30 \
        background.drawing=off \
        label.font="sketchybar-app-font:Regular:16.0" \
        label.background.height=30 \
        label.background.drawing=on \
        label.background.color=0xff494d64 \
        label.background.corner_radius=9 \
        label.drawing=off \
      click_script="aerospace workspace $sid" \
      script="$CONFIG_DIR/plugins/aerospacer.sh $sid" \
      display=2
  done

  aerospace list-workspaces --monitor 2 | while IFS= read -r sid; do
    sketchybar --add item "space.$sid" left \
      --subscribe "space.$sid" aerospace_workspace_change \
      --set "space.$sid" \
        icon="$sid" \
        icon.padding_left=22 \
        icon.padding_right=22 \
        label.padding_right=33 \
        icon.highlight_color="$RED" \
        background.color=0x44ffffff \
        background.corner_radius=5 \
        background.height=30 \
        background.drawing=off \
        label.font="sketchybar-app-font:Regular:16.0" \
        label.background.height=30 \
        label.background.drawing=on \
        label.background.color=0xff494d64 \
        label.background.corner_radius=9 \
        label.drawing=off \
      click_script="aerospace workspace $sid" \
      script="$CONFIG_DIR/plugins/aerospacer.sh $sid" \
      display=1
  done
fi

