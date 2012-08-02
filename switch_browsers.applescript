property theURL : ""
property safariState : ""

on appIsRunning(appName)
	tell application "System Events" to (name of processes) contains appName
end appIsRunning

tell application "Google Chrome"
	set theURL to URL of active tab of window 1
end tell

if appIsRunning("Safari") then
	set safariState to "Running"
end if

tell application "Safari"
	
	activate
	reopen
	
	if safariState is equal to "Running" then
		
		tell window 0
			open location theURL
		end tell
		
	else
		
		tell window 0
			set URL of (current tab) to theURL
		end tell
		
	end if
	
end tell
