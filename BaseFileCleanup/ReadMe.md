# Base File Cleanup
Everybody seems to clean CAD files just a little bit differently. I've been finding that the steps below seem to be the best practices for cleaning up base files to keep a set running as smoothly and cleanly as possible, but if you have additions or corrections let me know!

## Setup:
Download the LD_CLEANUP.lsp file from this repository (Right-click > Save Link As...) and save it somewhere you can access it easily. The easiest way to load it into a CAD file is to drag and drop it into model space, so I have mine placed on my desktop on an extra monitor where I'm not usually running CAD. That way it is easy to do that.

## Steps:
Leave the original file in the inbox, save the working copy into the CAD / civil folder. perform the following steps in your working copy:
1. delete all layouts (unless there's something you want to save there)
1. run the PURGESTYLES command a couple times until all Civil 3D styles are purged.
1. Load and run the LD_CLEANUP lisp by dragging / dropping the file into modelspace and typing the command LD_CLEANUP (this command will turn on and unfreeze all layers, and change all colors to 252 / by layer, among other things. Open it in notepad to view if you're curious)
1. Freeze off non-plot and demo layers, and anything else you don't want showing.
1. set your layer colors and linetypes as desired (my typical: Prop Lines 6, Structures 5, walls 4, easements 2, all paving 1, everything else leave as 252)
1. hit save and you're good to xref into your site file.

## Bonus tips:
* For quicker base updates, save a layer state of your finished layer settings and use it to do everything after step 4 above with one click!
