#!/bin/bash

set -e

export DEVOPS_ORGANIZATION=$1
export DEVOPS_PROJECT=$2
export GROUP_NAME=$3

# Configure the Azure DevOps CLI
az devops configure --defaults organization=${DEVOPS_ORGANIZATION} project=${DEVOPS_PROJECT} --use-git-aliases true

# Get the variable group id (if already exists)
group_id=$(az pipelines variable-group list --group-name ${GROUP_NAME} --query '[0].id' -o json)

if [ -z "${group_id}" ]; then
    # Create a new variable group
    tf_output=$(terraform output -json | jq -r 'to_entries[] | "\(.key)=\(.value.value)"')
    az pipelines variable-group create --name ${GROUP_NAME} --variables ${tf_output} --authorize true
else
    # Get existing variables
    var_list=$(az pipelines variable-group variable list --group-id ${group_id})

    # Add temporary uuid variable (a variable group cannot be empty)
    uuid=$(cat /proc/sys/kernel/random/uuid)
    az pipelines variable-group variable create --group-id ${group_id} --name ${uuid}

    # Delete existing variables
    for row in $(echo ${var_list} | jq -r 'to_entries[] | "\(.key)"'); do
        az pipelines variable-group variable delete --group-id ${group_id} --name ${row} --yes
    done

    # Create variables with latest values (from Terraform)
    success=false  # Track if any variable creation was successful

    terraform_output=$(terraform output -json)
    while read row; do

        key=$(echo $row | jq -r '.key')
        value=$(echo $row | jq -r '.value.value')
        is_secret=$(echo $row | jq -r '.value.sensitive')

        # If value is null or key is empty, skip this row
        if [ "$value" == "null" ] || [ -z "$key" ]; then
            echo "Skipping empty key/value..."
            continue
        fi

        echo "Key: $key"

        # Now, $value will be an empty string if it was null
        az pipelines variable-group variable create --group-id ${group_id} --name $key --value "$(printf "%s" "$value")" --secret $is_secret && success=true
    done < <(echo "$terraform_output" | jq -c '. | to_entries[]')


    # Only delete temporary uuid variable if at least one variable was successfully created
    if $success; then
        az pipelines variable-group variable delete --group-id ${group_id} --name ${uuid} --yes
    else
        echo "Error: No variables were successfully created. Keeping temporary variable."
        exit 1
    fi
fi
