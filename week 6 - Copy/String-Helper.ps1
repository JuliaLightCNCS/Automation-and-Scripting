<# String-Helper
*************************************************************
   This script contains functions that help with String/Match/Search
   operations. 
************************************************************* 
#>


<# ******************************************************
   Functions: Get Matching Lines
   Input:   1) Text with multiple lines  
            2) Keyword
   Output:  1) Array of lines that contain the keyword
********************************************************* #>
function getMatchingLines($contents, $lookline){

$allines = @()
$splitted =  $contents.split([Environment]::NewLine)

for($j=0; $j -lt $splitted.Count; $j++){  
 
   if($splitted[$j].Length -gt 0){  
        if($splitted[$j] -ilike $lookline){ $allines += $splitted[$j] }
   }

}

return $allines
}
        # TODO: Check the given password with your new function. 
        #              - If false is returned, do not continue and inform the user
        #              - If true is returned, continue with the rest of the function

function checkPassword($password){
if($password.length -lt 6){
write-host "1"
return $false}
elseif($password -inotlike '*[^a-zA-Z0-9]*'){
write-host "2"
return $false}
elseif($password -inotlike '*[!@#$%^&]*'){
write-host "3"
return $false} 
else{
write-host "4"
return $true}
}

checkPassword 12345!