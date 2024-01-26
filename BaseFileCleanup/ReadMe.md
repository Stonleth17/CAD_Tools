# Base File Cleanup
Everybody seems to clean CAD files just a little bit differently. I've been finding that the steps outlined in these LISP files seem to be the best practices for cleaning up base files to keep a set running as smoothly and cleanly as possible, but if you have additions or corrections let me know!

Just a note, LD_CLEANUP is considered deprecated. BA_CLEANER is the new kid on the block and has been improved with new tools and cleaner coding.

## Setup:
Download your preferred file and either add it to your startup suite or save it somewhere you can access it easily for drag and drop loading. If you elect the drag and drop method, un-comment the line that contains the auto-run code (at the end of the script, read the comments) so that it will run immediately when you drop it into your CAD drawing (instead of having to run it after you load it).

## BA_CLEANER Usage:
If it's a civil file, it's best to use the EXPORTC3DDRAWING command in Civil 3D to process it first since we don't routinely work in Civil 3D. This will remove proxy objects so you don't have to worry about missing critical information. DWGs exported from Revit don't contain proxy objects, so don't worry about pre-processing them. Typically we leave the original file in a dated folder under the Siteplans folder and then save the cleaned file with a "_CLEAN" suffix. Once you've preprocessed the file, do the following:
1. Run the BA_CLEANER command. It will delete all layouts, detach all XREFs, turn on and unfreeze all layers, and change all colors to 34 (except layer 0), add an L-FRZ layer, purge and audit, and set a few common settings. Open it in notepad or via the link above to view if you're curious what all the steps are.
2. The last step of the command will open a file dialouge box where you can select the last version of the base file you are updating. If it was cleaned with this command then it should have a layerstate saved called "BA" that will then be loaded. If not, you can hit cancel in this window.
3. Once the previous ayerstate is loaded you'll want to go into your layer manager and take a look at the layers that are turned off. The Layerstate manager will turn off any layers that weren't found in the layerstate, so these are new layers to the drawing. Figure out what is on them and set their look and freeze/thaw state accordingly. Don't use on/off to hide layers, use freeze/thaw (for this and other reasons).
4. If you didn't have the advantage of a past layerstate to copy then you'll have to start from scratch. Freeze off non-plot and demo layers, anything else you don't want showing, and set your layer colors and linetypes.
5. Hit save and you're good to xref into your site file. Just a note, the command will automatically save a layerstate titled BA for future use.

### Bonus tips:
* If there is a command in the lisp that you don't want to run (for example, if you don't want to set all objects to "ByLayer" for colors, linetypes, etc.) then copy BA_CLEANER to your desktop and open it in Microsoft Notepad. Find the line with the command you want to disable and add three semi-colons in front of it: `(command "setbylayer" "all" "" "" "")` becomes `;;; (command "setbylayer" "all" "" "" "")`. Hit save and drag-and-drop it into modelspace to load it into the file, and now when you run BA_CLEANER it will skip that step.

## LD_CLEANUP Usage:
Leave the original CAD Base file in the inbox and save a working copy of it into the CAD / civil folder. perform the following steps in the working copy:
1. run the PURGESTYLES command a couple times until all Civil 3D styles are purged (must be using Civil 3D to use the PURGESTYLES command).
1. Run the LD_CLEANUP lisp. It will proceed to delete all layouts, turn on and unfreeze all layers, and change all colors to 252 / by layer, among other things. Open it in notepad or via the link above to view if you're curious what all the steps are.
1. Freeze off non-plot and demo layers, and anything else you don't want showing.
1. set your layer colors and linetypes as desired (my typical settings are: Prop Lines 6, Structures 5, walls 4, easements 2, all paving 1, everything else leave as 252)
1. hit save and you're good to xref into your site file.

### Bonus tips:
* For quicker base updates, save a layer state of your finished layer settings and use it to do everything after step 3 above with one click! (sometimes you have to open the CAD file and re-save the layer state to be able to import it into a new file)
* If there is a command in the LD_CLEANUP lisp that you don't want to run (for example, if you don't want to set all objects to "ByLayer" for colors, linetypes, etc.) then open LD_CLEANUP.lsp in Microsoft Notepad and add three semi-colons in front of the command you want to disable: `(command "setbylayer" "all" "" "" "")` becomes `;;; (command "setbylayer" "all" "" "" "")`. Hit save and drag-and-drop it into modelspace again, and now when you run LD_CLEANUP CAD will skip that step.
