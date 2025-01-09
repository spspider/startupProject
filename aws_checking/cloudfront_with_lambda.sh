#!/bin/bash
# lambda_functions=$(aws lambda list-functions --query 'Functions[*].FunctionName' --output text)

# LAMBDA_NAME="cdnwaf-klopf-deleteme"
# count=0

# distributions=$(aws cloudfront list-distributions --query "DistributionList.Items[].Id" --output text)
# for distribution in $distributions; do
#     config=$(aws cloudfront get-distribution-config --id $distribution)
#     if echo $config | grep -q $LAMBDA_NAME; then
#         ((count++))
#         echo "$count, lambda function $LAMBDA_NAME is attached to CloudFront distribution $distribution"
#     fi
# done

####################################################

#!/bin/bash

# List of Lambda function names
LAMBDA_NAMES=(
    "lambda_names"
)

count=0

# Fetch the list of CloudFront distributions
distributions=$(aws cloudfront list-distributions --query "DistributionList.Items[].Id" --output text)

# Loop through each distribution
for distribution in $distributions; do
    # Get the distribution configuration
    config=$(aws cloudfront get-distribution-config --id $distribution)

    # Check each Lambda function name in the list
    for LAMBDA_NAME in "${LAMBDA_NAMES[@]}"; do
        if echo $config | grep -q $LAMBDA_NAME; then
            ((count++))
            echo "$count, lambda function $LAMBDA_NAME is attached to CloudFront distribution $distribution" >>list
            echo "$count, lambda function $LAMBDA_NAME is attached to CloudFront distribution $distribution"
        fi
    done
done
