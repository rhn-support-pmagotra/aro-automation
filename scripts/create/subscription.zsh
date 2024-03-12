#!/bin/zsh
#
# Sourcing the Variables:
source ../../config.var

# Check if subs_value is set and not empty, assign default value otherwise

if [[ -z "$SUBSCRIPTION" && -n "${subs_fetch}" ]]; then
    SUBSCRIPTION="${subs_fetch}"
fi
subs_fetch=${subs_value:-3ceade1e-a7eb-4b2d-ba84-f84f89a10267}

# ---

echo
echo -e "\e[32mSetting-up the Subscription:\e[0m"
echo "---"
sleep 1
subs_fetch_from_user=$(echo "$subs_fetch" | tr -d '[:space:]')
current_subs_from_az=$(az account list --query "[?isDefault].id" -o tsv)

# ---

if [ "$current_subs_from_az" = "$subs_fetch_from_user" ]; then
	echo "╰─○ Subscription "$subs_fetch_from_user" is already set"
else
    if [ "$subs_fetch_from_user" = "desired_value" ]; then
        echo "╰─○ SUCCESS"
        az account set --subscription "$subs_fetch_from_user"
    else
        echo -e "\e[31mInvalid subscription value provided\e[0m '$subs_fetch_from_user'\e[31m. Script will exit now.\e[0m"
	exit 1
    fi
fi
echo

# ---
