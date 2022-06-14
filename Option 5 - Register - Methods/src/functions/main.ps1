$app = [FunctionApp]::new()

$app.RegisterHttpBinding('Request', 'in', 'anonymous', ['get', 'post'])
$app.RegisterHttpBinding('Response', 'out')
$app.RegisterAzureFunction('PushHttpOutputBindingDemo' ['Request', 'Response'])
