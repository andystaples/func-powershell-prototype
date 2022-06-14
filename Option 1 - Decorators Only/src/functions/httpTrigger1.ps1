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
$body | Push-HttpBinding -StatusCode OK -Name response

# NOTE: We have two options here: Either

# $body | Push-HttpBinding -StatusCode OK -Name response
#   This requires defining a Push-<type>Binding for every output binding, but feels more natural
# OR
# Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{StatusCode = [HttpStatusCode]::OK, Body = $body})
#   Which can be parsed using the type attribute of the Value, but requiring this is more explicit