# Base File Cleanup
Everybody seems to clean CAD files just a little bit differently. I've been finding that the steps below seem to be the best practices for cleaning up base files to keep a set running as smoothly and cleanly as possible, but if you have additions or corrections let me know!

## Setup:
Download LD_CLEANUP.lsp or copy it from the folder on the server. Save it somewhere you can access it easily, I store mine on my desktop so that I can easily drag and drop it into a CAD file. Please note: this command is set up to run IMMEDIATELY when you load it into CAD.

## Steps:
Leave the original CAD Base file in the inbox and save a working copy of it into the CAD / civil folder. perform the following steps in the working copy:
1. run the PURGESTYLES command a couple times until all Civil 3D styles are purged.
1. Run the LD_CLEANUP lisp by dragging / dropping the file (linked above) into modelspace (this command will delete all layouts, turn on and unfreeze all layers, and change all colors to 252 / by layer, among other things. Open it in notepad or via the link above to view if you're curious).
1. Freeze off non-plot and demo layers, and anything else you don't want showing.
1. set your layer colors and linetypes as desired (my typical settings are: Prop Lines 6, Structures 5, walls 4, easements 2, all paving 1, everything else leave as 252)
1. hit save and you're good to xref into your site file.

## Bonus tips:
* For quicker base updates, save a layer state of your finished layer settings and use it to do everything after step 3 above with one click! (sometimes you have to open the CAD file and re-save the layer state to be able to import it into a new file)
* If there is a command in the LD_CLEANUP lisp that you don't want to run (for example, if you don't want to set all objects to "ByLayer" for colors, linetypes, etc.) then open LD_CLEANUP.lsp in Microsoft Notepad and add three semi-colons in front of the command you want to disable: `(command "setbylayer" "all" "" "" "")` becomes `;;; (command "setbylayer" "all" "" "" "")`. Hit save and drag-and-drop it into modelspace again, and now when you run LD_CLEANUP CAD will skip that step.
