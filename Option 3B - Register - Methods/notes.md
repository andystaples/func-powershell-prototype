Bindings and functions both registered in main.ps1
No attributes or, really, changes needed in functions files
$app object exists

Pros:
- .ps1/.psm1 files don't need to change from legacy model
- Object model for Function App / app-level settings ?

Cons:
- High barrier to entry - almost the same as legacy programming model
- More verbose than function.json
- @PSCustomObject leaves Intellisense limited
