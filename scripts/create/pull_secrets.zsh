#!/bin/zsh
#
echo
echo -e "\e[32mChecking the availability of Pull Secret File\e[0m"
echo "---"
sleep 1
if [ -e ../../"pull-secret.txt" ]; then
    echo "╰─○ SUCCESS"
else
    echo -e "╰─○ pull-secret.txt \e[31mfile is missing. Please Download the Pull Secrets from\e[0m https://console.redhat.com/openshift/install/azure/aro-provisioned\e[31m. Script will now Exit.\e[0m"
    exit 1
fi
echo
