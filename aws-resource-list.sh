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
    echo "Usage: $0 <region> <service-name>"
    exit 1
fi

#Check if the AWS CLI is installed

if ! command -v aws &> /dev/null
then
    echo "AWS CLI could not be found. Please install the AWS CLI"
    exit
fi

