#requires -module AzureFunctionsHelpers
using namespace Microsoft.Azure.Functions.Worker

[Function()]
param(
    [HttpTrigger()]
    $Request,
    $TriggerMetadata
)

'The Http Trigger invocation was successful'
