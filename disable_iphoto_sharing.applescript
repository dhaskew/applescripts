set toggle_a to "/Users/dhaskew/code/projects/applescripts/toggle_iphoto_sharing.scpt"

set toggle_b to POSIX file toggle_a

set mode to "disable"

set sphoto to "no"

run script toggle_b with parameters {mode, sphoto}