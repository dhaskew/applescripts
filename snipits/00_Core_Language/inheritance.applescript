-- inheritance example
(*
script mommy
	on talk()
		display dialog "How do you do?"
	end talk
end script
script baby
	property parent : mommy
end script
baby's talk() -- How do you do?
*)