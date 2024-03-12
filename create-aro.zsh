#!/bin/zsh
#
cd "$(dirname "$0")/scripts/create" || exit
./login.zsh
./vmlimit.zsh
./subscription.zsh
./providers.zsh
./resource_group.zsh
./vnet.zsh
./master_subnet.zsh
./worker_subnet.zsh
./pull_secrets.zsh
./create_cluster.zsh
./show_details.zsh
