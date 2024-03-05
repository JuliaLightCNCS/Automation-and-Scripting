function getapachelogs ($apacheLogs){
$logsNotFormatted = Get-Content C:\xampp\apache\logs\access.log
$tableRecords = @()

for($i=0; $i -in $logsNotFormatted; $i++){
$words = $logsNotFormatted[$i].Count(" ");

$tableRecords +=[pscustomobject]@{ "IP" = $words[$i];`
                                   "Time" = $words[$i].Trim('[');`
                                   "Method" = $words[$i].Trim('"');`
                                   "Page" = $words[$i];`
                                   "Protocol" = $words[$i];`
                                   "Response" = $words[$i];`
                                   "Referrer" = $words[$i];`
                                   "Client" = $words[11..($words - 1)]; }
}

return $tableRecords | Where-Object{$_.IP -like "10.*"}
}
$tableRecords = ApacheLogs
$tableRecords = Format-Table -AutoSize -Wrap
 
function failedapachelogs($failedLogs){
$failedLogins = Get-EventLog security -After (Get-Date).AddDays(""+"$timeBack") | Where { $_.InstanceID -eq "4625" }

  $failedLoginsTable = @()
  for($i=0; $i -lt $failedLogins.Count; $i++){

    $account=""
    $domain="" 

    $userlines = getMatchingLines $failedLogins[$i].Message "*Account Name*"
    $user = $userlines[1].Split(":")[1].trim()

    $dmnlines = getMatchingLines $failedLogins[$i].Message "*Account Domain*"
    $dmn = $dmnlines[1].Split(":")[1].trim()

    $user = $dmn+"\"+$user;

    $failedloginsTable += [pscustomobject]@{"Time" = $failedLogins[$i].TimeGenerated; `
                                       "Id" = $failedLogins[$i].InstanceId; `
                                    "Event" = "Failed"; `
                                     "User" = $user;
                                     }

    }

    return $failedloginsTable
}

function atriskuser($riskyuser){
}

function champlain($chrome){	
if ( get-process -Name "chrome"){
    stop-process -Name "chrome"
	start-process -filepath "C:\Program Files\Google\Chrome\Application\chrome.exe"`
	-argumentlist "champlain.edu"

	}

	else {
	start-process -filepath "C:\Program Files\Google\Chrome\Application\chrome.exe"`
	-argumentlist "champlain.edu"
}
}