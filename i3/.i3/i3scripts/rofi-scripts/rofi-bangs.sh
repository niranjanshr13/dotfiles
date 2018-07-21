#!/usr/bin/env bash

declare -A LABELS
declare -A COMMANDS

BASE_PWD='$HOME/.i3/i3scripts/rofi-scripts/'

###
# List of defined 'bangs'

# launch programs
COMMANDS["apps"]="rofi -show combi -combi-modi window,drun -switchers combi"
LABELS["apps"]=""

# open bookmarks
COMMANDS["bookmarks"]="$BASE_PWD/rofi_firefox_bookmark.sh"
LABELS["bookmarks"]=""

# open crypto
COMMANDS["crypto"]="$BASE_PWD/rofi_crypto.sh"
LABELS["crypto"]=""

# open calculator
COMMANDS["calulator"]="$BASE_PWD/rofi_calc.sh"
LABELS["calulator"]=""

# open calculator
COMMANDS["clipboard"]="$BASE_PWD/rofi_clipboard.sh"
LABELS["clipboard"]=""

# ring iphone
COMMANDS["iphone"]="$BASE_PWD/icloud/rofi_icloud.sh"
LABELS["iphone"]=""

# ring iphone
COMMANDS["pythonHistory"]="$BASE_PWD/rofi_python_history.sh"
LABELS["pythonHistory"]=""

# search local files
#COMMANDS["locate"]="~/.scripts/rofi-scripts-collection/rofi-locate.sh"
#LABELS["locate"]=""

################################################################################
# do not edit below
################################################################################
##
# Generate menu
##
function print_menu()
{
    for key in ${!LABELS[@]}
    do
  echo "$key    ${LABELS}"
     #   echo "$key    ${LABELS[$key]}"
     # my top version just shows the first field in labels row, not two words side by side
    done
}
##
# Show rofi.
##
function start()
{
    # print_menu | rofi -dmenu -p "?=>" 
    print_menu | sort | rofi -dmenu -l 10 -mesg ">>> launch your rofi scripts" -i -p "rofi-bangs: "
}


# Run it
value="$(start)"

# Split input.
# grab upto first space.
choice=${value%%\ *}
# graph remainder, minus space.
input=${value:$((${#choice}+1))}

##
# Cancelled? bail out
##
if test -z ${choice}
then
    exit
fi

# check if choice exists
if test ${COMMANDS[$choice]+isset}
then
    # Execute the choice
    eval echo "Executing: ${COMMANDS[$choice]}"
    eval ${COMMANDS[$choice]}
else
 eval  $choice | rofi
 # prefer my above so I can use this same script to also launch apps like geany or leafpad etc (DK) 
 #   echo "Unknown command: ${choice}" | rofi -dmenu -p "error"
fi
