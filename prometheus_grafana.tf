provider "helm" {
  kubernetes {
    config_path = "${path.module}/kubeconfig"
  }
}

provider "kubernetes" {
 
    config_path = "${path.module}/kubeconfig"
   # load_config_file = false
  
}


resource "kubernetes_namespace" "monitoringns" {
  metadata {
    annotations = {
      name = "monitoring"
    }

    labels = {
      mylabel = "monitoring"
    }

    name = "prometheus-monitoring"
  }
  depends_on = [oci_containerengine_cluster.k8s_cluster, oci_containerengine_node_pool.k8s_node_pool]
}

/*resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress-controller"

  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus-community"

  set {
    name  = "service.type"
    value = "ClusterIP"
  }
}
*/
resource "null_resource" "helm" {
 /* triggers = {
      trigger = file("${path.module}/helmcommands.ps1")
     # trigger = timestamp()
  }*/
  provisioner "local-exec" {
    command = "powershell -file ${path.module}/helmcommands.ps1 -helm_path ${var.helm_path}"
    
    #interpreter = ["PowerShell", "-File"]
  }
  depends_on = [oci_containerengine_node_pool.k8s_node_pool, oci_containerengine_cluster.k8s_cluster, kubernetes_namespace.monitoringns]
}

