resource "civo_kubernetes_cluster" "cluster" {
  name        = var.cluster_name
  firewall_id = civo_firewall.firewall.id

  pools {
    node_count = var.cluster_node_count
    size       = var.cluster_node_size
  }

  timeouts {
    create = "5m"
  }
}

resource "local_file" "cluster-config" {
  content              = civo_kubernetes_cluster.cluster.kubeconfig
  filename             = pathexpand(var.kube_config_path)
  file_permission      = "0600"
  directory_permission = "0755"
}

resource "helm_release" "mario" {
  name       = var.chart_name
  repository = var.chart_repository
  chart      = var.chart_name
  version    = var.chart_version

  depends_on = [local_file.cluster-config]
}
