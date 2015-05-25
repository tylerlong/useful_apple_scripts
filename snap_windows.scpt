global x1
global y1
global x2
global y2

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

on maximize()
	set front_app to (path to frontmost application as Unicode text)
	tell application front_app
		set the bounds of the first window to {x1, y1, x2, y2}
	end tell
end maximize

maximize()
