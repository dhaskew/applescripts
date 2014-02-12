-- containment checks
-- {1, 2} contains 2 -- true
--{1, 2, 3} contains {2, 3} -- true
--{1, 2, 3} contains {1, 3} -- false -- lists are orderd, and items must be compared in sequence
--{name:"Matt", age:"51"} contains {name:"Matt"} -- true
--Records are not internally ordered:
--{name:"Matt", age:"51"} contains {age:"51", name:"Matt"} -- true

--containment in reverse
--2 is in {1, 2}

--final containment
--{1, 2} ends with 2  -- true