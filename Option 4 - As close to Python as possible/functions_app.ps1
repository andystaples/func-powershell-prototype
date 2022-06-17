<#
import azure.functions as func

app = func.FunctionApp()

@app.function_name(name="HttpTrigger1")
@app.route(route="hello") # HTTP Trigger
def test_function(req: func.HttpRequest) -> func.HttpResponse:
     return func.HttpResponse("HttpTrigger1 function processed a request!!!")
#>
$app = [FunctionApp]::new()
$manifest = @{
     'HttpTrigger1'='hello'
     'HttpTrigger2'='hello2'
     'TimerTrigger1'='timer1'
}

function HttpTrigger1 {
     params(
          [HttpTrigger('Anonymous', ('GET', 'POST'))]$Request,
          $TriggerMetadata
     )

     $value | Push-OutputBinding -Name Response
}

function HttpTrigger2 {
     params(
          [HttpTrigger('Function', ('POST'))]$Request,
          $TriggerMetadata
     )

     $value | Push-OutputBinding -Name Response
}

function TimerTrigger1 {
     params(
        [TimerTrigger('0 */5 * * * *')]$Timer
     )

    # Get the current universal time in the default string format
    $currentUTCtime = (Get-Date).ToUniversalTime()

    # The 'IsPastDue' porperty is 'true' when the current function invocation is later than scheduled.
    if ($Timer.IsPastDue) {
        Write-Host "PowerShell timer is running late!"
    }

    # Write an information log with the current time.
    Write-Host "PowerShell timer trigger function ran! TIME: $currentUTCtime"
}

$app.Register($manifest)
# OR
$manifest | Register-AzureFunctions 
