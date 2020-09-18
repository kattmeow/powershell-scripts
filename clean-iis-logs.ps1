$LogPath = "C:\inetpub\logs\LogFiles\" 
$maxDaystoKeep = -7 
#$outputPath = "c:\CleanupTask\Cleanup_Old_logs.log" 
Set-Location -Path $LogPath 
$itemsToDelete = Get-ChildItem $LogPath -Filter *.log -Recurse | Where LastWriteTime -lt ((get-date).AddDays($maxDaystoKeep))  
   
If ($itemsToDelete.Count -gt 0){ 
    ForEach ($item in $itemsToDelete){ 
        Get-item $item.FullName | Remove-Item -Verbose
    } 
     
    Write-Output "IIS Log Retention: Cleanup of log files older than $((get-date).AddDays($maxDaystoKeep)) completed..."
} 
Else
{ 
    Write-Output "IIS Log Retention: No items to be deleted today $($(Get-Date).DateTime)"
} 
  
Start-Sleep -Seconds 10
