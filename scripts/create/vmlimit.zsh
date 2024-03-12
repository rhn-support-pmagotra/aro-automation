#!/bin/zsh
#
# Sourcing the Variables:
source ../../config.var

echo
echo -e "\e[32mChecking Available Limit for the VM:\e[0m"
echo "---"
sleep 1
for LIMIT in "$(az vm list-usage -l $REGION  --query "[?contains(name.value, 'standardDSv3Family')]" -otable | awk 'NR==3 {print $2}')"
do
    if [ "$LIMIT" -ge 200 ]; then
        echo "╰─○ Current limit is $LIMIT. Proceeding further safely"
    else
        echo "╰─○Current limit it is below 200. Script will now exit."
        exit 1
    fi
done
echo
