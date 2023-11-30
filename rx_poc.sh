#! /bin/bash

# Assign city name as Casablanca
city=Casablanca

# Obtain the weather report for Casablanca
curl -s wttr.in/$city?T --output weather_report

# To extract current temperature
obs_temp=$(curl -s wttr.in/$city?T | grep -m 1 '°.' | grep -Eo -e '-?[[:digit:]].*')
echo "The current Temperature of $city: $obs_temp"

# To extract the forecast temperature for noon tomorow for
fc_temp=$(curl -s wttr.in/$city?T | head -23 | tail -1 | grep '°.' | cut -d 'C' -f2 | grep -Eo -e '-?[[:digit:]].*')
echo "The forecast Temperature for noon tommorow for $city: $fc_temp C"

# Assign Country and City to variable TZ
TZ='Morocco/Casablanca'

hour=$(TZ='Morocco/Csablanca' date -u +%H)
day=$(TZ='Morocco/Csablanca' date -u +%d)
month=$(TZ='Morocco/Csablanca' date -u +%m)
year=$(TZ='Morocco/Csablanca' date -u +%Y)

record=$(echo -e "$year\t$month\t$day\t$obs_temp\t$fc_temp C")
echo $record>>rx_poc.log