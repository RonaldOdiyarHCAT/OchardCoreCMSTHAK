
# Based off script / instructions from this site...
# https://dailydotnettips.com/deploy-azure-web-apps-from-visual-studio-code/

# Start Deploying Azure Web App from Visual Studio Code using Cloud Shell

$gitrepo="https://github.com/RonaldOdiyarHCAT/OchardCoreCMSTHAK"
$webappname="waThakOrchardCMS"
$location="Central US"
$myresourceGroup ="rgThakOrchardCoreCMS"


# Creating the Azure Resource group for Web Application
New-AzureRmResourceGroup -Name $myresourceGroup -Location $location

# Creating the Azure App Services Plan
New-AzureRmAppServicePlan -Name $webappname -Location $location -ResourceGroupName $myresourceGroup -Tier Free


# Creating the Web App Resource under the newly created App Service Plan
New-AzureRmWebApp -Name $webappname -Location $location -AppServicePlan $webappname -ResourceGroupName $myresourceGroup



# Set Git Properties
$PropertiesObject = @{
repoUrl = "$gitrepo";
branch = "master";
}

# Final Deployment of Solution
Set-AzureRmResource -PropertyObject $PropertiesObject -ResourceGroupName $myresourceGroup -ResourceType Microsoft.Web/sites/sourcecontrols -ResourceName $webappname/web -ApiVersion 2018-02-01 -Force