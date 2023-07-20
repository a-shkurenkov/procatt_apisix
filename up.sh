#!/bin/bash

tstart=`date +%s.%N`
cd terraform/; terraform init; terraform apply -auto-approve; cd -
tend=`date +%s.%N`
truntime=$( echo "$tend - $tstart" | bc -l )
echo -e "\nTerraform execution time: $(date -d @$truntime -u +%H:%M:%S.%N)"

echo -e "\nImport kubectl config."
yc container cluster get-credentials kub-test --external

astart=`date +%s.%N`
cd ansible/; ansible-playbook base.yml
aend=`date +%s.%N`
aruntime=$( echo "$aend - $astart" | bc -l )
echo -e "\nAnsible execution time: $(date -d @$aruntime -u +%H:%M:%S.%N)"
