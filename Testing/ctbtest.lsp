; - Function for generating a single colored line for each of AutoCAD's 255 index colors.
; - Useful for testing CTB tables (hence the name).
; - Future versions may be able to also print the details of the pen table next to the line?
; - Most likely that is impossible using LISP though.

(defun c:test_ctb ( / pt1 LC LL LO pt2 pt3)

;pick point to place first line
  (setq pt1 (getpoint "Select top left corner")) ;starting point for first line
  (setq LC 1) ;starting color for first line
  (setq LL 2) ;length of lines
  (setq LO (list 0 0.25)) ;offset for lines

;begin loop:
  (while (< LC 256) ;stops loop after generating 255 lines
    
    ;place line and set color
    (setq pt2 (list (+ (car pt1) LL) (cadr pt1)))
    (entmake (list '(0 . "LINE") (cons 10 pt1) (cons 11 pt2) (cons 62 LC)))
    
    ;place text next to line
    (setq pt3 (mapcar '+ pt1 '(-0.0625 0)))
    (entmake (list '(0 . "TEXT") (cons 1 (itoa LC)) (cons 10 pt3) (cons 40 0.125) (cons 11 pt3) '(72 . 2) '(73 . 2)))
    
    ;set next line location
    (setq pt1 (mapcar '- pt1 LO))
    
    ;set next color#
    (setq LC (1+ LC))
  )
  (princ)
)
