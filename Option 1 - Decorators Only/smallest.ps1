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
    Body = 'The Azure Function executed successfully'
})

$value | Push-OutputBinding -Name Response
