-- To throw an error, use the error command. It has five optional parameters:

(*
error [messageString]
    [number shortInteger]
    [partial result list]
    [from anything]
    [to class]
*)

--Here are the default values of the parameters:

--messageString
--	Nothing

--number
--	-2700

--partial result
--	The empty list

--from
--	The currently executing script or script object

--to
--	The class item

-- simple example
-- error "Things fall apart, the centre cannot hold."


-- a basic try block, with no error handling
-- situation a: I don't want to quit my script if I have an unexplainable error
-- situation b: I might have an error, but I don't care, keep going
(*
try
    -- code in which errors will be caught
end try
*)

-- In the second, fuller form of try block, you supply a second block,
-- an error block , presumably containing some error-handling functionality:
(*
try
    -- code in which errors will be caught
on error [parameters]
    -- error-handling code
end try
*)


-- a more complex example
(*
on getFavoriteColor( )
    try
        set r to display dialog "What is your favorite color?" default answer ""
    on error
        error number 1001
    end try
    set s to text returned of r
    if s = "" then error number 1000
    return s
end getFavoriteColor
set c to ""
repeat until c is not ""
    try
        set c to getFavoriteColor( )
    on error number n
        if n = 1000 then
            display dialog "You didn't enter a color!" buttons "OK"
        else if n = 1001 then
            display dialog "Why did you cancel? Tell me!" buttons "OK"
        end if
    end try
end repeat
display dialog "Aha, you like " & c & ", eh?"
*)


