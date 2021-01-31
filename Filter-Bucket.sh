#!/bin/bash
read bucket
aws s3 ls s3://$bucket --recursive --human-readable --summarize
