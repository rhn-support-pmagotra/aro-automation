#!/bin/zsh
#
## Sourcing the Variables:
source ../../config.var

echo
echo -e "\e[32mRegistering Providers:\e[0m"
echo "---"
sleep 1
if [[ "$(az provider list --query "[?namespace=='Microsoft.RedHatOpenShift'].namespace" | grep -o "Microsoft.RedHatOpenShift")" == "Microsoft.RedHatOpenShift" ]]; then
        echo "╰─○ Provider Microsoft.RedHatOpenShift is already Registered"
else
        az provider register -n Microsoft.RedHatOpenShift --wait
        echo "╰─○ SUCCESS"
fi

# ---

if [[ "$(az provider list --query "[?namespace=='Microsoft.Compute'].namespace" | grep -o "Microsoft.Compute")" == "Microsoft.Compute" ]]; then
        echo "╰─○ Provider Microsoft.Compute is already Registered"
else
        az provider register -n Microsoft.Compute --wait
        echo "╰─○ SUCCESS"
fi

# ---

if [[ "$(az provider list --query "[?namespace=='Microsoft.Storage'].namespace" | grep -o "Microsoft.Storage")" == "Microsoft.Storage" ]]; then
        echo "╰─○ Provider Microsoft.Storage is already Registered"
else
        az provider register -n Microsoft.Storage --wait
        echo "╰─○ SUCCESS"
fi

# ---

if [[ "$(az provider list --query "[?namespace=='Microsoft.Authorization'].namespace" | grep -o "Microsoft.Authorization")" == "Microsoft.Authorization" ]]; then
        echo "╰─○ Provider Microsoft.Authorization is already Registered"
else
        az provider register -n Microsoft.Authorization --wait
        echo "╰─○ SUCCESS"
fi
echo

# ---
