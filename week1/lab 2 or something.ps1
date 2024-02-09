#clear
#(Get-NetIpAddress -AddressFamily IPv4| Where-Object {$_.interfaceAlias -ilike "Ethernet0"}).IPAddress

#clear
#(Get-NetIPAddress -AddressFamily IPv4 |where-object {$_.interfaceAlias -ilike "Ethernet0"}).prefixlength

#clear
#Get-WmiObject -list | Where-Object {$_.root -ilike "Win32_net"} 

#clear
#Get-WmiObject -list | Where-Object {$_.root -ilike "Win32_net"} |

#clear
#Get-CimInstance Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled=$true" | select DHCPServer

#clear
#Get-CimInstance Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled=$true" | `
#select DHCPServer | Format-Table -HideTableHeaders

#clear
#(Get-DnsClientServerAddress -AddressFamily IPv4 | `
#Select-Object {$_.InterfaceAlias -ilike "Ethernet"}).ServerAddresses.0

clear
cd $PSScriptRoot

$files=($PSScriptRoot)
for ($j=0; $j -le $files.Length; $j++){

   if ($files[$j].length -ilike "*ps1"){
       Write-Host $files[$j].length
    }
}

$folderpath="$PSScriptRoot\outfolder"
if (-not $folderpath){
   Write-Host "Folder Already Exists"
}
else{
    New-Item -Path $folderpath
}

clear
cd $PSScriptRoot
$files=($PSScriptRoot)

$folderpath = "$PSScriptRoot/outfolder/"
$filepath = -Directory $folderpath "out.csv"

$files | -Get-ChildItem -Path $filepath -eq ".ps1"*|`
Export-Csv -Path $filepath