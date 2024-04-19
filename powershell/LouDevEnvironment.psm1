# Start the vmdev1 and vmdev2
function Start-DevEnvironment {
    Connect-AzAccount

    $sub = Get-Secret -Name 'SubscriptionID' | ConvertFrom-SecureString -AsPlainText

    Set-AzContext -Subscription $sub

    Import-Module az

    Write-Output "Starting vmdev1..."
    Start-AzVM -ResourceGroupName "rg-lou-dev-env" -Name "vmdev1"
    Write-Output "Starting vmdev2..."
    Start-AzVM -ResourceGroupName "rg-lou-dev-env" -Name "vmdev2"
}

# stop vmdev1 and vmdev2
function Stop-DevEnvironment {
    Connect-AzAccount

    $sub = Get-Secret -Name 'SubscriptionID' | ConvertFrom-SecureString -AsPlainText

    Set-AzContext -Subscription $sub

    Import-Module az

    Write-Output "Stopping vmdev1..."
    Stop-AzVM -ResourceGroupName "rg-lou-dev-env" -Name "vmdev1"
    Write-Output "Stopping vmdev2..."
    Stop-AzVM -ResourceGroupName "rg-lou-dev-env" -Name "vmdev2"
}

Export-ModuleMember -Function Start-DevEnvironment
Export-ModuleMember -Function Stop-DevEnvironment