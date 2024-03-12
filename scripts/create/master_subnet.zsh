#!/bin/zsh
#
# Sourcing the Variables
source ../../config.var

# Storing Variables
azmastersubnetfetch=$(az network vnet subnet list --resource-group "$RESOURCEGROUP" --vnet-name "$VNETNAME" -otsv | awk '{print $1$6}' | grep $MASTER_SUBNET_ADDR$MASTER_SUBNET_NAME)
sourcefile="$(echo $MASTER_SUBNET_ADDR$MASTER_SUBNET_NAME)"

echo
echo -e "\e[32mCreating master subnet:\e[0m"
echo "---"
sleep 1
if [[ "$azmastersubnetfetch" == "$sourcefile" ]]
then
	echo "╰─○ Subnet $MASTER_SUBNET_NAME already Present"
else
	az network vnet subnet create --resource-group $RESOURCEGROUP --vnet-name $VNETNAME --name $MASTER_SUBNET_NAME --address-prefixes $MASTER_SUBNET_ADDR
       	echo "╰─○ SUCCESS"
fi
echo
