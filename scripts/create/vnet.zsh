#!/bin/zsh
#
# Sourcing the Variables
source ../../config.var

# Storing Variables
azvnetfetch=$(az network vnet list --query "[?contains(addressSpace.addressPrefixes, '$VNETADDR')]" -otsv | awk '{print $5}' | grep $VNETNAME)
sourcefile=$(echo $VNETNAME)

echo
echo -e "\e[32mCreating Virtual Network\e[0m $VNETNAME"
echo "---"
sleep 1
if [[ "$azvnetfetch" == "$sourcefile"  ]]
then
	echo "╰─○ VNET $VNETNAME already Present"
else
	az network vnet create --resource-group $RESOURCEGROUP --name $VNETNAME --address-prefixes $VNETADDR
	echo "╰─○ SUCCESS"
fi
echo
