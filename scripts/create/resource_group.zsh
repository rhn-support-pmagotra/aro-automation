#!/bin/zsh
#
# Sourcing the Variables:
source ../../config.var

echo
echo -e "\e[32mCreate Resource Group\e[0m $RESOURCEGROUP:"
echo "---"
sleep 1
if [[ "$(az group exists -n $RESOURCEGROUP)" == "true" ]]; then
	echo "╰─○ Resource Group $RESOURCEGROUP is already present"
else
	az group create --name $RESOURCEGROUP --location $REGION
	echo "╰─○ SUCCESS"
fi
echo
