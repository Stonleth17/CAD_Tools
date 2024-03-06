;;; Routine for prepping files to send to a consultant.
;;; Will delete all layouts, bind all Xrefs, purge, audit, and save as a new file.

;;; Written by Josh Wilcox
;;; Last update 02/28/2024

(defun c:qxport(/ lytl lyt dir date name ndir spath doc)

  ;set current layer to 0
  (command "-layer" "t" "0" "s" "0" "")
    
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
  (setq dir (getvar "DWGPREFIX"))
  (setq date (rtos (getvar "CDATE") 2 0))
  (setq date (strcat (substr date 1 4) "." (substr date 5 2) "." (substr date 7 2)))
  (setq name (getvar "DWGNAME"))
  (setq ndir (strcat dir date "_" name))
  (setq spath (getfiled "Save Drawing As..." ndir "dwg" 1))
  (setq doc (vla-get-activedocument (vlax-get-acad-object)))
  (vla-saveas doc spath)
  
  (princ)
)
