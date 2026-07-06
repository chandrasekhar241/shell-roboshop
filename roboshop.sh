#!/bin/bash

AMI_ID=ami-0220d79f3f480ecf5
ZONE_ID=Z08591453NE7S2K54TI4E
DOMAIN_NAME=daws90saws.shop

for instance in $@
do
    INSTANCE_ID=$(aws ec2 run-instances \
        --image-id ami-0220d79f3f480ecf5 \
        --instance-type t3.micro \
        --security-groups roboshop-common \
        --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Test}]' \
        --query 'Instances[0].InstanceId' \
        --output text
    )
done