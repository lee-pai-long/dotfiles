--                               conky_lpl-seamod
--
-- Date    : 05/09/2017
-- Author  : Lee-Pai-Long
-- Version : v0.2
-- License : Distributed under the terms of GNU GPL version 2 or later
--
-- This version is a modification of conkyrc_seamod
-- which is a modification conkyrc_lunatico
-- which is a modification of conkyrc_orange
--
-- conkyrc_orange:    http://gnome-look.org/content/show.php?content=137503&forumpage=0
-- conkyrc_lunatico:  http://gnome-look.org/content/show.php?content=142884
-- conkyrc_seamod:    http://seajey.deviantart.com/art/Conky-Seamod-v0-1-283461046
--
conky.config = {
	background = false,
	update_interval = 1,

	cpu_avg_samples = 1,
	net_avg_samples = 2,
	temperature_unit = 'celsius',

	double_buffer = true,
	no_buffers = true,
	text_buffer_size = 2048,

	gap_x = 30,
	gap_y = 70,
	minimum_width = 300, minimum_height = 900,
	maximum_width = 350,

	xinerama_head = 2,

	own_window = true,
	own_window_type = 'desktop',
	own_window_transparent = true,
	own_window_argb_visual = true,
	own_window_argb_visual = true,
	own_window_colour = '#000000',
	own_window_argb_value = 0,
	own_window_hints = 'undecorated,sticky,skip_taskbar,skip_pager,below',

	border_inner_margin = 0,
	border_outer_margin = 0,
	alignment = 'top_right',


	draw_shades = false,
	draw_outline = false,
	draw_borders = false,
	draw_graph_borders = false,

	override_utf8_locale = true,
	use_xft = true,
	font = 'caviar dreams:size=10',
	xftalpha = 0.5,
	uppercase = false,

-- Defining colors
	default_color = '#FFFFFF',
-- Shades of Gray
	color1 = '#DDDDDD',
	color2 = '#AAAAAA',
	color3 = '#888888',
-- Orange
	color4 = '#EF5A29',
-- Green
	color5 = '#77B753',

-- Loading lua script for drawning rings
	lua_load = './lpl-seamod_rings.lua',
	lua_draw_hook_post = 'main',

--# System information using conky capabilities

-- Header with base system info
	own_window_argb_value = 0,
	own_window_colour = '#000000',
};

-- Time formats
-- %%    a literal %
-- %a    locale's abbreviated weekday name (e.g., Sun)
-- %A    locale's full weekday name (e.g., Sunday)
-- %b    locale's abbreviated month name (e.g., Jan)
-- %B    locale's full month name (e.g., January)
-- %c    locale's date and time (e.g., Thu Mar 3 23:05:25 2005)
-- %C    century; like %Y, except omit last two digits (e.g., 21)
-- %d    day of month (e.g, 01)
-- %D    date; same as %m/%d/%y
-- %e    day of month, space padded; same as %_d but no leading 0
-- %F    full date; same as %Y-%m-%d
-- %g    last two digits of year of ISO week number (see %G)
-- %G    year of ISO week number (see %V); normally useful only with %V
-- %h    same as %b
-- %H    hour (00..23)
-- %I    hour (01..12)
-- %j    day of year (001..366)
-- %k    hour ( 0..23)
-- %l    hour ( 1..12)
-- %m    month (01..12)
-- %M    minute (00..59
conky.text = [[
${voffset -5}${offset 80}${font Ubuntu:size=10,weight:bold}${color1}${desktop}
${voffset -10}${font Ubuntu:size=15,weight:bold}${color5}$nodename ${color4}${hr 2}
${voffset -31}${offset 210}${font Ubuntu:size=10,weight:normal}${color1}${time %A %D}
${voffset 10}${font Ubuntu:size=30,weight:normal}${color1}${time %H}${color3}:${color1}${time %M}${color3}:${color4}${time %S}
${voffset -65}${offset 160}${font Ubuntu:size=10,weight:normal}${color1}Uptime: ${color5}$uptime

#${offset 15}${font Ubuntu:size=10,weight:normal}${color4}$sysname $kernel

# Showing CPU Graph
${voffset 5}
${offset 130}${cpugraph 40,220 4B1B0C FF5C2B 100 -l}${voffset -20}
${offset 90}${font Ubuntu:size=10,weight:bold}${color5}CPU
# Showing TOP 5 CPU-consumers
${offset 105}${font Ubuntu:size=10,weight:normal}${color4}${top name 1}${alignr}${top cpu 1}%
${offset 105}${font Ubuntu:size=10,weight:normal}${color1}${top name 2}${alignr}${top cpu 2}%
${offset 105}${font Ubuntu:size=10,weight:normal}${color2}${top name 3}${alignr}${top cpu 3}%
${offset 105}${font Ubuntu:size=10,weight:normal}${color3}${top name 4}${alignr}${top cpu 4}%
${offset 105}${font Ubuntu:size=10,weight:normal}${color3}${top name 5}${alignr}${top cpu 5}%

#Showing memory part with TOP 5
${voffset 35}
${offset 235}${font Ubuntu:size=10,weight:normal}${color5}${mem}${color1} / ${color4}${memmax}${voffset -13}
${offset 90}${font Ubuntu:size=10,weight:bold}${color5}MEM${voffset 5}${color1}${hr 1}${voffset 10}
${offset 105}${font Ubuntu:size=10,weight:normal}${color4}${top_mem name 1}${alignr}${top_mem mem 1}%
${offset 105}${font Ubuntu:size=10,weight:normal}${color1}${top_mem name 2}${alignr}${top_mem mem 2}%
${offset 105}${font Ubuntu:size=10,weight:normal}${color2}${top_mem name 3}${alignr}${top_mem mem 3}%
${offset 105}${font Ubuntu:size=10,weight:normal}${color3}${top_mem name 4}${alignr}${top_mem mem 4}%
${offset 105}${font Ubuntu:size=10,weight:normal}${color3}${top_mem name 4}${alignr}${top_mem mem 5}%

# Showing disk partitions: root
${offset 15}${font Ubuntu:size=10,weight:bold}${color5}DISKS${color1}${hr 1}
${offset 65}${font Ubuntu:size=10,weight:bold}${color2}Free: ${color5}${fs_free} ${color2} - Used: ${color4}${fs_used} ${color2} - Total:  ${color}$fs_size
${offset 15}${color4}${fs_bar}
${offset 15}${diskiograph 40,320 666666 666666}
${offset 15}${font Ubuntu:size=10,weight:bold}${color4}${top_io name 1}${alignr}read: ${top_io io_read 1} - write : ${top_io io_write 1}
${offset 15}${font Ubuntu:size=10,weight:normal}${color1}${top_io name 2}${alignr}read: ${top_io io_read 2} - write : ${top_io io_write 2}
${offset 15}${font Ubuntu:size=10,weight:normal}${color2}${top_io name 3}${alignr}read: ${top_io io_read 3} - write : ${top_io io_write 3}
${offset 15}${font Ubuntu:size=10,weight:normal}${color3}${top_io name 4}${alignr}read: ${top_io io_read 4} - write : ${top_io io_write 4}
${offset 15}${font Ubuntu:size=10,weight:normal}${color3}${top_io name 5}${alignr}read: ${top_io io_read 5} - write : ${top_io io_write 5}

# Network

${font Ubuntu:size=10,weight:bold}${color5}NETWORK${color1}${hr 1}
${if_existing /proc/net/route eth0}
	${voffset -40}${offset 210}${font Ubuntu:size=10,weight:normal}${color1}eth0: ${color4}${addr eth0}
	${voffset 10}${offset 15}${color1}${font Ubuntu:size=9,weight:bold}Up: ${alignr}${font 	Ubuntu:size=9,weight:normal}$color4${upspeed eth0} $color2/ $color1${totalup eth0}
	${offset 15}${upspeedgraph eth0 40,320 4B1B0C FF5C2B 100 -l}
	${offset 15}${color1}${font Ubuntu:size=9,weight:bold}Down: ${alignr}${font Ubuntu:size=9,weight:normal}$color5${downspeed eth0} $color2/ $color1${totaldown eth0}
	${offset 15}${downspeedgraph eth0 40,320 324D23 77B753 100 -l}
	${color4}${hr 2}
${else}
${if_existing /proc/net/route wlan0}
	${voffset -55}${offset 210}${color4}${font Ubuntu:size=10,weight:normal}${color1}wlan0: ${color4}${addr wlan0}
	${voffset 10}${offset 15}${color1}${font Ubuntu:size=9,weight:bold}Up: ${alignr}${font Ubuntu:size=9,weight:normal}$color4${upspeed wlan0} $color2/ $color1${totalup wlan0}
	${offset 15}${upspeedgraph wlan0 40,320 4B1B0C FF5C2B 100 -l}
	${offset 15}${color1}${font Ubuntu:size=9,weight:bold}Down: ${alignr}${font Ubuntu:size=9,weight:normal}$color5${downspeed wlan0} / $color1${totaldown wlan0}
	${offset 15}${downspeedgraph wlan0 40,320 324D23 77B753 100 -l}
	${color4}${hr 2}
${endif}
${endif}
]];
