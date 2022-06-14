Function registering moved to main.ps1
Registering a function is a cmdlet
No $app object, which means global settings are still necessary (local.settings.json)


Pros:
- User can explicity register which functions/files are to be included
- 

Cons:
- runspace - main.ps1 runs on load metadata request, but other files run on invoke
- 
