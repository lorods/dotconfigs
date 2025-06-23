source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
   if functions fish_greeting | string match -r -q -e "^[[:space:]]*fastfetch\$"
      fastfetch
   end
   set_color cyan; echo -e "Display properties reported by X:"
   set_color brgreen; xrandr | string match -r -e "\*"
   set_color cyan; echo -e "Display properties reported by Wayland:"
   set_color brgreen; wayland-info -i wl_output
   set_color normal; source (which "Cachy Reboot")
end
set --export YDOTOOL_SOCKET /tmp/.ydotool_socket
