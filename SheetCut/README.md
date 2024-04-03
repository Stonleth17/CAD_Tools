# Suite of tools for cutting a project into sheets

### generate scaled sheet template
- use a dynamic block
- prompt user to draw viewport outlines on the viewport layer as plylines

### generate viewports and sheets
- start with polyline outlines of the sheet areas
- select polylines in order of sheets views
- prompt for sheet size and create sheets based on generic titleblock that can be replaced later
- create sheetset and add sheets to it
- rename / renumber automatically?
- create viewports for each sheet based on bounding box min / max of polylines
- copy scaled polylines (make sure they're on vports layer) aligned to their respoective viewports and clip the viewports with them (just in case vports aren't square)
- generate paperspace matchlines
-   have the user select or draw where matchlines should go
-   test if matchlines overlap with viewports, and if so
-   draw matchlines in paperspace for viewports
-   lastly, generate labels... not sure how to number accurately yet though

### copy sheets from another file
- use from template to copy sheets from another file
- automate the find / replace command that changes the matchline labels and sheet titles
- add sheets to the sheetset (maybe prompt for the exact sheetset so as not to accidnetally add to the wrong one)
