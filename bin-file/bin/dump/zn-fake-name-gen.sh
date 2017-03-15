#!/bin/bash
# Script is created by @niranjanshr13

#------
# Notes:
# Parameter 1 is always should be 'value' variable. Look below. To see
#------

downloading_page='curl -sL 'http://www.fakenamegenerator.com''
r_name=$($downloading_page | grep '<h3>' | sed 's/<\/h3>//g' | sed 's/<h3>//g' | sed 's/  //g')
r_add=$($downloading_page | grep '<br/>' | grep '</div>' | sed 's/  //g' | sed 's/<\/div>//g' | sed 's/<br\/>/\n/g')

#-----

# Variable's
value() {
printf \
"f_name
l_name
add_address
add_city
add_state
add_zip\n"
}
#-----
# Tiny Script's
f_name() {
echo "$r_name" | awk '{print $1}'
}
l_name() {
echo "$r_name" | awk '{print $3}'
}
add_address() {
echo "$r_add" | head -1
}
add_city() {
echo "$r_add" | head -2| tail -1 | cut -d"," -f1
}
add_state() {
echo "$r_add" | head -2| tail -1 | cut -d"," -f2- | awk '{print $1}'
}
add_zip() {
echo "$r_add" | head -2| tail -1 | cut -d"," -f2- | awk '{print $2}'
}
#------
# script runner
for values in $(value)
do
#echo $values
if [[ $values == $1 ]]
then
$values
fi
done

# to get all the info like before.
#echo "First Name = f_name"
#echo "Last Name = l_name"
#echo "Address = add_address"
#echo "City = add_city"
#echo "State = add_state"
#echo "ZipCode = add_zip"
