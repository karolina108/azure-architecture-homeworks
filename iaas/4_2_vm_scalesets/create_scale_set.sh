#!/usr/bin/env bash
az login;

LOCATION=westeurope
RESOURCE_GROUP=cs-arch-iaas-rg;
SCALE_SET=cs-arch-iaas-vmss

az group create --name ${RESOURCE_GROUP} --location ${LOCATION}

az vmss create \
    --resource-group ${RESOURCE_GROUP} \
    --name ${SCALE_SET} \
    --image UbuntuLTS \
    --vm-sku Standard_F1 \
    --instance-count 3 \
    --admin-username azureuser \
    --generate-ssh-keys

az vmss show \
    --resource-group ${RESOURCE_GROUP} \
    --name ${SCALE_SET} \
    --output table

az group delete \
    --name ${RESOURCE_GROUP} \
    --resource-group ${RESOURCE_GROUP} \
    --no-wait \
    --yes;

az group exists --name ${RESOURCE_GROUP}