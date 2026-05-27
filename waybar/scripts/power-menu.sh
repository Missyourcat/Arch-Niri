#!/bin/bash

CHOICE=$(printf "󰐥 锁屏\n󰤄 休眠\n󰜉 重启\n󰐥 关机" \
| wofi --dmenu \
       --width 300 \
       --height 260 \
       --prompt "电源菜单" \
       --style ~/.config/waybar/scripts/wofi_css/power.css)

case "$CHOICE" in
    *锁屏*) loginctl lock-session ;;
    *休眠*) systemctl suspend ;;
    *重启*) systemctl reboot ;;
    *关机*)
        CONFIRM=$(printf "取消\n确认关机" | wofi --dmenu --prompt "确认？")
        [[ "$CONFIRM" == "确认关机" ]] && systemctl poweroff
        ;;
esac