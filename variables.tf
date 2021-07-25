variable "tenancy_ocid" {}
 
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "compartment_ocid" {}
 
variable "ssh_public_key_file" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD7GhL6G+v0T8VPPDNu/QCxDgrh+RXiXsurzFGw+r5FXPkag5uFHSS8DWZJ4qUuPM92EKFVXVzkPxlVtvYBW2Sw/DBc+Z7GzjCbIdnSrfLR1IBZ1y5Pd83Ggg4p7CDg9FQkNT4nGBoKBCPqiJEj5RxVcUejEpkCMNUh4z7xzt8wY/S9jN50chQW84upKDC7zr4aInHPuQ2JZqjSIj7cxL4AxRqwzMJd+jO4D3ohn58ExisBHi+zqj9ijuFTg6VQjvTSS68EPhLSuljGrev0DF7ADjjFMqI9Y+xDDUWfHg+2WIA+HLPRZVxkh7oNS1ZwbTda4sflkH58rOSaOmHablNd rsa-key-20210713"
}
 
variable "region" {
  default = "us-ashburn-1"
}
 
# Choose an Availability Domain
variable "availability_domain" {
  default = "3"
}
 
variable "internet_gateway_enabled" {
  default = "true"
}
 
variable "worker_ol_image_name" {
  default = "Oracle-Linux-7.4"
}
 
variable "oke" {
  type = map(string)
 
  default = {
    name             = "oke"
    version          = "v1.20.8"
    shape            = "VM.Standard.E3.Flex"
    nodes_per_subnet = 1
  }
}
 
variable "network_cidrs" {
  type = map(string)
 
  default = {
    vcnCIDR               = "10.0.0.0/16"
    workerSubnetAD1       = "10.0.10.0/24"
    workerSubnetAD2       = "10.0.11.0/24"
    workerSubnetAD3       = "10.0.12.0/24"
    LoadBalancerSubnetAD1 = "10.0.20.0/24"
    LoadBalancerSubnetAD2 = "10.0.21.0/24"
    LoadBalancerSubnetAD3 = "10.0.22.0/24"
  }
}