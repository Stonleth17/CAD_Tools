;;; Program containing routines for cutting a site into sections and generating sheets.
;;; Contains 3 routines (SHEETCUT, SHEETGEN, MATCHLINEGEN).

;;; Written by Josh Wilcox
;;; Last update 04/10/2024

(defun c:sheetcut ( / inpt)

  ;load the dynamic block viewport template
  (setq inpt(getvar "viewctr"))
  (command "_insert"
  			"M:\\Files\\CADX\\TBLOCKS\\_Block_ViewportTemplate.dwg" ;block filepath
  			inpt ;insertion point (center of current view)
  			"120" ;default scale, 120 is 1"=10'-0"
			"0") ;rotation
  
  ;prompt user to draw viewport outlines on the viewport layer as plylines
  (alert "Use the view template to determine where sheet boundaries should go
    		\n\n1. Pick the desired sheet size from the dropdown
		\n2. Set the scale of the block to the desired viewport scale
    		\n3. Place and copy templates until entire site is covered
    		\n4. Draw closed polyline boundaries for your viewports
    		\n\nWhen you are satisfied, run the SHEETGEN command")
  (princ)
)

(defun c:sheetgen ()
  ; - start with polyline outlines of the sheet areas and select them in order of sheet views
  (setq ss (ssget));"\nSelect viewport outlines in order of sheets..."))
  
  ; - define valid sheet sizes
  (setq shtsizelst (list "22x34" "24x36" "30x42" "36x48"))

  ; - prompt for first sheet number
  (setq shtpfnum (getstring "\nEnter the sheet umber prefix (e.g. for L2.01 enter L2.)"))
  (setq shtnum 1)

  ; - prompt for sheet size and create sheets based on generic titleblock that can be replaced later
  (setq shtsize(getstring (strcat "\nWhat size sheet? Options: 22x34, 24x36, 30x42, 36x48")))
  (setq shtscale(getstring "\nWhat scale for the viewports? e.g. 120 for 10 scale, 240 for 20, etc..."))
  (if (null (member shtsize shtsizelst))
	(princ "\nPlease input a valid sheet size")

	;make this a for loop on the polyline ss
	(repeat (setq i (sslength ss))

		;generate a sheet based on shtsize
		(command "-layout" "t" "M:\\Files\\CADX\\TBLOCKS\\_TemplateLayouts.dwg" shtsize)
		(command "-layout" "set" shtsize)
		(command "-layout" "rename" "" (strcat shtpfnum (itoa shtnum)))
		(setq shtnum (1+ shtnum))

		;place the viewport based on the polyline
		

    	)
  )
  ; - rename / renumber automatically?

  ; - create viewports for each sheet based on bounding box min / max of polylines

  ; - copy scaled polylines (on vports layer) aligned to viewports and clip (in case vports aren't square)
  
  ; - generate paperspace matchlines

  ; -   have the user select or draw where matchlines should go

  ; -   test if matchlines overlap with viewports, and if so

  ; -   draw matchlines in paperspace for viewports

  ; -   lastly, generate labels... not sure how to number accurately yet though

  ; -  Alert user to set up a sheetset
)

(defun c:matchlinegen ()
; - use from template to copy sheets from another file
; - automate the find / replace command that changes the matchline labels and sheet titles
; - add sheets to the sheetset (maybe prompt for the exact sheetset so as not to accidnetally add to the wrong one)
)
