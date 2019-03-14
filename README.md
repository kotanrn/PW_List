# PW_List

for i in *.txt; do cat $i >> everything.pass; done

sort -f everything.pass | uniq -i > every.sort
