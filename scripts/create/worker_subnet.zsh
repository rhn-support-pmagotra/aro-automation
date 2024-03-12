#!/bin/zsh
#
# Sourcing the Variables
source ../../config.var

# Storing Variables
azworkersubnetfetch=$(az network vnet subnet list --resource-group "$RESOURCEGROUP" --vnet-name "$VNETNAME" -otsv | awk '{print $1$6}' | grep $WORKER_SUBNET_ADDR$WORKER_SUBNET_NAME)
sourcefile="$(echo $WORKER_SUBNET_ADDR$WORKER_SUBNET_NAME)"

echo
echo -e "\e[32mCreating worker subnet:\e[0m"
echo "---"
sleep 1
if [[ "$azworkersubnetfetch" == "$sourcefile" ]]
then
	echo "╰─○ Subnet $WORKER_SUBNET_NAME already Present"
else
	az network vnet subnet create --resource-group $RESOURCEGROUP --vnet-name $VNETNAME --name $WORKER_SUBNET_NAME --address-prefixes $WORKER_SUBNET_ADDR
       	echo "╰─○ SUCCESS"
fi
echo
