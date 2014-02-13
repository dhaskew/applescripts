
-- containment checks
log {1, 2} contains 2 -- true
log {1, 2, 3} contains {2, 3} -- true
log {1, 2, 3} contains {1, 3} -- false -- lists are orderd, and items must be compared in sequence
log {name:"Matt", age:"51"} contains {name:"Matt"} -- true

--Records are not internally ordered:
log {name:"Matt", age:"51"} contains {age:"51", name:"Matt"} -- true

--containment in reverse
log 2 is in {1, 2}

log "XXXXXXX"

--final containment
log {1, 2} ends with 2  -- true
