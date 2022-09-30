#!/bin/bash

birthdate=$1
givenWeekday=$2

IFS=',' read -r -a tempArray <<< "$birthdate"
day=${tempArray[0]}
month=${tempArray[1]}
year=${tempArray[2]}

month="$(tr '[:lower:]' '[:upper:]' <<< ${month:0:1})${month:1}"
givenWeekday="$(tr '[:lower:]' '[:upper:]' <<< ${givenWeekday:0:1})${givenWeekday:1}"

$monthNumber;
case $month in
    January) monthNumber="01" ;;
    February) monthNumber="02" ;;
    March) monthNumber="03" ;;
    April) monthNumber="04" ;;
    May) monthNumber="05" ;;
    June) monthNumber="06" ;;
    July) monthNumber="07" ;;
    August) monthNumber="08" ;;
    September) monthNumber="09" ;;
    October) monthNumber="10" ;;
    November) monthNumber="11" ;;
    December) monthNumber="12" ;;
esac

birthdateFormatted=${year}-${monthNumber}-${day}
realWeekday=`date -d $birthdateFormatted +%A`

#1st Function
function isWeekdayValid {
    if [ "$1" = "$2" ]; then
        result=true
    else
        result=false
    fi
}

isWeekdayValid $realWeekday $givenWeekday
echo "isWeekdayValid": $result "(real weekday:" $realWeekday")"

#2nd Function
function passOrRemainBirthday {
    daysPastFromYear=`date +%j`
    bdaysPastFromYear=`date -d "$1" +"%j"`

    if [ $daysPastFromYear -le $bdaysPastFromYear ]; then
        echo $(($((bdaysPastFromYear - daysPastFromYear)))) days remain to your birthday
    else
        echo $(($((daysPastFromYear - bdaysPastFromYear)))) days passed from your birthday
    fi
}

passOrRemainBirthday $birthdateFormatted

#3rd Function
function daysDifferenceBetweenBirthdate {
    birthdate=$1
    otherDate=$2
    difference=$((($(date -d "$1" +%s) - $(date -d "$2" +%s)) / (60*60*24)))
    result="The difference is "${difference}" days"
}

otherDate="1990-07-11"
daysDifferenceBetweenBirthdate $birthdateFormatted $otherDate
echo $result