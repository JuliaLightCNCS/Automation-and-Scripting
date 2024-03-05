. "C:\Users\champuser\Automation-and-Scripting\week6\Event-Logs.ps1"
. "C:\Users\champuser\Automation-and-Scripting\week7\scheduler.ps1"
. "C:\Users\champuser\Automation-and-Scripting\week7\Email.ps1"
. "C:\Users\champuser\Automation-and-Scripting\week7\configurations.ps1"


# Obtaining Configuration
$configuration = configurationMenu

# Obtaining at risk users
$Failed = atRiskUsers $failedloginsTable

# Sending at risk users an email
SendAlertEmail ($Failed | Format-Table | Out-String)

# Setting the script to be run daily
ChooseTimeToRun($scheduledtasks.***)