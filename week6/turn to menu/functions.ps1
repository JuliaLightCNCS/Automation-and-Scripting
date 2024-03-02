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
function failedapachelogs($failedlogs){
}
function atriskuser($riskyuser){
}
function champlain($chrome){
}