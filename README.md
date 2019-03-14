# PW_List

awk -F, '{print $3}' input.csv >> output.txt

for i in *; do cat $i >> everything.pass; done

sort -f everything.pass | uniq -i > every.sort

while true; do clear; ls -lha | grep -i every; sleep 5; done
