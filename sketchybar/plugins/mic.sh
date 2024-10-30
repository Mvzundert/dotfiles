#!/usr/bin/env zsh

MIC_VOLUME=$(osascript -e 'input volume of (get volume settings)')

if [[ $MIC_VOLUME -eq 0 ]]; then
  sketchybar -m --set mic icon=" $MIC_VOLUME"
elif [[ $MIC_VOLUME -eq 100 ]]; then
  sketchybar -m --set mic icon=" $MIC_VOLUME"
else
  osascript -e 'set volume input volume 100'
fi 
