(defun c:ld_cleanup()
  (command "-layout" "set" "model")
  (command "-layout" "delete" "")
  (command "-layout" "delete" "")
  (command "-layout" "delete" "")
  (command "layon")
  (command "laythw")
  (command "-layer" "u" "*" "c" "252" "*" "lw" "d" "*" "")
  (command "setbylayer" "all" "" "" "")
  (command "clayer" "0")
  (command "ucs" "w")
  (command "plan" "")
  (command "angbase" "0")
  (command "snapang" "0")
  (command "-purge" "b" "" "n")
  (command "-purge" "a" "" "n")
  (command "-purge" "r" "" "n")
  (command "-purge" "a" "" "n")
  (command "-purge" "z")
  (command "-purge" "e")
  (command "-purge" "o")
  (command "-purge" "a" "" "n")
  (command "audit" "y")
  (command "indexctl" "3")
  (command "msltscale" "1")
  (command "ltscale" "1")
)

(c:ld_cleanup)
