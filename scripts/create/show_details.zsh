#!/bin/zsh
#
source ../../config.var

echo
echo -e "\e[32mShowing the Installed Cluster Details\e[0m"
echo "---"
sleep 1
echo -e "╰─○    \e[32mConsole URL:\e[0m $(az aro show -n $CLUSTER -g $RESOURCEGROUP --query "consoleProfile.url" -otsv)"
echo -e "╰─○        \e[32mAPI URL:\e[0m $(az aro show -g $RESOURCEGROUP -n $CLUSTER --query "apiserverProfile.url" -otsv)"
echo -e "╰─○ \e[32mkubeAdmin User:\e[0m $(az aro list-credentials -n $CLUSTER -g $RESOURCEGROUP | jq -r '.kubeadminUsername')"
echo -e "╰─○ \e[32mkubeAdmin Pass:\e[0m $(az aro list-credentials -n $CLUSTER -g $RESOURCEGROUP | jq -r '.kubeadminPassword')"
sleep 2
echo -e "\e[32m---------------------\e[0m"
echo -e "╰─○ \e[32mComplete Login Command:\e[0m oc login -u $(az aro list-credentials -n $CLUSTER -g $RESOURCEGROUP | jq -r '.kubeadminUsername') -p $(az aro list-credentials -n $CLUSTER -g $RESOURCEGROUP | jq -r '.kubeadminPassword') $(az aro show -g $RESOURCEGROUP -n $CLUSTER --query apiserverProfile.url -otsv)"
echo
