#!/bin/sh
policyname=cdnwaf-s-hhpmc-access-role
aws iam list-role-policies --role-name $policyname --query 'PolicyNames' --output json > inline_policies.json
mkdir -p $policyname
for policy in $(jq -r '.[]' inline_policies.json); do
    aws iam get-role-policy --role-name $policyname --policy-name $policy --query 'PolicyDocument' --output json > $policyname/${policy}.json
done
aws iam get-role --role-name $policyname --query 'Role.AssumeRolePolicyDocument' --output json > $policyname/trust-policy.json

aws iam list-role-tags --role-name $policyname --query 'Tags' --output json > $policyname/tags.json
