(defun c:ba_cleaner( / lytl lyt lystl lyst lystfile nlyst)

;;;set up layerstate saver on close;;;
  (vl-load-com)
  (vlr-dwg-reactor "LS Saver" '((:vlr-beginSave . balayerstate)))
  
;;;Switch to model space and delete all layouts;;;
  (setvar "ctab""Model")
  (setq lytl (layoutlist))
  (foreach lyt lytl (command "-layout" "delete" lyt))

;;;Detach all Xrefs;;;
  (command "-xref" "d" "*")

;;;Purge scale list;;;
  (command "-scalelistedit" "d" "*" "e")
  
;;;Modify layers, set all objects to by layer, and orient view to world;;;
  (command "-layer" "ON" "*" "T" "*" "u" "*" "c" "34" "*" "lw" "d" "*" "S" "0" "")
  (command "setbylayer" "all" "" "" "")
  (command "ucs" "w")
  (command "plan" "")

;;;Purge and audit;;;
  (command "-purge" "b" "" "n")
  (command "-purge" "a" "" "n")
  (command "-purge" "r" "" "n")
  (command "-purge" "a" "" "n")
  (command "-purge" "z")
  (command "-purge" "e")
  (command "-purge" "o")
  (command "-purge" "a" "" "n")
  (command "audit" "y")

;;;Set system variables for use and performance;;;
  (setvar "angbase" 0)
  (setvar "snapang" 0)
  (setvar "indexctl" 3)
  (setvar "msltscale" 1)
  (setvar "ltscale" 1)
  (setvar "visretain" 1)
  (command "base" "0,0,0")

;;;Add an "L-FRZ" layer and make layer 0 white;;;
  (command "-layer" "c" "7" "0" "n" "L-FRZ" "f" "L-FRZ" "")

;;;Get layerstate from previous basefile and apply;;;
  (setq filepath (getvar "DWGPREFIX"))
  (setq lystfile (getfiled "Select file with BA Layerstate to copy" filepath "dwg" 128))
  (if (= lystfile nil) (quit))
  (setq lystl (layerstate-getnames))
  (foreach lyst lystl (layerstate-delete lyst))
  (setq nlyst "BA")
  (layerstate-importfromdb nlyst lystfile)
  (command "layerstate")
 (princ)
)

(defun balayerstate (calling-reactor commandInfo / acadDocument)
  (layerstate-delete "BA")
  (layerstate-save "BA" 255 nil)
  (alert "BA Layerstate saved")
)

;;; Un-comment the line below to auto-run this LISP when you drag and drop it into the file.
;;;(c:ba_cleaner)
