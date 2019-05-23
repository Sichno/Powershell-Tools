#This script is scheduled to start at midnight, This script outputs users who have left files open at that time. 
$date = get-date -format mm-dd-yyyy
Start-Transcript -Path "C:\Temp\OpenFiles_$date.txt" -IncludeInvocationHeader -Append
    Write-Verbose "Log Entry"
    $sessn = New-CIMSession –Computername "your server name goes here"
    Get-SMBOpenFile -CIMSession $sessn |Select-Object -Property ClientComputerName, ClientUserName, Path, FileId,SessionId , Permissions, ShareRelativePath 
    Write-Error "log an error"
Stop-Transcript
