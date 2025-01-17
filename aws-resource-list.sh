#!/bin/bash

#################################################################

# This script will list all the resources in the AWS account
# Author : Parthasarathy G
# Version: v0.0.1

# Following are the supported AWS services by the script
# 1. EC2
# 2. S3
# 3. RDS
# 4. DynamoDB
# 5. Lambda
# 6. IAM
# 7. CloudFormation
# 8. CloudWatch
# 9. VPC
# 10. SNS

#Usage: ./aws-resource-list.sh <region> <service-name>
#Example: ./aws-resource-list.sh us-east-1 ec2

#################################################################

# Check if the required arguments are passed

   if [ $# -ne 2 ]; then
   echo "Usage: ./aws-resource-list.sh <region> <service-name>"
   echo "Example: ./aws-resource-list.sh us-east-1 ec2"
    exit 1
fi

#Check if the AWS CLI is installed

if ! command -v aws &> /dev/null
then
    echo "AWS CLI could not be found. Please install the AWS CLI"
    exit
fi

#Check if the AWS CLI is configured

if [ ! -d ~/.aws ]; then
    echo "AWS CLI is not configured. Please configure the AWS CLI"
    exit
fi

#Execute the AWS CLI command based on the service name

case $2 in
    ec2)
        aws ec2 describe-instances --region $1
        ;;
    s3)
        aws s3api list-buckets --region $1
        ;;
    rds)
        aws rds describe-db-instances --region $1
        ;;
    dynamodb)
        aws dynamodb list-tables --region $1
        ;;
    lambda)
        aws lambda list-functions --region $1
        ;;
    iam)
        aws iam list-users --region $1
        ;;
    cloudformation)
        aws cloudformation list-stacks --region $1
        ;;
    cloudwatch)
        aws cloudwatch list-metrics --region $1
        ;;
    vpc)
        aws ec2 describe-vpcs --region $1
        ;;
    sns)
        aws sns list-topics --region $1
        ;;
    *)
        echo "Invalid service name. Please provide a valid service name"
        ;;
esac