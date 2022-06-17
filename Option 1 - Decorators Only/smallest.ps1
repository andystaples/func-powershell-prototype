#requires -module AzureFunctionsHelpers
using namespace Microsoft.Azure.Functions.Worker

[Function()]
param(
    [HttpTrigger()]
    $Request,
    $TriggerMetadata
)

$value =  ([HttpResponseContext]@{
    StatusCode = [HttpStatusCode]::OK
    Body = 'The Http trigger invocation was successful'
})

$value | Push-OutputBinding -Name Response
