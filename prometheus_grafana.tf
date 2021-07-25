provider "helm" {
  kubernetes {
    config_path = "${path.module}/kubeconfig"
  }
}

provider "kubernetes" {
 
    config_path = "${path.module}/kubeconfig"
  
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
  triggers = {
      trigger = file("${path.module}/helmcommands.ps1")
      trigger = timestamp()
  }
  provisioner "local-exec" {
    command = "${path.module}/helmcommands.ps1"
    
    interpreter = ["PowerShell", "-File"]
  }
}

