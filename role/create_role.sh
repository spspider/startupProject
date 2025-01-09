#!/bin/sh

# Variables
new_role_name="cdnwaf-s-hhpmc-github-access-role"
old_role_name="cdnwaf-s-hhpmc-access-role"

# # Step 1: Create a new IAM role with the saved trust policy
trust_policy=$(cat $old_role_name/trust-policy.json)
aws iam create-role --role-name $new_role_name --assume-role-policy-document "$trust_policy"

# Step 2: Attach the saved inline policies to the new role
for policy_file in $old_role_name/*.json; do
    if [ $policy_file != *"trust-policy.json" ]; then
        policy_name=$(basename $policy_file .json)
        policy_document=$(cat $policy_file)
        aws iam put-role-policy --role-name $new_role_name --policy-name $policy_name --policy-document "$policy_document"
    fi
done

tags=$(cat $old_role_name/tags.json)
aws iam tag-role --role-name $new_role_name --tags "$tags"
