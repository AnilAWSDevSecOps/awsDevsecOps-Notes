#!/bin/bash
# Listing the VPCs in the account
Region=$1
# aws ec2 describe-vpcs --region $Region --query "Vpcs[].VpcId" --output text
aws ec2 describe-vpcs --region $Region | jq ".Vpcs[].VpcId" -r
