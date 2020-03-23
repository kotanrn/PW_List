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



### One liner to watch the file grow
# while true; do clear; ls -lha | grep -i holy; sleep 10; done



# XXXXX
#wget -O XXXXX --max-redirect=0 --user-agent="Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0" --keep-session-cookies --save-cookies cookies.txt --post-data --header="Host: somewebsite.com" --header="Referer: https://google.com" "XXXXX"
#bzip2 -dk xxxxx
#rm xxxxx



# clear; while true; do clear; ls -lha; sleep


# Counter for number of files downloaded
#dlFiles=$((dlFiles+1))
dlFiles=0

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

echo "Total files downloaded: $dlFiles"
}


# Create a function to sort -u holy_wow.txt
hwSort () {
echo "Sorting round $dlFiles"
sort -u -o holy_wow.txt holy_wow.txt
}

# Make a directory titled holy_wow so we don't accidentally clutter up something like the desktop
mkdir holy_wow
cd holy_wow


# Make sure holy_wow.txt exists
touch holy_wow.txt


# Clear the screen
clear


# Start the timer
SECONDS=0
timer



### Start with hashcat's example.dict on their githib
### https://github.com/hashcat/hashcat
curl -O https://raw.githubusercontent.com/hashcat/hashcat/master/example.dict
cat example.dict >> holy_wow.txt
rm example.dict
dlFiles=$((dlFiles+1))
hwSort
clear
timer


### Get all lists from Dan Miessler's github
### https://github.com/danielmiessler/SecLists/tree/master/Passwords

# Twitter Banned
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/twitter-banned.txt
cat twitter-banned.txt >> holy_wow.txt
rm twitter-banned.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer
clear

# probable-v2-top12000.txt
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/probable-v2-top12000.txt
cat probable-v2-top12000.txt >> holy_wow.txt
rm probable-v2-top12000.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer

# OpenWall.net
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/openwall.net-all.txt
cat openwall.net-all.txt >> holy_wow.txt
rm openwall.net-all.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer

# MSSql
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/mssql-passwords-nansh0u-guardicore.txt
cat mssql-passwords-nansh0u-guardicore.txt >> holy_wow.txt
rm mssql-passwords-nansh0u-guardicore.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer

# Dutch wordlist
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/dutch_wordlist
cat dutch_wordlist >> holy_wow.txt
rm dutch_wordlist
dlFiles=$((dlFiles+1))
hwSort
clear
timer

# darkweb2017-top10000.txt
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/darkweb2017-top10000.txt
cat darkweb2017-top10000.txt >> holy_wow.txt
rm darkweb2017-top10000.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer

# bt4-password.txt
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/bt4-password.txt
cat bt4-password.txt >> holy_wow.txt
rm bt4-password.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer

# PHP Magic
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/PHP-Magic-Hashes.txt
cat PHP-Magic-Hashes.txt >> holy_wow.txt
rm PHP-Magic-Hashes.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer

# Most-Popular-Letter-Passes.txt
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Most-Popular-Letter-Passes.txt
cat Most-Popular-Letter-Passes.txt >> holy_wow.txt
rm Most-Popular-Letter-Passes.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer

# Keyboard walks
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Keyboard-Combinations.txt
cat Keyboard-Combinations.txt >> holy_wow.txt
rm Keyboard-Combinations.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer

# xato-net-10-million-passwords.txt
curl -O https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/xato-net-10-million-passwords.txt
cat xato-net-10-million-passwords.txt >> holy_wow.txt
rm xato-net-10-million-passwords.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer


### I'm not a big fan of this "dictionary". It looks a lot like someone took rockyou and websters,
### applied base64.rule to it and saved it as a text file. Uncomment if you want to include it.

# md5decrypt dictionary
# https://md5decrypt.net/en/Password-cracking-wordlist-download/_Downloads_/wordlist-download.php

#wget -O Md5decrypt-awesome-wordlist.7z --user-agent="Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0" --keep-session-cookies --save-cookies cookies.txt --post-data --header="Host: somewebsite.com" --header="Referer: https://md5decrypt.net/en/Password-cracking-wordlist-download/_Downloads_/wordlist-download.php" "http://md5decrypt.net/Telecharger-wordlist/Md5decrypt-awesome-wordlist.7z"
#7za e Md5decrypt-awesome-wordlist.7z
#rm Md5decrypt-awesome-wordlist.7z
#cat Md5decrypt-awesome-wordlist.txt >> holy_wow.txt
#rm Md5decrypt-awesome-wordlist.txt
#dlFiles=$((dlFiles+1))
#clear
#timer


### Get a bunch of lists from Skull Security
### https://wiki.skullsecurity.org/Passwords

# Rockyou
wget -O rockyou.txt.bz2 "http://downloads.skullsecurity.org/passwords/rockyou.txt.bz2"
bzip2 -dk rockyou.txt.bz2
rm rockyou.txt.bz2
cat rockyou.txt >> holy_wow.txt
rm rockyou.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer


# MySpace
wget -O myspace.txt.bz2 "http://downloads.skullsecurity.org/passwords/myspace.txt.bz2"
bzip2 -dk myspace.txt.bz2
rm myspace.txt.bz2
cat myspace.txt >> holy_wow.txt
rm myspace.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer

# Crackstation
wget -O crackstation.txt.gz "https://crackstation.net/files/crackstation.txt.gz"
7za e crackstation.txt.gz
rm crackstation.txt.gz
cat realuniq.lst >> holy_wow.txt
rm realuniq.lst
dlFiles=$((dlFiles+1))
hwSort
clear
timer

# John the Ripper
wget -O john.txt.bz2 "http://downloads.skullsecurity.org/passwords/john.txt.bz2"
bzip2 -dk john.txt.bz2
rm john.txt.bz2
cat john.txt >> holy_wow.txt
rm john.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer

# Cain and Able
wget -O cain.txt.bz2 "http://downloads.skullsecurity.org/passwords/cain.txt.bz2"
bzip2 -dk cain.txt.bz2
rm cain.txt.bz2
cat cain.txt >> holy_wow.txt
rm cain.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer

# Conficker
wget -O conficker.txt.bz2 "http://downloads.skullsecurity.org/passwords/conficker.txt.bz2"
bzip2 -dk conficker.txt.bz2
rm conficker.txt.bz2
cat conficker.txt >> holy_wow.txt
rm conficker.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer

# PHPbb
wget -O phpbb.txt.bz2 "http://downloads.skullsecurity.org/passwords/phpbb.txt.bz2"
bzip2 -dk phpbb.txt.bz2
rm phpbb.txt.bz2
cat phpbb.txt >> holy_wow.txt
rm phpbb.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer

# Hotmail
wget -O hotmail.txt.bz2 "http://downloads.skullsecurity.org/passwords/hotmail.txt.bz2"
bzip2 -dk hotmail.txt.bz2
rm hotmail.txt.bz2
cat hotmail.txt >> holy_wow.txt
rm hotmail.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer

# Faithwriters
wget -O faithwriters.txt.bz2 "http://downloads.skullsecurity.org/passwords/faithwriters.txt.bz2"
bzip2 -dk faithwriters.txt.bz2
rm faithwriters.txt.bz2
cat faithwriters.txt >> holy_wow.txt
rm faithwriters.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer

# Elite Hacker
wget -O elitehacker.txt.bz2 "http://downloads.skullsecurity.org/passwords/elitehacker.txt.bz2"
bzip2 -dk elitehacker.txt.bz2
rm elitehacker.txt.bz2
cat elitehacker.txt >> holy_wow.txt
rm elitehacker.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer

# Hak5
wget -O hak5.txt.bz2 "http://downloads.skullsecurity.org/passwords/hak5.txt.bz2"
bzip2 -dk hak5.txt.bz2
rm hak5.txt.bz2
cat hak5.txt >> holy_wow.txt
rm hak5.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer

# DirBuster Big
wget -O big.txt "https://raw.githubusercontent.com/digination/dirbuster-ng/master/wordlists/big.txt"
cat big.txt >> holy_wow.txt
rm big.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer

# DirBuster Euskera
wget -O Euskera.txt "https://raw.githubusercontent.com/digination/dirbuster-ng/master/wordlists/euskera.txt"
cat Euskera.txt >> holy_wow.txt
rm Euskera.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer

# DirBuster Catala
wget -O Catala.txt "https://github.com/digination/dirbuster-ng/blob/master/wordlists/catala.txt"
cat Catala.txt >> holy_wow.txt
rm Catala.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer

# SET FastTrack
wget -O FastTrack.txt "https://raw.githubusercontent.com/trustedsec/social-engineer-toolkit/master/src/fasttrack/wordlist.txt"
cat FastTrack.txt >> holy_wow.txt
rm FastTrack.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer

# Fern Wifi Cracker list
wget -O Fern.txt "https://raw.githubusercontent.com/savio-code/fern-wifi-cracker/master/Fern-Wifi-Cracker/extras/wordlists/common.txt"
cat Fern.txt >> holy_wow.txt
rm Fern.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer





### wFuzz lists
# test_ext
wget -O test_ext.txt "https://raw.githubusercontent.com/xmendez/wfuzz/master/wordlist/stress/test_ext.txt"
cat test_ext.txt >> holy_wow.txt
rm test_ext.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer

# common_pass
wget -O common_pass.txt "https://raw.githubusercontent.com/xmendez/wfuzz/master/wordlist/others/common_pass.txt"
cat common_pass.txt >> holy_wow.txt
rm common_pass.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer

# Names
wget -O names.txt "https://raw.githubusercontent.com/xmendez/wfuzz/master/wordlist/others/names.txt"
cat names.txt >> holy_wow.txt
rm names.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer

# megabeast
wget -O megabeast.txt "https://raw.githubusercontent.com/xmendez/wfuzz/master/wordlist/general/megabeast.txt"
cat megabeast.txt >> holy_wow.txt
rm megabeast.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer

# spanish
wget -O spanish.txt "https://raw.githubusercontent.com/xmendez/wfuzz/master/wordlist/general/spanish.txt"
cat spanish.txt >> holy_wow.txt
rm spanish.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer




### nmap lists
# Passwords
wget -O passwords.lst "https://raw.githubusercontent.com/nmap/nmap/master/nselib/data/passwords.lst"
sed -i '/#!comment/d' ./passwords.lst   ### Remove comments
cat passwords.lst >> holy_wow.txt
rm passwords.lst
dlFiles=$((dlFiles+1))
hwSort
clear
timer

# vHosts
wget -O vhosts-full.lst "https://raw.githubusercontent.com/nmap/nmap/master/nselib/data/vhosts-full.lst"
cat vhosts-full.lst >> holy_wow.txt
rm vhosts-full.lst
dlFiles=$((dlFiles+1))
hwSort
clear
timer




### Hashes.org
# 2012-2019 consolidated list
wget -O hashes.org-2012-2019.7z --user-agent="Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0" --keep-session-cookies --save-cookies cookies.txt --post-data --header="Host: somewebsite.com" --header="Referer: https://hashes.org/left.php" "https://hashes.org/download.php?foundId=true&type=found&year=2012-2019"
7za e hashes.org-2012-2019.7z
rm hashes.org-2012-2019.7z
cat hashes.org-2012-2019.txt >> holy_wow.txt
rm hashes.org-2012-2019.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer

# 2020 list
wget -O hashes.org-2020.7z --user-agent="Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0" --keep-session-cookies --save-cookies cookies.txt --post-data --header="Host: somewebsite.com" --header="Referer: https://hashes.org/left.php" "https://hashes.org/download.php?foundId=true&type=found&year=2020"
7za e hashes.org-2020.7z
rm hashes.org-2020.7z
cat hashes.org-2020.txt >> holy_wow.txt
rm hashes.org-2020.txt
dlFiles=$((dlFiles+1))
hwSort
clear
timer



### Download all from hashes.org https://hashes.org/left.php
### https://hashes.org/download.php?foundId=true&type=found&year=2012-2019
### https://hashes.org/download.php?foundId=true&type=found&year=2020



### This here is to grab the hashes.org PWs the long and hard way. Created before I found the consolidated lists:
### https://hashes.org/left.php
### https://hashes.org/download.php?foundId=true&type=found&year=2012-2019
### https://hashes.org/download.php?foundId=true&type=found&year=2020

# Set the start point
# StartPoint=1

# Get StopPoint from https://hashes.org/hashlists.php and store as StopPoint
# rm hashlists.php
# curl -O https://hashes.org/hashlists.php
# read StopPoint <<< $(sed 's/[^0-9]//g' <<< $(grep -m 1 td hashlists.php))
# rm hashlists.php

# Iterate from StartPoint to StopPoint and download all of the cracked lists
# for (( i=$StartPoint; i<=$StopPoint; i++ ))
# do
#    clear
#    timer
#    echo "Sleeping 1 second... (hashlistId = $i of $StopPoint)"
#    sleep 1
#    clear
#    timer
#    echo -e "We're on hashlistId $i of $StopPoint\n"
#    wget -O $i.txt --user-agent="Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0" --keep-session-cookies --save-cookies cookies.txt --post-data --header="Host: somewebsite.com" --header="Referer: https://hashes.org/leaks.php?id=$i" "https://hashes.org/download.php?type=found&hashlistId=$i"

   ### Find all occurrances of "Invalid hashlist!" and "Hashlist is deleted!" from hashes.org lists and delete them
#    if [[ $(grep "Invalid hashlist!" $i.txt) ]]; then rm $i.txt; fi
#    if [[ $(grep "Hashlist is deleted!" $i.txt) ]]; then rm $i.txt; fi
   
#    cat $i.txt >> holy_wow.txt
#    rm $i.txt

# done



### Remove cookies.txt
rm cookies.txt




# Stop timer and display
date --rfc-2822
timer

echo "Total unique passwords in holy_wow: $(wc -l < holy_wow.txt)"
