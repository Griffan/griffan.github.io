pandoc --filter=pandoc-citeproc --standalone mybib.md -o mybib.html --metadata pagetitle="mybib"
#perl -e '$flag=0;while(<>){if(/body/){$flag ^= 1;next;}print if $flag;}' mybib.html |grep -v "Bibliography"|cat ../header.html - ../foot.html >../publications.html
perl -e '$flag=0;while(<>){if(/body/){$flag ^= 1;next;} $_=~s/<p>(\w+), ((\w+|\.| )+),{1}/<p>$2 $1,/g; print if $flag;}' mybib.html|grep -v "Bibliography"|cat ../header.html - ../foot.html >../publications.html
