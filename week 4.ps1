clear

#Get-Content C:\xampp\apache\logs\access.log

#Get-Content -Path C:\xampp\apache\logs\access.log -Tail 5

#Get-Content -Path C:\xampp\apache\logs\access.log | Select-String '404 ','400 '

#Display only logs that does NOT contain 200 (OK)
#Get-Content -Path C:\xampp\apache\logs\access.log | Select-String '200 ' -NotMatch

#From every file with .log extension in the directory, only get logs that contain the word 'error'
#$A = get-childitem -path C:\xampp\apache\logs\*.log | select-string 'error'
#$A[-5,-1]
#$A

#Display only IP addresses for 404 (Not Found) records
<# $notfounds = get-content -Path C:\xampp\apache\logs\access.log| Select-String ' 404 '

$regex = [regex] "\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b"

$ipsunorganized = $regex.Matches($notfounds)

$ips = @()
for($i=0; $i -lt $ipsunorganized.Count; $i++){
 $ips += [pscustomobject]@{"IP" = $ipsunorganized[$i].value;}
 }
$ips | Where-Object { $_.IP -ilike "10.*"}#>

$ipsoftens = $ips | Where-Object { $_.IP -ilike "10.*"}
$counts = $ipsoftens | group ip
$counts | select-object Count, Name