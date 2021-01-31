#!/bin/bash
echo "Aws Account Name:"
aws_profile=('venkata');

#loop AWS profiles

for i in "${aws_profile[@]}"; do
        echo "${i}"
        buckets=($(aws --profile "${i}" --region us-east-2 s3 ls s3:// --recursive | awk '{print $3}'))
        echo "Aws Bucket names with contents in them:"

#loop S3 buckets

        for j in "${buckets[@]}"; do
        echo "${j}"
        files=($(aws s3 ls s3://"${j}" --recursive --human-readable --summarize | awk '{print $1 $2 $3 $4 $5 $6 $7}'))
               
                for k in "${files[@]}"; do
                echo "${k}"
                
                done
        done

done
