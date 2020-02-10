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



# Make a directory titled holy_wow so we don't accidentally clutter up something like the desktop
mkdir holy_wow
cd holy_wow



### Get all lists from Dan Miessler's github
### https://github.com/danielmiessler/SecLists/tree/master/Passwords

# Twitter Banned
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/twitter-banned.txt

# probable-v2-top12000.txt
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/probable-v2-top12000.txt

# OpenWall.net
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/openwall.net-all.txt

# MSSql
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/mssql-passwords-nansh0u-guardicore.txt

# Dutch wordlist
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/dutch_wordlist

# darkweb2017-top10000.txt
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/darkweb2017-top10000.txt

# bt4-password.txt
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/bt4-password.txt

# PHP Magic
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/PHP-Magic-Hashes.txt

# Most-Popular-Letter-Passes.txt
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Most-Popular-Letter-Passes.txt

# Keyboard walks
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Keyboard-Combinations.txt

# xato-net-10-million-passwords.txt
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/xato-net-10-million-passwords.txt



### Get a bunch of lists from Skull Security
### https://wiki.skullsecurity.org/Passwords

# Rockyou
wget -O rockyou.txt.bz2 "http://downloads.skullsecurity.org/passwords/rockyou.txt.bz2"
bzip2 -dk rockyou.txt.bz2
rm rockyou.txt.bz2


# MySpace
wget -O myspace.txt.bz2 --max-redirect=0 --user-agent="Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0" --keep-session-cookies --save-cookies cookies.txt --post-data --header="Host: somewebsite.com" --header="Referer: https://google.com" "http://downloads.skullsecurity.org/passwords/myspace.txt.bz2"
bzip2 -dk myspace.txt.bz2
rm myspace.txt.bz2

# Crackstation
wget -O crackstation.txt.gz "https://crackstation.net/files/crackstation.txt.gz"
7za e crackstation.txt.gz
rm crackstation.txt.gz
mv realuniq.lst crackstation.txt

# John the Ripper
wget -O john.txt.bz2 "http://downloads.skullsecurity.org/passwords/john.txt.bz2"
bzip2 -dk john.txt.bz2
rm john.txt.bz2

# Cain and Able
wget -O cain.txt.bz2 "http://downloads.skullsecurity.org/passwords/cain.txt.bz2"
bzip2 -dk cain.txt.bz2
rm cain.txt.bz2

# Conficker
wget -O conficker.txt.bz2 "http://downloads.skullsecurity.org/passwords/conficker.txt.bz2"
bzip2 -dk conficker.txt.bz2
rm conficker.txt.bz2

# PHPbb
wget -O phpbb.txt.bz2 "http://downloads.skullsecurity.org/passwords/phpbb.txt.bz2"
bzip2 -dk phpbb.txt.bz2
rm phpbb.txt.bz2

# Hotmail
wget -O hotmail.txt.bz2 "http://downloads.skullsecurity.org/passwords/hotmail.txt.bz2"
bzip2 -dk hotmail.txt.bz2
rm hotmail.txt.bz2

# Faithwriters
wget -O faithwriters.txt.bz2 "http://downloads.skullsecurity.org/passwords/faithwriters.txt.bz2"
bzip2 -dk faithwriters.txt.bz2
rm faithwriters.txt.bz2

# Elite Hacker
wget -O elitehacker.txt.bz2 "http://downloads.skullsecurity.org/passwords/elitehacker.txt.bz2"
bzip2 -dk elitehacker.txt.bz2
rm elitehacker.txt.bz2

# Hak5
wget -O hak5.txt.bz2 "http://downloads.skullsecurity.org/passwords/hak5.txt.bz2"
bzip2 -dk hak5.txt.bz2
rm hak5.txt.bz2





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
   clear; echo "Sleeping 1 second... (hashlistId = $i)"; sleep 1; clear; echo -e "We're on hashlistId $i of $StopPoint\n"; wget -O $i.txt --user-agent="Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0" --keep-session-cookies --save-cookies cookies.txt --post-data --header="Host: somewebsite.com" --header="Referer: https://hashes.org/leaks.php?id=$i" "https://hashes.org/download.php?type=found&hashlistId=$i"
done




### Remove cookies.txt
rm cookies.txt



### Combine everything in to holy_wow.txt, then sort and uniq it
touch holy_wow.txt; cat *.txt > holy_wow.txt; sort holy_wow.txt | uniq





