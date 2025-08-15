#!/bin/bash

menu_item_region_clipboard_only="Выбранная область (только копирование)"
menu_item_region_save_file="Выбранная область (сохранить в файл)"
menu_item_window_clipboard_only="Выбранное окно (только копирование)"
menu_item_window_save_file="Выбранное окно (сохранить в файл)"
menu_item_output_clipboard_only="Весь экран (только копирование)"
menu_item_output_save_file="Весь экран (сохранить в файл)"

menu="${menu_item_region_clipboard_only}\n\
${menu_item_region_save_file}\n\
${menu_item_window_clipboard_only}\n\
${menu_item_window_save_file}\n\
${menu_item_output_clipboard_only}\n\
${menu_item_output_save_file}"

choice=$(echo -e "$menu" | walker --dmenu --hidebar)

case "$choice" in
  "${menu_item_region_clipboard_only}") hyprshot -m region --clipboard-only ;;
  "${menu_item_region_save_file}") hyprshot -m region ;;
  "${menu_item_window_clipboard_only}") hyprshot -m window --clipboard-only ;;
  "${menu_item_window_save_file}") hyprshot -m window ;;
  "${menu_item_output_clipboard_only}") hyprshot -m output --clipboard-only ;;
  "${menu_item_output_save_file}") hyprshot -m output ;;
esac
