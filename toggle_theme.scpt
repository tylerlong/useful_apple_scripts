tell application "System Preferences"
	launch
	activate
	set miniaturized of windows to false
	reveal pane id "com.apple.preference.general"
end tell

tell application "System Events"
	tell process "System Preferences"
		tell first window
			click checkbox 3
		end tell
	end tell
end tell

tell application "System Preferences"
	quit
end tell
