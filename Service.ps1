# Define variables
$Server = 'localhost'
$ServiceName = 'Sonarr'
$ProviderName = 'Sonarr'
$Service = Get-Service -ComputerName $Server -Name $ServiceName 

# Clear screen and print some logs.
clear
Get-WinEvent -ComputerName $Server -LogName Application -MaxEvents 5 | Format-Table
# Print basic service info.
Write-Output $Service
Write-Output ' '
Write-Output ' '

# While loop that checks if service status is running, If not, keep restarting service.
while ($Service.Status -ne 'Running')
{
    
    write-host -ForegroundColor Red '>>> Service is in a '$Service.Status'state.'
    write-host '>>> Now starting service and checking stability. You could check the logs above while waiting.'
    Start-Service $ServiceName -Verbose

 
    Start-Sleep -seconds 30
    $Service.Refresh()
    if ($Service.Status -eq 'Running')
    {
        Write-Host -ForegroundColor Green '>>> The service is running and seems stable.' 
        Write-Output ' '
        #Write-Output ' '
        Write-Output $Service | Format-Table
    }

}




