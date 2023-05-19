
#/!bin/sh

curl -s -X POST -H "Content-Type: application/x-www-form-urlencoded" -d 'domain='$1'&submit=' https://seckrd.com/subdomain-finder.php | grep -oE "https?://[^'\"]+" | awk -F/ '{print $3}';





