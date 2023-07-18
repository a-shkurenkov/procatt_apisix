#!/bin/bash

tstart=`date +%s.%N`
cd terraform/; terraform init; terraform apply -auto-approve; cd -
tend=`date +%s.%N`
truntime=$( echo "$tend - $tstart" | bc -l )
echo -e "\nTerraform execution time: $(date -d @$truntime -u +%H:%M:%S.%N)"

