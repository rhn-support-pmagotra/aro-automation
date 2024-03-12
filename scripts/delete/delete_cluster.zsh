#!/bin/zsh
#
source ../../config.var
echo
echo -e "\e[32mStarting the Process of Deleting the Cluster\e[0m '$CLUSTER':"
echo "---"
if [ "$(az aro list --resource-group $RESOURCEGROUP --query '[].name' -o tsv 2> /dev/null)" = "$CLUSTER" ]
then
	echo "╰─○ SUCCESS - Executing Deletion"
	az aro delete --resource-group $RESOURCEGROUP --name $CLUSTER
else
	echo -e "\e[31mCluster\e[0m '$CLUSTER' \e[31min Resource Group\e[0m '$RESOURCEGROUP' \e[31mis not present. Either the Cluster Name or Resource Group is incorrect. Please try again.\e[0m"
fi
echo
