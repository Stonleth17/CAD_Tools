(defun c:ld_outbox()
  (command "clayer" "0")
  (command "-layout" "set" "model")
  (command "-layout" "delete" "")
  (command "-layout" "delete" "")
  (command "-layout" "delete" "")
  (command "-layout" "delete" "")
  (command "-layout" "delete" "")
  (command "-layout" "delete" "")
  (command "-layout" "delete" "")
  (command "-layout" "delete" "")
  (command "-xref" "bind" "*")
  (command "-purge" "b" "" "n")
  (command "-purge" "a" "" "n")
  (command "-purge" "r" "" "n")
  (command "-purge" "a" "" "n")
  (command "-purge" "z")
  (command "-purge" "e")
  (command "-purge" "o")
  (command "-purge" "a" "" "n")
  (command "audit" "y")
)
