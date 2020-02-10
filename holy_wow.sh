#! /bin/bash

#################################################
#    holy_wow.sh                                #
#    By: n0beard                                #
#                                               #
#  A simple bash script to download             #
#  and combine a bunch of wordlists in          #
#  to holy_wow.txt.                             #
#                                               #
#  Inspired by _NSAKey's talk in 2015           #
#  at BSides Nashville                          #
#                                               #
#  https://www.youtube.com/watch?v=7A9siTT_A6I  #
#                                               #
#  Unzip templates                              #
#     bzip2 -dk xxxxx.bz2                       #
#     7za e xxxxx.txt.gz                        #
#                                               #
#################################################



# XXXXX
#wget -O XXXXX --max-redirect=0 --user-agent="Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0" --keep-session-cookies --save-cookies cookies.txt --post-data --header="Host: somewebsite.com" --header="Referer: https://google.com" "XXXXX"
#bzip2 -dk xxxxx
#rm xxxxx




# Create a function to display time elapsed
timer () {
if (( $SECONDS > 3600 )) ; then
    let "hours=SECONDS/3600"
    let "minutes=(SECONDS%3600)/60"
    let "seconds=(SECONDS%3600)%60"
    echo "Timer: $hours hour(s), $minutes minute(s) and $seconds second(s)" 
elif (( $SECONDS > 60 )) ; then
    let "minutes=(SECONDS%3600)/60"
    let "seconds=(SECONDS%3600)%60"
    echo "Timer: $minutes minute(s) and $seconds second(s)"
else
    echo "Timer: $SECONDS seconds"
fi
}


# Make a directory titled holy_wow so we don't accidentally clutter up something like the desktop
mkdir holy_wow
cd holy_wow


# Make sure holy_wow.txt exists
touch holy_wow.txt


# Start the timer
SECONDS=0


### Get all lists from Dan Miessler's github
### https://github.com/danielmiessler/SecLists/tree/master/Passwords

# Twitter Banned
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/twitter-banned.txt
cat twitter-banned.txt >> holy_wow.txt
rm twitter-banned.txt
clear
timer

# probable-v2-top12000.txt
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/probable-v2-top12000.txt
cat probable-v2-top12000.txt >> holy_wow.txt
rm probable-v2-top12000.txt
clear
timer

# OpenWall.net
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/openwall.net-all.txt
cat openwall.net-all.txt >> holy_wow.txt
rm openwall.net-all.txt
clear
timer

# MSSql
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/mssql-passwords-nansh0u-guardicore.txt
cat mssql-passwords-nansh0u-guardicore.txt >> holy_wow.txt
rm mssql-passwords-nansh0u-guardicore.txt
clear
timer

# Dutch wordlist
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/dutch_wordlist
cat dutch_wordlist >> holy_wow.txt
rm dutch_wordlist
clear
timer

# darkweb2017-top10000.txt
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/darkweb2017-top10000.txt
cat darkweb2017-top10000.txt >> holy_wow.txt
rm darkweb2017-top10000.txt
clear
timer

# bt4-password.txt
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/bt4-password.txt
cat bt4-password.txt >> holy_wow.txt
rm bt4-password.txt
clear
timer

# PHP Magic
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/PHP-Magic-Hashes.txt
cat PHP-Magic-Hashes.txt >> holy_wow.txt
rm PHP-Magic-Hashes.txt
clear
timer

# Most-Popular-Letter-Passes.txt
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Most-Popular-Letter-Passes.txt
cat Most-Popular-Letter-Passes.txt >> holy_wow.txt
rm Most-Popular-Letter-Passes.txt
clear
timer

# Keyboard walks
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Keyboard-Combinations.txt
cat Keyboard-Combinations.txt >> holy_wow.txt
rm Keyboard-Combinations.txt
clear
timer

# xato-net-10-million-passwords.txt
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/xato-net-10-million-passwords.txt
cat xato-net-10-million-passwords.txt >> holy_wow.txt
rm xato-net-10-million-passwords.txt
clear
timer



### Get a bunch of lists from Skull Security
### https://wiki.skullsecurity.org/Passwords

# Rockyou
wget -O rockyou.txt.bz2 "http://downloads.skullsecurity.org/passwords/rockyou.txt.bz2"
bzip2 -dk rockyou.txt.bz2
rm rockyou.txt.bz2
cat rockyou.txt >> holy_wow.txt
rm rockyou.txt
clear
timer


# MySpace
wget -O myspace.txt.bz2 --max-redirect=0 --user-agent="Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0" --keep-session-cookies --save-cookies cookies.txt --post-data --header="Host: somewebsite.com" --header="Referer: https://google.com" "http://downloads.skullsecurity.org/passwords/myspace.txt.bz2"
bzip2 -dk myspace.txt.bz2
rm myspace.txt.bz2
cat myspace.txt >> holy_wow.txt
rm myspace.txt
clear
timer

# Crackstation
wget -O crackstation.txt.gz "https://crackstation.net/files/crackstation.txt.gz"
7za e crackstation.txt.gz
rm crackstation.txt.gz
cat realuniq.lst >> holy_wow.txt
rm realuniq.lst
clear
timer

# John the Ripper
wget -O john.txt.bz2 "http://downloads.skullsecurity.org/passwords/john.txt.bz2"
bzip2 -dk john.txt.bz2
rm john.txt.bz2
cat john.txt >> holy_wow.txt
rm john.txt
clear
timer

# Cain and Able
wget -O cain.txt.bz2 "http://downloads.skullsecurity.org/passwords/cain.txt.bz2"
bzip2 -dk cain.txt.bz2
rm cain.txt.bz2
cat cain.txt >> holy_wow.txt
rm cain.txt
clear
timer

# Conficker
wget -O conficker.txt.bz2 "http://downloads.skullsecurity.org/passwords/conficker.txt.bz2"
bzip2 -dk conficker.txt.bz2
rm conficker.txt.bz2
cat conficker.txt >> holy_wow.txt
rm conficker.txt
clear
timer

# PHPbb
wget -O phpbb.txt.bz2 "http://downloads.skullsecurity.org/passwords/phpbb.txt.bz2"
bzip2 -dk phpbb.txt.bz2
rm phpbb.txt.bz2
cat phpbb.txt >> holy_wow.txt
rm phpbb.txt
clear
timer

# Hotmail
wget -O hotmail.txt.bz2 "http://downloads.skullsecurity.org/passwords/hotmail.txt.bz2"
bzip2 -dk hotmail.txt.bz2
rm hotmail.txt.bz2
cat hotmail.txt >> holy_wow.txt
rm hotmail.txt
clear
timer

# Faithwriters
wget -O faithwriters.txt.bz2 "http://downloads.skullsecurity.org/passwords/faithwriters.txt.bz2"
bzip2 -dk faithwriters.txt.bz2
rm faithwriters.txt.bz2
cat faithwriters.txt >> holy_wow.txt
rm faithwriters.txt
clear
timer

# Elite Hacker
wget -O elitehacker.txt.bz2 "http://downloads.skullsecurity.org/passwords/elitehacker.txt.bz2"
bzip2 -dk elitehacker.txt.bz2
rm elitehacker.txt.bz2
cat elitehacker.txt >> holy_wow.txt
rm elitehacker.txt
clear
timer

# Hak5
wget -O hak5.txt.bz2 "http://downloads.skullsecurity.org/passwords/hak5.txt.bz2"
bzip2 -dk hak5.txt.bz2
rm hak5.txt.bz2
cat hak5.txt >> holy_wow.txt
rm hak5.txt
clear
timer





### Download all from hashes.org
### Get StopPoint from https://hashes.org/hashlists.php

# Set the start point
StartPoint=1

# Get StopPoint from https://hashes.org/hashlists.php and store as StopPoint
rm hashlists.php
curl -O https://hashes.org/hashlists.php
read StopPoint <<< $(sed 's/[^0-9]//g' <<< $(grep -m 1 td hashlists.php))
rm hashlists.php

# Iterate from StartPoint to StopPoint and download all of the cracked lists
for (( i=$StartPoint; i<=$StopPoint; i++ ))
do
   clear
   timer
   echo "Sleeping 1 second... (hashlistId = $i of $StopPoint)"
   sleep 1
   clear
   timer
   echo -e "We're on hashlistId $i of $StopPoint\n"
   wget -O $i.txt --user-agent="Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0" --keep-session-cookies --save-cookies cookies.txt --post-data --header="Host: somewebsite.com" --header="Referer: https://hashes.org/leaks.php?id=$i" "https://hashes.org/download.php?type=found&hashlistId=$i"

   ### Find all occurrances of "Invalid hashlist!" and "Hashlist is deleted!" from hashes.org lists and delete them
   if [[ $(grep "Invalid hashlist!" $i.txt) ]]; then rm $i.txt; fi
   if [[ $(grep "Hashlist is deleted!" $i.txt) ]]; then rm $i.txt; fi
   
   cat $i.txt >> holy_wow.txt
   rm $i.txt

done



### Remove cookies.txt
rm cookies.txt



### Sort and uniq everything in holy_wow.txt
sort holy_wow.txt | uniq



# Stop timer and display
timer

echo "Total unique passwords in holy_wow: $(wc -l < holy_wow.txt)"

