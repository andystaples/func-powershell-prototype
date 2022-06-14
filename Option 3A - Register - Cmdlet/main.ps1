Register-Binding -Name Request -Type HttpTrigger -Direction 'in' -OtherInfo [PSCustomObject]@{
    AuthLevel: "anonymous",
    Methods: [
      "get",
      "post"
    ]}
Register-Binding -Name Response -Type 'http' -Direction 'out'
Register-AzureFunction -Name 'PushHttpOutputBindingDemo' -Bindings ['Request', 'Response']

Register-Binding -Name Request2 -Type HttpTrigger -Direction 'in' -OtherInfo [PSCustomObject]@{
  AuthLevel: "anonymous",
  Methods: [
    "get",
    "post"
  ]}
Register-Binding -Name Response2 -Type 'http' -Direction 'out'
Register-AzureFunction -Name 'PushHttpOutputBindingDemo2' -Bindings ['Request2', 'Response2']
