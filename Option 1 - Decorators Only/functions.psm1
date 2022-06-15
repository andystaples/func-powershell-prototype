<#
TODO: Need a way to specify the output response
#>
function PushHttpOutputBindingDemo1 
{
    [Function('PushHttpOutputBindingDemo')]
    [HttpOutput('Response')]
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
    
    $value =  ([HttpResponseContext]@{
        StatusCode = [HttpStatusCode]::OK
        Body = $body
    })

    Push-OutputBinding -Name Response -Value $value

    $value | Push-OutputBinding -Name
    #   Which can be parsed using the type attribute of the Value, but requiring this is more explicit
    # OR we register the Name in the main.ps1/equivalent and just use the syntax from the legacy model - less retooling
}

function PushHttpOutputBindingDemo2
{
    [Function('PushHttpOutputBindingDemo')]
    [HttpOutput('Response')]
    param(
        [HttpTrigger('function', ('GET'))]
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

    $value =  ([HttpResponseContext]@{
        StatusCode = [HttpStatusCode]::OK
        Body = $body
    })

    # Associate values to output bindings by calling 'Push-OutputBinding'.
    $value | Push-OutputBinding -Name Response

    # NOTE: We have a couple of options here: Either
    
    # $body | Push-HttpBinding -StatusCode OK -Name response
    #   This requires defining a Push-<type>Binding for every output binding, but feels more natural
    # OR
    # Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{StatusCode = [HttpStatusCode]::OK, Body = $body})
    #   Which can be parsed using the type attribute of the Value, but requiring this is more explicit
    # OR we register the Name in the main.ps1/equivalent and just use the syntax from the legacy model - less retooling
} 
