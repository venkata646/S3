#!/bin/bash

read storage
aws_profile=('venkata');

#loop AWS profiles
for i in "${aws_profile[@]}"; do
        buckets=($(aws --profile "${i}" --region us-east-2 s3 ls s3:// --recursive | awk '{print $3}'))
        echo "Aws Bucket names with contents in them:"

#loop S3 buckets

        for j in "${buckets[@]}"; do
        echo "${j}"
        files=($(aws s3 ls s3://"${j}" --recursive --human-readable --summarize | awk '{print $1 $2 $3 $4 $5 $6 $7}'))
        strcls=($(aws s3api list-objects-v2 --bucket "${j}" --prefix Action --query "Contents[?StorageClass=='@storage'].Key" --output text      
        done
done
