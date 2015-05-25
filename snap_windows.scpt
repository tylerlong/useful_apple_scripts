tell application "Finder"
	set desktop_dimensions to bounds of window of desktop
end tell

set front_app to (path to frontmost application as Unicode text)

tell application front_app
	set the bounds of the first window to {0, 0, (item 3 of desktop_dimensions), (item 4 of desktop_dimensions)}
end tell
