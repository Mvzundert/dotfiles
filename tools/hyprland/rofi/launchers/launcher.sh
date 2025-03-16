#!/usr/bin/env bash

## Rofi   : Launcher (Modi Drun, Run, File Browser, Window)

dir="$HOME/.config/rofi/launchers"
theme='style'

## Run
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
