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
}

function HttpTrigger1 {
     params(
          [HttpRequest]$Request,
          $TriggerMetadata
     )

     $value | Push-OutputBinding -Name Response
}

$app.Register($manifest)
# OR
$manifest | Register-AzureFunctions 
