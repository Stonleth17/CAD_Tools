;;; Program containing routines for cutting a site into sections and generating sheets.
;;; Contains 3 routines (SHEETCUT, SHEETGEN, MATCHLINEGEN).

;;; Written by Josh Wilcox
;;; Last update 04/10/2024

(defun c:sheetcut ( / inpt)

  ;load the dynamic block viewport template
  (setq inpt(getvar "viewctr"))
  (command "_insert"
  			"M:\Files\CADX\TBLOCKS\_Block_ViewportTemplate.dwg" ;block filepath
  			inpt ;insertion point (center of current view)
  			"120" ;default scale, 120 is 1"=10'-0"
			"0") ;rotation
  
  ;prompt user to draw viewport outlines on the viewport layer as plylines
  (alert "Use the view template to determine where sheet boundaries should go
    		\n\n1. Set the scale of the template
    		\n2. Place and copy templates until entire site is covered
    		\n3. Draw closed polyline boundaries for your viewports
    		\n\nWhen you are satisfied, run the SHEETGEN command")
)

(defun c:sheetgen ()
  ; - start with polyline outlines of the sheet areas and select them in order of sheet views
  (setq vpol (ssget "\nSelect viewport outlines in order of sheets..."))
  (setq shtlen (length vpol))

  ; - define valid sheet sizes
  (setq shtsizelst (list "22x34" "24x36" "30x42" "36x48"))

  ; - prompt for sheet size and create sheets based on generic titleblock that can be replaced later
  (setq shtsize(getstring (strcat "\nWhat size sheet? " shtsizelst)))
  (setq shtscale(getstring "\nWhat scale for the viewports? e.g. 120 for 10 scale, 240 for 20, etc..."))
  (if (null (member shtsize shtsizelst))
	(princ "\nPlease input a valid sheet size"
	(progn
		(setq shtsize );retrieve the proper string from the shtsizelist
		;generate a sheet based on shtsize
		;xattach a dummy titleblock
		(setq shtlen(shtlen - 1))
	    (while (shtlen > 0)
			;copy the initial sheet you just made
    	)
	)
    ;if not a real sheet size then repeat sheet size prompt...
  )
  ; - create sheetset and add sheets to it

  ; - rename / renumber automatically?

  ; - create viewports for each sheet based on bounding box min / max of polylines

  ; - copy scaled polylines (on vports layer) aligned to viewports and clip (in case vports aren't square)
  
  ; - generate paperspace matchlines

  ; -   have the user select or draw where matchlines should go

  ; -   test if matchlines overlap with viewports, and if so

  ; -   draw matchlines in paperspace for viewports

  ; -   lastly, generate labels... not sure how to number accurately yet though
)

(defun c:matchlinegen ()
; - use from template to copy sheets from another file
; - automate the find / replace command that changes the matchline labels and sheet titles
; - add sheets to the sheetset (maybe prompt for the exact sheetset so as not to accidnetally add to the wrong one)
)
