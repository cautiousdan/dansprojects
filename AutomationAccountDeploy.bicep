/*
AutomationAccountDeploy.bicep
Creates an Azure automation account with local auth disabled and keys stored in Automation account. Uses free SKU.
Name of AA is passed with parameter "nameVariable". Location of AA is passed with parameter "locationVariable".
*/

/* test blah blah blah blah test */
resource symbolicname 'Microsoft.Automation/automationAccounts@2021-06-22' = {

  name: nameVariable
  location: locationVariable
  tags: {
  }
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    disableLocalAuth: true
    encryption: {
      identity: {
      }
      keySource: 'Microsoft.Automation'
     
    }
    publicNetworkAccess: false
    sku: {
      name: 'Free'
    }
  }
}

param locationVariable string
param nameVariable string

/*
To run on Azure use the following command
New-AzResourceGroupDeployment `
  -Name AutomationAccountDeployment `
  -ResourceGroupName rg-PersistentResources-cus-01 `
  -TemplateFile AutomationAccountDeploy.bicep `
  -Tag @{persistentResource="true"}
  
  To deploy a new RG use the following command
  New-AzResourceGroup `
    -Name rg-PersistentResources-cus-01 `
    -Location "Central US" `
    -Tag @{persistentResource="true"}
   
  */
