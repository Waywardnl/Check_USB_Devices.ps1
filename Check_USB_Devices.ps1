$InitialUSB = Get-PnpDevice -PresentOnly | Where-Object { $_.InstanceId -match '^USB' }


$RunUSB = 1

while ($RunUSB -gt 0)
  {
    Write-Host "***************************************" -ForegroundColor Gray
    Write-Host $InitialUSB -ForegroundColor Gray
    Write-Host "***************************************" -ForegroundColor Gray

    sleep 30

    $CurrentUSB = Get-PnpDevice -PresentOnly | Where-Object { $_.InstanceId -match '^USB' }

    if ("$InitialUSB" -eq "$CurrentUSB")
      {
        Write-Host "USB Devices are the same" -ForegroundColor Green

        Write-Host "#############################################" -ForegroundColor Green
        Write-Host $InitialUSB -ForegroundColor Green
        Write-Host "---------------------------------------------" -ForegroundColor Green
        Write-Host $CurrentUSB -ForegroundColor Green
      }
    else
      {
        Write-Host "USB Devices are different" -ForegroundColor Red

        Write-Host "#############################################" -ForegroundColor Red
        Write-Host $InitialUSB -ForegroundColor Red
        Write-Host "---------------------------------------------" -ForegroundColor Red
        Write-Host $CurrentUSB -ForegroundColor Red

        $RunUSB = 0
      }
  }
