-- not all apps implement transactions in the same way
-- it usually helps maintain consistency, and "monopolizes" the app in question

-- basic structure
(*
with transaction
    -- transactional code
end transaction
*)

--In this example, we monopolize FileMaker Pro long enough to create a Find request and perform it:

(*
tell application "FileMaker Pro"
    with transaction
        tell database 1
            show every record
            set f to create new request
            set cell "lastname" of f to "neuburg"
            find
        end tell
    end transaction
end tell
*)