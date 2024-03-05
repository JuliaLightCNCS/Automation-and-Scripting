
. "C:\Users\champuser\Automation-and-Scripting\week6\turn to menu\functions.ps1"

clear

$Prompt  = "Please choose your operation:`n"
$Prompt += "1 - Display last 10 apache logs`n"
$Prompt += "2 - Display last 10 failed logins for all users`n"
$Prompt += "3 - Display at risk users`n"
$Prompt += "4 - Start Champlain.edu`n"
$Prompt += "5 - Exit`n"

$operation = $true

while($operation){

    
    Write-Host $Prompt | Out-String
    $choice = Read-Host 

    if($choice -eq 5){
        Write-Host "Goodbye" | Out-String
        exit
        $operation = $false 
    }

    elseif($choice -eq 1){
    $last10logs = getapachelogs | select -Last 10
    $last10logs
    }

    elseif($choice -eq 2){
    $days = Read-Host -Prompt "please enter the number of days for failed logins"
    $userlogon = failedapachelogs $days
    Write-Host($userlogon | Where-Object{$_.User -ilike "*$name"} |select -Last 10 | Format-Table | Out-String)
    }

    elseif($choice -eq 3){ 
    $days = Read-Host -Prompt "please enter the number of days for failed logins"
    $failedLogins = failedapachelogs $days

    $atriskusers = $failedLogins | Group-Object -Property User | Where-Object {$_.count -gt 10}

    Write-Host "users with more than 10 failed logins in the last $days days" | Out-String
    foreach($i in $atriskusers){
    Write-Host "users: $($i.Name)", "count: $($i.count)" | Out-String
    }
    }

    elseif($choice -eq 4){
    champlain
    }
    else{
        Write-Host "try another selection as  the one you entered doesn't exist"
    }
}