
#/!bin/sh

curl -s -X POST -H "Content-Type: application/x-www-form-urlencoded" -d 'domain='$1'&submit=' https://seckrd.com/subdomain-finder.php | grep -oE "https?://[^'\"]+" | awk -F/ '{print $3}';

curl -k -s "https://crt.sh/?q=$1&output=json" | jq -r '.[] | "\(.name_value)\n\(.common_name)"' | sort -u;

curl -k -s "https://rapiddns.io/subdomain/$1?full=1#result" | grep "<td><a" | cut -d '"' -f 2 | grep http | cut -d '/' -f3 | sed 's/#results//g' | sort -u;             

curl -s "https://riddler.io/search/exportcsv?q=pld:$1" | grep -Po "(([\w.-]*)\.([\w]*)\.([A-z]))\w+" | sort -u; 

curl -sk "http://web.archive.org/cdx/search/cdx?url=*.$1&output=txt&fl=original&collapse=urlkey&page=" | awk -F / '{gsub(/:.*/, "", $3); print $3}' | anew | sort -u | unfurl domains;
