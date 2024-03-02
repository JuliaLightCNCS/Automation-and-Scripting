clear

function readconfiguration(){
$file = Get-Content -Path C:\Users\champuser\Automation-and-Scripting\week7\configurations.txt

$data = $file.split("`n")

$a= @()
$a+=[pscustomobject]@{"Days" = $data[0];`
                      "ExecutionTime" = $data[1];
}
Write-Host ($a | Format-Table | Out-String)

}
function changeconfiguration(){

$operation = $true

while ($operation) {
    $newdays = Read-Host -Prompt "enter the new amount of days. only numbers"
    $newtime = Read-Host -Prompt "enter a time in #:## AM/PM format"
    if ($newdays -match '[\d+]'){
        if ($newtime -match '\d:\d\d [AP]M') {
            Set-Content -Path C:\Users\champuser\Automation-and-Scripting\week7\configurations.txt -value $newdays, $newtime
            Write-Host "config successfully changed"
            return
        }
        else{
            write-host "didn't work try again"
        }
    }
}
}
function configurationmenu(){

$Prompt  = "Please choose your operation:`n"
$Prompt += "1 - Show configuration`n"
$Prompt += "2 - Change Configuration`n"
$Prompt += "3 - Exit`n"

$operation = $true

while($operation){

    write-host $Prompt | Out-String
    $choice = Read-Host

    if($choice -eq 3){
        Write-Host "goodbye" | Out-String
        exit
        $operation = $false
    }
    elseif($choice -eq 1){
    readconfiguration
    }
    elseif($choice -eq 2){
    changeconfiguration
    }
    else{
    Write-Host "That is not a choice!" | outstring
    }
}
}
configurationmenu