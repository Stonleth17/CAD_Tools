# XProbe
This tool is for probing nested elements in a CAD file. It's a bit like XLIST, but instead of only listing the top element in the nested stack it lists all of them.

The original Probe was a classic command from the 90's. This version was written as an update for a couple of reasons:
1. Updating the code to use modern ActiveX commands drastically reduced the number of lines of code, increasing readability and maintainability
2. The routine was also thoroughly commented to explain what each portion is for, which also makes it easier to maintain and revise
3. The original DCL dialogue box has been removed in favor of a cleaner, simpler alert function
4. AND the alert now displays information for the entire stack of entities, from nested xrefs all the way down to individual lines

There's certainly room for improvement, and the list of probed properties could easily be revised. Feel free to leave comments or suggestions, or use it for your own work.