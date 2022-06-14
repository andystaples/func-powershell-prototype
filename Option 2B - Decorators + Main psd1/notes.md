Function registering moved to main.ps1
Registering a function is a cmdlet
No $app object, which means global settings are still necessary (local.settings.json)

Pros:
- Explicity specifying functions to export 
- "Powershelly" experience

Cons:
- No way to specify a route that is not the name of the function
