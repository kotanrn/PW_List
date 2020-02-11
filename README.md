# PW_List

./holy_wow.sh is a simple bash script to download
and combine a bunch of wordlists in to holy_wow.txt


Inspired by _NSAKey's talk at BSides Nashville 2015: 

https://www.youtube.com/watch?v=7A9siTT_A6I 


When last run on 09 Feb 2020, it took about 6 hours to
download, combine, sort, and uniq; holy_wow.txt was
~38 GB with 3,559,675,825 unique passwords.


It takes about 30 minutes to base64.rule all of them against plain md5
on my machine
