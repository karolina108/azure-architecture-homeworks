#!/usr/bin/env bash
az login;

LOCATION=westeurope;
RESOURCE_GROUP=cs-arch-arm-homework-rg-0002;
TEMPLATE_PATH=../single_linux_machine_template.json;
PARAMETERS_PATH=../single_linux_machine_parameters.json;

az group create --location ${LOCATION}  --name ${RESOURCE_GROUP};

az group deployment validate \
    --resource-group ${RESOURCE_GROUP} \
    --mode Complete \
    --template-file ${TEMPLATE_PATH} \
    --parameters ${PARAMETERS_PATH};

az group deployment create \
    --resource-group ${RESOURCE_GROUP} \
    --mode Complete \
    --template-file ${TEMPLATE_PATH} \
    --parameters ${PARAMETERS_PATH};

az group delete \
    --name ${RESOURCE_GROUP} \
    --resource-group ${RESOURCE_GROUP} \
    --no-wait \
    --yes;

az group exists --name ${RESOURCE_GROUP}