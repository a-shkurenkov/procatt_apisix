#!/bin/bash

tstart=`date +%s.%N`
cd terraform/; terraform destroy -auto-approve
tend=`date +%s.%N`
truntime=$( echo "$tend - $tstart" | bc -l )
echo "Terraform execution time: $(date -d @$truntime -u +%H:%M:%S.%N)"
