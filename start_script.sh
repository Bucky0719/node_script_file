#!/bin/bash

# Set your AWS region and EC2 instance ID
AWS_REGION="us-east-1"  # Change to your AWS region
INSTANCE_ID="i-0c1e67d0a65bee739"  # Replace with your EC2 instance ID

# Start the EC2 instance
echo "Starting EC2 instance: $INSTANCE_ID..."
aws ec2 start-instances --instance-ids $INSTANCE_ID --region $AWS_REGION

# Wait for the instance to start
echo "Waiting for the instance to start..."
aws ec2 wait instance-running --instance-ids $INSTANCE_ID --region $AWS_REGION

# Get the public IP address of the instance
PUBLIC_IP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --region $AWS_REGION --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)

echo "EC2 instance is now running."
echo "Public IP Address: $PUBLIC_IP"
