$app = [FunctionApp]::new()
$manifest = @{
     'HttpTrigger1'='hello'
}

function HttpTrigger1 {
     params(
          [HttpTrigger()]$Request,
          $TriggerMetadata
     )

     $value | Push-OutputBinding -Name Response
}

$app.Register($manifest)
# OR
$manifest | Register-AzureFunctions 
