on appIsRunning(appName)
	tell application "System Events" to (name of processes) contains appName
end appIsRunning

on run argv
	set a_stat to (item 1 of argv)
	#set a_stat to "disable"
	
	set start_iphoto to (item 2 of argv)
	
	set do_work to "no"
	
	if not appIsRunning("iPhoto") then
		if start_iphoto is equal to "yes" then
			set do_work to "yes"
		end if
	else
		set do_work to "yes"
	end if
	
	if do_work is equal to "yes" then
		
		tell application "iPhoto" to activate
		tell application "System Events"
			tell process "iPhoto"
				click menu item 3 of menu "iPhoto" of menu bar 1
				click button "Sharing" of tool bar 1 of window 1
				
				if value of checkbox "Share my photos" of group 1 of group 1 of window 1 is equal to 1 then
					if a_stat is equal to "disable" then
						click checkbox "Share my photos" of group 1 of group 1 of window 1
					end if
				else
					if a_stat is equal to "enable" then
						click checkbox "Share my photos" of group 1 of group 1 of window 1
					end if
				end if
				
				click button 1 of window 1
				
			end tell
		end tell
		
	end if
	
end run

