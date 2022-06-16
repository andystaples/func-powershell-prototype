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


Assumptions/Defaults: 
- Function() uses the name of the file, for .ps1, or the function name in .psm1
- HttpTrigger() has an input binding called Request and an output binding called Response
- HttpTrigger() uses Anonymous auth level and supports ['get', 'post'] methods
- TimerTrigger() has no output binding
