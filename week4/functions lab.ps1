#Clear the screen
clear

# Getting the computer login and logoff events
# Get-EventLog system -Source Microsoft-Windows-winlogon

# or
#Get-EventLog system | Where-Object {$_.Source -ilike "microsoft-Windows-*"} | select source

# Get login and logoff records from windows events and save to a variable
# Get the last 14 days
<#$loginouts = Get-EventLog system -Source Microsoft-Windows-winlogon -After (Get-Date).AddDays(-14)

$loginoutsTable = @()
for($i=0; $i -lt $loginouts.Count; $i++){

$event = ""
if($loginouts[$i].InstanceID -eq 7001){$event="Logon"}
if($loginouts[$i].InstanceID -eq 7002){$event="Logoff"}

# Creating user property value
$user = $loginouts[$i].ReplacementStrings[1]

# Adding each new line to our empty array
$loginoutsTable +=[pscustomobject ]@{"Time" = $loginouts[$i].TimeGenerated; `
                                     "Id" = $loginouts[$i].InstanceId; `
                                     "Event" = $event; `
                                     "user"= $user;
                                     }

} # end for
$loginoutsTable
#>

<#$loginouts = Get-EventLog system -Source Microsoft-Windows-winlogon -After (Get-Date).AddDays(-14)

$loginoutsTable = @()
for($i=0; $i -lt $loginouts.Count; $i++){

$event = ""
if($loginouts[$i].InstanceID -eq 7001){$event="Logon"}
if($loginouts[$i].InstanceID -eq 7002){$event="Logoff"}

# Creating user property value
$user = $loginouts[$i].ReplacementStrings[1]
$username = [System.Security.Principal.SecurityIdentifier]::new($user).Translate([System.Security.Principal.NTAccount])

# Adding each new line to our empty array
$loginoutsTable +=[pscustomobject ]@{"Time" = $loginouts[$i].TimeGenerated; `
                                     "Id" = $loginouts[$i].InstanceId; `
                                     "Event" = $event; `
                                     "user"= $username;
                                     }

} # end for
$loginoutsTable#>


#Make a function that turns same code above into a function
<#function loginlogs($AddDays){

 $loginouts = Get-EventLog system -Source Microsoft-Windows-winlogon -After (Get-Date).AddDays($AddDays)

$loginoutsTable = @()
for($i=0; $i -lt $loginouts.Count; $i++){

$event = ""
if($loginouts[$i].InstanceID -eq 7001){$event="Logon"}
if($loginouts[$i].InstanceID -eq 7002){$event="Logoff"}

# Creating user property value
$user = $loginouts[$i].ReplacementStrings[1]
$username = [System.Security.Principal.SecurityIdentifier]::new($user).Translate([System.Security.Principal.NTAccount])

# Adding each new line to our empty array
$loginoutsTable +=[pscustomobject ]@{"Time" = $loginouts[$i].TimeGenerated; `
                                     "Id" = $loginouts[$i].InstanceId; `
                                     "Event" = $event; `
                                     "user"= $username;
                                     }
                                     
} # end for
return $loginoutsTable
}
return loginlogs(-14)
#>

# Function to obtain computer start and shut-down times

function shutofflogs($AddDays){

 $shutinoffs = Get-EventLog system -Source Microsoft-Windows-winlogon -After (Get-Date).AddDays($AddDays)

$shutinoffsTable = @()
for($i=0; $i -lt $shutinoffs.Count; $i++){

$event = ""
if($shutinoffs[$i].EventID -eq 6006){$event="Turn On"}
if($shutinoffs[$i].EventID -eq 6006){$event="Turn Off"}

# Creating user property value
$user = $shutinoffs[$i].ReplacementStrings[1]
$username = [System.Security.Principal.SecurityIdentifier]::new($user).Translate([System.Security.Principal.NTAccount])

# Adding each new line to our empty array
$shutinoffsTable +=[pscustomobject ]@{"Time" = $shutinoffs[$i].TimeGenerated; `
                                     "Id" = $shutinoffs[$i].EventId; `
                                     "Event" = $event; `
                                     "user"= $username;
                                     }
                                     
} # end for
return $shutinoffsTable
}
return shutofflogs(-14)