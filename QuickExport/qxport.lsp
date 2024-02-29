;;; Routine for prepping files to send to a consultant.
;;; Will delete all layouts, bind all Xrefs, purge, audit, and save as a new file.

;;; Written by Josh Wilcox
;;; Last update 02/28/2024

(defun c:qxport(/ lytl lyt filepath savepath doc)

  ;set current layer to 0
  (command "clayer" "0")
  
  ;Switch to model space and delete all layouts
  (setvar "ctab""Model")
  (setq lytl (layoutlist))
  (foreach lyt lytl (command "-layout" "delete" lyt))
  
  ;bind all xrefs
  (command "-xref" "bind" "*")
  
  ;purge and audit the file
  (command "-purge" "b" "" "n")
  (command "-purge" "a" "" "n")
  (command "-purge" "r" "" "n")
  (command "-purge" "a" "" "n")
  (command "-purge" "z")
  (command "-purge" "e")
  (command "-purge" "o")
  (command "-purge" "a" "" "n")
  (command "audit" "y")
    
  ;perform a saveas operation
  (setq filepath (getvar "DWGPREFIX"))
  (setq savepath (getfiled "Save Drawing As..." filepath "dwg" 1))
  (setq doc (vla-get-activedocument (vlax-get-acad-object)))
  (vla-saveas doc savepath)
  
  (princ)
)