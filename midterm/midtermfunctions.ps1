clear


function midterm1(){
$page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.5/IOC.html
#$page | out-string

$trs = $page.ParsedHtml.body.getElementsByTagName("tr")

$midtable = @()

for ($i=1; $i -lt $trs.length; $i++){
    $tds = $trs[$i].getElementsByTagName("td");
    $midtable += [pscustomobject]@{"pattern" = $tds[0].innerText; "explantion" = $tds[1].innerText}
    }
return $midtable 
}
midterm1 | format-table



function midterm2(){
$logsNotFormatted = Get-Content C:\Users\champuser\Automation-and-Scripting\midterm\access.log
$tableRecords = @()

for($i=0; $i -lt $logsNotFormatted.length; $i++){
$words = $logsNotFormatted[$i].split(" ")

$tableRecords +=[pscustomobject]@{"IP" = $words[0];`
                                  "Time"= $words.Trim('[');`
                                  "Method" = $words.Trim('"');`
                                  "Page" = $words[6];`
                                  "Protocol" = $words[7];`
                                  "Response" = $words[8];`
                                  "Referrer" = $words[10];`
        }
    }
return $tableRecords #| Where-Object{$_.IP -like "10.*"}
}
#$tableRecords = midterm2
midterm2 | Format-Table 

function midterm3($tds, $tableRecords){

$records = @()

foreach($log in $tableRecords){
    
    foreach($pattern in $tds){
    
    $test = $pattern.Pattern

    if($log.Page -match $test){
        $records += $log
            }
    }
    }
    return $records | Group-Object -Property 'Page' | ForEach-Object{ $_.Group[0]} | Format-Table
}
$tds = midterm1
$tableRecords = midterm2

midterm3 $tds $tableRecords 

midterm3 | Format-Table