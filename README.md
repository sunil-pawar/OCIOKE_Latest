# OCIOKE_Latest
## Description
  The terraform code to create OCI(oracle cloud infrastructure) resoruces and deploy kubernetes cluster in it, along with the the kube prometheus stack deployed to monitor the kuberentes nodes and display in the dashboard. (Using Helm) 
## Pre-requisite
1. Install terraform, helm and kubernetes on the laptop/machine where the terraform is to be run and make a note of the path
2. OCI account informations suchs as user OCID, tenancy OCID, region, Fingerprint and campartment OCID 
3. Setup .oci config [OracleDocs](https://docs.oracle.com/en-us/iaas/Content/API/Concepts/sdkconfig.htm)
4. Generate sshkey pair following the instruction from here [oracle docs](https://www.oracle.com/webfolder/technetwork/tutorials/obe/cloud/compute-iaas/generating_ssh_key/generate_ssh_key.html)
## Steps to deploy
1. Download the content of this repository
2. Download the repository
3. Edit the env_var.ps1 file with the values from the step 1-4 from prerequisites
4. Update the variables.tf file as required mainly the public sshkey that was generated from step 4 of prereqisites
###  Execute commands
    1. .\env_var.ps1
    2. terraform init
    3. terraform plan
    4. terraform apply

