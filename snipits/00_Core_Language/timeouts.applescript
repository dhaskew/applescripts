-- All Apple events sent to target applications have a default timeout value of one minute.

--The maximum permissible value is 8947848.

--In Tiger there is no penalty for using a larger number, but it will be treated as 8947848;
--on earlier systems, a larger number will cause a 
--runtime error ("The result of a numeric operation was too large ").

--To illustrate, we'll command the Finder to perform an operation so long that 
--without a timeout specification, it probably wouldn't have time to reply.  
--we'll ask it to cycle down the entire hierarchy looking for a certain kind of file:
(*
with timeout of 100000 seconds
    tell application "Finder"
        get every application file of entire contents 


            of disk 1 where its creator type is "aplt"
    end tell
end timeout
*)


-- An expired timeout is an error like any other; this example shows a way to handle it:
(*
try
    tell application "Finder"
        activate
        with timeout of 1 second
            display dialog "Press a button." giving up after 2
        end timeout
    end tell
on error number -1712
    activate
    display dialog "Ha ha, not fast enough!"
end try
*)

