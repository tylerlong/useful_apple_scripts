global x1, y1, x2, y2

tell application "System Events" to tell process "Dock"
	set dock_size to size in list 1
	set dock_width to (item 1 of dock_size)
	set dock_height to (item 2 of dock_size)
	set dock_position to position in list 1
	set dock_x to (item 1 of dock_position)
	set dock_y to (item 2 of dock_position)
end tell

tell application "Finder"
	set desktop_bounds to bounds of window of desktop
	set x1 to (item 1 of desktop_bounds)
	set y1 to (item 2 of desktop_bounds)
	set x2 to (item 3 of desktop_bounds)
	set y2 to (item 4 of desktop_bounds)
end tell

if dock_x = 0 then
	set x1 to dock_width
else if (dock_y + dock_height) = y2 then
	set y2 to (y2 - dock_height)
else if (dock_x + dock_width) = x2 then
	set x2 to (x2 - dock_width)
end if

on set_bounds(bounds)
	tell application "System Events"
		set frontApp to first application process whose frontmost is true
		set frontAppName to name of frontApp
		tell process frontAppName
			tell (1st window whose value of attribute "AXMain" is true)
				set position to {item 1 of bounds, item 2 of bounds}
				set size to {(item 3 of bounds) - (item 1 of bounds), (item 4 of bounds) - (item 2 of bounds)}
			end tell
		end tell
	end tell
end set_bounds

on maximize()
	set_bounds({x1, y1, x2, y2})
end maximize

on left_half()
	set_bounds({x1, y1, x1 + (x2 - x1) / 2, y2})
end left_half

on right_half()
	set_bounds({x1 + (x2 - x1) / 2, y1, x2, y2})
end right_half

on top_half()
	set_bounds({x1, y1, x2, y1 + (y2 - y1) / 2})
end top_half

on bottom_half()
	set_bounds({x1, y1 + (y2 - y1) / 2, x2, y2})
end bottom_half

on left_top()
	set_bounds({x1, y1, x1 + (x2 - x1) / 2, y1 + (y2 - y1) / 2})
end left_top

on left_bottom()
	set_bounds({x1, y1 + (y2 - y1) / 2, x1 + (x2 - x1) / 2, y2})
end left_bottom

on right_top()
	set_bounds({x1 + (x2 - x1) / 2, y1, x2, y1 + (y2 - y1) / 2})
end right_top

on right_bottom()
	set_bounds({x1 + (x2 - x1) / 2, y1 + (y2 - y1) / 2, x2, y2})
end right_bottom

on central()
	set_bounds({x1 + (x2 - x1) / 4, y1 + (y2 - y1) / 4, x2 - (x2 - x1) / 4, y2 - (y2 - y1) / 4})
end central

maximize()
