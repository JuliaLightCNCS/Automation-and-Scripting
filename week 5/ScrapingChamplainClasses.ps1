clear

function gatherClasses(){
$page = Invoke-WebRequest -TimeoutSec 2 http://10.0.17.35/courses.html

# Get all the tr elements of html document
$trs=$page.parsedHTML.body.getelementsbytagname("tr")

#empty array to hold results
$fulltable = @()
for($i=1; $i -lt $trs.length; $i++){ # Going over every tr element

    # Get every td element of current tr element
    $tds=$trs[$i].getelementsbytagname("td")

    # Want to separate start time and end time from one time field
    $Times = $tds[5].innertext.split("-")

    $fulltable +=[pscustomobject]@{"Class Code" = $tds[0].innerText;
                                        "Title"      = $tds[1].innerText;
                                        "Days"       = $tds[4].innerText;
                                        "Time Start" = $times[0];
                                        "Time End"   = $times[1];
                                        "Instructor" = $tds[6].innerText;
                                        "Location"   = $tds[9].innerText;
                                       }
    }
return $fulltable
}


function daysTranslator($fulltable) {

    # Go over every record in the table
    for ($i=0; $i -lt $fulltable.length; $i++) {
        # Empty array to hold days for every record
        $days = @()

        # "M" for Monday
        if ($fulltable[$i].Days -ilike "*M*"){ $days += "Monday" }

        # "T" Followed T, W, or F for Tuesday
        if ($fulltable[$i].Days -ilike "*T[TWF]*"){ $days += "Tuesday" }

        # "W" for Wednesday
        if ($fulltable[$i].Days -ilike "*W*"){ $days += "Wednesday" }

        # "TH" for Thursday
        if ($fulltable[$i].Days -ilike "*TH*"){ $days += "Thursday" }

        # "F" for Friday
        if ($fulltable[$i].Days -ilike "*F*"){ $days += "Friday" }

        $fulltable[$i].Days = $days

    }
    return $fulltable
}