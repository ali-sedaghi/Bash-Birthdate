# Bash-Birthdate

Bash script with 3 functions and it takes your birthdate (day, month, year) and weekday of 
birth as inputs which:

1. The first function should validate the weekday of birth is True or not.

2. The second function should calculate the number of passed days after your birthday if less than 6 
months is passed; otherwise, the number of remaining days to your birthday.

3. The third function should calculate the days' difference between your birthdate and 1990-07-11.


## Example

Running script
```bash
$ bash script.sh 29,december,1999 sunday
```

Output
```bash
isWeekdayValid: false (real weekday: Wednesday)
90 days remain to your birthday
The difference is 3458 days
```
