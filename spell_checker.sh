#!/bin/sh
#This script should be called from test_html.sh with the 3 arguments supplied
#Runs spell checker ,commits the custom dictionary and returns
#the exit code

python3 $2/html_spell.py $1 $2/data/English.txt $3/data/custom_dict.txt -e
exit_code=$?
git pull
git add $3/data/custom_dict.txt
git commit $3/data/custom_dict.txt -m "Custom dictionary updated by spell checker tool"
echo $exit_code