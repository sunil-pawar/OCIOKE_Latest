# OCIOKE_Latest
## Description
  The terraform code to create OCI(oracle cloud infrastructure) resoruces and deploy kubernetes cluster in it, along with the the kube prometheus stack deployed to monitor the kuberentes nodes and display in the dashboard. (Using Helm) 
## Pre-requisite
1. Install helm and kubernetes on the laptop/machine where the terraform is to be run and make a note of the path
2. Setup .oci config [OracleDocs](https://docs.oracle.com/en-us/iaas/Content/API/Concepts/sdkconfig.htm)
3. OCI account informations suchs as user OCID, tenancy OCID, region, Fingerprint and campartment OCID
## Steps to deploy
### download the content of this repository
###   download the repository
### edit the env_var.ps1 file with the values from the step 3 from prerequisites
### edit the helmcommands.ps1 powershell with the path of the helm.exe
### Update the variables.tf file as required 
###  execute commands 
#### terraform init
#### terraform plan
#### terraform apply

