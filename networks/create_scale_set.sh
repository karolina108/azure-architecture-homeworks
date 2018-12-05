#!/usr/bin/env bash
az login;

LOCATION=westeurope
RESOURCE_GROUP=cs-arch-hmk-networks-rg;
SCALE_SET=csarchhmknetvs


az vmss create --resource-group ${RESOURCE_GROUP} \
    --name ${SCALE_SET} \
    --image UbuntuLTS \
    --vm-sku Standard_DS1_v2 \
    --instance-count 2 \
    --authentication-type ssh \
    --ssh-key-value /Users/karolina/.ssh/az_arch_net.pub \
    --admin-username azure-user \
    --app-gateway cs-arch-hmk-networks-apg \
    --custom-data cloud-init.txt \
    --vnet-name cs-arch-hmk-networks-vnet-001 \
    --subnet cs-arch-hmk-networks-apps-sbn \
    --backend-pool-name cs-arch-hmk-networks-apgCsArchHmkNetVS