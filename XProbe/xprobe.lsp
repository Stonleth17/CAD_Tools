;;; Program for probing details of objects in a CAD file, specifically designed
;;; to list nested objects and the objects they are nested inside.

;;; Written by Josh Wilcox
;;; Last update 02/28/2024

(vl-load-com)
(defun c:xprobe (/ sel len el1 elx ents count xdump n obj typ name lay col pos ltp props msg)
  
  ;Set program to loop for ease of use on multiple entities
  (while
    
    ;Get primary entity to probe
    (setq sel (nentsel "\nSelect nested xref or block object to probe: "))
    
    ;if nested, create list of nesting entities with primary entity at the top
    (if (> (setq len (length sel)) 2)
      (progn
      	(setq el1 (car sel))
	      (setq elx (last sel))
	      (setq ents (vl-list* el1 elx))))
    
    ;set up nest counter and empty list for entity property strings
    (setq count 0)
    (setq xdump (list ""))

	;;;BEGIN FOR Loop;;;
    (foreach n ents
      
      ;;;FOR Loop Section 1:
      ;;;create strings for each property from raw CAD output
      
      ;get the object's type, if needed replace "INSERT" with "BLOCK" or "XREF"
      (setq obj (vlax-ename->vla-object n))
      (setq typ (assoc 0 (entget n)))
      (if (= (cdr typ) "INSERT")
        (progn
          (if (vlax-property-available-p obj 'Path)
            (setq typ "XREF")
            (setq typ "BLOCK")))
        (setq typ (cdr typ)))
      
      ;get the object's name if it exists otherwise return "(none)"
      (setq name (if (vlax-property-available-p obj 'Name)
                   (vlax-get-property obj 'Name)
                   "(none)"))
      
      ;get the object's layer
      (setq lay (vlax-get-property obj 'Layer))
      
      ;get the object's color code and translate to readable string
      (setq col (vlax-get obj 'color))
      (cond
        ((= col 256) (setq col "ByBlock"))
        ((= col 255) (setq col "ByLayer"))
        ((setq pos (vl-position col '(1 2 3 4 5 6 7)))
         (setq col (nth pos '("Red" "Yellow" "Green" "Cyan" "Blue" "Magenta" "White"))))
        (T (setq col (itoa col))))
      
      ;get the object's linetype
      (setq ltp (vlax-get-property obj 'Linetype))
      
      ;;;FOR Loop Section 2:
	  ;;;build into a single string and append it to property strings list
      
      ;build the individual property strings into one string
      (setq props (strcat
        "----------Nest Level " (itoa count) "----------"
        "\nObject:		" typ
        "\nName:		" name
        "\nLayer:		" lay
        "\nColor:		" col
        "\nLinetype:		" ltp
        "\n\n"
        )
      )
      
      ;Update count variable and append properties string to the property strings list
      (setq count (+ count 1))
      (setq xdump (append xdump (list props)))
    );;;END FOR Loop;;;
    
    ;combine the property strings list into a single string for the alert
    ;reverse the property strings list so the outermost entity reads first
    (setq msg "")
    (foreach n (reverse xdump)
      (setq msg (strcat msg n)))
    
    ;send the alert
    (alert msg)
  )
  (princ)
)
