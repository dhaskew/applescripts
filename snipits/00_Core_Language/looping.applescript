-- Looping examples (repeat)
(*
repeat
	display dialog "Prepare to loop forever."
	exit repeat
end repeat
display dialog "Just kidding."
*)

(*
repeat 3 times
	display dialog "This is really boring."
end repeat
display dialog "ZZzzzz...."
*)

-- Looping examples (repeat while)
(*
repeat while 

end repeat
*)

-- Looping examples (repeat until)
(*
set response to ""
repeat until response = "Enough!"
 -- do stuff that sets response
end repeat
*)

-- Looping examples (repeat with)
(*
repeat with x from 3 to 1 by -1
	display dialog x
end repeat
display dialog "Blast off!"
*)

-- Looping examples (repeat with .. in)
(*
repeat with x in {1, 2, 3}
	display dialog x -- 1, 2, 3
end repeat
*)
(*
repeat with x in {1, 2, 3}
	if contents of x = 2 then
		display dialog "2"
	end if
end repeat
*)



