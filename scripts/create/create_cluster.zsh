#!/bin/zsh
#
source ../../config.var

echo
echo -e "\e[32mStarting Cluster Creation\e[0m"
echo "---"
sleep 1

# ---

aro_command_init="az aro create --resource-group \"$RESOURCEGROUP\" --name \"$CLUSTER\" --vnet \"$VNETNAME\" --master-subnet \"$MASTER_SUBNET_NAME\" --worker-subnet \"$WORKER_SUBNET_NAME\" --pull-secret ../../pull-secret.txt"

if [ -z "$VERSION" ]; then
    aro_command_final="$aro_command_init"
else
    aro_command_final="$aro_command_init --version \"$VERSION\""
fi

# ---

if [[ "$(az aro list --resource-group $RESOURCEGROUP -otsv 2> /dev/null | awk '{print $4}')" == "$CLUSTER" ]]
then
	echo "╰─○ Cluster $CLUSTER already exists"
else
	echo "╰─○ SUCCESS - Executing $CLUSTER"
	eval "$aro_command_final"
fi
echo

# ---
