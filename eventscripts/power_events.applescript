-- To receive the eventArgs parameter
-- we wrap the script in an on run handler

on run eventArgs
	
  -- every eventArgs record has a trigger property
  -- that describes the action that caused the script to be executed
	
  set thisTrigger to (trigger of eventArgs)
	
  -- display dialog thisTrigger
	
  -- the name of the disk we care about
  set diskName to "WD2T"
	
  -- the default mount status of the disk is initially Unknown
  set diskStatus to "Unknown"
	
  -- when the power plug is removed or if we lose power from the outlet
  if thisTrigger is "Power switched to battery" then
		
    try
      -- ensure a time machine backup is not running
      set tmStatus to do shell script " tmutil status | grep -c \"Running = 1\""
			
      -- time machine is running, so alert me not to disconnect the drive
      if tmStatus is "1" then
        display dialog "A backup IS running. Don't disconnect your disk yet!"
      end if
			
    on error number 1
			
      -- check to see if the disk is mounted
      tell application "Finder"
        if disk diskName exists then
          set my diskStatus to "Mounted"
        end if
      end tell
			
      if (diskStatus is "Mounted") then
				
        -- ask the user if we should unmount the disk
        set myVariable to (display dialog "No backup running. Eject WD2T?")
				
        -- set theAnswer to the text returned of myVariable
        set theButtonName to the button returned of myVariable
				
        -- eject the disk if user hits "ok" button
        if (theButtonName is "OK") then
          tell application "Finder" to eject disk "WD2T"
        end if
				
      end if
			
    end try
		
  end if
	
	
  -- if the power cord is reattached or power is restored via outlet
  if thisTrigger is "Power switched to mains" then
		
    -- check if disk is mounted
    tell application "Finder"
      if disk diskName exists then
        set my diskStatus to "Mounted"
      end if
    end tell
		
    -- send a message if not mounted
    if (diskStatus is not "Mounted") then
      display dialog "Time Machine Disk Not Connected?"
    end if
  end if
	
end run