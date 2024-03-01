function SendAlertEmail($Body){

$From = "julia.light@mymail.champlain.edu"
$to = "julia.light@mymail.champlain.edu"
$subject = "suspicious activity"

$Password = <#Get ya own key#> | ConvertTo-SecureString -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $From, $Password

Send-MailMessage -From $From -To $to -Subject $subject -Body $body -SmtpServer "smtp.gmail.com"`
-Port 587 -UseSsl -Credential $Credential
}
SendAlertEmail "Body Of Email"