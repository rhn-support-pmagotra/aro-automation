#!/bin/zsh
#
#Sourcing the Variables:
#
source ../../config.var

echo
echo -e "\e[32mLogging in to Azure CLI\e[0m"
echo "---"
sleep 1
if [ "$(az account show --query 'user.name' -o tsv | tr -d '\n')" = "$AZEMAIL" ]; then
        echo "╰─○ Account $AZEMAIL is already logged in"
else
        az login
	echo "╰─○ SUCCESS"
fi
echo
