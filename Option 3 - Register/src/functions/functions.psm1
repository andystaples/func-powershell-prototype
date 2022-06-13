Register-Binding -Name Request -Type HttpTrigger -Direction 'in' -OtherInfo [PSCustomObject]@{
    AuthLevel: "anonymous",
    Methods: [
      "get",
      "post"
    ]}
Register-Binding -Name Response -Type 'http' -Direction 'out'
Register-AzureFunction -Name 'PushHttpOutputBindingDemo' -Bindings ['Request', 'Response']
