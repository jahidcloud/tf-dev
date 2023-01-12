#!/bin/bash


ARTIFACT=`packer build -machine-readable -var-file=variable.json initial-ami.json |awk -F, '$0 ~/artifact,0,id/ {print $6}'`
AMI_ID=`echo $ARTIFACT | cut -d ':' -f2`
echo 'variable "AMI_ID"
