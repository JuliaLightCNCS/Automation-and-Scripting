﻿clear

$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.35/ToBeScraped.html

# Display links as HTML Element
$scraped_page.Links

# Get a count of the links in the page
$scraped_page.count

# Display only URL and its text
$scraped_page.Links | Select -ExpandProperty href

# Get outer text of every element with the tag h2
$h2s=$scraped_page.ParsedHtml.body.getElementsByTagName("h2") | select outerText

$h2s

# 13. Print innerText of every div element that has the class as “div-1”
$divs1=$scraped_page.ParsedHtml.body.getElementsByTagName("div") | where {$_.getattributeNode("class").value -ilike "div-1"} | select innertext

$divs1