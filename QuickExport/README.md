# QXPORT (Quick Export)
LISP file for prepping files to send externally. Will delete all layouts, bind all Xrefs, purge and audit the file, and prompt you to save as a new file (i.e. in an outbox or sent folder).

### Needs Work:
- If any xrefs are unloaded all xrefs will fail to bind. Need to refactor so that xrefs are processed prior to the bind command.
- It might be a good idea to save a temporary file first, clean the file, then save in a new directory to prevent accidental overwrites?
