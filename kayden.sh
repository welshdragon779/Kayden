#!/bin/bash

figlet "Kay_den"

echo "Welcome to this command line based mail server. You can send mail to your desired location via command line  with ease just  answer the following questions and you can leave blank space as it is if you dont wanna include anything"

echo " "

echo "Insert sender's mail address"
read send

echo "Insert receiver's mail address"
read rec

echo "Insert cc mail address"
read fb

echo "Insert bcc mail address"
read fa

echo "Write the subject of your message"
read sub

echo "write content-body of your message"
read body

echo "Attest the path of attachment you wanna  mail. {example format "/path/to/test.cpp"} "
read src

BASEPATH=${src##*/}
echo "Your attachment is = "$BASEPATH" "

# DIRPATH=${src%$BASEPATH}
# echo $DIRPATH

echo "Do you want to schedule this mail ? [y/n]"
read sc

if [ $sc == "y" ];then
	echo "Scheduling your mail"
	echo "     "
	echo "When would you like to schedule this mail ? "
	echo "Current system date is  $date "
	echo "You can specify the runtime in different ways, such as:
	Time:
	HH:MM
	HHMM
	12-hour format (am or pm)
	midnight
	noon
	teatime
	Date:
	MMDD[CC]YY
	MM/DD/[CC]YY
	DD.MM.[CC]YY
	[CC]YY-MM-DD
	today
	tomorrow
	weekday
	Increment
	now + count time-units, where the time-units can be minutes, hours, days, or weeks"

	read deo

	sendEmail -f $send -t $rec -u $sub -cc $fb -bcc $fa -m $body -a $src -l /home/kali/practice/climailer.logs/logs | at "$deo" 
else
	sendEmail -f $send -t $rec -u $sub -cc $fb -bcc $fa -m $body -a $src -l /home/kali/practice/climailer.logs/logs
fi




