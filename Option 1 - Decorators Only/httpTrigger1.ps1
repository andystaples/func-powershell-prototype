#requires -module AzureFunctionsHelpers
using namespace Microsoft.Azure.Functions.Worker

[Function('PushHttpOutputBindingDemo')]
[HttpOutput('response')]
param(
    [HttpTrigger('Anonymous', ('GET', 'POST'))]
    [HttpRequestContext]$Request,
    $TriggerMetadata
)

# Write to the Azure Functions log stream.
Write-Host 'PowerShell HTTP trigger function processed a request.'

# Interact with query parameters or the body of the request.
$name = $Request.Query.Name
if (-not $name) {
    $name = $Request.Body.Name
}

$body = 'This HTTP triggered function executed successfully. Pass a name in the query string or in the request body for a personalized response.'

if ($name) {
    $body = "Hello, $name. This HTTP triggered function executed successfully."
}

# Associate values to output bindings by calling 'Push-OutputBinding'.

$value =  ([HttpResponseContext]@{
    StatusCode = [HttpStatusCode]::OK
    Body = $body
})

$value | Push-OutputBinding -Name response
