-- Date stuff
-- current date
--weekday of (current date)
--month of (current date)
--year of (current date)

-- what is the current date and time?
--current date

-- what was the date 2 days ago?
set yesterday to (current date) - (2 *days)


-- If you want to ensure that "yesterday" means the start of yesterday 
-- (rather than exactly 24 hours ago), then you might consider something like:

tell (current date) to set yesterday to it - days - time

-- another, albiet slower, similar method as previous example
date (date string of ((current date) - days))

-- secondsSince:
-- Returns the number of seconds since 'aDate'
on secondsSince(aDate)
	set curr to (current date)
	set elapsed to (curr - aDate)
	return elapsed
end secondsSince
