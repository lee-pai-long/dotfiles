
sleep 5s
killall conky
cd "$HOME/.conky"
conky -c "$HOME/.conky/lpl-seamod.lua" -b
