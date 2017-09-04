sleep 20s
killall conky
cd "$HOME/.conky"
conky -c "$HOME/.conky/lpl-seamod.conf" &
