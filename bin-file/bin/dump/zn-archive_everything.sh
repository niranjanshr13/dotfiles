#!/bin/bash

## Created by @niranjanshr13 "Niranjan Shrestha". 
## This script will automatically archive and will check if there is same file that you are going to archive and delete.
## This script is for those who encrypt their file and don't want to open it again like "Never" and have track of if you are going to store the same file or not.
##Looping this foreverrr....
while :
do
## You need create 'needed_to_be_checked' folder and where everything needed to archive lives here. In this case I am focus on jpg only and count jpg file. Feel free to fork it.
checkingfile=$(ls needed_to_be_checked/*.jpg | wc -l)
## Just if then else statement for checking .jpg exist or not.
if [[ $checkingfile != 0 ]]
then 
## Taking first file from head command. It a one-by-one step of check. So you can go suck it. If you find better way let me know.....  in @niranjanshr13
backintime=$(ls needed_to_be_checked/*.jpg | head -1)
## Moving file from needed_to_be_checked to same file as bash script.
mv $backintime ./
## MD5SUM of jpg and remove file name. So I have only md5sum hash. Newjpg is a text file. 
md5sum *.jpg | cut -c-33 > newjpg
## md5_checksum is a txt file you create a blank for first time. Below command will cat md5_checksum & newjpg and sort it and uniq it with duplicate or not. 
sorting=$(cat md5_checksum newjpg | sort| uniq -d)
## Just checking it has something or not from previous file. It a math if you don't getted go figure it out. Just change variable into simpler. I got lost 7 time to create this.
checking=$(echo $sorting | wc -c)
## Another if then else statement of wc -c command checking things has something or not..
if [[ $checking != 1 ]]
then
## ECHOOOOING if there is something that already md5 it.
echo found
# Deleting duplicate file.
rm *.jpg
else
## ECHOOOOING if file is not md5 it ever and it back that thing.
echo not found
## Adding md5 to md5_checksum file.
md5sum *.jpg | cut -c-33 >> md5_checksum
## Moving that file.
mv *.jpg backed/
#Delete that useless newjpg -->> which md5 hash of the file just moved.
rm newjpg
fi
## sorting thing. Don't need it by the way.
sort md5_checksum > md5_checksum.new
## deleting md5_checksum because we have md5_checksum.new sorted file.
rm md5_checksum
## renaming to md5_checksum.new to md5_checksum
mv md5_checksum.new md5_checksum
else
## Echoooing there is nothing to do..
echo crap no file found
fi
done
