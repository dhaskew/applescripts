-- during interapplication communications the sender of an Apple 
-- event may specify that it has no intention of waiting around
-- for a reply. It doesn't care what the result is; it doesn't care
-- if there's an error. It just wants to send the Apple event and be
-- done with it, proceeding immediately to its own next step.
-- In AppleScript, here's how to send such an Apple event:
(*
ignoring application responses
    -- code
end ignoring
*)


-- Here are the string considerations:

-- case
-- If ignored, uppercase and lowercase variants of the same letter are taken to be equivalent. Ignored by default.

-- diacriticals
-- If ignored, variants of the same letter with different accent marks (or no accent mark)
-- are taken to be equivalent. Considered by default.

-- expansion
-- If ignored, ligatures are taken to be equivalent to their component characters. Considered by default.

-- hyphens
-- If ignored, hyphens are taken not to exist. Considered by default.

-- punctuation
-- If ignored, word-boundary punctuation and quotation marks and apostrophes are taken not to exist.
-- Considered by default.

-- white space
-- If ignored, spaces, tabs, and line-break characters are taken not to exist. Considered by default.

-- numeric strings
-- (New in Tiger.) If considered, the string is treated as a version number, 
-- consisting of sections delimited by a period; order is determined by successive
--  numeric comparison of these sections.


-- Here's the syntax for writing a string consideration:

(*
considering | ignoring considerations [but ignoring | considering considerations]
    -- code
end considering | ignoring
*)

-- Each set of considerations is any number of string considerations separated by comma;
-- AppleScript will rewrite the last comma as and. Entire string consideration blocks
-- may also be nested. So, for example:
(*
ignoring hyphens, expansion and punctuation
    considering white space but ignoring case and diacriticals
        "a-" = "!" -- true
    end considering
end ignoring
*)

--String considerations are Unicode-savvy:
(*
set bigEpsilon to Çdata utxt0395È as Unicode text
set littleEpsilon to Çdata utxt03B5È as Unicode text
ignoring case
    bigEpsilon = littleEpsilon -- true
end ignoring
*)

--Here's an example illustrating the new numeric strings consideration:
(*
"1.10" > "1.9.3" -- false
considering numeric strings
    "1.10" > "1.9.3" -- true
end considering
*)
-- In the comparison inside the considering block, 1 is equal to 1 so we 
-- proceed to the next section; 10 is greater than 9 so that's the result of the comparison.

