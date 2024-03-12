#!/bin/zsh
#
source ../../config.var

echo
echo -e "\e[32mShowing the Installed Cluster Details:\e[0m"
echo
echo "---"
sleep 1
if [[ "$(az aro list --resource-group $RESOURCEGROUP --query '[].name' -o tsv 2> /dev/null)" = "$CLUSTER" ]]
then
	echo -e "╰─○    \e[32mConsole URL:\e[0m $(az aro show -n $CLUSTER -g $RESOURCEGROUP --query "consoleProfile.url" -otsv)"
	echo -e "╰─○        \e[32mAPI URL:\e[0m $(az aro show -g $RESOURCEGROUP -n $CLUSTER --query "apiserverProfile.url" -otsv)"
	echo -e "╰─○ \e[32mkubeAdmin User:\e[0m $(az aro list-credentials -n $CLUSTER -g $RESOURCEGROUP | jq -r '.kubeadminUsername')"
	echo -e "╰─○ \e[32mkubeAdmin Pass:\e[0m $(az aro list-credentials -n $CLUSTER -g $RESOURCEGROUP | jq -r '.kubeadminPassword')"
	echo "---"
	echo -e "╰─○ \e[32mComplete Login Command:\e[0m oc login -u $(az aro list-credentials -n $CLUSTER -g $RESOURCEGROUP | jq -r '.kubeadminUsername') -p $(az aro list-credentials -n $CLUSTER -g $RESOURCEGROUP | jq -r '.kubeadminPassword') $(az aro show -g $RESOURCEGROUP -n $CLUSTER --query apiserverProfile.url -otsv)"
else
	echo -e "╰─○ \e[31mCluster\e[0m '$CLUSTER' \e[31min Resource Group\e[0m '$RESOURCEGROUP' \e[31mis not present. Either the Cluster Name or Resource Group is incorrect. Please try again.\e[0m"
fi
echo
