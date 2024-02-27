(vl-load-com)
(defun c:xprobe (/ col ent obj name pos sel entlst)
  (while
    (setq sel (nentsel "\nSelect nested xref or block object to list: "))
    (if (> (setq len (length sel)) 2)
      (progn
      	(setq el1 (car sel))
	      (setq elx (last sel))
	      (setq ents (vl-list* el1 elx))
      )
    )
    (setq count 0)
    (setq xdump (list ""))
    (foreach n ents
      (setq obj (vlax-ename->vla-object n))
      (setq col (vlax-get obj 'color))
      (cond
        ((= col 256) (setq col "ByBlock"))
        ((= col 255) (setq col "ByLayer"))
        ((setq pos (vl-position col '(1 2 3 4 5 6 7)))
         (setq col (nth pos '("Red" "Yellow" "Green" "Cyan" "Blue" "Magenta" "White"))))
        (T (setq col (itoa col)))
      )
      (setq props (strcat
        "---NESTED LEVEL " (itoa count) "---"
        "\nName:       "  (if (vlax-property-available-p obj 'Name)
                            (vlax-get-property obj 'Name)
                            "(none)")
        "\nLayer:       " (vlax-get-property obj 'Layer)
        "\nColor:       " col
        "\nLinetype:    " (vlax-get-property obj 'Linetype)
        "\n"
        )
      )
      (setq count (+ count 1))
      (setq xdump (append xdump (list props)))
    )
    (princ xdump)
    (setq msg "")
    (foreach n xdump
      (setq msg (strcat msg n)))
    (alert msg)
    ; (alert props)
  )
  (princ)
)
