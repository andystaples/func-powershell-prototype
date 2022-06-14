$app = [FunctionApp]::new()

$methods = 'get', 'post'
$bindings = 'Request', 'Response'

$app.RegisterHttpBinding('Request', 'in', 'anonymous', $methods)
$app.RegisterHttpBinding('Response', 'out')
$app.RegisterAzureFunction('PushHttpOutputBindingDemo', $bindings)
