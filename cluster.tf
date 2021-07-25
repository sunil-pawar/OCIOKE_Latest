resource "oci_containerengine_cluster" "k8s_cluster" {
  #Required
  compartment_id     = "${var.compartment_ocid}"
  kubernetes_version = "${var.oke["version"]}"
  name               = "${var.oke["name"]}"
  vcn_id             = "${oci_core_vcn.oke_vcn.id}"
  endpoint_config {
    is_public_ip_enabled = true 
    subnet_id            = oci_core_subnet.workerSubnetAD1.id
  }
 
  #Optional
  options {
    service_lb_subnet_ids = ["${oci_core_subnet.LoadBalancerSubnetAD1.id}"]
  }
}
 
# https://www.terraform.io/docs/providers/oci/r/containerengine_node_pool.html
resource "oci_containerengine_node_pool" "k8s_node_pool" {
  #Required
  cluster_id         = "${oci_containerengine_cluster.k8s_cluster.id}"
  compartment_id     = "${var.compartment_ocid}"
  kubernetes_version = "${var.oke["version"]}"
  name               = "${var.oke["name"]}"
  #node_image_name    = "${var.worker_ol_image_name}"
  node_shape         = "${var.oke["shape"]}"
  #subnet_ids         = ["${oci_core_subnet.workerSubnetAD1.id}"]
 
  #quantity_per_subnet = "${var.oke["nodes_per_subnet"]}"
  ssh_public_key      = "${var.ssh_public_key_file}"

  node_source_details {
		image_id = "ocid1.image.oc1.iad.aaaaaaaafjeywk4pmink5lmvhbfwzshlb4skyh74zd3qbberxex4fdkpg62a"
		source_type = "IMAGE"
	}
  node_shape_config {
		memory_in_gbs = "16"
		ocpus = "1"
	}
node_config_details {
        #Required
        placement_configs {
            #Required
            availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[1], "name")}"
            subnet_id = oci_core_subnet.workerSubnetAD1.id
        }
        size = "3"

        #Optional
        #nsg_ids = var.node_pool_node_config_details_nsg_ids
    }

}
 
# https://www.terraform.io/docs/providers/oci/d/containerengine_cluster_kube_config.html
data "oci_containerengine_cluster_kube_config" "cluster_kube_config" {
  cluster_id    = "${oci_containerengine_cluster.k8s_cluster.id}"
  expiration    = 2592000
  token_version = "2.0.0"
}
 
# https://www.terraform.io/docs/providers/local/r/file.html
resource "local_file" "kubeconfig" {
  content  = "${data.oci_containerengine_cluster_kube_config.cluster_kube_config.content}"
  filename = "${path.module}/kubeconfig"
}