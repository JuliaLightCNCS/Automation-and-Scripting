clear

function runChamplain($chrome){
	if ( get-process -Name "chrome"){
		stop-process -Name "chrome"
	}

	else {
	start-process -filepath "C:\Program Files\Google\Chrome\Application\chrome.exe"`
	-argumentlist "champlain.edu"
}
}
return runChamplain