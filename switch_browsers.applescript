property theURL : ""

tell application "Google Chrome"
	set theURL to URL of active tab of window 1
end tell

tell application "Safari"
	make new document at end of documents
	set URL of current tab of window 0 to theURL
	activate
end tell

on appIsRunning(appName)
	tell application "System Events" to (name of processes) contains appName
end appIsRunning