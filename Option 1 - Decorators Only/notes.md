This option uses attributes on the param block

No additional files needed, which is nice

Must parse through all .ps1 and .psm1 files in the project (maybe must do this on all other approaches too?)

Warnings required for missing bindings

Pros:
- Attributes are explicit
- Everything about one function is all in one file, where the function is defined
- Multiple files, multiple functions per file (if desired)

Cons:
- No way to set Function App level settings
- Enforcability of output type?