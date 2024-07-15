#!/bin/bash

# Function to log messages
log_message() {
    local log_type=$1
    local log_message=$2
    local log_time=$(date +"%Y-%m-%d %H:%M:%S")
    echo "$log_time [$log_type] $log_message" >> /home/kali/practice/climailer.logs/logs
}

# Function to display messages in color
print_color() {
    local color=$1
    local message=$2
    case $color in
        red) echo -e "\033[31m$message\033[0m" ;;
        green) echo -e "\033[32m$message\033[0m" ;;
        yellow) echo -e "\033[33m$message\033[0m" ;;
        blue) echo -e "\033[34m$message\033[0m" ;;
        *) echo "$message" ;;
    esac
}

figlet "Kay_den"
print_color green "Welcome to this command line based mail server. You can send mail to your desired location via command line with ease. Just answer the following questions and you can leave blank spaces if you don't want to include anything."
log_message "INFO" "Mail server started"

print_color blue "Would you like to load a draft? [y/n]"
read load_draft

if [ "$load_draft" == "y" ]; then
    if [ -f draft.txt ]; then
        source draft.txt
        print_color green "Draft loaded."
        log_message "INFO" "Draft loaded"
    else
        print_color red "No draft found."
        log_message "ERROR" "No draft found"
    fi
else
    print_color blue "Insert sender's mail address"
    read send
    print_color blue "Insert receiver's mail address"
    read rec
    print_color blue "Insert cc mail address"
    read fb
    print_color blue "Insert bcc mail address"
    read fa
    print_color blue "Write the subject of your message"
    read sub
    print_color blue "Write content-body of your message"
    read body
    print_color blue "Attach the path of the file you want to mail. {example format '/path/to/test.cpp'}"
    read src
    BASEPATH=${src##*/}
    print_color green "Your attachment is = $BASEPATH"
    
    # Save draft option
    print_color blue "Would you like to save this as a draft? [y/n]"
    read save_draft
    if [ "$save_draft" == "y" ]; then
        echo "send='$send'" > draft.txt
        echo "rec='$rec'" >> draft.txt
        echo "fb='$fb'" >> draft.txt
        echo "fa='$fa'" >> draft.txt
        echo "sub='$sub'" >> draft.txt
        echo "body='$body'" >> draft.txt
        echo "src='$src'" >> draft.txt
        print_color green "Draft saved."
        log_message "INFO" "Draft saved"
    fi
fi

print_color blue "Do you want to schedule this mail? [y/n]"
read sc

if [ "$sc" == "y" ]; then
    print_color blue "Scheduling your mail"
    print_color blue "When would you like to schedule this mail? (Current system date is $(date))"
    print_color yellow "You can specify the runtime in different ways, such as:
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
    log_message "INFO" "Email scheduled to be sent at $deo"
else
    sendEmail -f $send -t $rec -u $sub -cc $fb -bcc $fa -m $body -a $src -l /home/kali/practice/climailer.logs/logs
    log_message "INFO" "Email sent immediately"
fi

print_color green "Process completed."
log_message "INFO" "Process completed"





