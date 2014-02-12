-- How to use a tell block
(*
script fb
	property myname : "poopy"
	on sayName()
		display dialog myname
	end sayName
end script

tell fb
	set its myname to "my name is poopy"
	sayName()
end tell
*)
-- end how to use a tell block