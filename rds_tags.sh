#!/bin/bash

# Variables:


# User-defined functions:

function get_arns(){
     aws rds describe-db-instances | jq -r .DBInstances[].DBInstanceArn
}

# Main:

RESULT=$(get_arns)

for ARN in $RESULT

do
        echo $ARN
        aws rds list-tags-for-resource --resource-name $ARN

done
